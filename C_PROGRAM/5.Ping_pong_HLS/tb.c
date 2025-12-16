#include <stdio.h>
#include "ping_pong.h"
#include <stdlib.h>
#include <time.h>

void arrayCreator(data_t* arr,unsigned char num);

int main(){
/*
	printf("Start program \n");
	data_t arrIn[N],arrOut[N];

	printf("Create array \n");
	arrayCreator(arrIn,N);

	for(int i=0;i<N;i++){
		printf("Array element %d = %d\n",i,arrIn[i]);
		}

	algo(arrIn, arrOut);

	for(int i=0;i<N;i++){
		printf("Array results %d = %d\n",i,arrOut[i]);
		}
*/
	data_t arrIn[N],arrOut[N];
	for(int i = 0;i < 10;i++){
		arrayCreator(arrIn,N);
		algo(arrIn, arrOut);
	}
	return 0;
}

void arrayCreator(data_t* arr,unsigned char num){
	srand(time(NULL));
	for(int i=0;i<num;i++){
		arr[i] = rand() % 10;
	}
}
