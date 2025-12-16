// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XHLS_OBJECT_GREEN_CLASSIFICATION_H
#define XHLS_OBJECT_GREEN_CLASSIFICATION_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xhls_object_green_classification_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Ctrl_BaseAddress;
} XHls_object_green_classification_Config;
#endif

typedef struct {
    u64 Ctrl_BaseAddress;
    u32 IsReady;
} XHls_object_green_classification;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XHls_object_green_classification_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XHls_object_green_classification_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XHls_object_green_classification_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XHls_object_green_classification_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XHls_object_green_classification_Initialize(XHls_object_green_classification *InstancePtr, u16 DeviceId);
XHls_object_green_classification_Config* XHls_object_green_classification_LookupConfig(u16 DeviceId);
int XHls_object_green_classification_CfgInitialize(XHls_object_green_classification *InstancePtr, XHls_object_green_classification_Config *ConfigPtr);
#else
int XHls_object_green_classification_Initialize(XHls_object_green_classification *InstancePtr, const char* InstanceName);
int XHls_object_green_classification_Release(XHls_object_green_classification *InstancePtr);
#endif


u32 XHls_object_green_classification_Get_object_count(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_object_count_vld(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_is_green_BaseAddress(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_is_green_HighAddress(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_is_green_TotalBytes(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_is_green_BitWidth(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_is_green_Depth(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Write_obj_is_green_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length);
u32 XHls_object_green_classification_Read_obj_is_green_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length);
u32 XHls_object_green_classification_Write_obj_is_green_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length);
u32 XHls_object_green_classification_Read_obj_is_green_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length);
u32 XHls_object_green_classification_Get_obj_x_BaseAddress(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_x_HighAddress(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_x_TotalBytes(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_x_BitWidth(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_x_Depth(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Write_obj_x_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length);
u32 XHls_object_green_classification_Read_obj_x_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length);
u32 XHls_object_green_classification_Write_obj_x_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length);
u32 XHls_object_green_classification_Read_obj_x_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length);
u32 XHls_object_green_classification_Get_obj_y_BaseAddress(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_y_HighAddress(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_y_TotalBytes(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_y_BitWidth(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Get_obj_y_Depth(XHls_object_green_classification *InstancePtr);
u32 XHls_object_green_classification_Write_obj_y_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length);
u32 XHls_object_green_classification_Read_obj_y_Words(XHls_object_green_classification *InstancePtr, int offset, word_type *data, int length);
u32 XHls_object_green_classification_Write_obj_y_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length);
u32 XHls_object_green_classification_Read_obj_y_Bytes(XHls_object_green_classification *InstancePtr, int offset, char *data, int length);

#ifdef __cplusplus
}
#endif

#endif
