#include "parameters.h"
#include "RGB2HSV.h"


//These functions to conversion bgr to hsv
u8 MaxOf3(u8 b, u8 g, u8 r){
    u8 max = b;
    if (max <= g) max = g;
    if (max <= r) max = r;
    return max;
}

u8 Minof3(u8 b, u8 g, u8 r){
    u8 min = b;
    if(min >= g) min = g;
    if(min >= r) min = r;
    return min;
}

void findHSV(PixelBGR* in,PixelHSV* out, u32 PixelNumber){
    
    float tmp = 0.0;

    //Find all V values
    for(u32 i=0;i<PixelNumber;i++){
        u8 max = MaxOf3(in[i].b,in[i].g,in[i].r);
        u8 min = Minof3(in[i].b,in[i].g,in[i].r);
        float diff = max - min;

        //V values
        out[i].v = max; 

        //S values
        if (max == 0) out[i].s = 0;
        else
            out[i].s = diff/(float)max*255;

        //H values
        if (max == min) tmp = 0;//only happends if 3 values b = g = r
        else if(max == in[i].r) tmp = 60*(float)(in[i].g-in[i].b)/diff;
        else if(max == in[i].g) tmp = 120 + 60*(float)(in[i].b-in[i].r)/diff;
        else if(max == in[i].b) tmp = 240 + 60*(float)(in[i].r-in[i].g)/diff;
        
        if ((int)tmp < 0 ) out[i].h = (tmp + 360)/2;
        else 
            out[i].h = tmp/2;
        }    

}