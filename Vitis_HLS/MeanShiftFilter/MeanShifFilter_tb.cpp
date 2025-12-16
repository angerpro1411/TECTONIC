#include "stdio.h"
#include <stdlib.h>
#include <math.h>
#include "MeanShiftFilter.h"

unsigned char FILE_OUT[fileSize];


int main(){
	//Create dynamic allocation
	unsigned char* imageData = (unsigned char*)malloc(sizeof(unsigned char)*fileSize);
	FILE *fptr = fopen("pepper.bmp","r");
	if(fptr == NULL){
		printf("Not be able to open file/File doesn't exist\n");
		exit(1);
	}

    	//Put all data into array
	for(int i=0;i<fileSize;i++){
		imageData[i] = fgetc(fptr);
	}

	//close file
	fclose(fptr);

    Pixel *input = (Pixel *)malloc(PixelNumber * sizeof(Pixel));
    Pixel *output = (Pixel *)malloc(PixelNumber * sizeof(Pixel));

    u32 pixelCounter = 0;
    for(int i = headerSize; i<fileSize; i=i+3){
            input[pixelCounter].b = imageData[i];
            input[pixelCounter].g = imageData[i+1];
            input[pixelCounter].r = imageData[i+2];
            pixelCounter++;
    }

    // Apply mean shift filter
    int hs = 15;        // Spatial radius
    float hr = 30.0f;  // Color radius
    int max_iter = 5;  // Maximum iterations

    MeanShiftFiltering(input, output, imageWidth, imageHeight, hs, hr, max_iter);

	fptr = fopen("processed_image.bmp","w");
	if (fptr == NULL){
		printf("blur_lenna.bmp file failed to open.\n");
		exit(1);
	}

    	//Copy header
	for(int i=0;i<headerSize;++i){
		FILE_OUT[i] = imageData[i];
	}



    // reset pixel counter
    pixelCounter = 0;
    for(int i=headerSize;i<fileSize;i=i+3){
        FILE_OUT[i] = output[pixelCounter].b;
        FILE_OUT[i+1] = output[pixelCounter].g;
        FILE_OUT[i+2] = output[pixelCounter].r;
        pixelCounter++;
    }


	for(int i=0;i<fileSize;i++){
		fputc(FILE_OUT[i],fptr);
	}

	fclose(fptr);

    return 0;
}
