// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
// CTRL
// 0x00 : Control signals
//        bit 0  - ap_start (Read/Write/COH)
//        bit 1  - ap_done (Read/COR)
//        bit 2  - ap_idle (Read)
//        bit 3  - ap_ready (Read/COR)
//        bit 7  - auto_restart (Read/Write)
//        bit 9  - interrupt (Read)
//        others - reserved
// 0x04 : Global Interrupt Enable Register
//        bit 0  - Global Interrupt Enable (Read/Write)
//        others - reserved
// 0x08 : IP Interrupt Enable Register (Read/Write)
//        bit 0 - enable ap_done interrupt (Read/Write)
//        bit 1 - enable ap_ready interrupt (Read/Write)
//        others - reserved
// 0x0c : IP Interrupt Status Register (Read/TOW)
//        bit 0 - ap_done (Read/TOW)
//        bit 1 - ap_ready (Read/TOW)
//        others - reserved
// 0x10 : Data signal of object_count
//        bit 15~0 - object_count[15:0] (Read)
//        others   - reserved
// 0x14 : Control signal of object_count
//        bit 0  - object_count_ap_vld (Read/COR)
//        others - reserved
// 0x20 ~
// 0x3f : Memory 'obj_is_green' (32 * 1b)
//        Word n : bit [ 0: 0] - obj_is_green[4n]
//                 bit [ 8: 8] - obj_is_green[4n+1]
//                 bit [16:16] - obj_is_green[4n+2]
//                 bit [24:24] - obj_is_green[4n+3]
//                 others      - reserved
// 0x40 ~
// 0x7f : Memory 'obj_x' (32 * 16b)
//        Word n : bit [15: 0] - obj_x[2n]
//                 bit [31:16] - obj_x[2n+1]
// 0x80 ~
// 0xbf : Memory 'obj_y' (32 * 16b)
//        Word n : bit [15: 0] - obj_y[2n]
//                 bit [31:16] - obj_y[2n+1]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_AP_CTRL           0x00
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_GIE               0x04
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_IER               0x08
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_ISR               0x0c
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJECT_COUNT_DATA 0x10
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_BITS_OBJECT_COUNT_DATA 16
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJECT_COUNT_CTRL 0x14
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_BASE 0x20
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_IS_GREEN_HIGH 0x3f
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_WIDTH_OBJ_IS_GREEN     1
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_DEPTH_OBJ_IS_GREEN     32
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_BASE        0x40
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_X_HIGH        0x7f
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_WIDTH_OBJ_X            16
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_DEPTH_OBJ_X            32
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_BASE        0x80
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_ADDR_OBJ_Y_HIGH        0xbf
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_WIDTH_OBJ_Y            16
#define XHLS_OBJECT_GREEN_CLASSIFICATION_CTRL_DEPTH_OBJ_Y            32

