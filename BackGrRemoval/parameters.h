#define imageWidth 320
#define imageHeight 240
#define PixelNumber imageWidth*imageHeight
#define imageSize imageWidth*imageHeight*3
#define headerSize 0x8A
#define fileSize imageSize+headerSize 


typedef unsigned char u8;
typedef unsigned short int u16;
typedef unsigned int u32;

typedef struct{
    unsigned char r,g,b;
}PixelBGR;

typedef struct{
    unsigned char h,s,v;
}PixelHSV;