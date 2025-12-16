############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project ping_pong
set_top algo
add_files ../../C_PROGRAM/5.Ping_pong_HLS/ping_pong.c
add_files ../../C_PROGRAM/5.Ping_pong_HLS/ping_pong.h
add_files -tb ../../C_PROGRAM/5.Ping_pong_HLS/tb.c -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_cosim -tool xsim -trace_level all -wave_debug
source "./ping_pong/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -wave_debug -trace_level all
export_design -format ip_catalog
