
#include "stdio.h"
#include "file2.h"


int main(){
    // FILE * fileread;
    unsigned char ch;
    unsigned int i;
    unsigned int cnt = 0;
    // Creating a file
    // fileread = fopen("file2.txt", "r");


    // while(ch=fgetc(fileread) != EOF){
    //     cnt ++;
    // }
    // printf("Number of data in fileread is %d\n",cnt);
    printf("size of pixelData array is %ld",sizeof(pixelData)/sizeof(pixelData[0]));



    // fclose(fileread);
    return 0;
}