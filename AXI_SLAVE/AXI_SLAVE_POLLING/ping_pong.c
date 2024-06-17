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

//Function declarations*slave_reg03
void WRITE_DATA(unsigned int data);
void VALID_DATA();
unsigned int READ_DATA();
void INVALID_DATA();
void POLLING_DATA();

volatile unsigned int *slave_reg00;
volatile unsigned int *slave_reg01;
volatile unsigned int *slave_reg02;
volatile unsigned int *slave_reg03;




int main()
{
	unsigned int option;
	unsigned int data=0;
	//Start program.
	xil_printf("\r\n/-------------------Program starts------------------/");
	/*
	 * Point the register correspond to each address.
	 */
	slave_reg00 = (volatile unsigned int *)FPGA_BASE_ADDR;
	slave_reg01 = (volatile unsigned int *)(FPGA_BASE_ADDR + 4);
	slave_reg02 = (volatile unsigned int *)(FPGA_BASE_ADDR + 8);
	slave_reg03 = (volatile unsigned int *)(FPGA_BASE_ADDR + 12);

	while(1){
		xil_printf("\r\nFill the data to REG00(maximum 32b) 0x");
		scanf("%x",&data);

		//Write data into reg0
		WRITE_DATA(data);

		//tell system that data fresh in reg0
		VALID_DATA();

		//Wait new data is cming
		POLLING_DATA();

		//Read new data
		xil_printf("\r\nNew data is 0x%x",READ_DATA());

		//Put dirty to data we just read
		INVALID_DATA();

		xil_printf("\r\nEnd program.");
	}
    return 0;
}

//DATA is store in reg0
void WRITE_DATA(unsigned int data){
    unsigned int REG00 = 0;
    REG00 = REG00 | data;

    //Write data into register0
    *slave_reg00 = REG00;
}

//Valid signal is bit0 of regis1
void VALID_DATA(){
    unsigned int REG01 = 1;

    //Write data into register1
    *slave_reg01 = REG01;
}

//Read new data at regis02
unsigned int READ_DATA(){
	return *slave_reg02;
}

//Wait fresh data on regis02
void POLLING_DATA(){
	unsigned int REG03 = 0;
	do{
	//read continuously value of reg03 till equal 1
		REG03 = *slave_reg03;}
	while(REG03 == 0);

}

//Invalid data at regis03
void INVALID_DATA(){
	unsigned int REG03 = 0;

	//Write invalid bit to reg03
	*slave_reg03 = REG03;
}
