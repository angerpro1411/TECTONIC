############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project contour_approximation
set_top ContourApproximation
add_files ../../C_PROGRAM/3.ContourApproximation/contour_approximation.c
add_files ../../C_PROGRAM/3.ContourApproximation/contour_approximation.h
add_files -tb ../../C_PROGRAM/3.ContourApproximation/tb_contour.c -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_cosim -rtl vhdl -tool xsim
set_clock_uncertainty 0
source "./contour_approximation/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -rtl vhdl -tool xsim
export_design -format ip_catalog
