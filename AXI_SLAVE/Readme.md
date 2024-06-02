1. The raw one is AXI_LITE_SLAVE_OFFICIAL.vhd without modify. Fell free to use it.
- The last one who works to test and synthesizable is AXI_LITE_SLAVE_VHD_OLDVERSION. This one is modified from my_AXI_SLAVE. 
- The problem of my_AXI_SLAVE is that works with VHDL2008 and VIVADO of Xilinx doesn't support synthezise VHDL2008, so it is impossible to create IP and testing after RTL code.
- Target is Zedboard-Zynq7000
- Refer 2 videos in Youtube to know how to create Block Design with Axi lite slave and how to manage it Vitis:
- https://www.youtube.com/watch?v=XtvVfjIm9Xw
- https://www.youtube.com/watch?v=cQ8-_SeYGUQ
