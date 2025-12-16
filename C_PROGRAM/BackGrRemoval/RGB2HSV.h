#pragma once
#include "parameters.h"

u8 MaxOf3(u8 b, u8 g, u8 r);
u8 Minof3(u8 b, u8 g, u8 r);
void findHSV(PixelBGR* in,PixelHSV* out,u32 PixelNumber);