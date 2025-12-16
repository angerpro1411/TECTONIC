#include <hls_stream.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <hls_math.h>

#define IMG_WIDTH  320
#define IMG_HEIGHT 240
const unsigned char threshold = 220;

// 24-bit RGB pixel type for both input/output
typedef ap_axiu<24,1,1,1> axis_rgb_t;

void sobel_rgb_green_outline_fixed(
    hls::stream<axis_rgb_t>& in_stream,
    hls::stream<axis_rgb_t>& out_stream
)
{
#pragma HLS INTERFACE axis port=in_stream
#pragma HLS INTERFACE axis port=out_stream
#pragma HLS INTERFACE ap_ctrl_none port=return



    // Two-line grayscale buffer
    static ap_uint<8> linebuf[2][IMG_WIDTH];
#pragma HLS DEPENDENCE variable=linebuf inter false
#pragma HLS ARRAY_PARTITION variable=linebuf complete dim=1

    // 3x3 window for grayscale pixels
    ap_uint<8> window[3][3];
#pragma HLS ARRAY_PARTITION variable=window complete dim=0

    int row = 0, col = 0;

    OUTER: for (int i = 0; i < IMG_HEIGHT * IMG_WIDTH; i++) {
#pragma HLS PIPELINE II=2

        axis_rgb_t in_pix = in_stream.read();

        // Extract BGR from AXI stream (24-bit)
        ap_uint<8> B = (in_pix.data >> 16) & 0xFF;
        ap_uint<8> G = (in_pix.data >> 8) & 0xFF;
        ap_uint<8> R = (in_pix.data) & 0xFF;

        // Convert to grayscale (integer approximation)
        ap_uint<8> gray = (ap_uint<8>)((R * 30 + G * 59 + B * 11) / 100);

        // Shift window left
        INNER: for (int wy = 0; wy < 3; wy++) {
#pragma HLS UNROLL
            window[wy][0] = window[wy][1];
            window[wy][1] = window[wy][2];
        }

        // Fill rightmost column
        ap_uint<8> top    = (row >= 2) ? linebuf[(row-2)&1][col] : (ap_uint<8>)0;
        ap_uint<8> middle = (row >= 1) ? linebuf[(row-1)&1][col] : (ap_uint<8>)0;
        ap_uint<8> bottom = gray;

        window[0][2] = top;
        window[1][2] = middle;
        window[2][2] = bottom;

        // Update line buffer
        linebuf[row & 1][col] = gray;

        // Default: output original RGB
        ap_uint<8> outR = R;
        ap_uint<8> outG = G;
        ap_uint<8> outB = B;

        // Compute edge for valid pixels
        if (row >= 2 && col >= 2) {
        	ap_int<11> gx = -window[0][0] + window[0][2]
                   - 2 * window[1][0] + 2 * window[1][2]
                   - window[2][0] + window[2][2];

        	ap_int<11> gy = -window[0][0] - 2 * window[0][1] - window[0][2]
                   + window[2][0] + 2 * window[2][1] + window[2][2];

        	ap_uint<21> mag_sq = gx * gx + gy * gy;
            int threshold_sq = threshold * threshold;

            if (mag_sq > threshold_sq) {
                outR = 0;
                outG = 255;
                outB = 0;
            }
        }

        // Pack 24-bit RGB output
        axis_rgb_t out_pix;
        out_pix.data = ((ap_uint<24>)outB << 16) | ((ap_uint<24>)outG << 8) | outR;
        out_pix.keep = in_pix.keep;
        out_pix.strb = in_pix.strb;
        out_pix.user = in_pix.user;
        out_pix.last = in_pix.last;

        out_stream.write(out_pix);

        // Update coordinates
        col++;
        if (col == IMG_WIDTH) { col = 0; row++; }
    }
}
