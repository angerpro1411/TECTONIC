/*
 * Vitis -> Generate Linker Script -> Change Heap Size from 1KB to 512 KB, to store dynamic allocation array.
 * src -> lscript.ld -> Heap Size from 0x400 to 0x80000
 */


/*
 * This project we use "lenna image 320x240".
 */

/*
 * 11/07/2024 One must download gtkterm under Linux OS to succeed download image from computer to Zedboard.
 * Check all function including Read Image -> Put to array 8b -> Concatenate to array 24b
 *  							-> Send image to Block Ram -> Read back data from Block Ram. Oke
 */

/*
 * 02/09/2024 Check all done. Work well. Close program. Further update.
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

//Gray Image define region
#define BMP_Header 14
#define DIB_Header 124
#define ColorTable_NBytes 1024
#define Gray_HeaderSize BMP_Header+DIB_Header+ColorTable_NBytes


//Global static
u32 pixel_24b[imageWidth*imageHeight];
u32 pixel_count = 0;
u8 GrayImageData[PixelNumber+Gray_HeaderSize];


//You can check your base address at Address Editor in Vivado Design Block.
#define FPGA_BASE_ADDR 0x40000000

//Point the register correspond to each address.
volatile unsigned int *slave_reg00 = (volatile unsigned int *)FPGA_BASE_ADDR;
volatile unsigned int *slave_reg01 = (volatile unsigned int *)(FPGA_BASE_ADDR + 4);
volatile unsigned int *slave_reg02 = (volatile unsigned int *)(FPGA_BASE_ADDR + 8);
volatile unsigned int *slave_reg03 = (volatile unsigned int *)(FPGA_BASE_ADDR + 12);
volatile unsigned int *slave_reg04 = (volatile unsigned int *)(FPGA_BASE_ADDR + 16);
volatile unsigned int *slave_reg05 = (volatile unsigned int *)(FPGA_BASE_ADDR + 20);
volatile unsigned int *slave_reg06 = (volatile unsigned int *)(FPGA_BASE_ADDR + 24);
volatile unsigned int *slave_reg07 = (volatile unsigned int *)(FPGA_BASE_ADDR + 28);

//Function declaration
void WRITE_COMMAND(unsigned int data,unsigned int line, unsigned int row);
unsigned int READ_COMMAND(unsigned int line, unsigned int row);
void INCREASE_PIXEL_COUNT_BY1();
void RESET_PIXEL_COUNT();
u8 CHECK_PIXEL_COUNT();
void READ_STATUS_REGIS();
void WAIT_DONE_WRITE_COLOR();
void WAIT_DONE_WRITE_GRAY();
void WAIT_DONE_WRITE_SOBEL();
u8 READ_GRAY_DATA(unsigned int line, unsigned int row);
u8 READ_SOBEL_DATA(unsigned int line, unsigned int row);
u8 READ_SOBEL_DATA_byADDR(unsigned int address);
void AXI_GET_CONTROL();
void RGB_GET_CONTROL();
void SOBEL_GET_CONTROL();
void START_COLOR2GRAY();
void START_GRAY2SOBEL();
void New_Header_GrayImage();
void TEST_READ_COLOR_PIXEL();
void TEST_READ_GRAY_PIXEL();
void TEST_READ_SOBEL_PIXEL();
void SET_THRESHOLD(u32 threshold);
void ENABLE_REG00();
void DISABLE_REG00();
void CLR_REG00();
void CLR_REG01();
void CLR_REG02();
void CLR_REG03();
void READ_REG(char reg);
void RST_DONE_COLOR_SIGNAL();
void RST_DONE_GRAY_SIGNAL();
void RST_DONE_SOBEL_SIGNAL();
void READ_RD_DATA_REG();
void FINISH_IMAGE();
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
	//xil_printf("\r\n/-------------------Program starts------------------/");

	//Wait image from terminal.
	//xil_printf("\r\n/-------------------Wait image from terminal------------------/");

//While loop to re-use the algorithm.
while(1){

//Step 1: Sending image through UART to Processing system - arm processor(accompanied with teraterm or gtkterm send image file).
//All image pixel now will be stored in array imageData[].
	while(ReceivBytes < fileSize){
		ReceivBytes += XUartPs_Recv(&myUart_PS,&imageData[ReceivBytes], fileSize-ReceivBytes);
	}
	//Reset receiBytes for next roll.
	ReceivBytes = 0;

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


//Step 2: Starting from headerSize.
	//The loop below, we remove header data(so index starting from the end of headersize)
	//, and then we concatenate 3 elements of array to become one(to get one pixel),
	//because each elements inside array is one byte, but 1 pixel is 3 bytes.
    //So how many pixel we will have with that loop. (fileSize-headerSize)/3 = 320*240

	//Clear array
	for (i=0;i<imageWidth*imageHeight;i++){
		pixel_24b[i] = 0;
	}

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

//Step 3: Sending pixel to color bram.
    //set threshold
    SET_THRESHOLD(15000);

    RESET_PIXEL_COUNT();

	//Axi bus gets control.
    AXI_GET_CONTROL();
    READ_STATUS_REGIS();

	//Sending 24-bit image pixel to fpga particularly Color_bram.
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
    RESET_PIXEL_COUNT();


    //Wait done_write_color when all color pixel stores in color_bram
    WAIT_DONE_WRITE_COLOR();
    READ_STATUS_REGIS();

//    TEST_READ_COLOR_PIXEL();

    //Reset done color signal.
    RST_DONE_COLOR_SIGNAL();
    READ_STATUS_REGIS();



    //If we pass this step, it means all our pixel already stayed well in Color_BRam.
    //xil_printf("\r\n All our pixel already stayed well in Color_BRam.");

//Step 4: Starting processing color pixel, change it to gray pixel and write back to gray_bram
    //Start signal to start processing RGB to Gray pixel and also give the
    // access color and gray Bram to RGB_2_GRAY
    RGB_GET_CONTROL();
    START_COLOR2GRAY();

    //Wait all gray pixel inside Gray_bram
    WAIT_DONE_WRITE_GRAY();
    RST_DONE_GRAY_SIGNAL();
    READ_STATUS_REGIS();


    //Read gray pixel
	//AXI_GET_CONTROL();
	//READ_STATUS_REGIS();
    //TEST_READ_GRAY_PIXEL();

//Step 5: When all gray pixel is in gray bram, we start processing to sobel pixel.
    //Give back control permission to
    SOBEL_GET_CONTROL();
    START_GRAY2SOBEL();

    //Wait all sobel pixel inside sobel bram
    WAIT_DONE_WRITE_SOBEL();
    RST_DONE_SOBEL_SIGNAL();
    READ_STATUS_REGIS();


    //Write back gray-data into an array
//    RESET_PIXEL_COUNT();
//    for(u32 line = 0; line < imageHeight;line++){
//        for(u32 row = 0; row < imageWidth; row++){
//        		GrayImageData[Gray_HeaderSize+pixel_count] = READ_GRAY_DATA(line, row);
//                INCREASE_PIXEL_COUNT_BY1();
//        }
//    }
//    RESET_PIXEL_COUNT();


//Step 6: Write back sobel-data into an array(We still use GrayImageData array to store sobel image)
//Considering and explaination: Sobel algorithm takes 3x3 pixels to get only one new pixel at the center of 3x3 matrix.
//It means we can not have result of both first line and last line, also first pixel of second line from the top
//and last pixel of second line from bottom. Totally we lose 320x2 + 2 = 642 pixels. All 642 pixels we will fill up with zero.
//Inside sobel_bram, we only have 76800 - 642 = 76158 pixels. And these numbers of pixel will localize between
//first 321 zero pixels and last 321 zero pixels.

	AXI_GET_CONTROL();
	READ_STATUS_REGIS();

	//Clear array before store

	for(i = 0; i < PixelNumber+Gray_HeaderSize; i++){
		GrayImageData[i] = 0;
	}

    for(i = 0; i <=76157;i++){
        		GrayImageData[Gray_HeaderSize+321+i] = READ_SOBEL_DATA_byADDR(i);
    }

    READ_STATUS_REGIS();

	//6.1 : Header file for gray type image is different from color image, so neccessarily change it.
    //Change the header file
    New_Header_GrayImage();

	//xil_printf("\r\nFinish new sobel pixel.");


	//6.2: Sending gray data back to computer for visually seen it.
	//xil_printf("\r\nSending pixel back to computer.");

    u32 SendBytes = 0;
	while(SendBytes < PixelNumber+Gray_HeaderSize){
		SendBytes += XUartPs_Send(&myUart_PS,&GrayImageData[SendBytes], 1);
	}
	//Reset SendBytes for next roll.
	SendBytes = 0;

	//FINISH_IMAGE();
}
    return 0;

}

/*--------------------------Function definitions :: Start----------------------------------*/

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
	unsigned int REG04 =0;
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
		RESPOND = *slave_reg04;
		RESPOND &= (1<<31);
	}while(RESPOND == 0);

	//Reset valid fresh data
	*slave_reg03 = *slave_reg03 | 0x80000000;
	*slave_reg03 = *slave_reg03 & 0x7FFFFFFF;

	//only get 12b data
	REG04 = *slave_reg04;
	REG04 &= 0x00000FFF;
	return REG04;
}

u8 READ_GRAY_DATA(unsigned int line, unsigned int row){
	u32 RESPOND_FR_STATUS_REGIS = 0;
	u32 COMMAND = 0;
	u32 address = line*320+row;

	//Enable register03
	COMMAND = COMMAND | (1<<26);

	//Read gray option
	COMMAND = COMMAND | (1<<30);

	//enable read
	COMMAND = COMMAND | (1<<25);

	//push address
	COMMAND = COMMAND | (address << 8);

	//Write to register 3
	*slave_reg03 = COMMAND;

	do{
		RESPOND_FR_STATUS_REGIS = *slave_reg04;
		RESPOND_FR_STATUS_REGIS &=(1<<31);
	}while(RESPOND_FR_STATUS_REGIS == 0);

	//Reset valid fresh data
	*slave_reg03 = *slave_reg03 | 0x80000000;
	*slave_reg03 = *slave_reg03 & 0x7FFFFFFF;

	return (u8)(*slave_reg04 & 0x000000FF);

}

u8 READ_SOBEL_DATA(unsigned int line, unsigned int row){
	u32 RESPOND_FR_STATUS_REGIS = 0;
	u32 COMMAND = 0;
	u32 address = line*320+row;

	//Enable register03
	COMMAND = COMMAND | (1<<26);

	//Read sobel option
	COMMAND = COMMAND & 0xBFFFFFFF;

	//enable read
	COMMAND = COMMAND | (1<<25);

	//push address
	COMMAND = COMMAND | (address << 8);

	//Write to register 3
	*slave_reg03 = COMMAND;

	do{
		RESPOND_FR_STATUS_REGIS = *slave_reg04;
		RESPOND_FR_STATUS_REGIS &=(1<<31);
	}while(RESPOND_FR_STATUS_REGIS == 0);

	//Reset valid fresh data
	*slave_reg03 = *slave_reg03 | 0x80000000;
	*slave_reg03 = *slave_reg03 & 0x7FFFFFFF;

	return (u8)(*slave_reg04 & 0x000000FF);

}


u8 READ_SOBEL_DATA_byADDR(unsigned int address){
	u32 RESPOND_FR_STATUS_REGIS = 0;
	u32 COMMAND = 0;

	//Enable register03
	COMMAND = COMMAND | (1<<26);

	//Read sobel option
	COMMAND = COMMAND & 0xBFFFFFFF;

	//enable read
	COMMAND = COMMAND | (1<<25);

	//push address
	COMMAND = COMMAND | (address << 8);

	//Write to register 3
	*slave_reg03 = COMMAND;

	do{
		RESPOND_FR_STATUS_REGIS = *slave_reg04;
		RESPOND_FR_STATUS_REGIS &=(1<<31);
	}while(RESPOND_FR_STATUS_REGIS == 0);

	//Reset valid fresh data
	*slave_reg03 = *slave_reg03 | 0x80000000;
	*slave_reg03 = *slave_reg03 & 0x7FFFFFFF;

	return (u8)(*slave_reg04 & 0x000000FF);

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
	//xil_printf("\r\nValue of STATUS Register is 0x%x",*slave_reg05);
}

void WAIT_DONE_WRITE_COLOR(){
	u32 DONE_WRITE_COLOR = 0;
	//xil_printf("\r\nWaiting for finish writing color pixel to COLOR_BRAM");
	while(1){
		DONE_WRITE_COLOR = *slave_reg05 & 0x00000001;
		if (DONE_WRITE_COLOR != 0)
			break;
	}
	//xil_printf("\r\nDone writing color pixel to COLOR_BRAM");
}

void WAIT_DONE_WRITE_GRAY(){
	u32 DONE_WRITE_GRAY = 0;
	//xil_printf("\r\nWaiting for finish writing color pixel to GRAY_BRAM");
	while(1) {
		DONE_WRITE_GRAY = *slave_reg05 & 0x00000002;
		if (DONE_WRITE_GRAY != 0)
			break;
	}
	//xil_printf("\r\nDone writing gray pixel to GRAY_BRAM");
}

void WAIT_DONE_WRITE_SOBEL(){
	u32 DONE_WRITE_GRAY = 0;
	//xil_printf("\r\nWaiting for finish writing color pixel to SOBEL_BRAM");
	while(1) {
		DONE_WRITE_GRAY = *slave_reg05 & 0x00000004;
		if (DONE_WRITE_GRAY != 0)
			break;
	}
	//xil_printf("\r\nDone writing gray pixel to SOBEL_BRAM");
}

void AXI_GET_CONTROL(){
	//xil_printf("\r\nAXI gets control.");
	*slave_reg02 = *slave_reg02 & 0x3FFFFFFF;
}

void RGB_GET_CONTROL(){
	//xil_printf("\r\nRGB gets control.");
	*slave_reg02 = *slave_reg02 & 0x7FFFFFFF;
	*slave_reg02 = *slave_reg02 | 0x40000000;
}

void SOBEL_GET_CONTROL(){
	//xil_printf("\r\nSOBEL gets control.");
	*slave_reg02 = *slave_reg02 | 0x80000000;
	*slave_reg02 = *slave_reg02 & 0xBFFFFFFF;
}


void START_COLOR2GRAY(){
	//xil_printf("\r\nStart processing color to gray pixels.");
	//turn 28th to 1
	*slave_reg02 = *slave_reg02 | 0x10000000;

	//turn bit 28th to 0
	*slave_reg02 = *slave_reg02 & 0xEFFFFFFF;
}

void START_GRAY2SOBEL(){
	//xil_printf("\r\nStart processing gray to sobel pixels.");
	//turn 29th to 1
	*slave_reg02 = *slave_reg02 | 0x20000000;

	//turn bit 29th to 0
	*slave_reg02 = *slave_reg02 & 0xDFFFFFFF;
}


//This function has 1024 values in array that took from a gray image(format BMP).
//That gray image took from GIMP after processing.
void New_Header_GrayImage(){
	u32 cnt = 0;

	//BMP file to computer
	GrayImageData[0] = 0x42;
	GrayImageData[1] = 0x4D;

	//File size in total
	GrayImageData[2] = 0x8A;
	GrayImageData[3] = 0x30;
	GrayImageData[4] = 0x01;
	//GrayImageData[5] = 0x00;

	//Total offset from beginning to pixel data
	GrayImageData[10] = 0x8A;
	GrayImageData[11] = 0x04;
	//GrayImageData[12:13] = 0x00;

	//Size of DIB header
	GrayImageData[14] = 0x7C;
	//GrayImageData[15:17] = 0x00;

	//Image Width
	GrayImageData[18] = 0x40;
	GrayImageData[19] = 0x01;
	//GrayImageData[20:21] = 0x00;

	//Image Height
	GrayImageData[22] = 0xF0;
	//GrayImageData[23:25] = 0x00;

	//1 plane
	GrayImageData[26] = 0x01;
	//GrayImageData[27] = 0x00;

	//8 bits per pixel
	GrayImageData[28] = 0x08;
	//GrayImageData[29] = 0x00;

	//GrayImageData[30:33] = 0x00;

	//image size
	//GrayImageData[34] = 0x00;
	GrayImageData[35] = 0x2C;
	GrayImageData[36] = 0x01;
	//GrayImageData[37] = 0x00;

	//x pixel per meter
	GrayImageData[38] = 0x13;
	GrayImageData[39] = 0x0B;
	//GrayImageData[40:41] = 0x00;

	//y pixel per meter
	GrayImageData[42] = 0x13;
	GrayImageData[43] = 0x0B;
	//GrayImageData[44:45] = 0x00;

	//Colors in color table
	//GrayImageData[46] = 0x00;
	GrayImageData[47] = 0x01;
	//GrayImageData[48:49] = 0x00;

	//Color counts 0 -> 255
	//GrayImageData[50] = 0x00;
	GrayImageData[51] = 0x01;
	//GrayImageData[52:53] = 0x00;

	//Red bit mask
	//GrayImageData[54:55] = 0x00;
	GrayImageData[56] = 0xFF;
	//GrayImageData[57] = 0x00;

	//Green bit mask
	//GrayImageData[58] = 0x00;
	GrayImageData[59] = 0xFF;
	//GrayImageData[60:61] = 0x00;

	//Blue bit mask
	GrayImageData[62] = 0xFF;
	//GrayImageData[63:65] = 0x00;

	//Alpha bit mask
	//GrayImageData[66:69] = 0x00;

	//Color space type
	GrayImageData[70] = 0x42;
	GrayImageData[71] = 0x47;
	GrayImageData[72] = 0x52;
	GrayImageData[73] = 0x73;

	//36 Bytes zero for color space end point
	//GrayImageData[74:109] = 0x00;

	//12 Bytes zero for gamma R,G,B channel
	//GrayImageData[110:121] = 0x00;

	//Intent
	GrayImageData[122] = 0x02;
	//GrayImageData[123:125] = 0x00;

	//12 Bytes zero till end
	//GrayImageData[126:137] = 0x00;




	//Create color table
	for(unsigned int i = BMP_Header+DIB_Header;i <Gray_HeaderSize;i = i+4){
		GrayImageData[i+0] = cnt;
		GrayImageData[i+1] = cnt;
		GrayImageData[i+2] = cnt;
		GrayImageData[i+3] = 0;
		cnt++;
	}
}

void TEST_READ_COLOR_PIXEL(){
	int line, row;
	while(1){
		//xil_printf("\r\nEnter the line: ");
		scanf("%d",&line);
		//xil_printf("\r\nEnter the row: ");
		scanf("%d",&row);
		//xil_printf("\r\nRead at (%d,%d) 0x%x",line,row,READ_COMMAND(line,row));
		READ_RD_DATA_REG();
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

void TEST_READ_SOBEL_PIXEL(){
	int line, row;
	while(1){
		//xil_printf("\r\nEnter the line: ");
		scanf("%d",&line);
		//xil_printf("\r\nEnter the row: ");
		scanf("%d",&row);
		//xil_printf("\r\nRead at (%d,%d) 0x%x",line,row,READ_SOBEL_DATA(line,row));
	}
}

void SET_THRESHOLD(u32 threshold){
	//Write to register 2
	*slave_reg02 = *slave_reg02 | (threshold << 3);
}

void ENABLE_REG00(){
	//Enable register00 at bit 18th
	*slave_reg00 = *slave_reg00 | 0x00040000; //0100_0000_0000_0000_0000
}

void DISABLE_REG00(){
	//Disable Register00 at bit18th
	*slave_reg00 = *slave_reg00 & 0xFFFBFFFF;
}

void CLR_REG00(){
	*slave_reg00 = 0;
}
void CLR_REG01(){
	*slave_reg01 = 0;
}
void CLR_REG02(){
	*slave_reg02 = 0;
}
void CLR_REG03(){
	*slave_reg03 = 0;
}

void RST_DONE_COLOR_SIGNAL(){
	*slave_reg02 = *slave_reg02 | 0x00000001;
	*slave_reg02 = *slave_reg02 & 0xFFFFFFFE;
}

void RST_DONE_GRAY_SIGNAL(){
	*slave_reg02 = *slave_reg02 | 0x00000002;
	*slave_reg02 = *slave_reg02 & 0xFFFFFFFD;
}

void RST_DONE_SOBEL_SIGNAL(){
	*slave_reg02 = *slave_reg02 | 0x00000004;
	*slave_reg02 = *slave_reg02 & 0xFFFFFFFB;
}

void READ_REG(char reg){
	switch (reg) {
		case 0:
			//xil_printf("\r\nValue of reg %d is %0x",reg,*slave_reg00);
			break;
		case 1:
			//xil_printf("\r\nValue of reg %d is %0x",reg,*slave_reg01);
			break;
		case 2:
			//xil_printf("\r\nValue of reg %d is %0x",reg,*slave_reg02);
			break;
		case 3:
			//xil_printf("\r\nValue of reg %d is %0x",reg,*slave_reg03);
			break;
	}
}

void READ_RD_DATA_REG(){
	//xil_printf("\r\nValue of RD_DATA_REGISTER is %0x",*slave_reg04);
}

void FINISH_IMAGE(){
	*slave_reg02 = *slave_reg02 | 0x08000000;
	*slave_reg02 = *slave_reg02 & 0xF7FFFFFF;
}
/*--------------------------Function definitions :: End----------------------------------*/

