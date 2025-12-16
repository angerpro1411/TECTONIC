#include "parameters.h"
#include "RGB2HSV.h"
#include "BackGrRemoval.h"
/*Version 1
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

//---------------------------------------------------------------------------------------------//
/*Version 2
void BackGrRemoval(PixelBGR* inBGR, u8 threshold) {

    const u8 kernel_size = 11;
    const u8 total_Pixel_in_kernel = 121;
    const u8 EightyPercentOfKernel = 96;
    const u8 Half_size_kernel = 5;

    u8 h[PixelNumber];
    u8 s[PixelNumber];
    u8 v[PixelNumber];

    //Bool mask for whitening pixel
    bool mask[PixelNumber];



#pragma HLS RESOURCE variable=h core=RAM_T2P_BRAM
#pragma HLS ARRAY_PARTITION variable=h block factor=32 dim=1

    //Init mask value
    Mask_init:for(u32 index=0; index <= PixelNumber; index++){
#pragma HLS PIPELINE II=1
    	mask[index] = false;
    }


    // Convert RGB to HSV and store H/S/V channels
    findHSV(inBGR, h, s, v);

    image_row_loop:
    for (u32 y = Half_size_kernel; y < imageHeight - Half_size_kernel; y++) {

        image_column_loop:
        for (u32 x = Half_size_kernel; x < imageWidth - Half_size_kernel; x++) {
#pragma HLS PIPELINE II=1

            u32 center_idx = x + y * imageWidth;
            u8 center_h = h[center_idx];
            u32 count = 0;
            // Process only if center pixel is below threshold
            if (center_h < threshold) {


                // Load local 11x11 window from h[]

                load_kernel:
                for (u32 j = 0; j < kernel_size; j++) {
                    for (u32 i = 0; i < kernel_size; i++) {
#pragma HLS UNROLL
                        u32 idx = (x + i - Half_size_kernel) +
                                  (y + j - Half_size_kernel) * imageWidth;
                        u8 h_val = h[idx];
//                        local_kernel[j * kernel_size + i] = h_val;
                        if (h_val < threshold) {
                        	mask[idx] = true;
                        	count++;
                        	}
                        }
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
*/
//---------------------------------------------------------------------------------------------//

/*
 * Version 3
 * */
#include "parameters.h"
#include "RGB2HSV.h"

void BackGrRemoval(PixelBGR* inBGR, u8 threshold) {
#pragma HLS INTERFACE m_axi port=inBGR offset=slave bundle=gmem
#pragma HLS INTERFACE s_axilite port=threshold bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    const u8 kernel_size = 11;
    const u8 total_Pixel_in_kernel = 121;
    const u8 EightyPercentOfKernel = 96;
    const u8 Half_size_kernel = 5;

    static u8 h[PixelNumber];
    static u8 s[PixelNumber];
    static u8 v[PixelNumber];
    static bool mask[PixelNumber];

#pragma HLS RESOURCE variable=h core=RAM_T2P_BRAM
#pragma HLS ARRAY_PARTITION variable=h cyclic factor=32 dim=1
#pragma HLS RESOURCE variable=mask core=RAM_T2P_BRAM

    // Initialize mask
    Mask_init:
    for (u32 index = 0; index < PixelNumber; index++) {
#pragma HLS PIPELINE II=1
        mask[index] = false;
    }

    // Convert RGB to HSV
    findHSV(inBGR, h, s, v);

    // Process each pixel
    image_row_loop:
    for (u32 y = Half_size_kernel; y < imageHeight - Half_size_kernel; y++) {
        image_column_loop:
        for (u32 x = Half_size_kernel; x < imageWidth - Half_size_kernel; x++) {
#pragma HLS PIPELINE II=1
            u32 center_idx = x + y * imageWidth;
            u8 center_h = h[center_idx];
            u32 count = 0;

            if (center_h < threshold) {
                // Count neighborhood pixels below threshold
                kernel_y:
                for (u32 j = 0; j < kernel_size; j++) {
                    kernel_x:
                    for (u32 i = 0; i < kernel_size; i++) {
#pragma HLS UNROLL factor=4
                        u32 idx = (x + i - Half_size_kernel)
                                + (y + j - Half_size_kernel) * imageWidth;
                        if (h[idx] < threshold) {
                            mask[idx] = true;
                            count++;
                        }
                    }
                }

                // Whiten the region if enough background pixels found
                if (count >= EightyPercentOfKernel) {
                    whiten_kernel:
                    for (u32 j = 0; j < kernel_size; j++) {
                        for (u32 i = 0; i < kernel_size; i++) {
#pragma HLS UNROLL factor=4
                            u32 idx = (x + i - Half_size_kernel)
                                    + (y + j - Half_size_kernel) * imageWidth;
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
