#ifndef _PARAMETERS_H_
#define _PARAMETERS_H_

#include <cstdint>

typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;


#define imageWidth   320
#define imageHeight  240
#define PixelNumber  (imageWidth * imageHeight)
#define imageSize    (imageWidth * imageHeight * 3)
#define Offset2Pixel  0x8A
#define fileSize     (imageSize + Offset2Pixel)

#define IMG_WIDTH   imageWidth
#define IMG_HEIGHT  imageHeight
#define THRESHOLD_EDGE  220
#define MAX_LABELS  512
#define MAX_OBJECTS  32


#endif
