/*
 * This project we use "lenna image 320x240".
 */

/*
 * 11/07/2024 One must download gtkterm under Linux OS to succeed download image from computer to Zedboard.
 * Check all function including Read Image -> Put to array 8b -> Concatenate to array 24b
 *  							-> Send image to Block Ram -> Read back data from Block Ram. Oke
 */


/******************************************************************************
*Test simple in the enviroment Vitis with base address of Slave Register.
*We can see inside library "xparameters.h"
* Peripheral Definitions for peripheral FPGA_BASE_ADDR
#define XPAR_AXI_LITE_SLAVE_VHD_O_0_BASEADDR 0x40000000
#define XPAR_AXI_LITE_SLAVE_VHD_O_0_HIGHADDR 0x40000FFF
* 0x40000000 is the address of Reg0 and +4 next for next reg(4 regs in total design).
*
******************************************************************************/


#include <stdio.h>
#include <stdlib.h>
#include "xil_printf.h"
#include "xparameters.h"
#include "xuartps.h"

//Image define region
#define imageWidth 320
#define imageHeight 240
#define PixelNumber 320*240
#define imageSize 320*240*3
#define headerSize 0x8A
#define fileSize imageSize+headerSize


//Global static
u32 pixel_24b[imageWidth*imageHeight];
u32 pixel_count = 0;


//You can check your base address at Address Editor in Vivado Design Block.
#define FPGA_BASE_ADDR 0x40000000

//Point the register correspond to each address.
volatile unsigned int *slave_reg00 = (volatile unsigned int *)FPGA_BASE_ADDR;
volatile unsigned int *slave_reg01 = (volatile unsigned int *)(FPGA_BASE_ADDR + 4);;
volatile unsigned int *slave_reg02 = (volatile unsigned int *)(FPGA_BASE_ADDR + 8);;
volatile unsigned int *slave_reg03 = (volatile unsigned int *)(FPGA_BASE_ADDR + 12);;

//Function declaration
void WRITE_COMMAND(unsigned int data,unsigned int line, unsigned int row);
unsigned int READ_COMMAND(unsigned int line, unsigned int row);
void INCREASE_PIXEL_COUNT_BY1();
void RESET_PIXEL_COUNT();
u8 CHECK_PIXEL_COUNT();
void TEST_READ_PIXEL();

int main()
{
	//---------------------------Sending data part-----------------------------------//
	int Status;

    u32 i;//index


	u8 *imageData;

	imageData = malloc(sizeof(u8)*(fileSize));
	u32 ReceivBytes = 0;

	XUartPs_Config *myUartConfig;
	XUartPs myUart_PS;
	myUartConfig = XUartPs_LookupConfig(XPAR_PS7_UART_1_DEVICE_ID);
	if (NULL == myUartConfig) {
		xil_printf("\r\nXUartPs_LookupConfig fail.");
		return XST_FAILURE;
	}

	Status = XUartPs_CfgInitialize(&myUart_PS, myUartConfig, myUartConfig->BaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf("\r\nXUartPs_CfgInitialize fail.");
		return XST_FAILURE;
	}

	Status = XUartPs_SetBaudRate(&myUart_PS, 115200);
	if (Status != XST_SUCCESS) {
		xil_printf("\r\nXUartPs_SetBaudRate fail.");
		return XST_FAILURE;
	}

	/* Check hardware build. */
	Status = XUartPs_SelfTest(&myUart_PS);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	//Start program.
	//xil_printf("\r\n/-------------------Program starts------------------/");

	//Wait image from terminal.
	//xil_printf("\r\n/-------------------Wait image from terminal------------------/");

	while(ReceivBytes < fileSize){
		ReceivBytes += XUartPs_Recv(&myUart_PS,&imageData[ReceivBytes], fileSize-ReceivBytes);
	}
/*
	//for compression, we only keep 4 bits MSB and this part will check the image after compression.
	for (i=headerSize; i<fileSize;i++){
		imageData[i] = imageData[i] & 0xF0;
	}

	u32 SendBytes = 0;
	while(SendBytes < fileSize){
		SendBytes += XUartPs_Send(&myUart_PS,&imageData[SendBytes], 1);
	}
*/
    //-------------------------------------------------------------------------------------

	//The loop below, we remove header data(so index starting from the end of headersize)
	//, and then we concatenate 3 elements of array to become one(to get one pixel),
	//because each elements inside array is one byte, but 1 pixel is 3 bytes.
    //So how many pixel we will have with that loop. (fileSize-headerSize)/3 = 320*240
	for (i=headerSize; i<fileSize;i=i+3){
		pixel_24b[pixel_count] = (u32)(imageData[i]<<16) | (u32)(imageData[i+1]<<8) | (u32)(imageData[i+2]);
        INCREASE_PIXEL_COUNT_BY1();
    }
    Status = CHECK_PIXEL_COUNT();
    if (Status == 1){
        return XST_FAILURE;
    }




    //After concatenate, inside array pixel_24b, we have total 320x240 pixels, each pixel is 24bits long.
//  //check pixel received and concatenate.
//	for(i = 0;i<PixelNumber;++i){
//		xil_printf("\r\n%0x",pixel_24b[i]);
//	}

    //After that we have an array pixel_24b who contains all pixel we need to process.


	//Pixel data is starting after header.
	//So it means data is starting from imageData[headerSize]

	//---------------------------End of sending part---------------------------------//


	xil_printf("\r\nRemember Data writing in memory cell is 24bits, but reduce to 12 bits \
			due to compress pixel. R-G-B is 24 bits, it means 8 bits for each color but we only keep 4b each.");

    RESET_PIXEL_COUNT();
    for(u32 line = 0; line < imageHeight;line++){
        for(u32 row = 0; row < imageWidth; row++){
                WRITE_COMMAND(pixel_24b[pixel_count], line, row);
                INCREASE_PIXEL_COUNT_BY1();
        }
    }

    Status = CHECK_PIXEL_COUNT();
    if (Status == 1){
        return XST_FAILURE;
    }
    //If we pass this step, it means all our pixel already stayed well in Block Ram.
    xil_printf("\r\n All our pixel already stayed well in Block Ram.");

    //This part for read back pixel inside block RAM - Verification function
   // TEST_READ_PIXEL();


    return 0;
}

//line from 0 to 239, row from 0 to 319
void WRITE_COMMAND(unsigned int data,unsigned int line, unsigned int row){
	unsigned int COMMAND_REG = 0;
	unsigned int address = line*320+row;

	//Enable Command register
	COMMAND_REG = COMMAND_REG | 0x40000; //0100_0000_0000_0000_0000

	//Enable Write bit
	COMMAND_REG = COMMAND_REG | 0x20000;

	//Push line address
	COMMAND_REG = COMMAND_REG | address;


	*slave_reg01 = data;
	*slave_reg00 = COMMAND_REG;
}

unsigned int READ_COMMAND(unsigned int line, unsigned int row){
	unsigned int COMMAND_REG = 0;
	unsigned int RESPOND = 0;
	unsigned int REG01 =0;
	unsigned int address = line*320+row;
	//Enable Command register
	COMMAND_REG = COMMAND_REG | 0x40000; //0100_0000_0000_0000_0000

	//Enable READ bit
	COMMAND_REG = COMMAND_REG | 0x00000;

	//Push line address
	COMMAND_REG = COMMAND_REG | address;

	*slave_reg00 = COMMAND_REG;

	//while loop to wait valid data
	do{
		RESPOND = *slave_reg02;
	}while(RESPOND == 0);

	//only get 12b data
	REG01 = *slave_reg01;

	return REG01;
}

void INCREASE_PIXEL_COUNT_BY1(){
    ++pixel_count;
}

void RESET_PIXEL_COUNT(){
    pixel_count = 0;
}

//this function uses to check whether
u8 CHECK_PIXEL_COUNT(){
    if (pixel_count != PixelNumber){
        xil_printf("We haven't used all Pixel => Error => Check back");
        return 1;
    }
    else
        return 0;
}

//This part for read back pixel inside block RAM - Verification function
void TEST_READ_PIXEL(){
	int line, row;
	while(1){
		xil_printf("\r\nEnter the line: ");
		scanf("%d",&line);
		xil_printf("Enter the row: ");
		scanf("%d",&row);
		xil_printf("\r\nRead at (%d,%d) 0x%x",line,row,READ_COMMAND(line,row));
	}
}


