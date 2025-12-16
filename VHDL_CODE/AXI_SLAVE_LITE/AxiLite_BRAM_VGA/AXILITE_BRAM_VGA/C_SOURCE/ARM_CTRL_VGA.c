#include "stdio.h"
#include "stdlib.h"
#include "xparameters.h"
#include "xuartps.h"


//Image define region, with this application, we use gray image.
//Gray Image define region
#define imageWidth 320
#define imageHeight 240
#define PixelNumber 320*240
#define imageSize 320*240
#define BMP_Header 14
#define DIB_Header 124
#define ColorTable_NBytes 1024
#define Gray_HeaderSize BMP_Header+DIB_Header+ColorTable_NBytes
#define fileSize imageSize+Gray_HeaderSize

//Access control
#define PS_AXI 0
#define VGA_CTRL 1


/*
 * Bit manipulation
 * LSB bit is 0th
 */
#define BIT_SET(data,n)             ( data = data |   1<<n  )
#define BIT_CLR(data,n)             ( data = data & ~(1<<n) )
#define BIT_READ(data,n)            ( (data>>n) & 0x00000001)
#define BIT_WRITE(data,n,value)     ( value?            BIT_SET(data,n) : BIT_CLR(data,n) )
#define BIT_TOGGLE(data,n)          ( data = data ^   1<<n )


/*
 * Global variables
 * */
unsigned int pixel_count = 0;


//You can check your base address at Address Editor in Vivado Design Block.
#define FPGA_BASE_ADDR 0x40000000

//Point the register correspond to each address.
volatile unsigned int *slave_reg00 = (volatile unsigned int *)FPGA_BASE_ADDR;
volatile unsigned int *slave_reg01 = (volatile unsigned int *)(FPGA_BASE_ADDR + 4);
volatile unsigned int *slave_reg02 = (volatile unsigned int *)(FPGA_BASE_ADDR + 8);
volatile unsigned int *slave_reg03 = (volatile unsigned int *)(FPGA_BASE_ADDR + 12);

void WRITE_CMD(unsigned char data, unsigned int addr);
unsigned char READ_CMD(unsigned int addr);
void INCREASE_PIXEL_COUNT_BY1();
void RESET_PIXEL_COUNT();
u8 CHECK_PIXEL_COUNT();
void TEST_READ_GRAY_PIXEL();
void ACCESS_CONTROL(unsigned char direction);
int main(){

	//---------------------------Sending data part-----------------------------------//
	int Status;


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

	while(ReceivBytes < fileSize){
		ReceivBytes += XUartPs_Recv(&myUart_PS,&imageData[ReceivBytes], fileSize-ReceivBytes);
	}
    //-------------------------------------------------------------------------------------

	//Store data in the block ram
//	for(int i=Gray_HeaderSize;i<fileSize;i++){
//		WRITE_CMD(imageData[i],pixel_count);
//		INCREASE_PIXEL_COUNT_BY1();
//	}

	//Store data in the block ram
	//Pixel data of bmp starts from right bottom to left top,
	//So if we want to display it on the screen by VGA, we need to start at the last data of array.
	//If not, the image will be upside down.
	for(int i=fileSize-1;i>=Gray_HeaderSize;i--){
		WRITE_CMD(imageData[i],pixel_count);
		INCREASE_PIXEL_COUNT_BY1();
	}

	print("\r\nFinish send data to block ram");
	print("\r\nPixel DATA starts at addr 138(Header)+1024(Color table) = 1162");

	Status = CHECK_PIXEL_COUNT();
	if (Status == 1){
		print("\r\nProblem at sending data to block ram");
		return XST_FAILURE;
	}
	RESET_PIXEL_COUNT();

//	print("\r\nCheck pixel data in block ram");
//	TEST_READ_GRAY_PIXEL();

	//Change the access control to VGA
	//First access is AXI, use to send pixel data into block ram
	//Next access is VGA, use to get data from BRAM and display on screen.
	ACCESS_CONTROL(VGA_CTRL);

	return 0;
}

void WRITE_CMD(unsigned char data, unsigned int addr){
	unsigned int REG = 0;

	//Push address
	//17 bits address
	REG = REG | (addr & 0x0001FFFF);

	//Write bit 18th
	REG = REG | 0x00020000;

	//Enable bit 19th
	REG = REG | 0x00040000;

	//8bit data inserts
	REG = REG | (int)(data <<19);

	*slave_reg00 = REG;
}

unsigned char READ_CMD(unsigned int addr){
	unsigned int REG = 0;
	int RESP = 0;
	unsigned int RESULT;

	//Push address
	//17 bits address
	REG = REG | (addr & 0x0001FFFF);

	//READ bit 18th
	REG = REG | 0x00000000;

	//Enable bit 19th
	REG = REG | 0x00040000;

	*slave_reg00 = REG;

	//Wait valid data on
	do{
		RESP = *slave_reg00 & 0x80000000;
	}while(RESP == 0);

	RESULT = ((*slave_reg00 & 0x07F80000)>>19);
	//CLR REG after got result
	*slave_reg00 = 0;
	return RESULT;
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

void TEST_READ_GRAY_PIXEL(){
	unsigned int addr;
	while(1){
		printf("\r\nEnter address: ");
		scanf("%d",&addr);
		printf("\r\nRead at (%d) 0x%x",addr,READ_CMD(addr));
	}
}

void ACCESS_CONTROL(unsigned char direction){
//#define PS_AXI 0
//#define VGA_CTRL 1
	if (direction == PS_AXI){
		*slave_reg00 = 0x00000000;
	}
	else if(direction == VGA_CTRL){
		*slave_reg00 = 0x40000000;
	}
}

