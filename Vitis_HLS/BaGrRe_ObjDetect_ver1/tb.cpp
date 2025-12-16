#include <iostream>
#include <fstream>
#include <stdint.h>
#include <vector>
#include "parameters.h"
#include <hls_stream.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <cstdint>
#include <hls_math.h>
#include <x86intrin.h>
#include <stdint.h>


using namespace std;

// 24-bit RGB pixel type for both input/output
typedef ap_axiu<24,1,1,1> axis_rgb_t;

inline uint64_t read_tsc() {
    unsigned aux;
    _mm_mfence();
    uint64_t t = __rdtscp(&aux);
    _mm_mfence();
    return t;
}

void BaGr_ObjDetect(
	    hls::stream<axis_rgb_t> &input_stream,
	    hls::stream<axis_rgb_t> &output_stream,
	    int16_t obj_x[MAX_OBJECTS],
	    int16_t obj_y[MAX_OBJECTS],
	    ap_uint<1> obj_is_green[MAX_OBJECTS],
	    ap_uint<16> &object_count);



// ==================================================
// Simple BMP reader (24-bit)
// ==================================================
#pragma pack(push, 1)
struct BMPHeader {
    uint16_t type;
    uint32_t size;
    uint16_t reserved1, reserved2;
    uint32_t offset;
};
struct BMPInfoHeader {
    uint32_t size;
    int32_t width, height;
    uint16_t planes, bits;
    uint32_t compression, imagesize;
    int32_t xppm, yppm;
    uint32_t colors, important_colors;
};
#pragma pack(pop)

// ==================================================
// Read BMP file into R,G,B arrays
// ==================================================
bool load_bmp(const char *filename,
              vector<uint8_t> &R,
              vector<uint8_t> &G,
              vector<uint8_t> &B,
              int &width, int &height)
{
    ifstream f(filename, ios::binary);
    if(!f) return false;

    BMPHeader hdr;
    BMPInfoHeader info;

    f.read((char*)&hdr, sizeof(hdr));
    f.read((char*)&info, sizeof(info));

    if(hdr.type != 0x4D42) {
        cout << "Not a BMP file\n";
        return false;
    }

    width  = info.width;
    height = info.height;

    if(info.bits != 24) {
        cout << "Only 24-bit BMP supported\n";
        return false;
    }

    R.resize(width * height);
    G.resize(width * height);
    B.resize(width * height);

    f.seekg(hdr.offset, ios::beg);

    // BMP is bottom-up, so read reversed
    for(int y=height-1; y>=0; y--) {
        for(int x=0; x<width; x++) {
            uint8_t b = f.get();
            uint8_t g = f.get();
            uint8_t r = f.get();
            int idx = y * width + x;
            R[idx] = r;
            G[idx] = g;
            B[idx] = b;
        }
    }
    return true;
}

// ==================================================
// Write output BMP
// ==================================================
bool save_bmp(const char *filename,
              vector<uint8_t> &R,
              vector<uint8_t> &G,
              vector<uint8_t> &B,
              int width, int height)
{
    ofstream f(filename, ios::binary);
    if(!f) return false;

    BMPHeader hdr = {0};
    BMPInfoHeader info = {0};

    hdr.type = 0x4D42;
    hdr.offset = sizeof(BMPHeader) + sizeof(BMPInfoHeader);
    hdr.size = hdr.offset + width * height * 3;

    info.size = sizeof(BMPInfoHeader);
    info.width = width;
    info.height = height;
    info.planes = 1;
    info.bits = 24;
    info.imagesize = width * height * 3;

    f.write((char*)&hdr, sizeof(hdr));
    f.write((char*)&info, sizeof(info));

    // BMP bottom-up
    for(int y=height-1; y>=0; y--) {
        for(int x=0; x<width; x++) {
            int idx = y * width + x;
            f.put(B[idx]);
            f.put(G[idx]);
            f.put(R[idx]);
        }
    }
    return true;
}

// ==================================================
// Testbench MAIN
// ==================================================
int main()
{
    cout << "Loading input.bmp...\n";

    vector<uint8_t> R, G, B;
    int width, height;

    if(!load_bmp("10_320x240.bmp", B, G, R, width, height)) {
        cout << "Error: Failed to load image.\n";
        return 1;
    }

    if(width != 320 || height != 240) {
        cout << "Error: BMP must be 320x240.\n";
        return 1;
    }

    hls::stream<axis_rgb_t> input_stream("in");
    hls::stream<axis_rgb_t> output_stream("out");

    // Push pixels into AXI-stream
    for(int y=0; y<height; y++) {
        for(int x=0; x<width; x++) {
            int idx = y * width + x;
            axis_rgb_t pix;

            pix.data.range(23,16) = B[idx];
            pix.data.range(15,8)  = G[idx];
            pix.data.range(7,0)   = R[idx];

            pix.keep = -1;
            pix.strb = -1;
            pix.user = (x==0 && y==0 ? 1 : 0);
            pix.last = (x==width-1 && y==height-1);
            pix.id   = 0;
            pix.dest = 0;

            input_stream.write(pix);
        }
    }

    // Output arrays for objects
    int16_t obj_x[MAX_OBJECTS];
    int16_t obj_y[MAX_OBJECTS];
    ap_uint<1> obj_is_green[MAX_OBJECTS];
    ap_uint<16> object_count;

    //Start timing calculation
    uint64_t start = read_tsc();

    // Run top-level pipeline
    BaGr_ObjDetect(
        input_stream,
        output_stream,
        obj_x,
        obj_y,
        obj_is_green,
        object_count
    );

    uint64_t end = read_tsc();
    double time_value_ms = (end-start)*1000/(2.9e9);
    std::cout << "Software execution time: " << time_value_ms << " ms" << std::endl;

    cout << "Detected objects: " << object_count << "\n";
    for(int i=0; i<object_count; i++) {
        cout << "Obj " << i
             << "  X=" << obj_x[i]
             << "  Y=" << obj_y[i]
             << "  Green=" << obj_is_green[i]
             << "\n";
    }

    // Read output stream back into pixel arrays
    vector<uint8_t> R2(width*height);
    vector<uint8_t> G2(width*height);
    vector<uint8_t> B2(width*height);

    for(int y=0; y<height; y++) {
        for(int x=0; x<width; x++) {
            axis_rgb_t pix = output_stream.read();
            int idx = y * width + x;

            B2[idx] = pix.data.range(23,16);
            G2[idx] = pix.data.range(15,8);
            R2[idx] = pix.data.range(7,0);
        }
    }

    cout << "Saving output_pipeline.bmp...\n";
    save_bmp("output_pipeline.bmp", B2, G2, R2, width, height);

    cout << "DONE.\n";
    return 0;
}


