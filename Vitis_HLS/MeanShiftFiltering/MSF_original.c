#include "stdio.h"
#include <stdlib.h>
#include <math.h>

//Image define region
#define imageWidth 512
#define imageHeight 512
#define PixelNumber 512*512
#define imageSize 512*512*3
#define headerSize 0x8A
#define fileSize imageSize+headerSize //0x38480

//Data type definitions
typedef unsigned char u8;
typedef unsigned int u32;
typedef unsigned short int u16;

typedef struct {
    unsigned char r, g, b;
} Pixel;


unsigned char FILE_OUT[fileSize];


void MeanShiftFiltering(Pixel* in,Pixel* out,u32 ImageWidth,
    u32 ImageHeight, char sd, char cd, u8 max_iter){
        float thresHold = 0.1f;
        float sum_b = 0,sum_g = 0,sum_r = 0;
        u8 pixel_cnt = 0;
        float CENTER_b,CENTER_g,CENTER_r;
        float CURRENT_b,CURRENT_g,CURRENT_r;
        float MEAN_b,MEAN_g,MEAN_r;
        for(int y=0; y < ImageHeight;++y) {
            for (int x=0; x < ImageWidth;++x){
                CENTER_b = in[x+y*ImageHeight].b;
                CENTER_g = in[x+y*ImageHeight].g;
                CENTER_r = in[x+y*ImageHeight].r;

                u8 iter_numb = 0;
                float THRES_HOLD_DIST_SQUARE = 0.0f;
                //find the mean.
                do {
                    THRES_HOLD_DIST_SQUARE = 0.0f;
                    pixel_cnt = 0;
                    sum_b = 0;
                    sum_g = 0;
                    sum_r = 0;
                    for(int i=y-sd;i<=y+sd;++i){
                        for(int j=x-sd;j<=x+sd;++j){
                            
                            //No calculate with pixel out of border
                            if (i < 0 || i >= ImageHeight || j < 0 || j >= ImageWidth){
                                continue;
                            }
                                
                            if((i-y)*(i-y) + (j-x)*(j-x) > sd*sd){
                                continue;
                            }

                            CURRENT_b = in[j+i*ImageHeight].b;
                            CURRENT_g = in[j+i*ImageHeight].g;
                            CURRENT_r = in[j+i*ImageHeight].r;
                            float db = (CURRENT_b-CENTER_b);
                            float dg = (CURRENT_g-CENTER_g);
                            float dr = (CURRENT_r-CENTER_r);
                            float COLOR_DIST_SQ = db*db+dg*dg+dr*dr;
                            if( COLOR_DIST_SQ <= cd*cd ){
                                sum_b += CURRENT_b;
                                sum_g += CURRENT_g;
                                sum_r += CURRENT_r;
                                pixel_cnt++;
                            }
                        }
                    }
                    MEAN_b = sum_b/pixel_cnt;
                    MEAN_g = sum_g/pixel_cnt;
                    MEAN_r = sum_r/pixel_cnt;

                    iter_numb++;
                    THRES_HOLD_DIST_SQUARE = (MEAN_b-CENTER_b)*(MEAN_b-CENTER_b)+
                                             (MEAN_g-CENTER_g)*(MEAN_g-CENTER_g)+
                                             (MEAN_r-CENTER_r)*(MEAN_r-CENTER_r);

                    //Update new mean for center
                    CENTER_b = MEAN_b;
                    CENTER_g = MEAN_g;
                    CENTER_r = MEAN_r;


                }while ( (iter_numb <= max_iter) || THRES_HOLD_DIST_SQUARE >thresHold*thresHold);
                //Finish this while loop means that we found the best mean or for computational cost purpose, after a few iterations, we stop
                //Update to output pixel
                out[x+y*ImageHeight].b = (u8)(MEAN_b + 0.5f);
                out[x+y*ImageHeight].g = (u8)(MEAN_g + 0.5f);
                out[x+y*ImageHeight].r = (u8)(MEAN_r + 0.5f);
            }
    }
}



int main(){
	//Create dynamic allocation to store image pixel data
	unsigned char* imageData = malloc(sizeof(unsigned char)*fileSize);
	FILE *fptr = fopen("sample5.bmp","r");
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

    //Create 2 arrays to store input pixel and output pixel
    //Remember that C read data by byte, or my code read by byte. But we need to attach 3 pixel colors together to distigush each pixel.
    //So we create an dynamic allocation of pixel structure to attach r-g-b together.
    Pixel *input = (Pixel *)malloc(PixelNumber * sizeof(Pixel));
    Pixel *output = (Pixel *)malloc(PixelNumber * sizeof(Pixel));

    u32 pixelCounter = 0;
    //Write image data back to Pixel instances.
    for(int i = headerSize; i<fileSize; i=i+3){
            input[pixelCounter].b = imageData[i];
            input[pixelCounter].g = imageData[i+1];
            input[pixelCounter].r = imageData[i+2];
            pixelCounter++;
    }



    // Apply mean shift filter
    int sd = 15;        // Spatial distance
    float cd = 30.0f;  // Color distance
    int max_iter = 5;  // Maximum iterations

    //MAIN FUNCTION
    MeanShiftFiltering(input, output, imageWidth, imageHeight, sd, cd, max_iter);

    //Create new file to write back output data
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

    //Write back all pixel to array out
    for(int i=headerSize;i<fileSize;i=i+3){
        FILE_OUT[i] = output[pixelCounter].b;
        FILE_OUT[i+1] = output[pixelCounter].g;
        FILE_OUT[i+2] = output[pixelCounter].r;
        pixelCounter++;
    }
   
    //Write all pixel data, even header file inside FILEOUT into one file so we can read it.
	for(int i=0;i<fileSize;i++){
		fputc(FILE_OUT[i],fptr);
	}	
	fclose(fptr);    

    return 0;
}