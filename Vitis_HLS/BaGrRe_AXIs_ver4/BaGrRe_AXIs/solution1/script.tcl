############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project BaGrRe_AXIs
set_top BackGrRemovalStream
add_files BackGrRemoval.cpp
add_files BackGrRemoval.h
add_files RGB2HSV.cpp
add_files RGB2HSV.h
add_files parameters.h
add_files -tb 13_320x240.bmp -cflags "-Wno-unknown-pragmas"
add_files -tb tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output /home/dell3561-49/Vivado_Project_2023.1/ip_repo/BackGrRe_NoCtrl -rtl verilog
source "./BaGrRe_AXIs/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/dell3561-49/Vivado_Project_2023.1/ip_repo/BackGrRe_NoCtrl
