// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xbackgrremoval_stream_v2.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XBackgrremoval_stream_v2_CfgInitialize(XBackgrremoval_stream_v2 *InstancePtr, XBackgrremoval_stream_v2_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XBackgrremoval_stream_v2_Start(XBackgrremoval_stream_v2 *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_AP_CTRL) & 0x80;
    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XBackgrremoval_stream_v2_IsDone(XBackgrremoval_stream_v2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XBackgrremoval_stream_v2_IsIdle(XBackgrremoval_stream_v2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XBackgrremoval_stream_v2_IsReady(XBackgrremoval_stream_v2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XBackgrremoval_stream_v2_EnableAutoRestart(XBackgrremoval_stream_v2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XBackgrremoval_stream_v2_DisableAutoRestart(XBackgrremoval_stream_v2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_AP_CTRL, 0);
}

void XBackgrremoval_stream_v2_Set_threshold(XBackgrremoval_stream_v2 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_THRESHOLD_DATA, Data);
}

u32 XBackgrremoval_stream_v2_Get_threshold(XBackgrremoval_stream_v2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_THRESHOLD_DATA);
    return Data;
}

void XBackgrremoval_stream_v2_Set_rows(XBackgrremoval_stream_v2 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_ROWS_DATA, Data);
}

u32 XBackgrremoval_stream_v2_Get_rows(XBackgrremoval_stream_v2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_ROWS_DATA);
    return Data;
}

void XBackgrremoval_stream_v2_Set_cols(XBackgrremoval_stream_v2 *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_COLS_DATA, Data);
}

u32 XBackgrremoval_stream_v2_Get_cols(XBackgrremoval_stream_v2 *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_COLS_DATA);
    return Data;
}

void XBackgrremoval_stream_v2_InterruptGlobalEnable(XBackgrremoval_stream_v2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_GIE, 1);
}

void XBackgrremoval_stream_v2_InterruptGlobalDisable(XBackgrremoval_stream_v2 *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_GIE, 0);
}

void XBackgrremoval_stream_v2_InterruptEnable(XBackgrremoval_stream_v2 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_IER);
    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_IER, Register | Mask);
}

void XBackgrremoval_stream_v2_InterruptDisable(XBackgrremoval_stream_v2 *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_IER);
    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_IER, Register & (~Mask));
}

void XBackgrremoval_stream_v2_InterruptClear(XBackgrremoval_stream_v2 *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XBackgrremoval_stream_v2_WriteReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_ISR, Mask);
}

u32 XBackgrremoval_stream_v2_InterruptGetEnabled(XBackgrremoval_stream_v2 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_IER);
}

u32 XBackgrremoval_stream_v2_InterruptGetStatus(XBackgrremoval_stream_v2 *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XBackgrremoval_stream_v2_ReadReg(InstancePtr->Control_BaseAddress, XBACKGRREMOVAL_STREAM_V2_CONTROL_ADDR_ISR);
}

