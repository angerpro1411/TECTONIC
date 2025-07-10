#include "parameters.h"
#include "RGB2HSV.h"
#include "BackGrRemoval.h"
/*
//in HLS array must be fix, we choose our image is 320x240
void BackGrRemoval(PixelBGR* inBGR,u8 threshold){


    // Pixel number now fix as constant with resolution 320x240
    
    const u8 total_Pixel_in_kernel = 121;
    const u8 EightyPercentOfKernel = 96;
    const u8 kernel_size = 11;
    u8 Gr_pixel_in_total = 0;
    const unsigned char Half_size_kernel = 5;
    u8 h[PixelNumber];
    u8 s[PixelNumber];
    u8 v[PixelNumber];
#pragma HLS ARRAY_PARTITION variable=h cyclic factor=16 dim=1


    findHSV(inBGR,h,s,v);

    image_row_loop:
    for(u32 y = 0+Half_size_kernel; y < imageHeight-Half_size_kernel; y++){

    	image_column_loop:
    	for(u32 x = 0+Half_size_kernel; x < imageWidth-Half_size_kernel; x++){
#pragma HLS PIPELINE II=8

    		//Find a ground pixel
    		u8 centerKer = h[x+y*imageWidth];
            if ( centerKer < threshold){

            	y_Condition_kernel_loop:
            	for (u32 j = 0; j < kernel_size;j++){

            		x_condition_kernel_loop:
            		for(u32 i = 0;i < kernel_size;i++){
#pragma HLS PIPELINE II=1
            			u32 idx = (x+i-Half_size_kernel)+
            					  (y+j-Half_size_kernel)*imageWidth;
                        if (h[idx] < threshold)
                            Gr_pixel_in_total++;
                    }
                }

                if (Gr_pixel_in_total >= EightyPercentOfKernel)
                    y_kernel_pass_loop:
					for (u32 j = 0; j < kernel_size;j++){
                        x_kernel_pass_loop:
						for(u32 i = 0;i < kernel_size;i++){
							u32 idx = (x+i-Half_size_kernel)+
									  (y+j-Half_size_kernel)*imageWidth;
#pragma HLS PIPELINE II=1
                            inBGR[idx].b = 255;
                            inBGR[idx].g = 255;
                            inBGR[idx].r = 255;
                        }
                    }                  
            }
            //Reset the gr pixel counter
            Gr_pixel_in_total = 0;

        }
    }

}

*/


void BackGrRemoval(PixelBGR* inBGR, u8 threshold) {

    const u8 kernel_size = 11;
    const u8 total_Pixel_in_kernel = 121;
    const u8 EightyPercentOfKernel = 96;
    const u8 Half_size_kernel = 5;

    u8 h[PixelNumber];
    u8 s[PixelNumber];
    u8 v[PixelNumber];

#pragma HLS RESOURCE variable=h core=RAM_T2P_BRAM
#pragma HLS ARRAY_PARTITION variable=h block factor=32 dim=1

    // Convert RGB to HSV and store H/S/V channels
    findHSV(inBGR, h, s, v);

    image_row_loop:
    for (u32 y = Half_size_kernel; y < imageHeight - Half_size_kernel; y++) {

        image_column_loop:
        for (u32 x = Half_size_kernel; x < imageWidth - Half_size_kernel; x++) {
#pragma HLS PIPELINE II=1

            u32 center_idx = x + y * imageWidth;
            u8 center_h = h[center_idx];

            // Process only if center pixel is below threshold
            if (center_h < threshold) {

                u8 local_kernel[121];
#pragma HLS ARRAY_PARTITION variable=local_kernel complete dim=1

                // Load local 11x11 window from h[]
                u32 count = 0;
                load_kernel:
                for (u32 j = 0; j < kernel_size; j++) {
                    for (u32 i = 0; i < kernel_size; i++) {
#pragma HLS UNROLL
                        u32 idx = (x + i - Half_size_kernel) +
                                  (y + j - Half_size_kernel) * imageWidth;
                        u8 h_val = h[idx];
                        local_kernel[j * kernel_size + i] = h_val;
                        if (h_val < threshold) count++;
                    }
                }

                // If ground pixel count is high enough, whiten the region
                if (count >= EightyPercentOfKernel) {
                    whiten_kernel:
                    for (u32 j = 0; j < kernel_size; j++) {
                        for (u32 i = 0; i < kernel_size; i++) {
#pragma HLS UNROLL
                            u32 idx = (x + i - Half_size_kernel) +
                                      (y + j - Half_size_kernel) * imageWidth;
                            inBGR[idx].r = 255;
                            inBGR[idx].g = 255;
                            inBGR[idx].b = 255;
                        }
                    }
                }
            }
        }
    }
}

