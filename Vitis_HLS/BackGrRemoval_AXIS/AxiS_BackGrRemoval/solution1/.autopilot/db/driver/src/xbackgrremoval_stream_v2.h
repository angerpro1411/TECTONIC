// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XBACKGRREMOVAL_STREAM_V2_H
#define XBACKGRREMOVAL_STREAM_V2_H

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
#include "xbackgrremoval_stream_v2_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u64 Control_BaseAddress;
} XBackgrremoval_stream_v2_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XBackgrremoval_stream_v2;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XBackgrremoval_stream_v2_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XBackgrremoval_stream_v2_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XBackgrremoval_stream_v2_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XBackgrremoval_stream_v2_ReadReg(BaseAddress, RegOffset) \
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
int XBackgrremoval_stream_v2_Initialize(XBackgrremoval_stream_v2 *InstancePtr, u16 DeviceId);
XBackgrremoval_stream_v2_Config* XBackgrremoval_stream_v2_LookupConfig(u16 DeviceId);
int XBackgrremoval_stream_v2_CfgInitialize(XBackgrremoval_stream_v2 *InstancePtr, XBackgrremoval_stream_v2_Config *ConfigPtr);
#else
int XBackgrremoval_stream_v2_Initialize(XBackgrremoval_stream_v2 *InstancePtr, const char* InstanceName);
int XBackgrremoval_stream_v2_Release(XBackgrremoval_stream_v2 *InstancePtr);
#endif

void XBackgrremoval_stream_v2_Start(XBackgrremoval_stream_v2 *InstancePtr);
u32 XBackgrremoval_stream_v2_IsDone(XBackgrremoval_stream_v2 *InstancePtr);
u32 XBackgrremoval_stream_v2_IsIdle(XBackgrremoval_stream_v2 *InstancePtr);
u32 XBackgrremoval_stream_v2_IsReady(XBackgrremoval_stream_v2 *InstancePtr);
void XBackgrremoval_stream_v2_EnableAutoRestart(XBackgrremoval_stream_v2 *InstancePtr);
void XBackgrremoval_stream_v2_DisableAutoRestart(XBackgrremoval_stream_v2 *InstancePtr);

void XBackgrremoval_stream_v2_Set_threshold(XBackgrremoval_stream_v2 *InstancePtr, u32 Data);
u32 XBackgrremoval_stream_v2_Get_threshold(XBackgrremoval_stream_v2 *InstancePtr);
void XBackgrremoval_stream_v2_Set_rows(XBackgrremoval_stream_v2 *InstancePtr, u32 Data);
u32 XBackgrremoval_stream_v2_Get_rows(XBackgrremoval_stream_v2 *InstancePtr);
void XBackgrremoval_stream_v2_Set_cols(XBackgrremoval_stream_v2 *InstancePtr, u32 Data);
u32 XBackgrremoval_stream_v2_Get_cols(XBackgrremoval_stream_v2 *InstancePtr);

void XBackgrremoval_stream_v2_InterruptGlobalEnable(XBackgrremoval_stream_v2 *InstancePtr);
void XBackgrremoval_stream_v2_InterruptGlobalDisable(XBackgrremoval_stream_v2 *InstancePtr);
void XBackgrremoval_stream_v2_InterruptEnable(XBackgrremoval_stream_v2 *InstancePtr, u32 Mask);
void XBackgrremoval_stream_v2_InterruptDisable(XBackgrremoval_stream_v2 *InstancePtr, u32 Mask);
void XBackgrremoval_stream_v2_InterruptClear(XBackgrremoval_stream_v2 *InstancePtr, u32 Mask);
u32 XBackgrremoval_stream_v2_InterruptGetEnabled(XBackgrremoval_stream_v2 *InstancePtr);
u32 XBackgrremoval_stream_v2_InterruptGetStatus(XBackgrremoval_stream_v2 *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
