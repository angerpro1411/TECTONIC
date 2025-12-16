############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project Obj_detect_ver4
set_top hls_object_green_classification
add_files obj_detect.cpp
add_files -tb _output.bmp
add_files -tb output_.bmp
add_files -tb tb.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output /home/dell3561-49/Vivado_Project_2023.1/ip_repo/Object_detect -rtl verilog
#source "./Obj_detect_ver4/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/dell3561-49/Vivado_Project_2023.1/ip_repo/Object_detect
