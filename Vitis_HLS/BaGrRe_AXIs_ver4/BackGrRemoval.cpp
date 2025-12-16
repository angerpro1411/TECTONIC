#include "parameters.h"
#include "RGB2HSV.h"
#include <hls_stream.h>
#include <ap_axi_sdata.h>

#define KERNEL 11
#define HALF   (KERNEL/2)
#define THRESHOLD_DEFAULT 60

void BackGrRemovalStream(hls::stream<AXI_VAL> &input_stream,
                         hls::stream<AXI_VAL> &output_stream)
{
#pragma HLS INTERFACE axis port=input_stream
#pragma HLS INTERFACE axis port=output_stream
#pragma HLS INTERFACE ap_ctrl_none port=return   // <-- No AXI-Lite control port
#pragma HLS DATAFLOW

    // --- Line buffer for H only ---
    static u8 h_line[KERNEL][imageWidth];
#pragma HLS ARRAY_PARTITION variable=h_line complete dim=1

    // --- Main Processing ---
    row_loop: for (u32 y = 0; y < imageHeight; y++) {
        col_loop: for (u32 x = 0; x < imageWidth; x++) {
#pragma HLS PIPELINE II=1
            // --- Read pixel from stream ---
            AXI_VAL pixel_in = input_stream.read();
            PixelBGR px;
            px.r = pixel_in.data.range(23,16);
            px.g = pixel_in.data.range(15,8);
            px.b = pixel_in.data.range(7,0);

            // --- Compute H ---
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

            // --- Shift line buffer ---
            for (u32 k = 0; k < KERNEL-1; k++) {
#pragma HLS UNROLL
                h_line[k][x] = h_line[k+1][x];
            }
            h_line[KERNEL-1][x] = h_val;

            // --- Compute local thresholding ---
            u8 count = 0;
            u8 total = 0;

            kernel_loop: for (int i = 0; i < KERNEL; i++) {
#pragma HLS UNROLL
                int yy = y + i - HALF;
                if (yy < 0 || yy >= imageHeight) continue;

                u8 h_neighbor = h_line[i][x];
                total++;
                if (h_neighbor < THRESHOLD_DEFAULT) count++;
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
            pixel_out.last = (y == imageHeight - 1 && x == imageWidth - 1); // mark last pixel
            pixel_out.id   = 0;
            pixel_out.dest = 0;
            output_stream.write(pixel_out);
        }
    }
}
