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
//#include "//xil_printf.h"
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
void READ_STATUS_REGIS();
void TEST_READ_PIXEL();
void WAIT_DONE_WRITE_COLOR();
void WAIT_DONE_WRITE_GRAY();
u8 READ_GRAY_DATA(unsigned int line, unsigned int row);
void AXI_GET_CONTROL();
void RGB_GET_CONTROL();
void START_SIGNAL();
void TEST_READ_GRAY_PIXEL();
void RESET_STATUS_REGISTER();

int main()
{
	//---------------------------Sending data part-----------------------------------//
	int Status;

    u32 i;//index
    u8 GrayImageData[PixelNumber+headerSize];

	u8 *imageData;

	imageData = malloc(sizeof(u8)*(fileSize));
	u32 ReceivBytes = 0;

	XUartPs_Config *myUartConfig;
	XUartPs myUart_PS;
	myUartConfig = XUartPs_LookupConfig(XPAR_PS7_UART_1_DEVICE_ID);
	if (NULL == myUartConfig) {
		//xil_printf("\r\nXUartPs_LookupConfig fail.");
		return XST_FAILURE;
	}

	Status = XUartPs_CfgInitialize(&myUart_PS, myUartConfig, myUartConfig->BaseAddress);
	if (Status != XST_SUCCESS) {
		//xil_printf("\r\nXUartPs_CfgInitialize fail.");
		return XST_FAILURE;
	}

	Status = XUartPs_SetBaudRate(&myUart_PS, 115200);
	if (Status != XST_SUCCESS) {
		//xil_printf("\r\nXUartPs_SetBaudRate fail.");
		return XST_FAILURE;
	}

	//Start program.
	////xil_printf("\r\n/-------------------Program starts------------------/");

	//Wait image from terminal.
	////xil_printf("\r\n/-------------------Wait image from terminal------------------/");

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

    //After that we have an array pixel_24b who contains all pixel we need to process.


	//Pixel data is starting after header.
	//So it means data is starting from imageData[headerSize]

	//---------------------------End of sending part---------------------------------//


	//xil_printf("\r\nRemember Data writing in memory cell is 24bits, but reduce to 12 bits due to compress pixel.");

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

    //Wait done_write_color when all color pixel stores in color_bram
    READ_STATUS_REGIS();
    WAIT_DONE_WRITE_COLOR();
    READ_STATUS_REGIS();


    //If we pass this step, it means all our pixel already stayed well in Block Ram.
    //xil_printf("\r\n All our pixel already stayed well in Block Ram.");

    START_SIGNAL();
    READ_STATUS_REGIS();

    WAIT_DONE_WRITE_GRAY();
    READ_STATUS_REGIS();

    AXI_GET_CONTROL();
    READ_STATUS_REGIS();

    RESET_PIXEL_COUNT();
    for(u32 line = 0; line < imageHeight;line++){
        for(u32 row = 0; row < imageWidth; row++){
        		GrayImageData[headerSize+pixel_count] = READ_GRAY_DATA(line, row);
                INCREASE_PIXEL_COUNT_BY1();
        }
    }
    Status = CHECK_PIXEL_COUNT();
    if (Status == 1){
        return XST_FAILURE;
    }
    RESET_PIXEL_COUNT();

    RESET_STATUS_REGISTER();
    READ_STATUS_REGIS();

	for(i=0;i<headerSize;++i){
		if(i == 2)
			GrayImageData[i] = 0x8A;
		else if(i == 3)
			GrayImageData[i] = 0x2C;
		else if(i == 4)
			GrayImageData[i] = 0x01;
		else if(i == 28)
			GrayImageData[i] = 0x08;
		else
			GrayImageData[i] = imageData[i];
	}
	//xil_printf("\r\nFinish new gray pixel.");


	//xil_printf("\r\nSending pixel back to computer.");
	u32 SendBytes = 0;
	while(SendBytes < PixelNumber+headerSize){
		SendBytes += XUartPs_Send(&myUart_PS,&GrayImageData[SendBytes], 1);
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

	//while loop to wait valid data at bit 31 of register01
	do{
		RESPOND = *slave_reg01;
		RESPOND &= (1<<31);
	}while(RESPOND == 0);

	//only get 12b data
	REG01 = *slave_reg01;
	REG01 &= 0x00000FFF;
	return REG01;
}

u8 READ_GRAY_DATA(unsigned int line, unsigned int row){
	u32 RESPOND_FR_STATUS_REGIS = 0;
	u32 COMMAND = 0;
	u32 address = line*320+row;

	//enable read
	COMMAND = COMMAND | (1<<25);

	//push address
	COMMAND = COMMAND | (address << 8);

	//Write to register 3
	*slave_reg03 = COMMAND;

	do{
		RESPOND_FR_STATUS_REGIS = *slave_reg03;
		RESPOND_FR_STATUS_REGIS &=(1<<31);
	}while(RESPOND_FR_STATUS_REGIS == 0);

	return (u8)(*slave_reg03 & 0x000000FF);

}

//This part for read back pixel inside block RAM - Verification function
void TEST_READ_PIXEL(){
	int line, row;
	while(1){
		//xil_printf("\r\nEnter the line: ");
		scanf("%d",&line);
		//xil_printf("\r\nEnter the row: ");
		scanf("%d",&row);
		//xil_printf("\r\nRead at (%d,%d) 0x%x",line,row,READ_COMMAND(line,row));
	}
}

void TEST_READ_GRAY_PIXEL(){
	int line, row;
	while(1){
		//xil_printf("\r\nEnter the line: ");
		scanf("%d",&line);
		//xil_printf("\r\nEnter the row: ");
		scanf("%d",&row);
		//xil_printf("\r\nRead at (%d,%d) 0x%x",line,row,READ_GRAY_DATA(line,row));
	}
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
        //xil_printf("We haven't used all Pixel => Error => Check back");
        return 1;
    }
    else
        return 0;
}



void READ_STATUS_REGIS(){
	//xil_printf("\r\nValue of STATUS Register is 0x%x",*slave_reg02);
}

void WAIT_DONE_WRITE_COLOR(){
	//xil_printf("\r\nFinish writing color pixel to COLOR_BRAM");
	u32 DONE_WRITE_COLOR = 0;
	while(1){
		DONE_WRITE_COLOR = *slave_reg02 & 0x00000002;
		if (DONE_WRITE_COLOR != 0)
			break;
	}
}

void WAIT_DONE_WRITE_GRAY(){
	//xil_printf("\r\nFinish writing gray pixel to GRAY_BRAM");
	u32 DONE_WRITE_GRAY = 0;
	while(1) {
		DONE_WRITE_GRAY = *slave_reg02 & 0x00000001;
		if (DONE_WRITE_GRAY != 0)
			break;
	}
}



void RGB_GET_CONTROL(){
	//xil_printf("\r\nRGB gets control.");
	*slave_reg02 = *slave_reg02 | 0x80000000;
}

void AXI_GET_CONTROL(){
	//xil_printf("\r\nAXI gets control.");
	*slave_reg02 = *slave_reg02 & 0x7FFFFFFF;
}


void START_SIGNAL(){
	//xil_printf("\r\nStart processing pixels.");
	//turn bit 31th and 30th to 1
	*slave_reg02 = *slave_reg02 | 0xC0000000;

	//turn bit 30th to 0
	*slave_reg02 = *slave_reg02 & 0xBFFFFFFF;

}

void RESET_STATUS_REGISTER(){
	//xil_printf("\r\nReset Status register02 bit01 and bit00.");
	*slave_reg02 = *slave_reg02 & 0xFFFFFFFC;

}





















