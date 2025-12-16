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

int main(int argc, char*argv[]) {

	if (argc == 1){
		printf ("!!!Invalid input, no argument passed\n");
		exit(EXIT_FAILURE);
	}
	else if (argc > 2){
		printf ("!!!You have more than 1 input file, Invalid again\n");
		exit(EXIT_FAILURE);
	} 	
	
	char* filename = argv[1];
	
    FILE *fp = fopen(filename, "rb");
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
    fprintf(out, "const unsigned char image_data[%d] = {\n", width * height * bytes_per_pixel);
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
