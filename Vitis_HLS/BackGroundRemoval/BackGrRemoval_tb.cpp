#include "stdio.h"
#include "stdlib.h"
#include "parameters.h"
#include "RGB2HSV.h"
#include "BackGrRemoval.h"

u32 FileSizeReturner(FILE *fptr);

int main(){
    
    FILE* fptr = fopen("13_320x240.bmp","r");
    if(fptr == NULL){
        printf("Not be able to open file/File doesn't exist\n");
        exit(1);
    }


    //Create dynamic allocation to store file
    u8 imageData[fileSize];

    u8 FILE_OUT[fileSize];

    fread(imageData, 1, fileSize, fptr);
    
    u8 bytesPerPixel = 3;


    u32 rowSize_wPadding = (imageWidth*bytesPerPixel+3) & ~3;

    u32 RealImageSize = imageHeight*rowSize_wPadding;
    u8* pixelData = (u8*)malloc(sizeof(u8)*RealImageSize);

    //Extract only pixel data
    fseek(fptr,Offset2Pixel,SEEK_SET);
    fread(pixelData,1,RealImageSize,fptr);
    fclose(fptr);


    PixelBGR *input = (PixelBGR *)malloc(PixelNumber * sizeof(PixelBGR));

    
    //Handling from the bottom
    u32 PixelBGRCounter = 0;
    for(int y=0;y<imageHeight;y++){
        //Read from the bottom of data due to BMP format
        u32 rowIndex = (imageHeight-1-y);
        for(int x=0;x<imageWidth;x++){
            u32 idx = rowIndex*rowSize_wPadding+x*bytesPerPixel;
                input[PixelBGRCounter].b = pixelData[idx];
                input[PixelBGRCounter].g = pixelData[idx+1];
                input[PixelBGRCounter].r = pixelData[idx+2];
                PixelBGRCounter++;
        }
    }

    //Call BackGrRemoval Function
    BackGrRemoval(input,50);


    //Write new image
	fptr = fopen("processed_image.bmp","w");
	if (fptr == NULL){
        printf("blur_lenna.bmp file failed to open.\n");
        free(input);
        free(pixelData);        
		exit(1);
	}

    //Copy header
	for(int i=0;i<Offset2Pixel;++i){
		FILE_OUT[i] = imageData[i];
	}


    //Write back pixel from the bottom
    PixelBGRCounter = 0;
    for(int y=0;y<imageHeight;y++){
        //write from the bottom of data due to BMP format
        u32 rowIndex = (imageHeight-1-y);
        for(int x=0;x<imageWidth;x++){
            u32 idx = rowIndex*rowSize_wPadding+x*bytesPerPixel;
                pixelData[idx] = input[PixelBGRCounter].b;
                pixelData[idx+1] = input[PixelBGRCounter].g;
                pixelData[idx+2] = input[PixelBGRCounter].r;
                PixelBGRCounter++;
        }
    }


	for(int i=0;i<Offset2Pixel;i++){
		fputc(FILE_OUT[i],fptr);
	}
    
    fwrite(pixelData,1,RealImageSize,fptr);

    free(input);

    free(pixelData);
	fclose(fptr);    

    return 0;        
}

