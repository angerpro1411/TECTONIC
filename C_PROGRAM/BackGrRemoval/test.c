#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#pragma pack(push, 1)
typedef struct {
    uint16_t bfType;      // Signature "BM"
    uint32_t bfSize;      // File size in bytes
    uint16_t bfReserved1; // Reserved
    uint16_t bfReserved2; // Reserved
    uint32_t bfOffBits;   // Offset to pixel data
} BMPFileHeader;

typedef struct {
    uint32_t biSize;          // DIB header size
    int32_t  biWidth;         // Width
    int32_t  biHeight;        // Height (positive = bottom-up)
    uint16_t biPlanes;        // Must be 1
    uint16_t biBitCount;      // Bits per pixel (expect 24)
    uint32_t biCompression;   // Compression (0 = none)
    uint32_t biSizeImage;     // Image size (may be 0 for uncompressed)
    int32_t  biXPelsPerMeter; // Resolution
    int32_t  biYPelsPerMeter; // Resolution
    uint32_t biClrUsed;       // Colors used
    uint32_t biClrImportant;  // Important colors
} DIBHeader;
#pragma pack(pop)

int main() {
    FILE *file = fopen("13.bmp", "rb");
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    BMPFileHeader fileHeader;
    fread(&fileHeader, sizeof(fileHeader), 1, file);
    if (fileHeader.bfType != 0x4D42) {
        printf("Not a valid BMP file\n");
        fclose(file);
        return 1;
    }

    DIBHeader dibHeader;
    fread(&dibHeader, sizeof(dibHeader), 1, file);

    if (dibHeader.biBitCount != 24 || dibHeader.biCompression != 0) {
        printf("Only uncompressed 24-bit BMP files are supported\n");
        fclose(file);
        return 1;
    }

    int width = dibHeader.biWidth;
    int height = dibHeader.biHeight;
    int bytesPerPixel = 3;
    int rowSize = (width * bytesPerPixel + 3) & ~3; // row aligned to 4 bytes
    int imageSize = rowSize * abs(height);

    // Allocate memory for pixel data
    uint8_t *pixels = malloc(imageSize);
    if (!pixels) {
        perror("Memory allocation failed");
        fclose(file);
        return 1;
    }

    // Move to pixel array
    fseek(file, fileHeader.bfOffBits, SEEK_SET);
    fread(pixels, 1, imageSize, file);
    fclose(file);

    // Access and print pixel data
    printf("BMP image %dx%d\n", width, height);
    //for (int y = 0; y < abs(height); y++) {
        int y = 0;
        //int row = (height > 0) ? (abs(height) - 1 - y) : y; // handle bottom-up
        int row = y;
        for (int x = 0; x < width; x++) {
            int idx = row * rowSize + x * bytesPerPixel;
            uint8_t blue  = pixels[idx];
            uint8_t green = pixels[idx + 1];
            uint8_t red   = pixels[idx + 2];

            // Example: print pixel at (x, y)
            printf("Pixel (%d,%d): R=%3d G=%3d B=%3d\n", x, y, red, green, blue);
        }
    //}

    free(pixels);
    return 0;
}
