#ifndef _OBJ_DETECT_H_
#define _OBJ_DETECT_H_

#include <cstdint>
#include "parameters.h"

void obj_detect(
    u8 BGRdata[230400],           // Flat array: [B0,G0,R0, B1,G1,R1, ...]
    u8 BGRoutput[230400],         // Flat output array

    // Outputs
    int16_t obj_x[MAX_OBJECTS],
    int16_t obj_y[MAX_OBJECTS],
    uint8_t obj_is_green[MAX_OBJECTS],
    int &obj_count
);

#endif
