############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project BaGr_Removal_AXIs_ver3
set_top BackGrRemovalStream
add_files BackGrRemoval.cpp
add_files BackGrRemoval.h
add_files RGB2HSV.cpp
add_files RGB2HSV.h
add_files parameters.h
add_files -tb 10_320x240.bmp
add_files -tb 13_320x240.bmp -cflags "-Wno-unknown-pragmas"
add_files -tb tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_cosim -tool xsim
config_export -format ip_catalog -output /home/dell3561-49/Vitis_HLS_folder/BackGrRemoval_AXIS_ver3/BaGr_Removal_AXIs_ver3 -rtl verilog
source "./BaGr_Removal_AXIs_ver3/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/dell3561-49/Vitis_HLS_folder/BackGrRemoval_AXIS_ver3/BaGr_Removal_AXIs_ver3
