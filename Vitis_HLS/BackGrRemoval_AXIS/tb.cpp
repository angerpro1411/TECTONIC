#include "parameters.h"
#include <hls_stream.h>
#include <ap_axi_sdata.h>
#include <fstream>
#include <iostream>
#include <vector>
#include <cstdint>
#include <cstring>

typedef ap_axiu<24,1,1,1> AXI_VAL;
typedef hls::stream<AXI_VAL> axis_t;

// === Kernel Declaration ===
void BackGrRemoval_stream_v2(axis_t &in_stream, axis_t &out_stream,
                             u8 threshold, int rows, int cols);

// === BMP Utilities ===
#pragma pack(push, 1)
struct BMPHeader {
    uint16_t bfType;
    uint32_t bfSize;
    uint16_t bfReserved1;
    uint16_t bfReserved2;
    uint32_t bfOffBits;
    uint32_t biSize;
    int32_t  biWidth;
    int32_t  biHeight;
    uint16_t biPlanes;
    uint16_t biBitCount;
    uint32_t biCompression;
    uint32_t biSizeImage;
    int32_t  biXPelsPerMeter;
    int32_t  biYPelsPerMeter;
    uint32_t biClrUsed;
    uint32_t biClrImportant;
};
#pragma pack(pop)

// === Function: read BMP ===
bool read_bmp(const char *filename, std::vector<PixelBGR> &pixels, BMPHeader &hdr) {
    std::ifstream f(filename, std::ios::binary);
    if (!f.is_open()) return false;

    f.read(reinterpret_cast<char*>(&hdr), sizeof(BMPHeader));
    if (hdr.bfType != 0x4D42) { // 'BM'
        std::cerr << "Not a BMP file.\n";
        return false;
    }

    int width  = hdr.biWidth;
    int height = hdr.biHeight;
    pixels.resize(width * height);

    f.seekg(hdr.bfOffBits, std::ios::beg);
    int row_padded = (width * 3 + 3) & (~3);

    for (int y = 0; y < height; y++) {
        std::vector<uint8_t> row(row_padded);
        f.read(reinterpret_cast<char*>(row.data()), row_padded);
        for (int x = 0; x < width; x++) {
            PixelBGR p;
            p.b = row[x * 3 + 0];
            p.g = row[x * 3 + 1];
            p.r = row[x * 3 + 2];
            pixels[(height - 1 - y) * width + x] = p; // flip vertically
        }
    }
    f.close();
    return true;
}

// === Function: write BMP ===
bool write_bmp(const char *filename, const std::vector<PixelBGR> &pixels, const BMPHeader &hdr) {
    std::ofstream f(filename, std::ios::binary);
    if (!f.is_open()) return false;

    BMPHeader out_hdr = hdr;
    f.write(reinterpret_cast<const char*>(&out_hdr), sizeof(BMPHeader));

    int width = hdr.biWidth;
    int height = hdr.biHeight;
    int row_padded = (width * 3 + 3) & (~3);
    std::vector<uint8_t> row(row_padded, 0);

    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            PixelBGR p = pixels[(height - 1 - y) * width + x];
            row[x * 3 + 0] = p.b;
            row[x * 3 + 1] = p.g;
            row[x * 3 + 2] = p.r;
        }
        f.write(reinterpret_cast<char*>(row.data()), row_padded);
    }
    f.close();
    return true;
}

// === Testbench ===
int main() {
    const char *input_bmp  = "13_320x240.bmp";
    const char *output_bmp = "output_320x240.bmp";

    std::vector<PixelBGR> input_pixels;
    BMPHeader hdr;
    if (!read_bmp(input_bmp, input_pixels, hdr)) {
        std::cerr << "Failed to read " << input_bmp << std::endl;
        return 1;
    }

    axis_t in_stream, out_stream;

    int rows = hdr.biHeight;
    int cols = hdr.biWidth;
    std::cout << "Loaded image: " << cols << "x" << rows << std::endl;

    // === Feed input pixels into stream ===
    for (int i = 0; i < rows * cols; i++) {
        AXI_VAL v;
        PixelBGR p = input_pixels[i];
        ap_uint<24> d = ((ap_uint<24>)p.r << 16) | ((ap_uint<24>)p.g << 8) | (ap_uint<24>)p.b;
        v.data = d;
        v.keep = -1;
        v.strb = -1;
        v.user = 0;
        v.id = 0;
        v.dest = 0;
        v.last = (i == (rows * cols - 1)) ? 1 : 0;
        in_stream.write(v);
    }

    // === Run kernel ===
    u8 threshold = 60;
    BackGrRemoval_stream_v2(in_stream, out_stream, threshold, rows, cols);

    // === Collect results ===
    std::vector<PixelBGR> output_pixels(rows * cols);
    for (int i = 0; i < rows * cols; i++) {
        if (out_stream.empty()) {
            std::cerr << "Output stream empty at pixel " << i << std::endl;
            break;
        }
        AXI_VAL v = out_stream.read();
        PixelBGR p;
        ap_uint<24> d = v.data;
        p.r = d.range(23,16);
        p.g = d.range(15,8);
        p.b = d.range(7,0);
        output_pixels[i] = p;
    }

    // === Write result ===
    if (write_bmp(output_bmp, output_pixels, hdr))
        std::cout << "Wrote result to " << output_bmp << std::endl;
    else
        std::cerr << "Failed to write output BMP\n";

    return 0;
}
