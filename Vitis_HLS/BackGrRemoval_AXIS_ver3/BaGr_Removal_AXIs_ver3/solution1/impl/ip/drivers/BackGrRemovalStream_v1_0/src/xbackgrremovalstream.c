// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xbackgrremovalstream.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XBackgrremovalstream_CfgInitialize(XBackgrremovalstream *InstancePtr, XBackgrremovalstream_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XBackgrremovalstream_Start(XBackgrremovalstream *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremovalstream_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_AP_CTRL) & 0x80;
    XBackgrremovalstream_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XBackgrremovalstream_IsDone(XBackgrremovalstream *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremovalstream_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XBackgrremovalstream_IsIdle(XBackgrremovalstream *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremovalstream_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XBackgrremovalstream_IsReady(XBackgrremovalstream *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremovalstream_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XBackgrremovalstream_EnableAutoRestart(XBackgrremovalstream *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremovalstream_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XBackgrremovalstream_DisableAutoRestart(XBackgrremovalstream *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremovalstream_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_AP_CTRL, 0);
}

void XBackgrremovalstream_Set_threshold(XBackgrremovalstream *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremovalstream_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_THRESHOLD_DATA, Data);
}

u32 XBackgrremovalstream_Get_threshold(XBackgrremovalstream *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremovalstream_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_THRESHOLD_DATA);
    return Data;
}

void XBackgrremovalstream_InterruptGlobalEnable(XBackgrremovalstream *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremovalstream_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_GIE, 1);
}

void XBackgrremovalstream_InterruptGlobalDisable(XBackgrremovalstream *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremovalstream_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_GIE, 0);
}

void XBackgrremovalstream_InterruptEnable(XBackgrremovalstream *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBackgrremovalstream_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_IER);
    XBackgrremovalstream_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_IER, Register | Mask);
}

void XBackgrremovalstream_InterruptDisable(XBackgrremovalstream *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBackgrremovalstream_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_IER);
    XBackgrremovalstream_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_IER, Register & (~Mask));
}

void XBackgrremovalstream_InterruptClear(XBackgrremovalstream *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremovalstream_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_ISR, Mask);
}

u32 XBackgrremovalstream_InterruptGetEnabled(XBackgrremovalstream *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBackgrremovalstream_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_IER);
}

u32 XBackgrremovalstream_InterruptGetStatus(XBackgrremovalstream *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBackgrremovalstream_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVALSTREAM_CONTROL_ADDR_ISR);
}

