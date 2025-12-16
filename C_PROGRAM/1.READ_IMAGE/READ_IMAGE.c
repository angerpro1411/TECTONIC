#include "stdio.h"
#include "stdlib.h"
#include "stdbool.h"

//Image define region
#define imageWidth 512
#define imageHeight 512
#define PixelNumber 512*512
#define imageSize 512*512*3
#define headerSize 0x8A
#define fileSize imageSize+headerSize //0x38480

//Data type definitions
typedef unsigned char u8;
typedef unsigned int u32;
typedef unsigned short int u16;




typedef struct RGB{
	unsigned char R, G, B;
	float H,S,L;
}RGB;

typedef struct RGBIMAGE{
	unsigned int XSIZE;
	unsigned int YSIZE;
	RGB *IMAGE_DATA;
} RGBIMAGE;


//Function declarations
u8 isRedMax(RGB pixel);
u8 isGreenMax(RGB pixel);
u8 isBlueMax(RGB pixel);
u8 isRedMin(RGB pixel);
u8 isGreenMin(RGB pixel);
u8 isBlueMin(RGB pixel);


//Global variables
unsigned char GAUSSIAN_BLUR_MATRIX[9] = {1,2,1,2,4,2,1,2,1};
unsigned char GASSIAN_BLUR_ARRAY[fileSize];
unsigned char GAUSSIAN_BLUR_MATRIX5x5[25] = {1,4,6,4,1,4,16,24,16,4,6,24,36,24,6,4,16,24,16,4,1,4,6,4,1};

char x_KERNEL[9] = {1,0,-1,2,0,-2,1,0,-1};
char y_KERNEL[9] = {1,2,1,0,0,0,-1,-2,-1};


int main(){

	short int MUL_KERNEL[9];
	short int TEMP = 0;

	//Create dynamic allocation 
	unsigned char* imageData = malloc(sizeof(unsigned char)*fileSize);
	FILE *fptr = fopen("sample5.bmp","r");
	if(fptr == NULL){
		printf("Not be able to open file/File doesn't exist\n");
		exit(1);
	}

	//Put all data into array
	for(int i=0;i<fileSize;i++){
		imageData[i] = fgetc(fptr);
	}

	//close file
	fclose(fptr);

	//Check value
	// for(int i=0x38400;i<0x38480;i++){
	// 	printf("%0x\n", imageData[i]);
	// }	

	//Copy header
	for(int i=0;i<headerSize;++i){
		GASSIAN_BLUR_ARRAY[i] = imageData[i];
	}

						/*Processing blur image :: START*/
	for(int i=headerSize;i<fileSize - (512*2 + 2)*3;i++){
		MUL_KERNEL[0] = GAUSSIAN_BLUR_MATRIX[0] * imageData[i+512*0];
		MUL_KERNEL[1] = GAUSSIAN_BLUR_MATRIX[1] * imageData[i+512*0+3];
		MUL_KERNEL[2] = GAUSSIAN_BLUR_MATRIX[2] * imageData[i+512*0+3*2];
		MUL_KERNEL[3] = GAUSSIAN_BLUR_MATRIX[3] * imageData[i+512*3*1];
		MUL_KERNEL[4] = GAUSSIAN_BLUR_MATRIX[4] * imageData[i+512*3*1+3];
		MUL_KERNEL[5] = GAUSSIAN_BLUR_MATRIX[5] * imageData[i+512*3*1+3*2];
		MUL_KERNEL[6] = GAUSSIAN_BLUR_MATRIX[6] * imageData[i+512*3*2];
		MUL_KERNEL[7] = GAUSSIAN_BLUR_MATRIX[7] * imageData[i+512*3*2+3];
		MUL_KERNEL[8] = GAUSSIAN_BLUR_MATRIX[8] * imageData[i+512*3*2+3*2];
	

		//Calculate the Mul_SUM
		for(int j=0;j<9;j++){
			TEMP +=MUL_KERNEL[j];
		}		

		//Divide by 16 with Gaussian blur
		TEMP /=16;

		//Put result into array
		GASSIAN_BLUR_ARRAY[i+512*3*1+3] = TEMP;			
	}
						/*Processing blur image :: END*/









	fptr = fopen("blur_lenna.bmp","w");
	if (fptr == NULL){
		printf("blur_lenna.bmp file failed to open.\n");
		exit(1);
	}


	for(int i=0;i<fileSize;i++){
		fputc(GASSIAN_BLUR_ARRAY[i],fptr);
	}	

	fclose(fptr);

	return 0;
}



u8 isRedMax(RGB pixel){
	if (pixel.R >= pixel.G) {
		if (pixel.R >= pixel.B)
			return 1;
		else // G <= R < B 
			return 0;
	}	
}

u8 isGreenMax(RGB pixel){
	if (pixel.G >= pixel.B) {
		if (pixel.G >= pixel.B)
			return 1;
		else // G <= R < B 
			return 0;
	}	
}

u8 isBlueMax(RGB pixel){
	if (pixel.B >= pixel.G) {
		if (pixel.B >= pixel.R)
			return 1;
		else // G <= R < B 
			return 0;
	}	
}

u8 isRedMin(RGB pixel){
	if (pixel.R <= pixel.G) {
		if (pixel.R <= pixel.B)
			return 1;
		else 
			return 0;
	}		
}

u8 isGreenMin(RGB pixel){
	if (pixel.G <= pixel.R) {
		if (pixel.G <= pixel.B)
			return 1;
		else 
			return 0;
	}		
}

u8 isBlueMin(RGB pixel){
	if (pixel.B <= pixel.G) {
		if (pixel.B <= pixel.R)
			return 1;
		else 
			return 0;
	}		
}