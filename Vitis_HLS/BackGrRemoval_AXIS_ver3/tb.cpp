//#include <iostream>
//#include <fstream>
//#include <vector>
//#include "hls_stream.h"
//#include "ap_axi_sdata.h"
//#include "parameters.h"
//#include "BackGrRemoval.h"
//
//#define INPUT_BMP_FILE  "13_320x240.bmp"
//#define OUTPUT_BMP_FILE "output_BackGrRemoval.bmp"
//
//// --- BMP helper functions ---
//void read_bmp_header(std::ifstream &file, unsigned char *header) {
//    file.read(reinterpret_cast<char*>(header), 54);
//}
//
//void write_bmp_header(std::ofstream &file, unsigned char *header) {
//    file.write(reinterpret_cast<char*>(header), 54);
//}
//
//void read_bmp_data(std::ifstream &file, PixelBGR *image, int width, int height) {
//    int row_padded = (width * 3 + 3) & (~3);
//    std::vector<unsigned char> row(row_padded);
//
//    for (int y = 0; y < height; y++) {
//        file.read(reinterpret_cast<char*>(row.data()), row_padded);
//        for (int x = 0; x < width; x++) {
//            int idx = x + (height - 1 - y) * width; // BMP bottom-up
//            image[idx].b = row[x * 3 + 0];
//            image[idx].g = row[x * 3 + 1];
//            image[idx].r = row[x * 3 + 2];
//        }
//    }
//}
//
//void write_bmp_data(std::ofstream &file, PixelBGR *image, int width, int height) {
//    int row_padded = (width * 3 + 3) & (~3);
//    std::vector<unsigned char> row(row_padded, 0);
//
//    for (int y = 0; y < height; y++) {
//        for (int x = 0; x < width; x++) {
//            int idx = x + (height - 1 - y) * width;
//            row[x * 3 + 0] = image[idx].b;
//            row[x * 3 + 1] = image[idx].g;
//            row[x * 3 + 2] = image[idx].r;
//        }
//        file.write(reinterpret_cast<char*>(row.data()), row_padded);
//    }
//}
//
//// --- Main Testbench ---
//int main() {
//    const int width = imageWidth;
//    const int height = imageHeight;
//    const int totalPixels = PixelNumber;
//
//    std::ifstream input(INPUT_BMP_FILE, std::ios::binary);
//    if (!input.is_open()) {
//        std::cerr << "Error: cannot open input BMP file: " << INPUT_BMP_FILE << std::endl;
//        return -1;
//    }
//
//    unsigned char header[54];
//    read_bmp_header(input, header);
//
//    static PixelBGR image[PixelNumber];
//    read_bmp_data(input, image, width, height);
//    input.close();
//
//    // Streams
//    hls::stream<AXI_VAL> input_stream;
//    hls::stream<AXI_VAL> output_stream;
//
//    // Feed pixels into stream
//    for (int i = 0; i < totalPixels; i++) {
//        AXI_VAL pixel;
//        pixel.data.range(23,16) = image[i].r;
//        pixel.data.range(15,8)  = image[i].g;
//        pixel.data.range(7,0)   = image[i].b;
//        pixel.keep = -1;
//        pixel.strb = -1;
//        pixel.user = 0;
//        pixel.last = 0;
//        pixel.id   = 0;
//        pixel.dest = 0;
//        input_stream.write(pixel);
//    }
//
//    // Call the streaming kernel
//    u8 threshold = 60; // adjust as needed
//    BackGrRemovalStream(input_stream, output_stream, threshold);
//
//    // Read output stream
//    static PixelBGR out_img[PixelNumber];
//    for (int i = 0; i < totalPixels; i++) {
//        AXI_VAL pixel = output_stream.read();
//        out_img[i].r = pixel.data.range(23,16);
//        out_img[i].g = pixel.data.range(15,8);
//        out_img[i].b = pixel.data.range(7,0);
//    }
//
//    // Write output BMP
//    std::ofstream output(OUTPUT_BMP_FILE, std::ios::binary);
//    write_bmp_header(output, header);
//    write_bmp_data(output, out_img, width, height);
//    output.close();
//
//    std::cout << "✅ Background removal complete. Output saved as: " << OUTPUT_BMP_FILE << std::endl;
//    return 0;
//}


#include <iostream>
#include <fstream>
#include <vector>
#include "hls_stream.h"
#include "ap_axi_sdata.h"
#include "parameters.h"
#include "BackGrRemoval.h"

#define INPUT_BMP_FILE  "10_320x240.bmp"
#define OUTPUT_BMP_FILE "output_BackGrRemoval.bmp"

// Read BMP header (54 bytes)
void read_bmp_header(std::ifstream &file, unsigned char *header) {
    file.read(reinterpret_cast<char*>(header), 54);
}

// Write BMP header
void write_bmp_header(std::ofstream &file, unsigned char *header) {
    file.write(reinterpret_cast<char*>(header), 54);
}

// Read BMP pixel data (BGR order)
void read_bmp_data(std::ifstream &file, PixelBGR *image, int width, int height) {
    int row_padded = (width * 3 + 3) & (~3); // rows are padded to 4-byte boundary
    std::vector<unsigned char> row(row_padded);

    for (int y = 0; y < height; y++) {
        file.read(reinterpret_cast<char*>(row.data()), row_padded);
        for (int x = 0; x < width; x++) {
            int idx = x + (height - 1 - y) * width; // BMP stored bottom-up
            image[idx].b = row[x * 3 + 0];
            image[idx].g = row[x * 3 + 1];
            image[idx].r = row[x * 3 + 2];
        }
    }
}

// Write BMP pixel data
void write_bmp_data(std::ofstream &file, PixelBGR *image, int width, int height) {
    int row_padded = (width * 3 + 3) & (~3);
    std::vector<unsigned char> row(row_padded, 0);

    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            int idx = x + (height - 1 - y) * width;
            row[x * 3 + 0] = image[idx].b;
            row[x * 3 + 1] = image[idx].g;
            row[x * 3 + 2] = image[idx].r;
        }
        file.write(reinterpret_cast<char*>(row.data()), row_padded);
    }
}

int main() {
    const int width = imageWidth;
    const int height = imageHeight;
    const int totalPixels = PixelNumber;

    std::ifstream input(INPUT_BMP_FILE, std::ios::binary);
    if (!input.is_open()) {
        std::cerr << "Error: cannot open input BMP file: " << INPUT_BMP_FILE << std::endl;
        return -1;
    }

    unsigned char header[54];
    read_bmp_header(input, header);

    static PixelBGR image[PixelNumber];
    read_bmp_data(input, image, width, height);
    input.close();

    // Convert image to AXI stream
    hls::stream<AXI_VAL> input_stream;
    hls::stream<AXI_VAL> output_stream;

    for (int i = 0; i < totalPixels; i++) {
        AXI_VAL pixel;
        pixel.data.range(23,16) = image[i].r;
        pixel.data.range(15,8)  = image[i].g;
        pixel.data.range(7,0)   = image[i].b;
        pixel.keep = -1; // all bytes valid
        pixel.strb = -1;
        pixel.user = 0;
        pixel.last = 0;
        pixel.id   = 0;
        pixel.dest = 0;
        input_stream.write(pixel);
    }

    // Run the background removal function
    u8 threshold = 60; // Example value, adjust as needed
    BackGrRemovalStream(input_stream, output_stream, threshold);

    // Read output stream back into image array
    static PixelBGR out_img[PixelNumber];
    for (int i = 0; i < totalPixels; i++) {
        AXI_VAL pixel = output_stream.read();
        out_img[i].r = pixel.data.range(23,16);
        out_img[i].g = pixel.data.range(15,8);
        out_img[i].b = pixel.data.range(7,0);
    }

    // Write result to BMP file
    std::ofstream output(OUTPUT_BMP_FILE, std::ios::binary);
    write_bmp_header(output, header);
    write_bmp_data(output, out_img, width, height);
    output.close();

    std::cout << "✅ Background removal completed. Output saved as: " << OUTPUT_BMP_FILE << std::endl;
    return 0;
}
