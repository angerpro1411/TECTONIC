#include <stdio.h>
#include <ap_int.h>


void find(ap_uint<8> val, ap_uint<8> IN_VEC[10], ap_uint<8> OUT_VEC[10]){

//	#pragma HLS INTERFACE mode=AP_MEMORY port=IN_VEC
//	#pragma HLS INTERFACE mode=AP_MEMORY port=OUT_VEC

	#pragma HLS INTERFACE mode=AP_FIFO port=IN_VEC
	#pragma HLS INTERFACE mode=AP_FIFO port=OUT_VEC

	for (ap_uint<8> idx = 0; idx < 10; idx ++){

		#pragma HLS PIPELINE
		#pragma HLS UNROLL factor=2
		if (IN_VEC[idx] == val ){
			OUT_VEC[idx] = 1;
		}
		else
			OUT_VEC[idx] = 0;
	}
}
