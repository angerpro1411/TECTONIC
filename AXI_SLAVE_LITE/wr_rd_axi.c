#include <stdint.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FPGA_BASE_ADDR 0x40000000L
#define FPGA_OFFSET 0x00

volatile unsigned int *slave_reg00;
volatile unsigned int *slave_reg01;
volatile unsigned int *slave_reg02;
volatile unsigned int *slave_reg03;


int main(int agrc, char*argv[]){
	
	void*mapped_base;
	unsigned page_size = sysconf(_SC_PAGESIZE);
	
	//Open device memory in kernel
	int memfd = open("/dev/mem",O_RDWR | O_SYNC);
	if (memfd < 0) {
		printf("Can not open /dev/mem.\n");
		return EXIT_FAILURE;
	}
	
	//Map one page of memory into user space such that the device is in that page.
	mapped_base = mmap(0,2*page_size, PROT_READ|PROT_WRITE,MAP_SHARED,
										memfd, FPGA_BASE_ADDR);
	if(mapped_base == MAP_FAILED){
		printf("Can't map the memory to user space.\n");
		return -2;
	}
	
	slave_reg00 = (volatile unsigned int *)mapped_base;
	slave_reg01 = (volatile unsigned int *)(mapped_base + 1);
	slave_reg02 = (volatile unsigned int *)(mapped_base + 2);
	slave_reg03 = (volatile unsigned int *)(mapped_base + 3);
	
	
	return 0;
}
