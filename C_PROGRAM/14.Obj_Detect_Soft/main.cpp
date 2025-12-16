#include <stdio.h>
#include <stdlib.h>
#include "xuartps.h"
#include "BackGrRemoval.h"
#include "parameters.h"
#include "obj_detect.h"
#include <cstdint>
#include "xtime_l.h"
#include <iostream>
#include "data.h"

u8 BGRdata[230400];
u8 BGRoutput[230400];
int16_t obj_x[MAX_OBJECTS];
int16_t obj_y[MAX_OBJECTS];
uint8_t obj_is_green[MAX_OBJECTS];
int obj_count;

/*Execution time calculation*/
//Using the global timer
XTime start,end;

int main()
{


	for (i=0;i<imageSize;i++){
		BGRdata[i] = pixelData[Offset2Pixel+i];
	}


	//Start calculate the timing
	XTime_GetTime(&start);

	BackGrRemoval(BGRdata, imageWidth, imageHeight);

	obj_detect(
		BGRdata,           // Flat array: [B0,G0,R0, B1,G1,R1, ...]
	    BGRoutput,         // Flat output array

	    // Outputs
	    obj_x,
	    obj_y,
	    obj_is_green,
	    obj_count
	);

	//Calculate the end time
	XTime_GetTime(&end);

	printf("\r\nProcessing time %f ns",(end-start)*1000000000.0/COUNTS_PER_SECOND);

	for (i=0;i<imageSize;i++){
		pixelData[Offset2Pixel+i] = BGRoutput[i];
	}

    std::cout << "\r\nDetected objects: " << obj_count;
    for(int i=0; i<obj_count; i++) {
        std::cout << "\r\nObj " << i
             << "  X=" << obj_x[i]
             << "  Y=" << obj_y[i]
             << "  Green=" << obj_is_green[i];
    }

//    u32 SendBytes = 0;
//	while(SendBytes < fileSize){
//		SendBytes += XUartPs_Send(&myUart_PS,&imageData[SendBytes], 1);
//	}
	//Reset SendBytes for next roll.
//	SendBytes = 0;

	return 0;

}
