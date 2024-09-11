# ****Subject: Hardware - Software Co-design using Zedboard to process color image to edge image(Sobel Algorithm).
## 1.Block Design Vivado.
- We can all regenerate block design, hdl source code, the components by running script SOBEL_END.tcl
- Working in source_tcl_vivado directory then
```
#No GUI, TCL mode
vivado -mode tcl -source SOBEL_END.tcl

#GUI mode
vivado -source SOBEL_END.tcl
```
![image](https://github.com/user-attachments/assets/f7504481-b706-49df-bffc-e4d943a47c01)

## 2.Three control levels by Arm processor(inside Zynq)
 > - Don't forget to increase the capacity of Heap Size in Generate a linker script to 512KB. If not, we have enough memory to store dynamic array(for an image).
 > - Almost errors when you transfer data between Pc and Zedboard through UART, that comes from xil_printf, print, or any c command code line who uses UART between Send and Receive Uart. I have done and seen my totally printf line inside the "image file". Because xil_printf, get_char, scanf of Xilinx functions are based on Uart protocol. I commented all xil_printf and no error happened.


- Inside source_tcl_vivado/sourceC, there is a .c, which we can use in Vitis. In general, code C is used to control components inside FPGA:
### 2.1.Compression 24-bit image to 12-bit image.
- We can see the lenna normal at format 320x240
- ![image](https://github.com/angerpro1411/TECTONIC/assets/166725219/db5d7b6c-2616-4bfd-ba49-58690839dcef)
- And after compress by reduce 4 LSB of each color, from 24b/1pixel to 12b/1pixel
- ![image](https://github.com/angerpro1411/TECTONIC/assets/166725219/42b52f18-2025-45db-a43b-48bd51b43dec)
- The difference can not visually see, a bit but not much. So we accept this compression to reduce space consumption for FPGA.
- Coding to compress data inside array imageData.
```
//for compression, we only keep 4 bits MSB and this part will check the image after compression.
for (i=headerSize; i<fileSize;i++){
imageData[i] = imageData[i] & 0xF0;
}
```
- For transferring back from Zynq to computer we can use the function UartPs_Send :
```
u32 SendBytes = 0;
while(SendBytes < fileSize){
SendBytes += XUartPs_Send(&myUart_PS,&imageData[SendBytes], 1);
```
- But also with GTKterm, inside the Log tab at the toolbar, we have option "Log". Choose Log -> to file. Create a log file name: "compression_lenna.bmp".
- When we send the data back to the computer by using the function "Send" above. Data is sent that will store all inside compression_lenne.bmp.
- But sometimes, the loss happens because of UART-USB transaction, you need to modify a little bit by writing till the size of "original lenna" equal to "compression_lenna" or check if you can open it, it means no problem in transaction.
> At the end, we can visually see not too much difference, so in order to reduce the store capacity, we truly send 24-bit images from the computer but only 12-bit pixels are stored in Bram .

### 2.2.Control flow.
- In general, Data flow: Computer -> Processor -> Color Bram(FPGA) -> processing -> Gray Bram(FPGA) -> processing -> Sobel Bram(FPGA) -> Processor -> Computer.
- So the main duty of the processor is to communicate with computers (through Uart) and control data flow inside the FPGA.

## XSCT Xilinx Software Command-Line Tool - For downloading bitstream file to FPGA and elf file to Processor.
> - Before using XSCT, you need install XSCT command of Xilinx in your computer. Normally, it accompanies to Vitis software when you installed Xilinx software. But if not, you must do that or must install Petalinux in your OS.
- Connect Zedboard to computer(included 2 cables, uart and jtag).
- Turn on GTKterm or TeraTerm, configuration port ACM0(Zedboard), baud rate 115200, parity 0, bits 8, stop bit 1, and none flow control.
![image](https://github.com/user-attachments/assets/7fce5315-9b64-40ef-af79-7a854c27e3b7)

- After that, go to xsct working enviroment by(another terminal)
```
# go to xsct command terminal.
xsct
# read script.
source xsct_scrip.tcl
```
- It will automatically download .bitstream to FPGA, and .elf to processor.
  ![image](https://github.com/user-attachments/assets/47292063-6600-4d58-9577-ba843c3c51f3)
- After finished, go back to GTKterm terminal, Log -> to file, then create a file test.bmp, then File -> Send a raw file.(You can choose whatever 320x240 24-bit RGB BMP image)
- Wait it done, because we use UART to communicate to the computer so no single xil_printf is used, it will be written in our test.bmp file.
- After finised this step, we can see sobel image at test.bmp. If we want to send another image, Log -> Clear, then go back to File -> Send a raw file.
