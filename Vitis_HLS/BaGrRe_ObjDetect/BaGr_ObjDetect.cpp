#include <hls_stream.h>
#include "parameters.h"
#include <ap_int.h>
#include <cstdint>

void BackGrRemovalStream(
    hls::stream<axis_rgb_t> &input_stream,
    hls::stream<axis_rgb_t> &output_stream);

void hls_object_green_classification(
    hls::stream<axis_rgb_t> &in_stream,
    hls::stream<axis_rgb_t> &out_stream,
    int16_t obj_x[MAX_OBJECTS],
    int16_t obj_y[MAX_OBJECTS],
    ap_uint<1> obj_is_green[MAX_OBJECTS],
    ap_uint<16> &object_count);


void BaGr_ObjDetect(
	    hls::stream<axis_rgb_t> &input_stream,
	    hls::stream<axis_rgb_t> &output_stream,
	    int16_t obj_x[MAX_OBJECTS],
	    int16_t obj_y[MAX_OBJECTS],
	    ap_uint<1> obj_is_green[MAX_OBJECTS],
	    ap_uint<16> &object_count)
	{
	#pragma HLS INTERFACE axis port=input_stream
	#pragma HLS INTERFACE axis port=output_stream

	#pragma HLS INTERFACE s_axilite port=obj_x        bundle=CTRL
	#pragma HLS INTERFACE s_axilite port=obj_y        bundle=CTRL
	#pragma HLS INTERFACE s_axilite port=obj_is_green bundle=CTRL
	#pragma HLS INTERFACE s_axilite port=object_count bundle=CTRL

	#pragma HLS INTERFACE s_axilite port=return       bundle=CTRL

	#pragma HLS DATAFLOW     // Enables parallel stages!

	    // TEMPORARY STREAM CONNECTING THE TWO KERNELS
	    static hls::stream<axis_rgb_t> mid_stream("mid_stream");
	#pragma HLS STREAM variable=mid_stream depth=512

	    // Stage 1: Background removal
	    BackGrRemovalStream(input_stream, mid_stream);

	    // Stage 2: Object detection
	    hls_object_green_classification(
	        mid_stream, output_stream,
	        obj_x, obj_y, obj_is_green, object_count);
	}
