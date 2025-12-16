#include "stdio.h"
#include "xaxidma.h"
#include "xparameters.h"
#include "xuartps.h"
#include "xscugic.h"
#include "stdlib.h"
#include "data.h"
#include "xil_exception.h"
#include "xhls_object_green_classification.h"
#include "xhls_object_green_classification_hw.h"
#include "ObjDetect.h"
#include "xtime_l.h"


//Image define region
#define imageWidth 320
#define imageHeight 240
#define PixelNumber 320*240
#define imageSize 320*240*3
#define headerSize 0x8A
#define fileSize imageSize+headerSize

#define HLS_IRQ_AP_DONE_MASK (1<<0)
#define HLS_IRQ_AP_READY_MASK (1<<1)


//Define for reading data from object_detection ip
//#define HLS_IP_BASE     XPAR_HLS_OBJECT_GREEN_CLA_0_S_AXI_CTRL_BASEADDR
//#define HLS_IP_INTR_ID  XPAR_FABRIC_HLS_OBJECT_GREEN_CLA_0_INTERRUPT_INTR


//function definitions
static void DMA_REPEAT_READ_ISR(void *CallBackRef);
void Obj_detect_read_result(void *CallbackRef);


XHls_object_green_classification myObjDetect;

XScuGic mycuGic;
u32 status;
u8 pixelDataInvert[imageSize];

int sendTimes = 0;

//Array to stock the obj we detect

volatile int g_obj_ready = 0;                 // set by ISR, read by main
static ObjDetect list[32];         // small shared buffer
u8 g_obj_count = 0;


/*Execution time calculation*/
//Using the global timer
XTime start,end;

unsigned int sendCnt=0;



int main(){



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


 /**********************************************ObjDetect CONFIG::START******************************************************************/
	XHls_object_green_classification_Config *myObjDetect_Config = XHls_object_green_classification_LookupConfig(XPAR_HLS_OBJECT_GREEN_CLA_0_DEVICE_ID);


	status = XHls_object_green_classification_CfgInitialize(&myObjDetect, myObjDetect_Config);
	if (status != XST_SUCCESS){
		print("\r\nFailed to CfgInitialize ObjDetect");
		return XST_FAILURE;
	}

	print("\r\nObjDetect CfgInitialize succeeded");

	//Enable intr
	// 0x08 : IP Interrupt Enable Register (Read/Write)
	//        bit 0 - enable ap_done interrupt (Read/Write)
	XHls_object_green_classification_InterruptEnable(&myObjDetect,HLS_IRQ_AP_DONE_MASK);
	XHls_object_green_classification_InterruptGlobalEnable(&myObjDetect);

	// *** Start ip ***
	XHls_object_green_classification_Start(&myObjDetect);
  /**********************************************ObjDetect CONFIG::END******************************************************************/



 /**********************************************CPU INTERRUPTION CONFIG::START******************************************************************/
	 XScuGic_Config *mycuGic_Config =  XScuGic_LookupConfig(XPAR_PS7_SCUGIC_0_DEVICE_ID);

	 status = XScuGic_CfgInitialize(&mycuGic, mycuGic_Config,
			 mycuGic_Config->CpuBaseAddress);
		if (status != XST_SUCCESS){
			print("\r\nFailed to CfgInitialize GIC");
			return XST_FAILURE;
		}

	//used to configure interrupt priority and trigger type for a specific interrupt source
		//when working with the Xilinx SCU Generic Interrupt Controller (GIC).
	XScuGic_SetPriorityTriggerType(&mycuGic, XPAR_FABRIC_AXI_DMA_0_MM2S_INTROUT_INTR, 0xA0, 3);

	//Connect the Interrupt and ISR - DMA
	status = XScuGic_Connect(&mycuGic, XPAR_FABRIC_AXI_DMA_0_MM2S_INTROUT_INTR,
					(Xil_InterruptHandler)DMA_REPEAT_READ_ISR, (void*)&myAxiDma);
	if (status != XST_SUCCESS){
		print("\r\nFailed to XScuGic_Connect_DMA GIC");
		return XST_FAILURE;
	}

	//Enable back the interrupt - DMA
	XScuGic_Enable(&mycuGic, XPAR_FABRIC_AXI_DMA_0_MM2S_INTROUT_INTR);


	//Connect the Interrupt and ISR - Object_Detect
	status = XScuGic_Connect(&mycuGic, XPAR_FABRIC_HLS_OBJECT_GREEN_CLA_0_INTERRUPT_INTR,
					(Xil_InterruptHandler)Obj_detect_read_result, (void*)&myObjDetect);
	if (status != XST_SUCCESS){
		print("\r\nFailed to XScuGic_Connect_OBj_Detect GIC");
		return XST_FAILURE;
	}
	//Enable back the interrupt - OBjDetect
	XScuGic_Enable(&mycuGic, XPAR_FABRIC_HLS_OBJECT_GREEN_CLA_0_INTERRUPT_INTR);




	//These functions tell the processor which function to call when a particular exception (like an interrupt) occurs
	Xil_ExceptionInit();
	//Connect GIC with processor - Hooks up the GIC dispatcher
	Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT, (Xil_ExceptionHandler)XScuGic_InterruptHandler, (void *)&mycuGic);
	//Globally enables interrupts in the CPU
	Xil_ExceptionEnable();

 /**********************************************CPU INTERRUPTION CONFIG::END******************************************************************/


/**********************************************STIMULUS::START******************************************************************/

	//Start calculate the timing
	XTime_GetTime(&start);

	//DMA send data to VGA
	status = XAxiDma_SimpleTransfer(&myAxiDma, (UINTPTR)pixelData, imageSize, XAXIDMA_DMA_TO_DEVICE);
	if (status == XST_SUCCESS){
		print("\r\n XST_SUCCESS XAxiDma_SimpleTransfer to transfer data");
	}
	else if (status == XST_FAILURE){
		print("\r\n XST_FAILURE XAxiDma_SimpleTransfer to transfer data");
		return XST_FAILURE;}
	else if (status == XST_INVALID_PARAM){
		print("\r\n XST_INVALID_PARAM XAxiDma_SimpleTransfer to transfer data");
		return XST_INVALID_PARAM;}

	//Polling to wait result of object detection then print the result
	while(1){
		if(g_obj_ready == 1){
		printf("\r\nProcessing time %f ns",(end-start)*1000000000.0/(sendCnt*COUNTS_PER_SECOND));
		xil_printf("\r\nDetected %d objects:", g_obj_count);
		for (u8 i = 0;i<g_obj_count;i++){
			xil_printf("\r\nObj %d:(%d,%d)",i,list[i].x,list[i].y);
			if (list[i].is_green == 1) print(",TREE.");
			else print(",HOUSE.");
		}
			g_obj_ready = 0;
		}
	}
	return 0;

/**********************************************STIMULUS::END******************************************************************/

}

//Interrupt Service Routine for DMA interrupt
static void DMA_REPEAT_READ_ISR(void *CallBackRef){


	XAxiDma *instDMA = (XAxiDma *)CallBackRef;

	//disable intr
	XAxiDma_IntrDisable(instDMA, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DMA_TO_DEVICE);

	//Clear interrupt status register
	XAxiDma_IntrAckIrq(instDMA, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DMA_TO_DEVICE);

	//Do sthing here,
	XAxiDma_SimpleTransfer(instDMA, (UINTPTR)pixelData, imageSize, XAXIDMA_DMA_TO_DEVICE);

	//Enable back the intr
	XAxiDma_IntrEnable(instDMA, XAXIDMA_IRQ_IOC_MASK, XAXIDMA_DMA_TO_DEVICE);
}

//Interrupt for Object Detection
void Obj_detect_read_result(void *CallbackRef)
{
	sendCnt++;
	//Calculate the end time
	XTime_GetTime(&end);

	XHls_object_green_classification *ip =
	        (XHls_object_green_classification *)CallbackRef;

	//Read data
    g_obj_count = ReadObj(list, 32, ip);

    //Asserted ready flag
    g_obj_ready = 1;


    // Clear interrupt
	XHls_object_green_classification_InterruptClear(ip, HLS_IRQ_AP_DONE_MASK);

    // Start again for the next frame
    XHls_object_green_classification_Start(ip);
}


