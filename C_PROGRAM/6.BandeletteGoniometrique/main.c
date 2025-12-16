#include "stdio.h"
#include "stdlib.h"
#include "string.h"

//we define maximum is 30 characters in one line
#define maximumLineLength 50

int main(){

    //create file pointer and open memory file
    FILE *fptr_ref = fopen("bandelette_reference.txt","r");
    FILE *fptr_real = fopen("real_detect_bandelette.txt","r");

    //Create 2 arrays to store line of each file
    char *lineBuff_ref = (char*)malloc(sizeof(char) * maximumLineLength);
    char *lineBuff_real = (char*)malloc(sizeof(char) * maximumLineLength);

    //Check memory file
    if(fptr_ref == NULL || fptr_real == NULL){
        fprintf(stderr, "Unable to open file \n");
        exit(0);
    }
    else{
        //Read first line of reference bandelette 
        fgets(lineBuff_ref,maximumLineLength,fptr_ref);

        //Read first line of real banddelette
        fgets(lineBuff_real,maximumLineLength,fptr_real);

        //Compare two string
        if (strcmp(lineBuff_ref,lineBuff_real) == 0){
            printf("MATCH");
        }
        else
            printf("Unmatch");
    }


    return 0;
}