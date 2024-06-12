/******************************************************************************
*Test simple in the enviroment Vitis with base address of Slave Register.
*We can see inside library "xparameters.h"
* Peripheral Definitions for peripheral AXI_LITE_SLAVE_VHD_O_0
#define XPAR_AXI_LITE_SLAVE_LEDS_SWITCHES_0_BASEADDR 0x40000000
#define XPAR_AXI_LITE_SLAVE_LEDS_SWITCHES_0_HIGHADDR 0x40000FFF
* 0x40000000 is the address of Reg0 and +4 next for next reg(4 regs in total design).
* The example that we and 8 lsb bit of reg2 and 8 lsb bit of reg3, and get the output to Leds of Zedboard.
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
/*This code C uses under Vitis enviroment of Xilinx*/


#include <stdio.h>
#include "xil_printf.h"
#include "xparameters.h"
#include "sleep.h"

volatile unsigned int *slave_reg00;
volatile unsigned int *slave_reg01;
volatile unsigned int *slave_reg02;
volatile unsigned int *slave_reg03;

volatile unsigned int *SW;


int main()
{
	//Start program.
	xil_printf("\r\n/-------------------Program starts----------------/");
	unsigned int LEDs = 0;
	unsigned int REG00,REG03 = 0;
	/*
	 * Point the register correspond to each address.
	 */
	slave_reg00 = (volatile unsigned int *)XPAR_AXI_LITE_SLAVE_LEDS_SWITCHES_0_BASEADDR;
	slave_reg01 = (volatile unsigned int *)(XPAR_AXI_LITE_SLAVE_LEDS_SWITCHES_0_BASEADDR + 4);
	slave_reg02 = (volatile unsigned int *)(XPAR_AXI_LITE_SLAVE_LEDS_SWITCHES_0_BASEADDR + 8);
	slave_reg03 = (volatile unsigned int *)(XPAR_AXI_LITE_SLAVE_LEDS_SWITCHES_0_BASEADDR + 12);

	//SW shares the same address "00" in hardware specification. Read VHDL code to more understanding.
	SW = (volatile unsigned int *)XPAR_AXI_LITE_SLAVE_LEDS_SWITCHES_0_BASEADDR;

	/*
	 * 7LEDs display. In the hardware specification, we define that 7-Leds = REG00 and REG03.
	 * So change the value both of them will change the LEDs display in Zedboard.
	 */
	while(1){
		xil_printf("\r\nWrite 8-bits value of Register00 0x");
		scanf("%x",&REG00);
		xil_printf("\r\nYou write 8-bits value of Register00 0x%x",REG00);

		xil_printf("\r\nWrite 8-bits value of Register03 0x");
		scanf("%x",&REG03);
		xil_printf("\r\nYou write 8-bits value of Register03 0x%x",REG03);

		//Write to real register in Hardware.
		*slave_reg03 = REG03;
		*slave_reg00 = REG00;
		LEDs = REG00 & REG03;
		xil_printf("\r\nLEDs will display 0x%x", LEDs);

		//Read the status of Switches.
		xil_printf("\r\nThe value of 7-switches is 0x%x",*SW);

		xil_printf("\r\n-----------------------------------");

		//delay for next ask
		sleep(1);
	}
    return 0;
}
