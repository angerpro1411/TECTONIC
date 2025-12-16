############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project MeanShiftFilter
set_top MeanShiftFiltering
add_files MeanShiftFilter.cpp
add_files MeanShiftFilter.h
add_files -tb MeanShifFilter_tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_cosim -tool xsim
config_export -format ip_catalog -rtl vhdl -vivado_clock 10
set_clock_uncertainty 0.5
source "./MeanShiftFilter/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -flow syn -rtl vhdl -format ip_catalog
