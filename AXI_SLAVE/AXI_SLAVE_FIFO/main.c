/******************************************************************************
*Test simple in the enviroment Vitis with base address of Slave Register.
*We can see inside library "xparameters.h"
* Peripheral Definitions for peripheral AXI_LITE_SLAVE_VHD_O_0
#define XPAR_AXI_LITE_SLAVE_VHD_O_0_BASEADDR 0x40000000
#define XPAR_AXI_LITE_SLAVE_VHD_O_0_HIGHADDR 0x40000FFF
* 0x40000000 is the address of Reg0 and +4 next for next reg(4 regs in total design).
*

*
* Modify REG0 to control Write and Read to FIFO
* Bit10th to enable READ/WRITE. Bit9/8 to control on/off read/write. 7->0  is write data
* Read data will be read at REG1 and also FIFO_STATUS at bit 9th and 8th corresponde to FULL et EMPTY
******************************************************************************/

/******************************************************************************
 *

******************************************************************************/

/*
 * main.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 */

#include <stdio.h>
#include "xil_printf.h"
#include "xparameters.h"
#include "sleep.h"

#define WRITE 1
#define READ 0

#define FULL 2
#define EMPTY 1
#define noFULLnoEMPTY 0

/*
* We need understand why each reg addr we need to add 4, because memory is aligned by Bytem so each 32 bits are aligned in 4 rows.
* Each register points to 32-bits memory so the address need to be divisible by 4.
* We create a function-an equation to address each address.
*/

#define BYTE_ADDRESSIBLE 4

#define REG0_OFFSET 0*BYTE_ADDRESSIBLE
#define REG1_OFFSET 1*BYTE_ADDRESSIBLE
#define REG2_OFFSET 2*BYTE_ADDRESSIBLE
#define REG3_OFFSET 3*BYTE_ADDRESSIBLE

volatile unsigned int *slave_reg00;
volatile unsigned int *slave_reg01;
volatile unsigned int *slave_reg02;
volatile unsigned int *slave_reg03;

volatile unsigned int *SW;

void WRITE_FIFO(unsigned char byte_data);
void READ_FIFO();
unsigned int CHECK_FIFO_STATUS();



int main()
{
	unsigned int option;
	unsigned int data=0;
	//Start program.
	xil_printf("/****************Program starts*****************/\r\n");
	/*
	 * Point the register correspond to each address.
	 */
	slave_reg00 = (volatile unsigned int *)(XPAR_S_AXI_LITE_FIFO_0_BASEADDR + REG0_OFFSET);
	slave_reg01 = (volatile unsigned int *)(XPAR_S_AXI_LITE_FIFO_0_BASEADDR + REG1_OFFSET);
	slave_reg02 = (volatile unsigned int *)(XPAR_S_AXI_LITE_FIFO_0_BASEADDR + REG2_OFFSET);
	slave_reg03 = (volatile unsigned int *)(XPAR_S_AXI_LITE_FIFO_0_BASEADDR + REG3_OFFSET);

	while(1){
		CHECK_FIFO_STATUS();
		xil_printf("\r\nWrite or Read 1/0");
		scanf("%d",&option);

		//check option and compare with status
		if(option == WRITE && CHECK_FIFO_STATUS() == FULL){
			xil_printf("\r\n Can not write when full, go back to option");
			continue;
		}
		else if(option == READ && CHECK_FIFO_STATUS() == EMPTY){
			xil_printf("\r\n Can not read when empty, go back to option");
			continue;
		}

		if (option == WRITE){
			xil_printf("\r\nFill the data 0x");
			scanf("%x",&data);
			WRITE_FIFO(data);
		}
		else if (option == READ)
			READ_FIFO();
	}

	/*
	CHECK_FIFO_STATUS();
	WRITE_FIFO(0x11);
	CHECK_FIFO_STATUS();
	READ_FIFO();
	CHECK_FIFO_STATUS();
	WRITE_FIFO(0x12);
	CHECK_FIFO_STATUS();
	READ_FIFO();
*/
    return 0;
}

void WRITE_FIFO(unsigned char byte_data){

	xil_printf("\r\nWrite to FIF0 data 0x%x ", byte_data);
	unsigned int REG0 = 0;

	//Enable READ/WRITE command at bit10th
	REG0 = REG0 | 0x400;

	//Enable WRITE at bit8th
	REG0 = REG0 | 0x100;

	//Insert data
	REG0 = REG0 | byte_data;

	//Write to reg0 - Launch write command
	*slave_reg00 = REG0;
}

void READ_FIFO(){

	unsigned int REG0 = 0;
	//Enable READ/WRITE command at bit10th
	REG0 = REG0 | 0x400;

	//Enable READ at bit9th
	REG0 = REG0 | 0x200;

	//Write to reg0 - Launch read command
	*slave_reg00 = REG0;

	xil_printf("\r\nFIFO read value is 0x%x ", (*slave_reg01 & 0xFF));
}

//FIFO_STATUS is FULL and EMPTY at bit 9th and bit 8th of register1
unsigned int CHECK_FIFO_STATUS(){
	unsigned int status = *slave_reg01;
	status = status & 0x00000F00;
	//no case that status is both empty and full
	if (status == 256){ //0x00000100 bit 8th = 1 emtpy
		xil_printf("\r\nFIFO empty.");
		return 1;
	}
	else if (status == 512){ //0x00000200 bit 9th = 1 full
		xil_printf("\r\nFIFO full.");
		return 2;
	}
	else{
		xil_printf("\r\nFIFO NOT empty NEITHER full.");
		return 0;
	}
}
