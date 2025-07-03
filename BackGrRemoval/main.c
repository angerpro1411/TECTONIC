#include "stdio.h"
#include "stdlib.h"
#include "parameters.h"
#include "RGB2HSV.h"






void main(){
    
    //Create dynamic allocation to store file
    u8* imageData = malloc(sizeof(u8)*fileSize);

    FILE* fptr = fopen("pepper.bmp","r");
    if(fptr == NULL){
        printf("Not be able to open file/File doesn't exist\n");
        exit(1);
    }

    //Put all data into array
    for(int i=0;i<fileSize;i++){
        imageData[i] = fgetc(fptr);
    }


    //Get imageHeight and imageWidth from data
    u32 width = (u32)(imageData[21] << 24) |
                    (u32)(imageData[20] << 16) |
                        (u32)(imageData [19] << 8) |
                            (u32)(imageData[18] << 0);
    u32 height  = (u32)(imageData[25] << 24) |
                    (u32)(imageData[24] << 16) |
                        (u32)(imageData [23] << 8) |
                            (u32)(imageData[22] << 0);                       


    //Close the file
    fclose(fptr);


    PixelBGR *input = (PixelBGR *)malloc(PixelNumber * sizeof(PixelBGR));
    PixelBGR *output = (PixelBGR *)malloc(PixelNumber * sizeof(PixelBGR));

    

    u32 PixelBGRCounter = 0;
    for(int i = headerSize; i<fileSize; i=i+3){
            input[PixelBGRCounter].b = imageData[i];
            input[PixelBGRCounter].g = imageData[i+1];
            input[PixelBGRCounter].r = imageData[i+2];
            PixelBGRCounter++;
    }
}

void BackGrRemoval(PixelBGR* in,PixelBGR* out,u8 threshold,u8 kernel_size,u32 width,u32 height){
    
    u16 total_Pixel_in_kernel = kernel_size*kernel_size;
    u16 EightyPercentOfKernel = (int)(total_Pixel_in_kernel*0.8f);
    u16 Gr_pixel_in_total = 0;
    u16 Half_size_kernel = (int)((kernel_size-1)/2);

    PixelHSV *output = (PixelHSV *)malloc(PixelNumber * sizeof(PixelHSV));
    findHSV(in,output);

    for(u32 y = 0+Half_size_kernel; y < height-Half_size_kernel+1; y++){
        for(u32 x = 0+Half_size_kernel; x < width-Half_size_kernel+1; x++){

            //Find a ground pixel
            if (output[x+y*width].h < threshold){
                for (u32 j = y-Half_size_kernel; j <y+Half_size_kernel;j++){
                    for(u32 i = x-Half_size_kernel;i < x+Half_size_kernel;i++){
                        if (output[i+j*width].h < threshold)
                            Gr_pixel_in_total++;
                    }
                }

                if (Gr_pixel_in_total >= EightyPercentOfKernel)
                    for (u32 j = y-Half_size_kernel; j <y+Half_size_kernel;j++){
                        for(u32 i = x-Half_size_kernel;i < x+Half_size_kernel;i++){
                            out[i+j*width].b = 255;
                            out[i+j*width].g = 255;
                            out[i+j*width].r = 255;
                        }
                    }                  
            }
            //Reset the gr pixel counter
            Gr_pixel_in_total = 0;

        }
    }


}


