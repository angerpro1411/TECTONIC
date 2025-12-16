############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project MeanShiftFilter
set_top MeanShiftFiltering
add_files ../MeanShiftFilter/MeanShiftFilter.cpp
add_files ../MeanShiftFilter/MeanShiftFilter.h
add_files -tb ../MeanShiftFilter/MeanShifFilter_tb.cpp -cflags "-Wno-unknown-pragmas"
add_files -tb pepper.bmp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
set_clock_uncertainty 0.5
source "./MeanShiftFilter/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
