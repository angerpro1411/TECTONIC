#include "stdio.h"
#include "xaxidma.h"
#include "xparameters.h"
#include "xuartps.h"
#include "xscugic.h"
#include "stdlib.h"
#include "data.h"

//Image define region
#define imageWidth 320
#define imageHeight 240
#define PixelNumber 320*240
#define imageSize 320*240*3
#define headerSize 0x8A
#define fileSize imageSize+headerSize


//function definitions
static void DMA_REPEAT_READ_ISR(void *CallBackRef);
XUartPs myUart_PS;

XScuGic mycuGic;
u32 status;
u8 pixelDataInvert[imageSize];

int sendTimes = 0;

int main(){

	for(int i=0;i<imageSize;i++){
		pixelDataInvert[i] = pixelData[imageSize-1-i];
	}


/**********************************************DMA CONFIG::START******************************************************************/
	XAxiDma_Config *myAxiDma_Config = XAxiDma_LookupConfig(XPAR_AXI_DMA_0_DEVICE_ID);
	XAxiDma myAxiDma;

	status = XAxiDma_CfgInitialize(&myAxiDma, myAxiDma_Config);
	if (status != XST_SUCCESS){
		print("\r\nFailed to CfgInitialize DMA");
		return XST_FAILURE;
	}

	print("\r\nDMA CfgInitialize succeeded");

	//Enable intr, but input output completion mask
	//It means when DMA finishes sending data to device, the intr will be asserted
	 XAxiDma_IntrEnable(&myAxiDma, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DMA_TO_DEVICE);

 /**********************************************DMA CONFIG::END******************************************************************/


 /**********************************************CPU INTERRUPTION CONFIG::START******************************************************************/
	 XScuGic_Config *mycuGic_Config =  XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);

	 status = XScuGic_CfgInitialize(&mycuGic, mycuGic_Config,
			 mycuGic_Config->CpuBaseAddress);
		if (status != XST_SUCCESS){
			print("\r\nFailed to CfgInitialize GIC");
			return XST_FAILURE;
		}

	XScuGic_SetPriorityTriggerType(&mycuGic, XPAR_FABRIC_AXI_DMA_0_MM2S_INTROUT_INTR, 0xA0, 3);

	//Connect the Interrupt and ISR
	status = XScuGic_Connect(&mycuGic, XPAR_FABRIC_AXI_DMA_0_MM2S_INTROUT_INTR,
					(Xil_InterruptHandler)DMA_REPEAT_READ_ISR, (void*)&myAxiDma);
	if (status != XST_SUCCESS){
		print("\r\nFailed to XScuGic_Connect GIC");
		return XST_FAILURE;
	}

	//Enable back the interrupt
	XScuGic_Enable(&mycuGic, XPAR_FABRIC_AXI_DMA_0_MM2S_INTROUT_INTR);

	//Connect GIC with processor
	Xil_ExceptionInit();
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, (void *)&mycuGic);
	Xil_ExceptionEnable();

 /**********************************************CPU INTERRUPTION CONFIG::END******************************************************************/


/**********************************************STIMULUS::START******************************************************************/
	//Flush all DCache instead of an amount.
	Xil_DCacheFlush();

	//DMA send data to VGA
	status = XAxiDma_SimpleTransfer(&myAxiDma, (UINTPTR)pixelData, imageSize, XAXIDMA_DMA_TO_DEVICE);
	if (status == XST_SUCCESS){
		print("\r\n XST_SUCCESS XAxiDma_SimpleTransfer to transfer data");
		return XST_SUCCESS;}
	else if (status == XST_FAILURE){
		print("\r\n XST_FAILURE XAxiDma_SimpleTransfer to transfer data");
		return XST_FAILURE;}
	else if (status == XST_INVALID_PARAM){
		print("\r\n XST_INVALID_PARAM XAxiDma_SimpleTransfer to transfer data");
		return XST_INVALID_PARAM;}
	return 0;

/**********************************************STIMULUS::END******************************************************************/

}

//Interrupt Service Routine for DMA interrupt
static void DMA_REPEAT_READ_ISR(void *CallBackRef){

	//disable intr
	XAxiDma_IntrDisable((XAxiDma *)CallBackRef, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DMA_TO_DEVICE);

	//Clear interrupt status register
	XAxiDma_IntrAckIrq((XAxiDma *)CallBackRef, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DMA_TO_DEVICE);

	//Do sthing here,
	XAxiDma_SimpleTransfer((XAxiDma *)CallBackRef, (UINTPTR)pixelData, imageSize, XAXIDMA_DMA_TO_DEVICE);

	//Enable back the intr
	XAxiDma_IntrEnable((XAxiDma *)CallBackRef, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DMA_TO_DEVICE);
}


