#ifndef _PARAMETERS_H_
#define _PARAMETERS_H_

#include <ap_fixed.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>

//Image define region
#define imageWidth 320
#define imageHeight 240
#define PixelNumber (320*240)
#define imageSize (320*240*3)
#define Offset2Pixel 0x8A
#define fileSize (imageSize+Offset2Pixel) //0x3848A

#define IMG_WIDTH 320
#define IMG_HEIGHT 240
#define THRESHOLD_EDGE 220
#define MAX_LABELS 512
#define MAX_OBJECTS 32 //Limit number of objects

typedef ap_axiu<24,1,1,1> axis_rgb_t;

typedef ap_uint<8> u8;
typedef ap_uint<16> u16;
typedef ap_uint<32> u32;

typedef ap_fixed<16,8> fx_t;

typedef struct{
    u8 r,g,b;
}PixelBGR;





#endif
