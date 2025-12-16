#pragma once
#include "parameters.h"

u8 MaxOf3(u8 b, u8 g, u8 r);
u8 Minof3(u8 b, u8 g, u8 r);
void findHSV(PixelBGR* in,u8* out_h,u8* out_s,u8* out_v);
