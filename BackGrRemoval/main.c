#include "stdio.h"
#include "stdlib.h"
#include "parameters.h"
#include "RGB2HSV.h"

u32 FileSizeReturner(FILE *fptr);
// u8 MaxOf3(u8 b, u8 g, u8 r);
// u8 MinOf3(u8 b, u8 g, u8 r);
// u8 findHSV(PixelBGR* in,PixelHSV* out, u32 PixelNumber);
void BackGrRemoval(PixelBGR* in,u8 threshold,u8 kernel_size,u32 width,u32 height);

int main(){
    


    FILE* fptr = fopen("13.bmp","r");
    if(fptr == NULL){
        printf("Not be able to open file/File doesn't exist\n");
        exit(1);
    }

    u32 fileSize = FileSizeReturner(fptr);


    //Create dynamic allocation to store file
    u8 imageData[fileSize];

    u8 FILE_OUT[fileSize];

    //Put all data into array
    // for(int i=0;i<fileSize;i++){
    //     imageData[i] = fgetc(fptr);
    // }

    fread(imageData, 1, fileSize, fptr);
    


    //Check imageData is correct or not
    // for(int i=0;i<10;i++)    
    //     printf("imageData[%d]=0x%x\n",i,imageData[i]);
    //Checked -> correct
    


    //Get imageHeight and imageWidth from data
    u32 width = (u32)(imageData[21] << 24) |
                    (u32)(imageData[20] << 16) |
                        (u32)(imageData [19] << 8) |
                            (u32)(imageData[18] << 0);
    u32 height  = (u32)(imageData[25] << 24) |
                    (u32)(imageData[24] << 16) |
                        (u32)(imageData [23] << 8) |
                            (u32)(imageData[22] << 0);                       

    u32 PixelNumber = width*height;
    u32 Offset2Pixel = (u32)(imageData[13] << 24) |
                        (u32)(imageData[12] << 16) |
                            (u32)(imageData [11] << 8) |
                                (u32)(imageData[10] << 0);

    u8 bytesPerPixel = 3;

    //actual row size instead of raw width. 
    //BMP files require that each row of pixel is aligned to a multiple of 4 bytes.
    //If not, padding 0x00 bytes to make it align.
    //Width*bytesPerPixel = raw width per row. Plus 3 to round up nearest 4.
    //Then wipe out last 2 bits(~3 = 0x1111..100) to make it divisibly by 4.
    u32 rowSize_wPadding = (width*bytesPerPixel+3) & ~3;

    u32 RealImageSize = height*rowSize_wPadding;
    u8* pixelData = malloc(sizeof(u8)*RealImageSize);

    //Extract only pixel data
    fseek(fptr,Offset2Pixel,SEEK_SET);
    fread(pixelData,1,RealImageSize,fptr);
    fclose(fptr);

    //Print some to check
    // for(int i=0;i<10;i++){
    //     printf("Pixel[%d] = 0x%x",i,pixelData[i]);
    // }



    PixelBGR *input = (PixelBGR *)malloc(PixelNumber * sizeof(PixelBGR));
    // PixelBGR *output = (PixelBGR *)malloc(PixelNumber * sizeof(PixelBGR));


    
    //Handling from the bottom
    u32 PixelBGRCounter = 0;
    for(int y=0;y<height;y++){
        //Read from the bottom of data due to BMP format
        u32 rowIndex = (height-1-y);
        for(int x=0;x<width;x++){
            u32 idx = rowIndex*rowSize_wPadding+x*bytesPerPixel;
                input[PixelBGRCounter].b = pixelData[idx];
                input[PixelBGRCounter].g = pixelData[idx+1];
                input[PixelBGRCounter].r = pixelData[idx+2];
                PixelBGRCounter++;
        }
    }


    //Print 10 first value of BGR
    // for(int i=0;i<10;i++){
    //     printf("Pixel[%d]: b = 0x%x, g = 0x%x, r = 0x%x\n",i,input[i].b,input[i].g,input[i].r);
    // }

    //Print 10 first value of BGR
    // for(int i=0;i < 10;i++){
    //     printf("Pixel[%d]: b = %d, g = %d, r = %d\n",i,input[i].b,input[i].g,input[i].r);
    // }


    // //Print 10 last value of BGR
    // for(int i=PixelNumber-1;i >= PixelNumber-10;i--){
    //     printf("Pixel[%d]: b = %d, g = %d, r = %d\n",i,input[i].b,input[i].g,input[i].r);
    // }
    //Call BackGrRemoval Function
    BackGrRemoval(input,45,11,width,height);


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
    for(int y=0;y<height;y++){
        //write from the bottom of data due to BMP format
        u32 rowIndex = (height-1-y);
        for(int x=0;x<width;x++){
            u32 idx = rowIndex*rowSize_wPadding+x*bytesPerPixel;
                pixelData[idx] = input[PixelBGRCounter].b;
                pixelData[idx+1] = input[PixelBGRCounter].g;
                pixelData[idx+2] = input[PixelBGRCounter].r;
                PixelBGRCounter++;
        }
    }

    //write header
	for(int i=0;i<Offset2Pixel;i++){
		fputc(FILE_OUT[i],fptr);
	}
    
    //write data
    fwrite(pixelData,1,RealImageSize,fptr);

    free(input);

    free(pixelData);
	fclose(fptr);    

    return 0;        
}

void BackGrRemoval(PixelBGR* inBGR,u8 threshold,u8 kernel_size,u32 width,u32 height){
    
    u16 total_Pixel_in_kernel = kernel_size*kernel_size;
    u16 EightyPercentOfKernel = (int)(total_Pixel_in_kernel*0.8f);
    u16 Gr_pixel_in_total = 0;
    u16 Half_size_kernel = (int)((kernel_size-1)/2);
    u32 PixelNumber = width*height;

    //Print 10 first value of BGR
    // for(int i=0;i<10;i++){
    //     printf("PixelinBGR[%d]: b = 0x%x, g = 0x%x, r = 0x%x\n",i,inBGR[i].b,inBGR[i].g,inBGR[i].r);
    // }

    //Print 10 last value of BGR
    // for(int i=PixelNumber-1;i>=PixelNumber-10;i--){
    //     printf("PixelinBGR[%d]: b = 0x%x, g = 0x%x, r = 0x%x\n",i,inBGR[i].b,inBGR[i].g,inBGR[i].r);
    // }    

    PixelHSV *outHSV = (PixelHSV *)malloc(PixelNumber * sizeof(PixelHSV));
    findHSV(inBGR,outHSV,PixelNumber);

    //print exemple of 100 h values
    // for(int i=0;i<10;i++)
    //     printf("PixelHSV[%d]: h = %d, s = %d, v = %d\n",i,outHSV[i].h,outHSV[i].s,outHSV[i].v);


    for(u32 y = 0+Half_size_kernel; y < height-Half_size_kernel+1; y++){
        for(u32 x = 0+Half_size_kernel; x < width-Half_size_kernel+1; x++){

            //Find a ground pixel
            if (outHSV[x+y*width].h < threshold){
                for (u32 j = y-Half_size_kernel; j <y+Half_size_kernel;j++){
                    for(u32 i = x-Half_size_kernel;i < x+Half_size_kernel;i++){
                        if (outHSV[i+j*width].h < threshold)
                            Gr_pixel_in_total++;
                    }
                }

                if (Gr_pixel_in_total >= EightyPercentOfKernel)
                    for (u32 j = y-Half_size_kernel; j <y+Half_size_kernel;j++){
                        for(u32 i = x-Half_size_kernel;i < x+Half_size_kernel;i++){
                            inBGR[i+j*width].b = 255;
                            inBGR[i+j*width].g = 255;
                            inBGR[i+j*width].r = 255;
                        }
                    }                  
            }
            //Reset the gr pixel counter
            Gr_pixel_in_total = 0;

        }
    }
    free(outHSV);

}

u32 FileSizeReturner(FILE *fptr){
    fseek(fptr, 0L, SEEK_END);
    u32 sz = ftell(fptr);

    rewind(fptr);
    return sz;
}


// //These functions to conversion bgr to hsv
// u8 MaxOf3(u8 b, u8 g, u8 r){
//     u8 max = b;
//     if (max <= g) max = g;
//     if (max <= r) max = r;
//     return max;
// }

// u8 Minof3(u8 b, u8 g, u8 r){
//     u8 min = b;
//     if(min >= g) min = g;
//     if(min >= r) min = r;
//     return min;
// }

// u8 findHSV(PixelBGR* in,PixelHSV* out, u32 PixelNumber){
    
//     float tmp = 0.0;

//     //Find all V values
//     for(u32 i=0;i<PixelNumber;i++){
//         u8 max = MaxOf3(in[i].b,in[i].g,in[i].r);
//         u8 min = Minof3(in[i].b,in[i].g,in[i].r);
//         float diff = max - min;

//         //V values
//         out[i].v = max; 

//         //S values
//         if (max == 0) out[i].s = 0;
//         else
//             out[i].s = diff/(float)max*255;

//         //H values
//         if (max == min) tmp = 0;//only happends if 3 values b = g = r
//         else if(max == in[i].r) tmp = 60*(float)(in[i].g-in[i].b)/diff;
//         else if(max == in[i].g) tmp = 120 + 60*(float)(in[i].b-in[i].r)/diff;
//         else if(max == in[i].b) tmp = 240 + 60*(float)(in[i].r-in[i].g)/diff;
        
//         if ((int)tmp < 0 ) out[i].h = (tmp + 360)/2;
//         else 
//             out[i].h = tmp/2;
//         }    

// }