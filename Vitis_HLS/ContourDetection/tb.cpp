//#include <hls_stream.h>
//#include <ap_int.h>
//#include <fstream>
//#include <iostream>
//#include <vector>
//#include <hls_stream.h>
//#include <ap_int.h>
//#include <ap_axi_sdata.h>
//#include <hls_math.h>
//
//#define IMG_WIDTH  320
//#define IMG_HEIGHT 240
//const unsigned char threshold = 220;
//
//// 24-bit RGB pixel type for both input/output
//typedef ap_axiu<24,1,1,1> axis_rgb_t;
//
//void sobel_rgb_green_outline_fixed(
//    hls::stream<axis_rgb_t>& in_stream,
//    hls::stream<axis_rgb_t>& out_stream
//);
//
//
//// Simple BMP header for 24-bit uncompressed BMP
//struct BMPHeader {
//    unsigned char header[54];
//};
//
//int main() {
//    hls::stream<axis_rgb_t> in_stream;
//    hls::stream<axis_rgb_t> out_stream;
//
//    // --- Read BMP ---
//    std::ifstream fin("output.bmp", std::ios::binary);
//    if (!fin) {
//        std::cerr << "Cannot open input.bmp" << std::endl;
//        return 1;
//    }
//
//    BMPHeader bmpHeader;
//    fin.read(reinterpret_cast<char*>(&bmpHeader.header), 54);
//
//    // BMP pixel data: 24-bit, bottom-up
//    std::vector<unsigned char> bmpData(IMG_WIDTH * IMG_HEIGHT * 3);
//    fin.read(reinterpret_cast<char*>(bmpData.data()), bmpData.size());
//    fin.close();
//
//    // --- Feed pixels to HLS stream ---
//    for (int y = IMG_HEIGHT - 1; y >= 0; y--) {  // BMP bottom-up
//        for (int x = 0; x < IMG_WIDTH; x++) {
//            int idx = (y * IMG_WIDTH + x) * 3;
//            axis_rgb_t pix;
//            pix.data = (bmpData[idx + 2] << 16) | (bmpData[idx + 1] << 8) | bmpData[idx];
//            pix.keep = 0xFF;
//            pix.strb = 0xFF;
//            pix.user = 0;
//            pix.last = (y == 0 && x == IMG_WIDTH - 1) ? 1 : 0;
//            in_stream.write(pix);
//        }
//    }
//
//    // --- Run HLS Sobel filter ---
//    sobel_rgb_green_outline_fixed(in_stream, out_stream);
//
//    // --- Write output BMP (top-down) ---
//    std::ofstream fout("output_process.bmp", std::ios::binary);
//    fout.write(reinterpret_cast<char*>(&bmpHeader.header), 54);
//
//    for (int y = 0; y < IMG_HEIGHT; y++) {  // Top-down for correct orientation
//        for (int x = 0; x < IMG_WIDTH; x++) {
//            axis_rgb_t out_pix = out_stream.read();
//            unsigned char R = (out_pix.data >> 16) & 0xFF;
//            unsigned char G = (out_pix.data >> 8) & 0xFF;
//            unsigned char B = out_pix.data & 0xFF;
//            fout.put(B);
//            fout.put(G);
//            fout.put(R);
//        }
//    }
//
//    fout.close();
//    std::cout << "Output written to output.bmp (right-side-up)" << std::endl;
//    return 0;
//}


#include <hls_stream.h>
#include <ap_int.h>
#include <fstream>
#include <iostream>
#include <vector>
#include <hls_stream.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <hls_math.h>

#define IMG_WIDTH  320
#define IMG_HEIGHT 240
const unsigned char threshold = 220;

// 24-bit RGB pixel type for both input/output
typedef ap_axiu<24,1,1,1> axis_rgb_t;

void sobel_rgb_green_outline_fixed(
    hls::stream<axis_rgb_t>& in_stream,
    hls::stream<axis_rgb_t>& out_stream
);

// Simple BMP header for 24-bit uncompressed BMP
struct BMPHeader {
    unsigned char header[54];
};

int main() {
    hls::stream<axis_rgb_t> in_stream;
    hls::stream<axis_rgb_t> out_stream;

    // --- Read BMP ---
    std::ifstream fin("output.bmp", std::ios::binary);
    if (!fin) {
        std::cerr << "Cannot open input.bmp" << std::endl;
        return 1;
    }

    BMPHeader bmpHeader;
    fin.read(reinterpret_cast<char*>(&bmpHeader.header), 54);

    // BMP pixel data: 24-bit, bottom-up
    std::vector<unsigned char> bmpData(IMG_WIDTH * IMG_HEIGHT * 3);
    fin.read(reinterpret_cast<char*>(bmpData.data()), bmpData.size());
    fin.close();

    // --- Feed pixels to HLS stream ---
    for (int y = IMG_HEIGHT - 1; y >= 0; y--) {  // BMP bottom-up
        for (int x = 0; x < IMG_WIDTH; x++) {
            int idx = (y * IMG_WIDTH + x) * 3;
            axis_rgb_t pix;
            pix.data = (bmpData[idx + 2] << 16) | (bmpData[idx + 1] << 8) | bmpData[idx];
            pix.keep = 0xFF;
            pix.strb = 0xFF;
            pix.user = 0;
            pix.last = (y == 0 && x == IMG_WIDTH - 1) ? 1 : 0;
            in_stream.write(pix);
        }
    }

    // --- Run HLS Sobel filter ---
    sobel_rgb_green_outline_fixed(in_stream, out_stream);

    // --- Write output BMP (top-down) ---
    std::ofstream fout("output_processed.bmp", std::ios::binary);
    fout.write(reinterpret_cast<char*>(&bmpHeader.header), 54);

    std::vector<axis_rgb_t> out_pixels;
    out_pixels.reserve(IMG_WIDTH * IMG_HEIGHT);

    // First, store all pixels from the stream
    for (int i = 0; i < IMG_WIDTH * IMG_HEIGHT; i++) {
        out_pixels.push_back(out_stream.read());
    }

    // Then, write bottom-up to match BMP convention
    for (int y = IMG_HEIGHT - 1; y >= 0; y--) {
        for (int x = 0; x < IMG_WIDTH; x++) {
            axis_rgb_t out_pix = out_pixels[y * IMG_WIDTH + x];
            unsigned char R = (out_pix.data >> 16) & 0xFF;
            unsigned char G = (out_pix.data >> 8) & 0xFF;
            unsigned char B = out_pix.data & 0xFF;
            fout.put(B);
            fout.put(G);
            fout.put(R);
        }
    }
}
