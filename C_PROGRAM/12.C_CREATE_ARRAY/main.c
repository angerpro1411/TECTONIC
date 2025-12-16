// #include "stdlib.h"
// #include "stdio.h"

// //Image define region
// #define imageWidth 320
// #define imageHeight 240
// #define PixelNumber 320*240
// #define imageSize 320*240*3
// #define headerSize 0x8A
// #define ColorTable_NBytes 1024
// #define fileSize imageSize+headerSize


// int main(){
//     FILE * fileread;
//     FILE * filewrite;
//     unsigned char ch;
//     unsigned int i;
//     unsigned cnt_for_new_line=0;
//     // Creating a file
//     fileread = fopen("13_320x240.bmp", "r");
//     filewrite = fopen("file2.txt", "w");

//     // ch = fgetc(fileread);
//     // printf("\n%x",ch);
//     // fprintf(filewrite,"%d,",ch);
//     // ch = fgetc(fileread);
//     // printf("\n%x",ch);
//     // fprintf(filewrite,"%d,",ch);

//     for(int i=0;i<fileSize;i++){
//         ch = fgetc(fileread);
//         if (i >= headerSize){
//             if(cnt_for_new_line % 32==0)
//                 fprintf(filewrite,"%d,\n",ch);
//             else    
//                 fprintf(filewrite,"%d,",ch);
//             cnt_for_new_line++;
//         }        
//     }


//     fclose(fileread);
//     fclose(filewrite);
//     return 0;
// }

//Provide by chatGPT
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#pragma pack(push, 1)
typedef struct {
    uint16_t bfType;
    uint32_t bfSize;
    uint16_t bfReserved1;
    uint16_t bfReserved2;
    uint32_t bfOffBits;
} BITMAPFILEHEADER;

typedef struct {
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
} BITMAPINFOHEADER;
#pragma pack(pop)

int main(void) {
    FILE *fp = fopen("13_320x240.bmp", "rb");
    if (!fp) {
        perror("Cannot open BMP");
        return 1;
    }

    BITMAPFILEHEADER fileHeader;
    BITMAPINFOHEADER infoHeader;

    fread(&fileHeader, sizeof(BITMAPFILEHEADER), 1, fp);
    fread(&infoHeader, sizeof(BITMAPINFOHEADER), 1, fp);

    int width  = infoHeader.biWidth;
    int height = abs(infoHeader.biHeight);
    int bytes_per_pixel = infoHeader.biBitCount / 8;

    // BMP rows are aligned to 4-byte boundaries
    int row_stride = (width * bytes_per_pixel + 3) & ~3;

    // Allocate memory
    unsigned char *bmp_data = malloc(row_stride * height);
    unsigned char *vga_data = malloc(width * height * bytes_per_pixel);

    // Move file pointer to pixel array
    fseek(fp, fileHeader.bfOffBits, SEEK_SET);
    fread(bmp_data, 1, row_stride * height, fp);
    fclose(fp);

    // Reorder rows for VGA (top-to-bottom)
    for (int y = 0; y < height; y++) {
        int bmp_y = height - 1 - y; // BMP bottom→top
        for (int x = 0; x < width; x++) {
            int src = bmp_y * row_stride + x * bytes_per_pixel;
            int dst = (y * width + x) * bytes_per_pixel;

            // Keep color order as BGR
            vga_data[dst + 0] = bmp_data[src + 0]; // B
            vga_data[dst + 1] = bmp_data[src + 1]; // G
            vga_data[dst + 2] = bmp_data[src + 2]; // R
        }
    }

    // Optional: write to C header file for FPGA/VGA
    FILE *out = fopen("data.h", "w");
    fprintf(out, "const unsigned char pixelData[%d] = {\n", width * height * bytes_per_pixel);
    for (int i = 0; i < width * height * bytes_per_pixel; i++) {
        fprintf(out, "%d,", vga_data[i]);
        if ((i + 1) % 12 == 0) fprintf(out, "\n");
    }
    fprintf(out, "\n};\n");
    fclose(out);

    free(bmp_data);
    free(vga_data);
    return 0;
}
