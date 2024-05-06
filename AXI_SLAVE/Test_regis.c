/******************************************************************************
*Test simple in the enviroment Vitis with base address of Slave Register. 
*We can see inside library "xparameters.h"
* Peripheral Definitions for peripheral AXI_LITE_SLAVE_VHD_O_0
#define XPAR_AXI_LITE_SLAVE_VHD_O_0_BASEADDR 0x40000000
#define XPAR_AXI_LITE_SLAVE_VHD_O_0_HIGHADDR 0x40000FFF
* 0x40000000 is the address of Reg0 and +4 next for next reg(4 regs in total design).
* The example that we and 8 lsb bit of reg2 and 8 lsb bit of reg3, and get the output to Leds of Zedboard.
******************************************************************************/

/*
 * helloworld.c: simple test application
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
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"

int *slave_reg02;
int *slave_reg03;

int main()
{
	slave_reg02 = XPAR_AXI_LITE_SLAVE_VHD_O_0_BASEADDR + 8;
	slave_reg03 = XPAR_AXI_LITE_SLAVE_VHD_O_0_BASEADDR + 12;

	*slave_reg02 = 0xFF;
	*slave_reg03 = 0xA5;
    return 0;
}
