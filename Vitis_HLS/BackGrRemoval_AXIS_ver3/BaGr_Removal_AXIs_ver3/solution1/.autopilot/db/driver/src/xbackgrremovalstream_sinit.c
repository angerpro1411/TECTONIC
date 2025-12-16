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
#include "xbackgrremovalstream.h"

extern XBackgrremovalstream_Config XBackgrremovalstream_ConfigTable[];

XBackgrremovalstream_Config *XBackgrremovalstream_LookupConfig(u16 DeviceId) {
	XBackgrremovalstream_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XBACKGRREMOVALSTREAM_NUM_INSTANCES; Index++) {
		if (XBackgrremovalstream_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XBackgrremovalstream_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XBackgrremovalstream_Initialize(XBackgrremovalstream *InstancePtr, u16 DeviceId) {
	XBackgrremovalstream_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XBackgrremovalstream_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XBackgrremovalstream_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

