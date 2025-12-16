#include <hls_stream.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <hls_math.h>
#include <iostream>
#include <fstream>

#define IMG_WIDTH  320
#define IMG_HEIGHT 240
const unsigned char threshold = 220;

// 24-bit RGB pixel type for both input/output
typedef ap_axiu<24,1,1,1> axis_rgb_t;

void hls_object_green_classification(
    hls::stream<axis_rgb_t>& in_stream,
    hls::stream<axis_rgb_t>& out_stream
);

// Simple BMP header structs
#pragma pack(push, 1)
struct BMPHeader {
    uint16_t bfType;
    uint32_t bfSize;
    uint16_t bfReserved1;
    uint16_t bfReserved2;
    uint32_t bfOffBits;
};

struct BMPInfoHeader {
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

// =========================================================
// Read 24-bit BMP file into a pixel array (BGR order)
// =========================================================
bool read_bmp(const char* filename, unsigned char image[IMG_HEIGHT][IMG_WIDTH][3]) {
    std::ifstream file(filename, std::ios::binary);
    if (!file) {
        std::cerr << "ERROR: Cannot open " << filename << std::endl;
        return false;
    }

    BMPHeader hdr;
    BMPInfoHeader info;
    file.read((char*)&hdr, sizeof(hdr));
    file.read((char*)&info, sizeof(info));

    if (hdr.bfType != 0x4D42 || info.biBitCount != 24) {
        std::cerr << "ERROR: Not a 24-bit BMP file\n";
        return false;
    }

    file.seekg(hdr.bfOffBits, std::ios::beg);
    int row_padded = ((IMG_WIDTH * 3 + 3) & (~3));
    unsigned char row[row_padded];

    for (int y = 0; y < IMG_HEIGHT; y++) {
        file.read((char*)row, row_padded);
        for (int x = 0; x < IMG_WIDTH; x++) {
            image[IMG_HEIGHT - 1 - y][x][0] = row[x*3 + 0]; // B
            image[IMG_HEIGHT - 1 - y][x][1] = row[x*3 + 1]; // G
            image[IMG_HEIGHT - 1 - y][x][2] = row[x*3 + 2]; // R
        }
    }
    return true;
}

// =========================================================
// Write 24-bit BMP file
// =========================================================
bool write_bmp(const char* filename, unsigned char image[IMG_HEIGHT][IMG_WIDTH][3]) {
    std::ofstream file(filename, std::ios::binary);
    if (!file) return false;

    int row_padded = ((IMG_WIDTH * 3 + 3) & (~3));
    int filesize = 54 + row_padded * IMG_HEIGHT;

    BMPHeader hdr = {0x4D42, (uint32_t)filesize, 0, 0, 54};
    BMPInfoHeader info = {
        40, IMG_WIDTH, IMG_HEIGHT, 1, 24, 0,
        (uint32_t)(row_padded * IMG_HEIGHT), 0, 0, 0, 0
    };

    file.write((char*)&hdr, sizeof(hdr));
    file.write((char*)&info, sizeof(info));

    unsigned char row[row_padded];
    for (int y = IMG_HEIGHT - 1; y >= 0; y--) {
        for (int x = 0; x < IMG_WIDTH; x++) {
            row[x*3 + 0] = image[y][x][0]; // B
            row[x*3 + 1] = image[y][x][1]; // G
            row[x*3 + 2] = image[y][x][2]; // R
        }
        for (int p = IMG_WIDTH*3; p < row_padded; p++) row[p] = 0;
        file.write((char*)row, row_padded);
    }

    return true;
}

// =========================================================
// Testbench
// =========================================================
int main() {
    unsigned char input_image[IMG_HEIGHT][IMG_WIDTH][3];
    unsigned char output_image[IMG_HEIGHT][IMG_WIDTH][3];
    hls::stream<axis_rgb_t> in_stream, out_stream;

    if (!read_bmp("output.bmp", input_image)) return 1;

    // Stream input image to DUT
    for (int y = 0; y < IMG_HEIGHT; y++) {
        for (int x = 0; x < IMG_WIDTH; x++) {
            axis_rgb_t pix;
            pix.data = ((ap_uint<24>)input_image[y][x][0] << 16) | // B
                       ((ap_uint<24>)input_image[y][x][1] << 8)  | // G
                       ((ap_uint<24>)input_image[y][x][2]);       // R
            pix.keep = -1;
            pix.strb = -1;
            pix.user = (y == 0 && x == 0);
            pix.last = (x == IMG_WIDTH - 1);
            in_stream.write(pix);
        }
    }

    // Call DUT
    hls_object_green_classification(in_stream, out_stream);

    // Read back output
    for (int y = 0; y < IMG_HEIGHT; y++) {
        for (int x = 0; x < IMG_WIDTH; x++) {
            axis_rgb_t out_pix = out_stream.read();
            ap_uint<24> data = out_pix.data;
            output_image[y][x][0] = (data >> 16) & 0xFF; // B
            output_image[y][x][1] = (data >> 8) & 0xFF;  // G
            output_image[y][x][2] = (data) & 0xFF;       // R
        }
    }

    write_bmp("output_320x240.bmp", output_image);
    std::cout << "✅ Output image written: output_320x240.bmp" << std::endl;

    return 0;
}
