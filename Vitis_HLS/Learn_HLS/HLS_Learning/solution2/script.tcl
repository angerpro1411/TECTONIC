############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project HLS_Learning
set_top find
add_files main.cpp
add_files -tb tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution2" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
source "./HLS_Learning/solution2/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
