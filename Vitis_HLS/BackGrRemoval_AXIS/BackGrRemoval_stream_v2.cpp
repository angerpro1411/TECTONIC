// BackGrRemoval_stream_v2_wholewindow.cpp
#include "parameters.h"
#include <hls_stream.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>

typedef ap_axiu<24,1,1,1> AXI_VAL;
typedef hls::stream<AXI_VAL> axis_t;

static inline void pack_axi_pixel(AXI_VAL &axi, u8 r, u8 g, u8 b, bool last=false) {
    ap_uint<24> d = ((ap_uint<24>)r << 16) | ((ap_uint<24>)g << 8) | (ap_uint<24>)b;
    axi.data = d;
    axi.keep = -1;
    axi.strb = -1;
    axi.user = 0;
    axi.id = 0;
    axi.dest = 0;
    axi.last = last ? 1 : 0;
}

static inline void unpack_axi_pixel(const AXI_VAL &axi, u8 &r, u8 &g, u8 &b) {
    ap_uint<24> d = axi.data;
    r = (u8)(d.range(23,16));
    g = (u8)(d.range(15,8));
    b = (u8)(d.range(7,0));
}

static inline u8 rgb_to_h_scaled(u8 r, u8 g, u8 b) {
#pragma HLS INLINE
    u8 maxv = (r > g) ? ((r > b) ? r : b) : ((g > b) ? g : b);
    u8 minv = (r < g) ? ((r < b) ? r : b) : ((g < b) ? g : b);
    u8 diff = maxv - minv;
    if (diff == 0) return 0;
    int hue = 0;
    if (maxv == r)
        hue = 60 * ((int)g - (int)b) / (int)diff;
    else if (maxv == g)
        hue = 120 + 60 * ((int)b - (int)r) / (int)diff;
    else
        hue = 240 + 60 * ((int)r - (int)g) / (int)diff;
    if (hue < 0) hue += 360;
    return (u8)(hue / 2); // 0..179 scaled to 0..~90 (but you used /2 previously)
}

// Streaming background removal: whiten entire KxK window when condition holds.
// This version uses a K-row circular buffer and mask writeback to whiten previous pixels.
void BackGrRemoval_stream_v2(axis_t &in_stream, axis_t &out_stream,
                             u8 threshold, int rows, int cols) {
#pragma HLS INTERFACE axis port=in_stream
#pragma HLS INTERFACE axis port=out_stream
#pragma HLS INTERFACE s_axilite port=threshold bundle=control
#pragma HLS INTERFACE s_axilite port=rows bundle=control
#pragma HLS INTERFACE s_axilite port=cols bundle=control
#pragma HLS INTERFACE s_axilite port=return bundle=control

    const int K = 11;
    const int HALF = 5;
    const int THRESH_COUNT = 96;

    // Circular buffers sized for K rows and full imageWidth (imageWidth from parameters.h)
    static u8 rgb_r[K][imageWidth];
    static u8 rgb_g[K][imageWidth];
    static u8 rgb_b[K][imageWidth];
#pragma HLS RESOURCE variable=rgb_r core=RAM_1P_BRAM
#pragma HLS RESOURCE variable=rgb_g core=RAM_1P_BRAM
#pragma HLS RESOURCE variable=rgb_b core=RAM_1P_BRAM
#pragma HLS ARRAY_PARTITION variable=rgb_r cyclic factor=8 dim=1
#pragma HLS ARRAY_PARTITION variable=rgb_g cyclic factor=8 dim=1
#pragma HLS ARRAY_PARTITION variable=rgb_b cyclic factor=8 dim=1

    // Hue buffer (for quick window access)
    static u8 hue_row[K][imageWidth];
#pragma HLS RESOURCE variable=hue_row core=RAM_1P_BRAM
#pragma HLS ARRAY_PARTITION variable=hue_row cyclic factor=8 dim=1

    // Whitening mask buffer for those K rows
    static bool mask_row[K][imageWidth];
#pragma HLS RESOURCE variable=mask_row core=RAM_1P_BRAM
#pragma HLS ARRAY_PARTITION variable=mask_row cyclic factor=8 dim=1

    // Small KxK local window registers (fully partitioned for parallel access)
    static u8 row_shift[K][K];
#pragma HLS ARRAY_PARTITION variable=row_shift complete dim=0

    int total = rows * cols;
    int row = 0;
    int col = 0;

    // We will process all input pixels. Outputs are delayed by HALF rows and HALF cols:
    // when we have read current pixel at (row,col), we can determine/mark the window centered at
    // center=(row-HALF, col-HALF). We then emit the output pixel located at that center position
    // (once its final mask is known).
process_pixels:
    for (int pix = 0; pix < total; pix++) {
#pragma HLS PIPELINE II=1

#ifndef __SYNTHESIS__
    if (in_stream.empty()) {
        std::cerr << "Warning: in_stream empty at pix=" << pix << std::endl;
        break;
    }
#endif


        // --- Read input pixel ---
        AXI_VAL in_axi = in_stream.read();
        u8 r_in, g_in, b_in;
        unpack_axi_pixel(in_axi, r_in, g_in, b_in);

        // compute hue for this input
        u8 Hv = rgb_to_h_scaled(r_in, g_in, b_in);

        // circular buffer index for current row
        int cur_idx = row % K;

        // write RGB and hue into circular buffers at [cur_idx][col]
        rgb_r[cur_idx][col] = r_in;
        rgb_g[cur_idx][col] = g_in;
        rgb_b[cur_idx][col] = b_in;
        hue_row[cur_idx][col] = Hv;

        // clear mask for this new location (will be set if some center triggers it)
        mask_row[cur_idx][col] = false;

        // ----- Build KxK local window centered at (row - HALF, col - HALF) when possible -----
        // We will form the window H-values by indexing into hue_row circular buffer.
        // The top row of the window corresponds to row - (K-1) ; map that into circular index.
        bool valid_center = false;
        if ((row >= HALF) && (col >= HALF) && (row < (rows - HALF)) && (col < (cols - HALF))) {
            valid_center = true;
        }

        if (valid_center) {
            // center coordinates in *original image*:
            int center_row = row - HALF;
            int center_col = col - HALF;

            // top-left row of window = center_row - HALF = row - (K-1)
            int top_row = row - (K - 1);

            // Fill local row_shift from hue_row buffer
        build_window:
            for (int wy = 0; wy < K; wy++) {
#pragma HLS UNROLL
                int src_row = (top_row + wy);
                int src_idx = (src_row % K + K) % K; // positive modulo
                int base_col = center_col - HALF; // = col - (K-1)
            build_window_cols:
                for (int wx = 0; wx < K; wx++) {
#pragma HLS UNROLL
                    int src_col = base_col + wx;
                    // bounds check (should be within image if valid_center)
                    if (src_col >= 0 && src_col < cols) {
                        row_shift[wy][wx] = hue_row[src_idx][src_col];
                    } else {
                        row_shift[wy][wx] = 0;
                    }
                }
            }

            // Count how many H < threshold
            int count = 0;
        count_window:
            for (int wy = 0; wy < K; wy++) {
#pragma HLS UNROLL
                for (int wx = 0; wx < K; wx++) {
#pragma HLS UNROLL
                    u8 hv = row_shift[wy][wx];
                    if (hv < threshold) count++;
                }
            }

            if (count >= THRESH_COUNT) {
                // Mark the full KxK region in the circular mask buffer
            mark_window:
                for (int wy = 0; wy < K; wy++) {
#pragma HLS UNROLL
                    int src_row = (top_row + wy);
                    int mask_idx = (src_row % K + K) % K;
                    int base_col = center_col - HALF; // col - (K-1)
                mark_cols:
                    for (int wx = 0; wx < K; wx++) {
#pragma HLS UNROLL
                        int dst_col = base_col + wx;
                        if (dst_col >= 0 && dst_col < cols) {
                            mask_row[mask_idx][dst_col] = true;
                        }
                    }
                }
            }
        } // end valid_center

        // --- Emit output pixel when its final mask decision is available ---
        // Output coordinate = (out_row, out_col) = (row - HALF, col - HALF)
        if ((row >= HALF) && (col >= HALF)) {
            int out_row = row - HALF;
            int out_col = col - HALF;
            int out_idx = (out_row % K + K) % K;

            // fetch stored rgb and mask
            u8 rr = rgb_r[out_idx][out_col];
            u8 gg = rgb_g[out_idx][out_col];
            u8 bb = rgb_b[out_idx][out_col];
            bool whiten = mask_row[out_idx][out_col];

            u8 out_r, out_g, out_b;
            if (whiten) {
                out_r = 255;
                out_g = 255;
                out_b = 255;
            } else {
                out_r = rr;
                out_g = gg;
                out_b = bb;
            }

            // decide last flag: only the very last output pixel should assert last
            // We'll determine last later; for streaming we can compute if (out_row == rows-1 && out_col == cols-1)
            bool is_last = ((out_row == (rows - 1)) && (out_col == (cols - 1)));
            AXI_VAL out_axi;
            pack_axi_pixel(out_axi, out_r, out_g, out_b, is_last);
            out_stream.write(out_axi);
        }

        // advance col/row
        col++;
        if (col == cols) {
            col = 0;
            row++;
        }
    } // end main pix loop

    // After consuming all input pixels, we still have delayed outputs pending:
    // For rows = rows .. rows+HALF-1, emit outputs for cols where col >= HALF (i.e., out_col = col - HALF in 0..cols-1)
    // This flushes the final HALF*cols outputs.
flush_tail_rows:
    for (int tail_row = rows; tail_row < rows + HALF; tail_row++) {
#pragma HLS PIPELINE II=1
        for (int tail_col = 0; tail_col < cols; tail_col++) {
#pragma HLS PIPELINE II=1
            if (tail_col >= HALF) {
                int out_row = tail_row - HALF;
                int out_col = tail_col - HALF;
                int out_idx = (out_row % K + K) % K;
                u8 rr = rgb_r[out_idx][out_col];
                u8 gg = rgb_g[out_idx][out_col];
                u8 bb = rgb_b[out_idx][out_col];
                bool whiten = mask_row[out_idx][out_col];

                u8 out_r, out_g, out_b;
                if (whiten) {
                    out_r = 255;
                    out_g = 255;
                    out_b = 255;
                } else {
                    out_r = rr;
                    out_g = gg;
                    out_b = bb;
                }

                bool is_last = ((out_row == (rows - 1)) && (out_col == (cols - 1)));
                AXI_VAL out_axi;
                pack_axi_pixel(out_axi, out_r, out_g, out_b, is_last);
                out_stream.write(out_axi);
            }
        }
    }
}
