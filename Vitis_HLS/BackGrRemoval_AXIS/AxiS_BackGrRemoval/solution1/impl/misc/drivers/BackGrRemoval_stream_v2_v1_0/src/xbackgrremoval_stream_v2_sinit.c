// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xbackgrremoval_stream_v2.h"

extern XBackgrremoval_stream_v2_Config XBackgrremoval_stream_v2_ConfigTable[];

XBackgrremoval_stream_v2_Config *XBackgrremoval_stream_v2_LookupConfig(u16 DeviceId) {
	XBackgrremoval_stream_v2_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XBACKGRREMOVAL_STREAM_V2_NUM_INSTANCES; Index++) {
		if (XBackgrremoval_stream_v2_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XBackgrremoval_stream_v2_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBackgrremoval_stream_v2_Initialize(XBackgrremoval_stream_v2 *InstancePtr, u16 DeviceId) {
	XBackgrremoval_stream_v2_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBackgrremoval_stream_v2_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBackgrremoval_stream_v2_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

