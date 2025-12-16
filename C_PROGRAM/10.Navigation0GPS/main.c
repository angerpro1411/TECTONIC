#include "stdio.h"
#include "stdlib.h"
#include "string.h"

typedef struct {
    char name[8];
    char type[8];
    float x;
    float y;
    float angle;
} Object;

int main(){
	FILE *fptr = fopen("manh_0.sxp","r");
    Object* ObjectPtr;

    //Check 
	if(fptr == NULL){
		printf("Not be able to open file/File doesn't exist\n");
		exit(1);
	}

    while(fscamf(fptr,))

    fclose(fptr);
    return 0;
}