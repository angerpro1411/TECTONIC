############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project Object_Detection
set_top objectDetection
add_files main.cpp
add_files object_detection.h
add_files parameters.h
add_files -tb main_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7a12ti-csg325-1L}
create_clock -period 10 -name default
#source "./Object_Detection/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
