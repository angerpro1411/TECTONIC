/******************************************************************************
*Test simple in the enviroment Vitis with base address of Slave Register.
*We can see inside library "xparameters.h"
* Peripheral Definitions for peripheral AXI_LITE_SLAVE_VHD_O_0
#define XPAR_AXI_LITE_SLAVE_VHD_O_0_BASEADDR 0x40000000
#define XPAR_AXI_LITE_SLAVE_VHD_O_0_HIGHADDR 0x40000FFF
* 0x40000000 is the address of Reg0 and +4 next for next reg(4 regs in total design).
*
* Modify REG0 to control Write and Read to FIFO
* Bit10th to enable READ/WRITE. Bit9/8 to control on/off read/write. 7->0  is write data
* Read data will be read at REG1 and also FIFO_STATUS at bit 9th and 8th corresponde to FULL et EMPTY
******************************************************************************/

/******************************************************************************
 * Objective: Read, Write Simply at Block Ram with choosing address.
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

//You can check your base address at Address Editor in Vivado Design Block.
#define FPGA_BASE_ADDR 0x40000000



volatile unsigned int *slave_reg00;
volatile unsigned int *slave_reg01;
volatile unsigned int *slave_reg02;
volatile unsigned int *slave_reg03;

//Function declaration
void WRITE_COMMAND(unsigned int data,unsigned int line, unsigned int row);
unsigned int READ_COMMAND(unsigned int line, unsigned int row);


int main()
{
	//Start program.
	xil_printf("\r\n/-------------------Program starts------------------/");
	xil_printf("\r\nRemember Data writing in memory cell is 24bits, but reduce to 12 bits \
			due to compress pixel. R-G-B is 24 bits, but we only take 4 each.");
	/*
	 * Point the register correspond to each address.
	 */
	slave_reg00 = (volatile unsigned int *)FPGA_BASE_ADDR;
	slave_reg01 = (volatile unsigned int *)(FPGA_BASE_ADDR + 4);
	slave_reg02 = (volatile unsigned int *)(FPGA_BASE_ADDR + 8);
	slave_reg03 = (volatile unsigned int *)(FPGA_BASE_ADDR + 12);

//	while(1){
		WRITE_COMMAND(0xFFFFFF,1,1);
		xil_printf("\r\nREG00 is 0x%x",*slave_reg00);
		xil_printf("\r\nREG01 is 0x%x",*slave_reg01);


/*		WRITE_COMMAND(2,2,2);
		xil_printf("\r\nREG00 is 0x%x",*slave_reg00);
		xil_printf("\r\nREG01 is 0x%x",*slave_reg01);
*/
		xil_printf("\r\nRead at (1,1) %x",READ_COMMAND(1,1));

		//xil_printf("\r\nRead at (2,2) %x",READ_COMMAND(2,2));
//	}
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
