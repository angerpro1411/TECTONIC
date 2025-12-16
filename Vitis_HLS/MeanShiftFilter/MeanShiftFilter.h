#include <ap_fixed.h>
#include <ap_int.h>


//Image define region
#define imageWidth 512
#define imageHeight 512
#define PixelNumber 512*512
#define imageSize 512*512*3
#define headerSize 0x8A
#define fileSize imageSize+headerSize //0x38480

//Data type definitions

typedef ap_uint<8> u8;
typedef ap_uint<16> u16;
typedef ap_uint<32> u32;

// Fixed-point type: 8 integer bits, 8 fractional bits
typedef ap_fixed<16, 8> fx_t;

typedef struct {
    u8 r, g, b;
} Pixel;

void MeanShiftFiltering(Pixel* in,Pixel* out,u32 ImageWidth,
    u32 ImageHeight, u8 sd, u8 cd, u8 max_iter);
