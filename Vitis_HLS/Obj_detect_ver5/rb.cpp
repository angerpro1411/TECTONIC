//#include <hls_stream.h>
//#include <ap_int.h>
//#include <ap_axi_sdata.h>
//#include <hls_math.h>
//#include <iostream>
//#include <fstream>
//
//#define WIDTH   320
//#define HEIGHT  240
//#define MAX_OBJECTS 32
//
//// 24-bit RGB pixel type for both input/output
//typedef ap_axiu<24,1,1,1> axis_rgb_t;
//
//const char* filename_input = "output_.bmp";
//const char* filename_output = "output_320x240.bmp";
//
//void hls_object_green_classification(
//	hls::stream<axis_rgb_t> &in_stream,
//	hls::stream<axis_rgb_t> &out_stream,
//	int16_t obj_x[MAX_OBJECTS],
//	int16_t obj_y[MAX_OBJECTS],
//	ap_uint<1> obj_is_green[MAX_OBJECTS],
//	ap_uint<16>& object_count,
//	ap_uint<1>& irq_frame_done,
//	ap_uint<1>  irq_clear);
//
//
//
//// =====================================================
//// Read 24-bit BMP (BGR) with 54-byte header
//// =====================================================
//bool bmp_read(const char* filename, uint8_t imgB[HEIGHT][WIDTH],
//                                   uint8_t imgG[HEIGHT][WIDTH],
//                                   uint8_t imgR[HEIGHT][WIDTH])
//{
//    std::ifstream f(filename, std::ios::binary);
//    if(!f) {
//        std::cout << "ERROR: Cannot open input BMP file!\n";
//        return false;
//    }
//
//    uint8_t header[54];
//    f.read((char*)header, 54);
//
//    int offset = *(int*)&header[10];
//    int w = *(int*)&header[18];
//    int h = *(int*)&header[22];
//    int bpp = *(short*)&header[28];
//
//    if(w != WIDTH || h != HEIGHT || bpp != 24) {
//        std::cout << "ERROR: BMP must be 320x240 24-bit!\n";
//        return false;
//    }
//
//    f.seekg(offset, std::ios::beg);
//
//    // BMP is stored bottom-up
//    for(int y = HEIGHT - 1; y >= 0; y--) {
//        for(int x = 0; x < WIDTH; x++) {
//            uint8_t B = f.get();
//            uint8_t G = f.get();
//            uint8_t R = f.get();
//            imgB[y][x] = B;
//            imgG[y][x] = G;
//            imgR[y][x] = R;
//        }
//    }
//
//    return true;
//}
//
//// =====================================================
//// Write output BMP
//// =====================================================
//bool bmp_write(const char* filename, uint8_t imgB[HEIGHT][WIDTH],
//                                     uint8_t imgG[HEIGHT][WIDTH],
//                                     uint8_t imgR[HEIGHT][WIDTH])
//{
//    std::ofstream f(filename, std::ios::binary);
//    if(!f) return false;
//
//    int filesize = 54 + 3 * WIDTH * HEIGHT;
//
//    uint8_t header[54] = {
//        'B','M',
//        (uint8_t)(filesize), (uint8_t)(filesize>>8), (uint8_t)(filesize>>16), (uint8_t)(filesize>>24),
//        0,0, 0,0,
//        54,0,0,0, // data offset
//        40,0,0,0, // DIB header
//        (uint8_t)(WIDTH), (uint8_t)(WIDTH>>8), (uint8_t)(WIDTH>>16), (uint8_t)(WIDTH>>24),
//        (uint8_t)(HEIGHT), (uint8_t)(HEIGHT>>8), (uint8_t)(HEIGHT>>16), (uint8_t)(HEIGHT>>24),
//        1,0,
//        24,0,
//        0,0,0,0, // no compression
//        0,0,0,0, // raw bitmap size
//        0,0,0,0, 0,0,0,0, // DPI, ignored
//        0,0,0,0, 0,0,0,0  // palette ignored
//    };
//
//    f.write((char*)header, 54);
//
//    // Write bottom-up
//    for(int y = HEIGHT - 1; y >= 0; y--) {
//        for(int x = 0; x < WIDTH; x++) {
//            f.put(imgB[y][x]);
//            f.put(imgG[y][x]);
//            f.put(imgR[y][x]);
//        }
//    }
//
//    return true;
//}
//
//
//// =====================================================
//// TESTBENCH
//// =====================================================
//int main()
//{
//    static uint8_t imgR[HEIGHT][WIDTH];
//    static uint8_t imgG[HEIGHT][WIDTH];
//    static uint8_t imgB[HEIGHT][WIDTH];
//
//    std::cout << "Reading input.bmp..." << std::endl;
//
//    if(!bmp_read(filename_input, imgB, imgG, imgR)) {
//        std::cout << "Failed to load BMP.\n";
//        return 1;
//    }
//
//    // Setup AXI streams
//    hls::stream<axis_rgb_t> in_stream;
//    hls::stream<axis_rgb_t> out_stream;
//
//    // Push input pixels into stream
//    for(int y = 0; y < HEIGHT; y++) {
//        for(int x = 0; x < WIDTH; x++) {
//            axis_rgb_t pix;
//            uint32_t B = imgB[y][x];
//            uint32_t G = imgG[y][x];
//            uint32_t R = imgR[y][x];
//            pix.data = (B << 16) | (G << 8) | R;
//            pix.keep = -1;
//            pix.strb = -1;
//            pix.user = 0;
//            pix.last = (y == HEIGHT - 1 && x == WIDTH - 1);
//            in_stream.write(pix);
//        }
//    }
//
//    // Output object arrays
//    int16_t obj_x[MAX_OBJECTS];
//    int16_t obj_y[MAX_OBJECTS];
//    ap_uint<1> obj_is_green[MAX_OBJECTS];
//    ap_uint<16> object_count;
//
//    ap_uint<1> irq_frame_done;
//    ap_uint<1> irq_clear = 0;
//
//    // Call DUT
//    hls_object_green_classification(
//        in_stream,
//        out_stream,
//        obj_x,
//        obj_y,
//        obj_is_green,
//        object_count,
//        irq_frame_done,
//        irq_clear
//    );
//
//    // Extract output stream into new image
//    static uint8_t outR[HEIGHT][WIDTH];
//    static uint8_t outG[HEIGHT][WIDTH];
//    static uint8_t outB[HEIGHT][WIDTH];
//
//    for(int y = 0; y < HEIGHT; y++) {
//        for(int x = 0; x < WIDTH; x++) {
//            axis_rgb_t pix = out_stream.read();
//            uint32_t B = (pix.data >> 16) & 0xFF;
//            uint32_t G = (pix.data >> 8)  & 0xFF;
//            uint32_t R =  pix.data        & 0xFF;
//            outB[y][x] = B;
//            outG[y][x] = G;
//            outR[y][x] = R;
//        }
//    }
//
//    std::cout << "Writing output.bmp..." << std::endl;
//    bmp_write(filename_output, outB, outG, outR);
//
//    // Show results
//    std::cout << "\nDetected Objects: " << object_count << "\n";
//    for(int i = 0; i < object_count; i++) {
//        std::cout << "Obj[" << i << "] "
//                  << "x=" << obj_x[i]
//                  << ", y=" << obj_y[i]
//                  << ", green=" << obj_is_green[i]
//                  << "\n";
//    }
//
//    std::cout << "\nFrame Done Interrupt: " << irq_frame_done << "\n";
//    return 0;
//}
//





#include <hls_stream.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <hls_math.h>
#include <iostream>
#include <fstream>
#include <x86intrin.h>
#include <stdint.h>
//#include "stdint-gcc.h"

#define WIDTH   320
#define HEIGHT  240
#define MAX_OBJECTS 32

// 24-bit RGB pixel type for both input/output
typedef ap_axiu<24,1,1,1> axis_rgb_t;

const char* filename_input = "_output.bmp";
const char* filename_output = "output_320x240.bmp";


inline uint64_t read_tsc() {
    unsigned aux;
    _mm_mfence();
    uint64_t t = __rdtscp(&aux);
    _mm_mfence();
    return t;
}

void hls_object_green_classification(
	hls::stream<axis_rgb_t> &in_stream,
	hls::stream<axis_rgb_t> &out_stream,
	int16_t obj_x[MAX_OBJECTS],
	int16_t obj_y[MAX_OBJECTS],
	ap_uint<1> obj_is_green[MAX_OBJECTS],
	ap_uint<16>& object_count);



// =====================================================
// Read 24-bit BMP (BGR) with 54-byte header
// =====================================================
bool bmp_read(const char* filename, uint8_t imgB[HEIGHT][WIDTH],
                                   uint8_t imgG[HEIGHT][WIDTH],
                                   uint8_t imgR[HEIGHT][WIDTH])
{
    std::ifstream f(filename, std::ios::binary);
    if(!f) {
        std::cout << "ERROR: Cannot open input BMP file!\n";
        return false;
    }

    uint8_t header[54];
    f.read((char*)header, 54);

    int offset = *(int*)&header[10];
    int w = *(int*)&header[18];
    int h = *(int*)&header[22];
    int bpp = *(short*)&header[28];

    if(w != WIDTH || h != HEIGHT || bpp != 24) {
        std::cout << "ERROR: BMP must be 320x240 24-bit!\n";
        return false;
    }

    f.seekg(offset, std::ios::beg);

    // BMP is stored bottom-up
    for(int y = HEIGHT - 1; y >= 0; y--) {
        for(int x = 0; x < WIDTH; x++) {
            uint8_t B = f.get();
            uint8_t G = f.get();
            uint8_t R = f.get();
            imgB[y][x] = B;
            imgG[y][x] = G;
            imgR[y][x] = R;
        }
    }

    return true;
}

// =====================================================
// Write output BMP
// =====================================================
bool bmp_write(const char* filename, uint8_t imgB[HEIGHT][WIDTH],
                                     uint8_t imgG[HEIGHT][WIDTH],
                                     uint8_t imgR[HEIGHT][WIDTH])
{
    std::ofstream f(filename, std::ios::binary);
    if(!f) return false;

    int filesize = 54 + 3 * WIDTH * HEIGHT;

    uint8_t header[54] = {
        'B','M',
        (uint8_t)(filesize), (uint8_t)(filesize>>8), (uint8_t)(filesize>>16), (uint8_t)(filesize>>24),
        0,0, 0,0,
        54,0,0,0, // data offset
        40,0,0,0, // DIB header
        (uint8_t)(WIDTH), (uint8_t)(WIDTH>>8), (uint8_t)(WIDTH>>16), (uint8_t)(WIDTH>>24),
        (uint8_t)(HEIGHT), (uint8_t)(HEIGHT>>8), (uint8_t)(HEIGHT>>16), (uint8_t)(HEIGHT>>24),
        1,0,
        24,0,
        0,0,0,0, // no compression
        0,0,0,0, // raw bitmap size
        0,0,0,0, 0,0,0,0, // DPI, ignored
        0,0,0,0, 0,0,0,0  // palette ignored
    };

    f.write((char*)header, 54);

    // Write bottom-up
    for(int y = HEIGHT - 1; y >= 0; y--) {
        for(int x = 0; x < WIDTH; x++) {
            f.put(imgB[y][x]);
            f.put(imgG[y][x]);
            f.put(imgR[y][x]);
        }
    }

    return true;
}


// =====================================================
// TESTBENCH
// =====================================================
int main()
{
    static uint8_t imgR[HEIGHT][WIDTH];
    static uint8_t imgG[HEIGHT][WIDTH];
    static uint8_t imgB[HEIGHT][WIDTH];

    std::cout << "Reading input.bmp..." << std::endl;

    if(!bmp_read(filename_input, imgB, imgG, imgR)) {
        std::cout << "Failed to load BMP.\n";
        return 1;
    }

    // Setup AXI streams
    hls::stream<axis_rgb_t> in_stream;
    hls::stream<axis_rgb_t> out_stream;

    // Push input pixels into stream
    for(int y = 0; y < HEIGHT; y++) {
        for(int x = 0; x < WIDTH; x++) {
            axis_rgb_t pix;
            uint32_t B = imgB[y][x];
            uint32_t G = imgG[y][x];
            uint32_t R = imgR[y][x];
            pix.data = (B << 16) | (G << 8) | R;
            pix.keep = -1;
            pix.strb = -1;
            pix.user = 0;
            pix.last = (y == HEIGHT - 1 && x == WIDTH - 1);
            in_stream.write(pix);
        }
    }

    // Output object arrays
    int16_t obj_x[MAX_OBJECTS];
    int16_t obj_y[MAX_OBJECTS];
    ap_uint<1> obj_is_green[MAX_OBJECTS];
    ap_uint<16> object_count;

    //Start timing calculation
    uint64_t start = read_tsc();

    // Call DUT
    hls_object_green_classification(
        in_stream,
        out_stream,
        obj_x,
        obj_y,
        obj_is_green,
        object_count
    );

    uint64_t end = read_tsc();
    double time_value_ms = (end-start)*1000/(2.9e9);
    std::cout << "Software execution time: " << time_value_ms << " ms" << std::endl;


    // Extract output stream into new image
    static uint8_t outR[HEIGHT][WIDTH];
    static uint8_t outG[HEIGHT][WIDTH];
    static uint8_t outB[HEIGHT][WIDTH];

    for(int y = 0; y < HEIGHT; y++) {
        for(int x = 0; x < WIDTH; x++) {
            axis_rgb_t pix = out_stream.read();
            uint32_t B = (pix.data >> 16) & 0xFF;
            uint32_t G = (pix.data >> 8)  & 0xFF;
            uint32_t R =  pix.data        & 0xFF;
            outB[y][x] = B;
            outG[y][x] = G;
            outR[y][x] = R;
        }
    }

    std::cout << "Writing output.bmp..." << std::endl;
    bmp_write(filename_output, outB, outG, outR);

    // Show results
    std::cout << "\nDetected Objects: " << object_count << "\n";
    for(int i = 0; i < object_count; i++) {
        std::cout << "Obj[" << i << "] "
                  << "x=" << obj_x[i]
                  << ", y=" << obj_y[i]
                  << ", green=" << obj_is_green[i]
                  << "\n";
    }

    return 0;
}


