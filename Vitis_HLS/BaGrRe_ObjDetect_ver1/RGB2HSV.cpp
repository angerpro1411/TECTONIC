#include "parameters.h"
#include "RGB2HSV.h"


//These functions to conversion bgr to hsv
u8 MaxOf3(u8 b, u8 g, u8 r){
#pragma HLS INLINE
    u8 max = b;
    if (max <= g) max = g;
    if (max <= r) max = r;
    return max;
}

u8 Minof3(u8 b, u8 g, u8 r){
#pragma HLS INLINE
    u8 min = b;
    if(min >= g) min = g;
    if(min >= r) min = r;
    return min;
}

void findHSV(PixelBGR* in,u8* out_h,u8* out_s,u8* out_v){
#pragma HLS INLINE off
#pragma HLS ARRAY_PARTITION variable=out_s cyclic factor=8 dim=1
    fx_t tmp = 0.0;

    //Find all V values
    HSV_LOOP:
    for(u32 i=0;i<PixelNumber;i++){
#pragma HLS PIPELINE II=1
#pragma HLS UNROLL factor=4
    	u8 max = MaxOf3(in[i].b,in[i].g,in[i].r);
        u8 min = Minof3(in[i].b,in[i].g,in[i].r);
        fx_t diff = max - min;

        //V values
        out_v[i] = max;

        //S values
        if (max == 0) out_s[i] = 0;
        else
            out_s[i] = diff/(fx_t)max*255;

        //H values
        if (max == min) tmp = 0;//only happends if 3 values b = g = r
        else if(max == in[i].r) tmp = 60*(fx_t)(in[i].g-in[i].b)/diff;
        else if(max == in[i].g) tmp = 120 + 60*(fx_t)(in[i].b-in[i].r)/diff;
        else if(max == in[i].b) tmp = 240 + 60*(fx_t)(in[i].r-in[i].g)/diff;
        
        if ((int)tmp < 0 ) out_h[i] = (tmp + 360)/2;
        else 
            out_h[i] = tmp/2;
        }    

}
