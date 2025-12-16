#pragma once
#include "parameters.h"
#include "hls_stream.h"
void BackGrRemoval(PixelBGR* inBGR,u8 threshold);

void BackGrRemovalStream(hls::stream<AXI_VAL> &input_stream,
                         hls::stream<AXI_VAL> &output_stream,
                         u8 threshold);

