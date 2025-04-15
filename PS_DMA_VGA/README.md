# PS - DMA - VGA(Xilinx - Zedboard)
- The objective of this project is stocking images in DDR(no more worry about the memory's capacity) \
then using DMA to get pixel data from DDR, display into screen via VGA. Display all images in VGA can \
help us avoid waste time that we need to change header file of png,bmp,.. each time we want to see result\
image after processing. Second objective of project that we want to be independant as much as possible to manufacture's IP, not the first time we see when the manufacturer updated their versions, then their IPs don't work as normal anymore. That's hurt when your big project works for example under version 2019 and version 2024, it crashes :)) So we trust our IPs, free IP, free develop, version could be changed but the code(behavior code, RTL code) never change. It works independantly to version.
- The project could be for further development thanks to work with DMA and the protocol Axi-Stream.

## VGA
> First IP we choose to develop is VGA. Not too much complicated IP.
### Image
![Screenshot from 2024-05-31 10-19-39](https://github.com/angerpro1411/TECTONIC/assets/166725219/a4b34e1a-372e-4b6e-bb5b-f7a15b33fbff)

- VGA includes 2 main component: Frame counter and VGA Sync
### Frame counter
- Frame counter works under 25 MHz clock frequency, it helps us know where the CRT beam is on the screen thanks to vertical counter and horizontal counter that we created

### VGA Sync or Decoding circuit
- Base on the position of CRT beam, we will know where to stream on our pixel data. Because not all CRT position, we need to be on stream. VGA screen also has front porch, back porch, retrace time, that won't be displayed in our screen.

### Top design VGA
- A top design component uses to integrate frame counter and VGA Sync into one VGA component, also create an D-FF for input data, make sure it synchronized.

### VGA port Zed board
- Instead of having 24-bit input port for VGA color(one byte for each), Zedboard has only 12-bit input port so it means 4-bit for each. So with 24-bit input port, we need to have a small decoding component to extract only 4 MSB bit of each color.

### Simulation
- VGA doesn't have a complicated combinational logic, so I did not create its own test bench but directly connect to the board and use Switch to control the input color data. 

### Test on zedboard
- I did forget to capture screen but it worked well. So we finish IP VGA.

## PS - Block RAM - VGA (Using AXI lite slave)
> Our next step is trying to display an image who is stored in Block Ram via VGA. \
> Why? Block ram, why AXI lite slave? Because I already developed all these IPs and tested them. So I don't need spend more time on these IPs that I already tested.\
> So, the data path is via gtkterm(one vitual machine interface for using Uart purpose), we send a whole image(320x240) into DDR(Zedboard). One image file contains 2 main parts, header data and pixel data, what we are only interessted in pixel data. We extract pixel data by code C(in Vitis or SDK) and use AXI-lite slave to store into Block Ram. VGA connect with one Block ram's read channel. Each time, VGA needs data to display on screen, it will launch a read command and the address. And finally, we can see the image on screen.All files are inside AXIlite_BRAM_VGA folder.

### Axi-lite slave component
- Axi lite slave component works as an interface between PS and PL through the registers(depend on your design you can create the number of register as you want). So if we want to write and read to block ram, we need to manipulate axi_lite_slave ips. Actually,we use the data receive in register to control write - read command to block ram.

### Block ram
- For sure, we need something to store data, write and read it with the address. And inside FPGA, we have block ram. For optimization, our block ram has dual-port, write port connects to PS, PS(Arm) has full right to write block ram and read port will switch between VGA and PS. Before actually let VGA read data inside block ram, I just want to make sure that these data I write to block ram are correct, so I want to read it and compare it with actual pixel value that I can see through Ghex(a software that helps us read file under hex format). When correct datas are stored inside block ram, it means I have no problem with axi_lite_slave, code C to write data into register and data inside block ram now are all correct. Right now, the problem is only timing to display pixel data via VGA on screen.

### Pixel data controller
- Due to limited capacity of block ram, we can not store a whole VGA image inside a block ram, it is too big for Zynq. So the image that we use is only 1/4 VGA scale, means 320x240.
