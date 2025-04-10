#include "stdlib.h"
#include "stdio.h"

//Image define region
#define imageWidth 320
#define imageHeight 240
#define PixelNumber 320*240
#define imageSize 320*240*3
#define headerSize 0x8A
#define ColorTable_NBytes 1024
#define fileSize imageSize+headerSize


int main(){
    FILE * fileread;
    FILE * filewrite;
    unsigned char ch;
    unsigned int i;
    unsigned cnt_for_new_line=0;
    // Creating a file
    fileread = fopen("lenna_color.bmp", "r");
    filewrite = fopen("file2.txt", "w");

    // ch = fgetc(fileread);
    // printf("\n%x",ch);
    // fprintf(filewrite,"%d,",ch);
    // ch = fgetc(fileread);
    // printf("\n%x",ch);
    // fprintf(filewrite,"%d,",ch);

    for(int i=0;i<fileSize;i++){
        ch = fgetc(fileread);
        if (i >= headerSize){
            if(cnt_for_new_line % 32==0)
                fprintf(filewrite,"%d,\n",ch);
            else    
                fprintf(filewrite,"%d,",ch);
            cnt_for_new_line++;
        }        
    }


    fclose(fileread);
    fclose(filewrite);
    return 0;
}
