/*
 * This project we use "lenna image 320x240
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
#define imageSize 320*240*3
#define headerSize 0x8A
#define fileSize imageSize+headerSize


//Global static
u32 pixel_24b[imageWidth*imageHeight];



//You can check your base address at Address Editor in Vivado Design Block.
#define FPGA_BASE_ADDR 0x40000000

/*
 * Point the register correspond to each address.
 */
volatile unsigned int *slave_reg00 = (volatile unsigned int *)FPGA_BASE_ADDR;
volatile unsigned int *slave_reg01 = (volatile unsigned int *)(FPGA_BASE_ADDR + 4);;
volatile unsigned int *slave_reg02 = (volatile unsigned int *)(FPGA_BASE_ADDR + 8);;
volatile unsigned int *slave_reg03 = (volatile unsigned int *)(FPGA_BASE_ADDR + 12);;

//Function declaration
void WRITE_COMMAND(unsigned int data,unsigned int line, unsigned int row);
unsigned int READ_COMMAND(unsigned int line, unsigned int row);


int main()
{
	//---------------------------Sending data part-----------------------------------//
	int Status;
	u8 *imageData;

	imageData = malloc(sizeof(u8)*(fileSize));
	u32 totalReceivBytes,ReceivBytes = 0;

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
		xil_printf("\r\nXUartPs_SetBaudRate fail or get a lot of errors.");
		return XST_FAILURE;
	}

	while(totalReceivBytes < fileSize){
		ReceivBytes = XUartPs_Recv(&myUart_PS,&imageData[totalReceivBytes], fileSize);
		totalReceivBytes += ReceivBytes;
	}

	//After header data, we concatenate 3 elements of array to become one,
	//because each elements inside array is one byte, but 1 pixel is 3 bytes.
	for (int i=headerSize; i<fileSize;++i){
		pixel_24b[i]
	}



	//Pixel data is starting after header.
	//So it means data is starting from imageData[headerSize]

	//---------------------------End of sending part---------------------------------//

	//Start program.
	xil_printf("\r\n/-------------------Program starts------------------/");
	xil_printf("\r\nRemember Data writing in memory cell is 24bits, but reduce to 12 bits \
			due to compress pixel. R-G-B is 24 bits, but we only take 4 each.");
	for(u32 line =0; line < imageHeight; ++line){
		for (u32 row = headerSize; row< headerSize+imageWidth; ++row){
			WRITE_COMMAND(imageData[row], line, row);
		}
	}

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
