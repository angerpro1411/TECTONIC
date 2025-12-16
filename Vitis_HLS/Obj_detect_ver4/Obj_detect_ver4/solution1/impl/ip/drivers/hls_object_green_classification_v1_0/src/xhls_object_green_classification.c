// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xhls_object_green_classification.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XHls_object_green_classification_CfgInitialize(XHls_object_green_classification *InstancePtr, XHls_object_green_classification_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Ctrl_BaseAddress = ConfigPtr->Ctrl_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

u32 XHls_object_green_classification_Get_object_count(XHls_object_green_classification *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_object_green_classification_ReadReg(InstancePtr->Ctrl_BaseAddress, XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJECT_COUNT_DATA);
    return Data;
}

u32 XHls_object_green_classification_Get_object_count_vld(XHls_object_green_classification *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XHls_object_green_classification_ReadReg(InstancePtr->Ctrl_BaseAddress, XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJECT_COUNT_CTRL);
    return Data & 0x1;
}

u32 XHls_object_green_classification_Get_obj_is_green_BaseAddress(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE);
}

u32 XHls_object_green_classification_Get_obj_is_green_HighAddress(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_HIGH);
}

u32 XHls_object_green_classification_Get_obj_is_green_TotalBytes(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE + 1);
}

u32 XHls_object_green_classification_Get_obj_is_green_BitWidth(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_WIDTH_OBJ_IS_GREEN;
}

u32 XHls_object_green_classification_Get_obj_is_green_Depth(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_DEPTH_OBJ_IS_GREEN;
}

u32 XHls_object_green_classification_Write_obj_is_green_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XHls_object_green_classification_Read_obj_is_green_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE + (offset + i)*4);
    }
    return length;
}

u32 XHls_object_green_classification_Write_obj_is_green_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XHls_object_green_classification_Read_obj_is_green_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE + offset + i);
    }
    return length;
}

u32 XHls_object_green_classification_Get_obj_x_BaseAddress(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE);
}

u32 XHls_object_green_classification_Get_obj_x_HighAddress(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_HIGH);
}

u32 XHls_object_green_classification_Get_obj_x_TotalBytes(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE + 1);
}

u32 XHls_object_green_classification_Get_obj_x_BitWidth(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_WIDTH_OBJ_X;
}

u32 XHls_object_green_classification_Get_obj_x_Depth(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_DEPTH_OBJ_X;
}

u32 XHls_object_green_classification_Write_obj_x_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XHls_object_green_classification_Read_obj_x_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE + (offset + i)*4);
    }
    return length;
}

u32 XHls_object_green_classification_Write_obj_x_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XHls_object_green_classification_Read_obj_x_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE + offset + i);
    }
    return length;
}

u32 XHls_object_green_classification_Get_obj_y_BaseAddress(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE);
}

u32 XHls_object_green_classification_Get_obj_y_HighAddress(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_HIGH);
}

u32 XHls_object_green_classification_Get_obj_y_TotalBytes(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE + 1);
}

u32 XHls_object_green_classification_Get_obj_y_BitWidth(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_WIDTH_OBJ_Y;
}

u32 XHls_object_green_classification_Get_obj_y_Depth(XHls_object_green_classification *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_DEPTH_OBJ_Y;
}

u32 XHls_object_green_classification_Write_obj_y_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(int *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE + (offset + i)*4) = *(data + i);
    }
    return length;
}

u32 XHls_object_green_classification_Read_obj_y_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length)*4 > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(int *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE + (offset + i)*4);
    }
    return length;
}

u32 XHls_object_green_classification_Write_obj_y_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(char *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE + offset + i) = *(data + i);
    }
    return length;
}

u32 XHls_object_green_classification_Read_obj_y_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr -> IsReady == XIL_COMPONENT_IS_READY);

    int i;

    if ((offset + length) > (XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_HIGH - XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE + 1))
        return 0;

    for (i = 0; i < length; i++) {
        *(data + i) = *(char *)(InstancePtr->Ctrl_BaseAddress + XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE + offset + i);
    }
    return length;
}

