#include "stdio.h"

unsigned int WRITE_COMMAND(unsigned int data,unsigned int line, unsigned int row){
	unsigned int COMMAND_REG = 0;
	
	//Enable Command register
	COMMAND_REG = COMMAND_REG | 0x40000; //0100_0000_0000_0000_0000
	
	//Enable Write bit
	COMMAND_REG = COMMAND_REG | 0x20000;
	
	//Push line address
	COMMAND_REG = COMMAND_REG | (line << 8);
	
	//Push row address
	COMMAND_REG = COMMAND_REG | row;
	
	return COMMAND_REG;
}


int main(){
    printf("0x%x\n",WRITE_COMMAND(0xFF,0xAB,0xAB));
    return 0;
}