This folder contains all files to recreate project BackGroundRemoval by using HLS to create version HDL of my code in C and in Python.
First quick develop in Python, then C++, the last thing to change to C HLS.

data.h file is data who is extracted from 13_320x240 image. 
To recreate vivado project :
-> Go to vivado application, choose write TCL, go to this folder and run :
source sysGen.tcl

If you are new in Vivado and Vitis design, "The_Zynq_Book_Tutorials" will help you start, first part would be enough because I already have full block design, Ips under Vivado and plus we also have drivers C++ for vitis. What you need to do only are running script, export hardware(with Bitstream)