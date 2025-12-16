#include "ap_int.h"
#include "hls_stream.h"
#include "parameters.h"
#include "RGB2HSV.h"
#include "BackGrRemoval.h"

typedef ap_uint<24> AXI_PIXEL; // 8 bits per channel: R,G,B

void BackGrRemovalStream(hls::stream<AXI_PIXEL> &input_stream,
                         hls::stream<AXI_PIXEL> &output_stream,
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
        AXI_PIXEL pixel = input_stream.read();
        img[i].r = pixel.range(23,16);
        img[i].g = pixel.range(15,8);
        img[i].b = pixel.range(7,0);
    }

    // Call the original BackGrRemoval kernel
    BackGrRemoval(img, threshold);

    // Write processed image back to AXI stream
    write_loop:
    for (u32 i = 0; i < PixelNumber; i++) {
#pragma HLS PIPELINE II=1
        AXI_PIXEL out_pixel;
        out_pixel.range(23,16) = img[i].r;
        out_pixel.range(15,8)  = img[i].g;
        out_pixel.range(7,0)   = img[i].b;
        output_stream.write(out_pixel);
    }
}
