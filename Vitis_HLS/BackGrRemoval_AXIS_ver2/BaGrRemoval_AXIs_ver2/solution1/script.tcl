############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project BaGrRemoval_AXIs_ver2
set_top BackGrRemovalStream
add_files BackGrRemoval.cpp
add_files BackGrRemoval.h
add_files RGB2HSV.cpp
add_files RGB2HSV.h
add_files parameters.h
add_files -tb 13_320x240.bmp
add_files -tb BackGrRemoval_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7a12ticsg325-1L}
create_clock -period 10 -name default
#source "./BaGrRemoval_AXIs_ver2/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
