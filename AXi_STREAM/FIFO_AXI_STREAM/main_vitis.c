#include "xparameters.h"
#include "xaxidma.h"
#include "xil_cache.h"

//Check in file .xsa
#define DDR_BASE_ADDR 0x100000

#define TX_BUFFER_BASE DDR_BASE_ADDR
#define RX_BUFFER_BASE (DDR_BASE_ADDR + 0x100000)
#define PKG_LENGTH 8

#define OFFSET_MM2S_DMA 0x04
#define OFFSET_S2MM_DMA 0x34

//Function definition
u32 checkHalted(u32 DIRECTION);


int main(){
	int Status;
	XAxiDma my_DMA;
	XAxiDma_Config *CfgPtr = XAxiDma_LookupConfigBaseAddr(XPAR_AXI_DMA_0_BASEADDR);

	u32* SendBuff = (u32*)TX_BUFFER_BASE;
	u32* ReceivBuff = (u32*)RX_BUFFER_BASE;

	Status = XAxiDma_CfgInitialize(&my_DMA, CfgPtr);
	if (Status != XST_SUCCESS){
		xil_printf("Initialization config failed\r\n");
		return XST_FAILURE;
	}

//	Initialize the send buffer
	for(u32 i=0;i<PKG_LENGTH;++i){
		*(SendBuff+i)=i+1;
	}
	for(u32 i=0;i<PKG_LENGTH;++i){
		xil_printf("sendbuff[%d] = %d\r\n",i,SendBuff[i]);
	}

//Flush all data in cache before send
	Xil_DCacheFlushRange((UINTPTR)SendBuff, PKG_LENGTH);
	Xil_DCacheFlushRange((UINTPTR)ReceivBuff, PKG_LENGTH);


	Status = XAxiDma_SimpleTransfer(&my_DMA, (UINTPTR)(ReceivBuff), sizeof(u32)*PKG_LENGTH, XAXIDMA_DEVICE_TO_DMA);
	if (Status != XST_SUCCESS){
		xil_printf("Transfer from Device to DMA failed\r\n");
		return XST_FAILURE;
	}

	Status = XAxiDma_SimpleTransfer(&my_DMA, (UINTPTR)(SendBuff), sizeof(u32)*PKG_LENGTH, XAXIDMA_DMA_TO_DEVICE);
	if (Status != XST_SUCCESS){
		xil_printf("Transfer from DMA to DEVICE failed\r\n");
		return XST_FAILURE;
	}

//Wait finish send
	xil_printf("Waits finish sending\r\n");
	while(checkHalted(OFFSET_MM2S_DMA) == 0);


	for(u32 i=0;i<PKG_LENGTH;++i){
		xil_printf("reicevbuff[%d] = %d\r\n",i,ReceivBuff[i]);
	}
	return 0;




}

u32 checkHalted(u32 DIRECTION){
//OFFSET_MM2S_DMA 0x04
// 		or
//OFFSET_S2MM_DMA 0x34
	u32 Status = Xil_In32(XPAR_AXI_DMA_0_BASEADDR + DIRECTION) && 0x01;
	return Status;
}
