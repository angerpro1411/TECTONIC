############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project AxiS_BackGrRemoval
set_top BackGrRemoval_stream_v2
add_files BackGrRemoval_stream_v2.cpp
add_files parameters.h
add_files -tb 13_320x240.bmp -cflags "-Wno-unknown-pragmas"
add_files -tb tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
source "./AxiS_BackGrRemoval/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
