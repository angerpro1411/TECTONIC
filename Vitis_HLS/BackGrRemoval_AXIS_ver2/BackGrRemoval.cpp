#include "parameters.h"
#include "RGB2HSV.h"
#include "BackGrRemoval.h"

#include <ap_int.h>
#include <ap_axi_sdata.h>
#include "hls_stream.h"
#include "RGB2HSV.h"

/*
 * Version 3
 * */


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

#pragma HLS RESOURCE variable=h core=RAM_T2P_BRAM
#pragma HLS ARRAY_PARTITION variable=h cyclic factor=32 dim=1

//START::Adding part
    static PixelBGR outBGR[PixelNumber];
#pragma HLS RESOURCE variable=outBGR core=RAM_T2P_BRAM

    // Copy input initially
    for (u32 i = 0; i < PixelNumber; i++) {
#pragma HLS PIPELINE II=1
        outBGR[i] = inBGR[i];
    }
//END::Adding part

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
                            outBGR[idx].r = 255;
                            outBGR[idx].g = 255;
                            outBGR[idx].b = 255;
                        }
                    }
                }
            }
        }
    }
    // Copy result back
    for (u32 i = 0; i < PixelNumber; i++) {
#pragma HLS PIPELINE II=1
        inBGR[i] = outBGR[i];
    }
}


void BackGrRemovalStream(hls::stream<AXI_VAL> &input_stream,
                         hls::stream<AXI_VAL> &output_stream,
                         u8 threshold)
{
#pragma HLS INTERFACE axis port=input_stream
#pragma HLS INTERFACE axis port=output_stream
#pragma HLS INTERFACE s_axilite port=threshold bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    // Local buffer for image
    static PixelBGR img[PixelNumber];
#pragma HLS RESOURCE variable=img core=RAM_T2P_BRAM
#pragma HLS ARRAY_PARTITION variable=img cyclic factor=8 dim=1

    // Read AXI stream into local buffer
    read_loop:
    for (u32 i = 0; i < PixelNumber; i++) {
#pragma HLS PIPELINE II=1
        AXI_VAL pixel = input_stream.read();
        img[i].r = pixel.data.range(23,16);
        img[i].g = pixel.data.range(15,8);
        img[i].b = pixel.data.range(7,0);
    }

    // Call the original BackGrRemoval kernel
    BackGrRemoval(img, threshold);

    // Write processed image back to AXI stream
    write_loop:
    for (u32 i = 0; i < PixelNumber; i++) {
#pragma HLS PIPELINE II=1
        AXI_VAL out_pixel;
        out_pixel.data.range(23,16) = img[i].r;
        out_pixel.data.range(15,8)  = img[i].g;
        out_pixel.data.range(7,0)   = img[i].b;
        output_stream.write(out_pixel);
    }
}
