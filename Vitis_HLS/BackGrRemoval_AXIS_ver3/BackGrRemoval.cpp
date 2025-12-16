//#include "parameters.h"
//#include "RGB2HSV.h"
//#include <hls_stream.h>
//#include <ap_axi_sdata.h>
//
//#define KERNEL 11
//#define HALF   (KERNEL/2)
//#define THRESHOLD_DEFAULT 30
//
//void BackGrRemovalStream(hls::stream<AXI_VAL> &input_stream,
//                         hls::stream<AXI_VAL> &output_stream,
//                         u8 threshold)
//{
//#pragma HLS INTERFACE axis port=input_stream
//#pragma HLS INTERFACE axis port=output_stream
//#pragma HLS INTERFACE s_axilite port=threshold bundle=control
//#pragma HLS INTERFACE s_axilite port=return bundle=control
//#pragma HLS DATAFLOW
//
//    static PixelBGR line_buffer[KERNEL][imageWidth];
//#pragma HLS ARRAY_PARTITION variable=line_buffer complete dim=1
//
//    static u8 h_line[KERNEL][imageWidth];
//#pragma HLS ARRAY_PARTITION variable=h_line complete dim=1
//
//    PixelBGR window[KERNEL][KERNEL];
//#pragma HLS ARRAY_PARTITION variable=window complete dim=0
//
//    for (u32 y = 0; y < imageHeight; y++) {
//        for (u32 x = 0; x < imageWidth; x++) {
//#pragma HLS PIPELINE II=1
//            // Read pixel from stream
//            AXI_VAL pixel_in = input_stream.read();
//            PixelBGR px;
//            px.r = pixel_in.data.range(23,16);
//            px.g = pixel_in.data.range(15,8);
//            px.b = pixel_in.data.range(7,0);
//
//            // Convert to H on-the-fly
//            u8 h_val;
//            {
//                u8 max = MaxOf3(px.b, px.g, px.r);
//                u8 min = Minof3(px.b, px.g, px.r);
//                float diff = max - min;
//                float tmp;
//
//                if (max == min) tmp = 0;
//                else if (max == px.r) tmp = 60.0f * (px.g - px.b) / diff;
//                else if (max == px.g) tmp = 120.0f + 60.0f * (px.b - px.r) / diff;
//                else tmp = 240.0f + 60.0f * (px.r - px.g) / diff;
//
//                if (tmp < 0) tmp += 360.0f;
//                h_val = (u8)(tmp / 2.0f);
//            }
//
//            // Shift line buffer
//            for (u32 k = 0; k < KERNEL-1; k++) {
//                line_buffer[k][x] = line_buffer[k+1][x];
//                h_line[k][x] = h_line[k+1][x];
//            }
//            line_buffer[KERNEL-1][x] = px;
//            h_line[KERNEL-1][x] = h_val;
//
//            // Shift window
//            for (u32 i = 0; i < KERNEL; i++) {
//                for (u32 j = 0; j < KERNEL-1; j++) {
//                    window[i][j] = window[i][j+1];
//                }
//                window[i][KERNEL-1] = line_buffer[i][x];
//            }
//
//            PixelBGR out_px = px;
//
//            // --- Border-aware kernel ---
//            u32 count = 0;
//            u32 total_neighbors = 0;
//
//            for (int i = 0; i < KERNEL; i++) {
//                int yy = y + i - HALF;
//                if (yy < 0 || yy >= imageHeight) continue;
//
//                for (int j = 0; j < KERNEL; j++) {
//                    int xx = x + j - HALF;
//                    if (xx < 0 || xx >= imageWidth) continue;
//
//                    total_neighbors++;
//                    if (h_line[i][xx] < threshold) count++;
//                }
//            }
//
//            if (total_neighbors > 0 && count * 10 >= total_neighbors * 8) { // 80% of available neighbors
//                out_px.r = 255;
//                out_px.g = 255;
//                out_px.b = 255;
//            }
//
//            // Write to output stream
//            AXI_VAL pixel_out;
//            pixel_out.data.range(23,16) = out_px.r;
//            pixel_out.data.range(15,8)  = out_px.g;
//            pixel_out.data.range(7,0)   = out_px.b;
//            pixel_out.keep = -1;
//            pixel_out.strb = -1;
//            pixel_out.user = 0;
//            pixel_out.last = 0;
//            pixel_out.id   = 0;
//            pixel_out.dest = 0;
//            output_stream.write(pixel_out);
//        }
//    }
//}

#include "parameters.h"
#include "RGB2HSV.h"
#include <hls_stream.h>
#include <ap_axi_sdata.h>

#define KERNEL 11
#define HALF   (KERNEL/2)
#define THRESHOLD_DEFAULT 30

void BackGrRemovalStream(hls::stream<AXI_VAL> &input_stream,
                         hls::stream<AXI_VAL> &output_stream,
                         u8 threshold)
{
#pragma HLS INTERFACE axis port=input_stream
#pragma HLS INTERFACE axis port=output_stream
#pragma HLS INTERFACE s_axilite port=threshold bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control
#pragma HLS DATAFLOW

    // --- Line buffer for H only (most important for thresholding)
    static u8 h_line[KERNEL][imageWidth];
#pragma HLS ARRAY_PARTITION variable=h_line complete dim=1

    // Shift registers for sliding window counts
    u8 h_window[KERNEL];
#pragma HLS ARRAY_PARTITION variable=h_window complete

    // Loop over rows
    row_loop: for (u32 y = 0; y < imageHeight; y++) {
        // Loop over columns
        col_loop: for (u32 x = 0; x < imageWidth; x++) {
#pragma HLS PIPELINE II=1
            // --- Read pixel from stream ---
            AXI_VAL pixel_in = input_stream.read();
            PixelBGR px;
            px.r = pixel_in.data.range(23,16);
            px.g = pixel_in.data.range(15,8);
            px.b = pixel_in.data.range(7,0);

            // --- Compute H in fixed-point (avoid float) ---
            u8 h_val;
            {
                u8 max = MaxOf3(px.b, px.g, px.r);
                u8 min = Minof3(px.b, px.g, px.r);
                u8 diff = max - min;
                int tmp;

                if (max == min) tmp = 0;
                else if (max == px.r) tmp = (60 * (int)(px.g - px.b) + diff/2) / diff;
                else if (max == px.g) tmp = 120 + (60 * (int)(px.b - px.r) + diff/2)/diff;
                else tmp = 240 + (60 * (int)(px.r - px.g) + diff/2)/diff;

                if (tmp < 0) tmp += 360;
                h_val = tmp >> 1; // divide by 2
            }

            // --- Shift line buffer (circular buffer style) ---
            for (u32 k = 0; k < KERNEL-1; k++) {
#pragma HLS UNROLL
                h_line[k][x] = h_line[k+1][x];
            }
            h_line[KERNEL-1][x] = h_val;

            // --- Compute neighborhood count (border-aware) ---
            u8 count = 0;
            u8 total = 0;

            kernel_loop: for (int i = 0; i < KERNEL; i++) {
#pragma HLS UNROLL
                int yy = y + i - HALF;
                if (yy < 0 || yy >= imageHeight) continue;

                u8 h_neighbor = h_line[i][x];
                total++;
                if (h_neighbor < threshold) count++;
            }

            PixelBGR out_px = px;
            if (total > 0 && count * 10 >= total * 8) {
                out_px.r = 255;
                out_px.g = 255;
                out_px.b = 255;
            }

            // --- Write to output stream ---
            AXI_VAL pixel_out;
            pixel_out.data.range(23,16) = out_px.r;
            pixel_out.data.range(15,8)  = out_px.g;
            pixel_out.data.range(7,0)   = out_px.b;
            pixel_out.keep = -1;
            pixel_out.strb = -1;
            pixel_out.user = 0;
            pixel_out.last = 0;
            pixel_out.id   = 0;
            pixel_out.dest = 0;
            output_stream.write(pixel_out);
        }
    }
}

