############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project New_BackGrRemoval
set_top BackGrRemoval
add_files ../BackGroundRemoval/BackGrRemoval.cpp
add_files ../BackGroundRemoval/BackGrRemoval.h
add_files ../BackGroundRemoval/RGB2HSV.cpp
add_files ../BackGroundRemoval/RGB2HSV.h
add_files ../BackGroundRemoval/parameters.h
add_files -tb ../BackGroundRemoval/BackGrRemoval_tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7a12ti-csg325-1L}
create_clock -period 10 -name default
set_clock_uncertainty 0.5
#source "./New_BackGrRemoval/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
