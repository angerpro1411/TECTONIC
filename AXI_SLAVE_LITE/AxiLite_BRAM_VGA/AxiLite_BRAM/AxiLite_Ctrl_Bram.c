#include "stdio.h"
#include "xparameters.h"
#include "xuartps.h"

/*
 * Bit manipulation
 * LSB bit is 0th
 */

#define BIT_SET(data,n)             ( data = data |   1<<n  )
#define BIT_CLR(data,n)             ( data = data & ~(1<<n) )
#define BIT_READ(data,n)            ( (data>>n) & 0x00000001)
#define BIT_WRITE(data,n,value)     ( value?            BIT_SET(data,n) : BIT_CLR(data,n) )
#define BIT_TOGGLE(data,n)          ( data = data ^   1<<n )

//You can check your base address at Address Editor in Vivado Design Block.
#define FPGA_BASE_ADDR 0x40000000

//Point the register correspond to each address.
volatile unsigned int *slave_reg00 = (volatile unsigned int *)FPGA_BASE_ADDR;
volatile unsigned int *slave_reg01 = (volatile unsigned int *)(FPGA_BASE_ADDR + 4);
volatile unsigned int *slave_reg02 = (volatile unsigned int *)(FPGA_BASE_ADDR + 8);
volatile unsigned int *slave_reg03 = (volatile unsigned int *)(FPGA_BASE_ADDR + 12);

void WRITE_CMD(unsigned char data, unsigned int addr);
unsigned char READ_CMD(unsigned int addr);

int main(){
	WRITE_CMD(0xAA, 0);
	xil_printf("0x%x\r\n",*slave_reg00);
	WRITE_CMD(0xAA, 1);
	xil_printf("0x%x\r\n",*slave_reg00);
	xil_printf("%x\r\n",READ_CMD(0));
	xil_printf("0x%x\r\n",*slave_reg00);
	xil_printf("%x\r\n",READ_CMD(1));
	xil_printf("0x%x\r\n",*slave_reg00);
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
