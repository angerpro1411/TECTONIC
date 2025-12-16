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

void mean_shift_filter(Pixel *in, Pixel *out, int width, int height, int hs, float hr, int max_iterations) {
    const float threshold = 0.1f; // Convergence threshold for color change

    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            Pixel initial = in[y * width + x];
            float current_r = initial.r;
            float current_g = initial.g;
            float current_b = initial.b;

            int iterations = 0;
            float delta;

            do {
                float sum_r = 0.0f, sum_g = 0.0f, sum_b = 0.0f;
                int count = 0;

                // Iterate over spatial window
                for (int dy = -hs; dy <= hs; dy++) {
                    for (int dx = -hs; dx <= hs; dx++) {
                        // Check spatial distance
                        if (dx * dx + dy * dy > hs * hs)
                            continue;

                        int xi = x + dx;
                        int yi = y + dy;

                        if (xi >= 0 && xi < width && yi >= 0 && yi < height) {
                            Pixel neighbor = in[yi * width + xi];
                            // Calculate color distance
                            float dr = neighbor.r - current_r;
                            float dg = neighbor.g - current_g;
                            float db = neighbor.b - current_b;
                            float color_dist_sq = dr * dr + dg * dg + db * db;

                            if (color_dist_sq <= hr * hr) {
                                sum_r += neighbor.r;
                                sum_g += neighbor.g;
                                sum_b += neighbor.b;
                                count++;
                            }
                        }
                    }
                }

                if (count == 0) break;

                // Compute mean color
                float mean_r = sum_r / count;
                float mean_g = sum_g / count;
                float mean_b = sum_b / count;

                // Calculate delta
                delta = (mean_r - current_r) * (mean_r - current_r) +
                        (mean_g - current_g) * (mean_g - current_g) +
                        (mean_b - current_b) * (mean_b - current_b);

                // Update current color
                current_r = mean_r;
                current_g = mean_g;
                current_b = mean_b;

                iterations++;
            } while (delta > threshold && iterations < max_iterations);

            // Assign the filtered color to output
            out[y * width + x].r = (unsigned char)(current_r + 0.5f);
            out[y * width + x].g = (unsigned char)(current_g + 0.5f);
            out[y * width + x].b = (unsigned char)(current_b + 0.5f);
        }
    }
}

void MeanShiftFiltering(Pixel* in,Pixel* out,u32 ImageWidth,
    u32 ImageHeight, u8 sd, u8 cd, u8 max_iter){
        float thresHold = 0.1f;
        float sum_b = 0,sum_g = 0,sum_r = 0;
        u32 pixel_cnt = 0;
        float CENTER_b,CENTER_g,CENTER_r;
        float CURRENT_b,CURRENT_g,CURRENT_r;
        float MEAN_b,MEAN_g,MEAN_r;
        for(int y=0; y < ImageHeight;++y) {
            for (int x=0; x < ImageWidth;++x){
                CENTER_b = in[x+y*ImageWidth].b;
                CENTER_g = in[x+y*ImageWidth].g;
                CENTER_r = in[x+y*ImageWidth].r;

                u8 iter_numb = 0;
                float THRES_HOLD_DIST_SQ = 0.0f;
                //find the mean.
                do {
                    pixel_cnt = 0;
                    sum_b = 0;
                    sum_g = 0;
                    sum_r = 0;
                    for(int dy=-sd;dy<=sd;++dy){
                        for(int dx=-sd;dx<=sd;++dx){
                                
                            if((dy)*(dy) + (dx)*(dx) > sd*sd){
                                continue;
                            }
                            int xi = x + dx;
                            int yi = y + dy;

                            //No calculate with pixel out of border
                            if (xi < 0 || xi >= imageWidth || yi < 0 || yi >= imageHeight){
                                continue;
                            }

                            CURRENT_b = in[xi+yi*ImageWidth].b;
                            CURRENT_g = in[xi+yi*ImageWidth].g;
                            CURRENT_r = in[xi+yi*ImageWidth].r;
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
                    if (pixel_cnt == 0){
                        break;}

                    MEAN_b = sum_b/pixel_cnt;
                    MEAN_g = sum_g/pixel_cnt;
                    MEAN_r = sum_r/pixel_cnt;

                    iter_numb++;
                    THRES_HOLD_DIST_SQ = (MEAN_b-CENTER_b)*(MEAN_b-CENTER_b)+
                                             (MEAN_g-CENTER_g)*(MEAN_g-CENTER_g)+
                                             (MEAN_r-CENTER_r)*(MEAN_r-CENTER_r);

                    //Update new mean for center
                    CENTER_b = MEAN_b;
                    CENTER_g = MEAN_g;
                    CENTER_r = MEAN_r;


                }while ( (iter_numb <= max_iter) && THRES_HOLD_DIST_SQ >thresHold);
                //Finish this while loop means that we found the best mean or for computational cost purpose, after a few iterations, we stop
                //Update to output pixel
                out[x+y*ImageHeight].b = (u8)(CENTER_b + 0.5f);
                out[x+y*ImageHeight].g = (u8)(CENTER_g + 0.5f);
                out[x+y*ImageHeight].r = (u8)(CENTER_r + 0.5f);
            }
    }
}



int main(){
	//Create dynamic allocation 
	unsigned char* imageData = malloc(sizeof(unsigned char)*fileSize);
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



    // //Check image data head
    // for(int i=headerSize;i<headerSize+10;i++)
    //     printf("\nimagedata[%d] = %x",i,imageData[i]);

    // //Check image data tail
    // for(int i=fileSize-1;i>fileSize-10;i--)
    //     printf("\nimagedata[%d] = %x",i,imageData[i]);

        // printf("\nblue = %x",input[0].b);
        // printf("\ngreen = %x",input[0].g);
        // printf("\nred = %x",input[0].r);    

    // //Check pixel loop
    // u32 pixelPosition=0;
    // while(1){
    //     printf("\nCheck pixel number ?");
    //     scanf("%d",&pixelPosition);
    //     printf("\nblue = %x",input[pixelPosition].b);
    //     printf("\ngreen = %x",input[pixelPosition].g);
    //     printf("\nred = %x",input[pixelPosition].r);
    // }


    // Apply mean shift filter
    int hs = 15;        // Spatial radius
    float hr = 30.0f;  // Color radius
    int max_iter = 5;  // Maximum iterations
    mean_shift_filter(input, output, imageWidth, imageHeight, hs, hr, max_iter);

    // MeanShiftFiltering(input, output, imageWidth, imageHeight, hs, hr, max_iter);

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
    // pixelCounter = 0;
    // for(int i=headerSize;i<fileSize;i=i+3){
    //     FILE_OUT[i] = input[pixelCounter].b;
    //     FILE_OUT[i+1] = input[pixelCounter].g;
    //     FILE_OUT[i+2] = input[pixelCounter].r;
    //     pixelCounter++;
    // }    

	for(int i=0;i<fileSize;i++){
		fputc(FILE_OUT[i],fptr);
	}	

	fclose(fptr);    

    return 0;
}
