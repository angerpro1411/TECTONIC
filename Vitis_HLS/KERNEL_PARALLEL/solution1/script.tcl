############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
## Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
############################################################
open_project KERNEL_PARALLEL
add_files KERNEL_PARALLEL/frame_differencer.cpp
add_files KERNEL_PARALLEL/image_producer.cpp
add_files KERNEL_PARALLEL/motion_analyzer.cpp
add_files KERNEL_PARALLEL/motion_detection.cpp
add_files KERNEL_PARALLEL/top_level.h
add_files -tb KERNEL_PARALLEL/testbench.cpp
open_solution "solution1" -flow_target vivado
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
#source "./KERNEL_PARALLEL/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
