// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
# 1 "/home/dell3561-49/C_PROGRAM/5.Ping_pong_HLS/ping_pong.c"
# 1 "/home/dell3561-49/C_PROGRAM/5.Ping_pong_HLS/ping_pong.c" 1
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 150 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/home/dell3561-49/C_PROGRAM/5.Ping_pong_HLS/ping_pong.c" 2
# 1 "/home/dell3561-49/C_PROGRAM/5.Ping_pong_HLS/ping_pong.h" 1








typedef unsigned char data_t;


void getRemainder(data_t *in, data_t *out1, data_t *out2);
void add1(data_t *in, data_t *out);
void mul2add1(data_t *in, data_t *out);
void division(data_t *in1, data_t *in2, data_t *out);
void algo(data_t vecIn[100], data_t vecOut[100]);
# 2 "/home/dell3561-49/C_PROGRAM/5.Ping_pong_HLS/ping_pong.c" 2

void algo(data_t vecIn[100], data_t vecOut[100]){
#pragma HLS ARRAY_PARTITION variable=vecIn cyclic factor=2 dim=1
#pragma HLS ARRAY_PARTITION variable=vecOut cyclic factor=2 dim=1




 data_t a[100],b[100];
    data_t c[100],d[100];

    getRemainder(vecIn,a,b);


    add1(a,c);
    mul2add1(b,d);

    division(d,c,vecOut);
}
#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_algo_ir(unsigned char *, unsigned char *);
#ifdef __cplusplus
extern "C"
#endif
void algo_hw_stub(unsigned char *vecIn, unsigned char *vecOut){
algo(vecIn, vecOut);
return ;
}
#ifdef __cplusplus
extern "C"
#endif
void refine_signal_handler();
#ifdef __cplusplus
extern "C"
#endif
void apatb_algo_sw(unsigned char *vecIn, unsigned char *vecOut){
refine_signal_handler();
apatb_algo_ir(vecIn, vecOut);
return ;
}
#endif
# 20 "/home/dell3561-49/C_PROGRAM/5.Ping_pong_HLS/ping_pong.c"


void getRemainder(data_t *in, data_t *out1, data_t *out2){
 REMAINDER_LOOP:
    for(int i=0;i<100;i++){


    *(out1 + i) = *(in + i) % 4;
    *(out2 + i) = *(in + i) % 9;
    }
}


void add1(data_t *in, data_t *out){
 ADD_LOOP:
    for(int i=0;i<100;i++){


    *(out + i) = *(in + i) + 1;
    }
}


void mul2add1(data_t *in, data_t *out){
    data_t temp[100];
    MUL2ADD1_LOOP:
    for(int i=0;i<100;i++){


    temp[i] = *(in + i)*2;
    *(out + i) = temp[i] + 1;
    }
}

void division(data_t *in1, data_t *in2, data_t *out){
    DIVISION_LOOP:
 for(int i=0;i<100;i++){


    *(out + i) = *(in1 + i) / *(in2 + i);
    }
}
