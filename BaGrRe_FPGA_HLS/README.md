# Guide to Design
This folder contains all files to recreate project BackGroundRemoval by using HLS to create version HDL of my code in C and in Python.
First quick develop in Python, then C++, the last thing to change to C HLS.

### Note before run script: 
- My project board is Zedboard, if you doesn't have zedboard, the VGA output may not match your design, but with processing IPs, no problem. 
- And also, if you don't have zedboard available in Vivado, follow [part 3 - Digilent install](https://digilent.com/reference/programmable-logic/guides/installing-vivado-and-sdk?srsltid=AfmBOoovrlNmbfgNlyBHrY-GiS8gz6CkLgI66sHYOdT9RiTvjQaUCotk) . Because it leads to stop tcl file if it doesn't find out the board.
- If you are new in Vivado and Vitis design,It is mandatory to read ["The_Zynq_Book_Tutorials"](https://www.secs.oakland.edu/~llamocca/Tutorials/EmbSys/The_Zynq_Book_Tutorials_Aug_15_2015.pdf), this book will help you start, the link could be obsolete so I included it in the folder, first part would be enough because I already have full block design, Ips under Vivado and plus we also have drivers C++ for vitis.
- What you need to do only are running script, export hardware (with Bitstream), attach it to Vitis, then copy code to driver and run to see it in VGA screen.
- data.h file is pixel data who is extracted from 13_320x240 image. So instead of getting images from computer and we need some functions to extract it from BMP format, last thing is to store it in DDR and use it. Now to reduce testing time, we just store it directly in an array at data.h
- Check all the cable used for VGA and JTAG, UART.

To re-create VIVADO project :

```
#in Vivado application, choose write TCL, go to this folder and run :
source sysGen.tcl
```

### Schema design
<img width="1032" height="597" alt="Screenshot from 2025-10-31 13-50-53" src="https://github.com/user-attachments/assets/0263bae8-76e9-4bed-b1e7-e804a848fc8b" />

### Schema under VIVADO
<img width="1828" height="418" alt="Screenshot from 2025-10-31 13-53-14" src="https://github.com/user-attachments/assets/f4b5d86d-4a70-4eac-a582-fc3846d294c2" />

### Explaincation IPs
Out of some auto-connect IPs from Xilinx Vivado, we have some IP designed by me. IP DMA from Xilinx only have some options output data as 8-bits,16,32,power of 2, but our IP processes with RGB color, normally 24-bits data. So we must create one IP between DMA and Processing component to concatnate 24-bits.

And due to old reason that we developped VGA component with input 8 bits, so we need one slice component between processing system and VGA_stream.

## Further developpement
This project can continue just by develop more IPs under AXI stream protocol. Or you can just swap my IP BackGrRemovalStream with your IP.
