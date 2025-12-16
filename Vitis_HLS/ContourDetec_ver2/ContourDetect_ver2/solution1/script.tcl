############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project ContourDetect_ver2
set_top sobel_rgb_green_outline_fixed
add_files contourDetect.cpp
add_files -tb output.bmp -cflags "-Wno-unknown-pragmas"
add_files -tb tb.cpp -cflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
config_export -format ip_catalog -output /home/dell3561-49/Vivado_Project_2023.1/ip_repo/ContourDetection -rtl verilog
source "./ContourDetect_ver2/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -rtl verilog -format ip_catalog -output /home/dell3561-49/Vivado_Project_2023.1/ip_repo/ContourDetection
