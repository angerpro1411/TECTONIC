#include <iostream>
#include <fstream>
#include <vector>
#include "hls_stream.h"
#include "ap_axi_sdata.h"
#include "parameters.h"
#include "BackGrRemoval.h"


// Image dimensions
#define IMG_W 320
#define IMG_H 240

// Define AXI value type
typedef hls::axis<ap_uint<24>, 1, 1, 1> AXI_VAL;

// Function to read a 24-bit BMP file (uncompressed)
bool read_bmp(const char* filename, unsigned char* data, int width, int height) {
    std::ifstream file(filename, std::ios::binary);
    if (!file) {
        std::cerr << "Cannot open " << filename << std::endl;
        return false;
    }

    unsigned char header[54];
    file.read((char*)header, 54);

    // Check signature
    if (header[0] != 'B' || header[1] != 'M') {
        std::cerr << "Not a BMP file!" << std::endl;
        return false;
    }

    // BMP stores pixels bottom-up
    int row_padded = (width * 3 + 3) & (~3);
    unsigned char* row_data = new unsigned char[row_padded];

    for (int y = 0; y < height; y++) {
        file.read((char*)row_data, row_padded);
        for (int x = 0; x < width; x++) {
            int idx = ((height - 1 - y) * width + x) * 3;
            data[idx + 2] = row_data[x * 3 + 0]; // B
            data[idx + 1] = row_data[x * 3 + 1]; // G
            data[idx + 0] = row_data[x * 3 + 2]; // R
        }
    }

    delete[] row_data;
    file.close();
    return true;
}

// Function to write BMP
void write_bmp(const char* filename, unsigned char* data, int width, int height) {
    std::ofstream file(filename, std::ios::binary);
    if (!file) {
        std::cerr << "Cannot create " << filename << std::endl;
        return;
    }

    int row_padded = (width * 3 + 3) & (~3);
    int filesize = 54 + row_padded * height;

    unsigned char header[54] = {
        'B','M',
        (unsigned char)(filesize),
        (unsigned char)(filesize>>8),
        (unsigned char)(filesize>>16),
        (unsigned char)(filesize>>24),
        0,0,0,0, 54,0,0,0, // pixel data offset
        40,0,0,0,          // DIB header size
        (unsigned char)(width),
        (unsigned char)(width>>8),
        (unsigned char)(width>>16),
        (unsigned char)(width>>24),
        (unsigned char)(height),
        (unsigned char)(height>>8),
        (unsigned char)(height>>16),
        (unsigned char)(height>>24),
        1,0,24,0
    };

    file.write((char*)header, 54);

    unsigned char* row_data = new unsigned char[row_padded];
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            int idx = ((height - 1 - y) * width + x) * 3;
            row_data[x * 3 + 0] = data[idx + 2]; // B
            row_data[x * 3 + 1] = data[idx + 1]; // G
            row_data[x * 3 + 2] = data[idx + 0]; // R
        }
        for (int p = width * 3; p < row_padded; p++) row_data[p] = 0;
        file.write((char*)row_data, row_padded);
    }
    delete[] row_data;
    file.close();
}

// ===================================================
//                 TESTBENCH MAIN
// ===================================================
int main() {
    const char* input_image = "13_320x240.bmp";
    const char* output_image = "output.bmp";

    static unsigned char image_in[IMG_W * IMG_H * 3];
    static unsigned char image_out[IMG_W * IMG_H * 3];

    if (!read_bmp(input_image, image_in, IMG_W, IMG_H)) {
        std::cerr << "Failed to read input image!\n";
        return -1;
    }

    hls::stream<AXI_VAL> input_stream("input_stream");
    hls::stream<AXI_VAL> output_stream("output_stream");

    // --- Convert to AXI stream ---
    for (int i = 0; i < IMG_W * IMG_H; i++) {
        AXI_VAL pix;
        pix.data.range(23,16) = image_in[i*3 + 0]; // R
        pix.data.range(15,8)  = image_in[i*3 + 1]; // G
        pix.data.range(7,0)   = image_in[i*3 + 2]; // B
        pix.keep = -1;
        pix.strb = -1;
        pix.user = 0;
        pix.last = (i == IMG_W*IMG_H - 1);
        pix.id   = 0;
        pix.dest = 0;
        input_stream.write(pix);
    }

    // --- Call DUT ---
    BackGrRemovalStream(input_stream, output_stream);

    // --- Collect output ---
    for (int i = 0; i < IMG_W * IMG_H; i++) {
        AXI_VAL pix_out = output_stream.read();
        image_out[i*3 + 0] = pix_out.data.range(23,16); // R
        image_out[i*3 + 1] = pix_out.data.range(15,8);  // G
        image_out[i*3 + 2] = pix_out.data.range(7,0);   // B
    }

    write_bmp(output_image, image_out, IMG_W, IMG_H);

    std::cout << "✅ Simulation completed.\nOutput image written to " << output_image << std::endl;
    return 0;
}
