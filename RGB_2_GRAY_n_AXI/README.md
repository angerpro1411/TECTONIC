- Don't forget to inscrease the capacity of Heap Size in Generate a linker script to 512KB. If not, we have enough memory to store dynamic array(for an image).
- Almost errors when you transfer data between Pc and Zedboard through UART, that comes from xil_printf, print, or any c command code line who uses UART between Send and Receive Uart. I have did and seen, my totally printf line inside "image file". Because xil_printf, get_char, scanf of Xilinx functions base on Uart protocol. I did commented all xil_printf and no error happends.