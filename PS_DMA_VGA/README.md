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
- Due to limited capacity of block ram, we can not store a whole VGA image inside a block ram, it is too big for Zynq. So the image that we use is only 1/4 VGA scale, means 320x240. I was adding one more IP called Pixel data controller - actually Position image controller. This IP has a mission that controls the position of our image, because our image scales 1/4 VGA now, not full screen. It basically bases on Horizontal counter and Vertical counter (25MHz) and we will know where the CRT beam is.

### Simulation  
- We integrate Pixel controller into VGA, so we have a new VGA where we can control the image position, now we need to test whether they work well or not. It works well when VGA only launches a READ COMMAND to block ram inside the specific HC and VC. Not too complicated but before implement on Zedboard, I want to be sure that all components work correctly. Simulation folder could be fought in AXI_SLAVE_LITE/AxiLite_BRAM_VGA/AXILITE_BRAM_VGA/Simulation Sources.

### Develop software C on Vitis
- Software-hardware co-design, after finish design hardware part, we need to manipulate CPU(core Arm) to control our IP. First thing, config Uart to wait the image's transaction from PC to DDR. After received whole image file, only send pixel data to block ram. Then change the access control to VGA, so VGA is able to read block ram.

### Test on Zedboard
- When all IPs work correctly under simulation, so it means nothing wrong with your logic design(in case of you can distinguish between RTL code and non-synthesizable code), write the physic connection inside .xdc file and see the result

## PS - DMA - IPs
> This is my first time working with Xilinx's DMA IP, which is available as a configurable block within the Block Design environment in Vivado. To use it in our application, we need to adjust its configuration parameters to ensure compatibility with our custom IP.\
Since the DMA is a pre-built Xilinx IP core, there's no need to develop it in VHDL or Verilog—no additional hardware development is required. Instead, we need to understand how to interact with it through the software APIs (Application Programming Interfaces) provided by Xilinx.\
To gain a deeper understanding of how the Xilinx DMA functions, I created two separate test projects. These experiments helped me explore its configuration and usage in different data transfer scenarios.

### AXI STREAM
![image](https://github.com/user-attachments/assets/81247f64-801e-4dc7-a519-74162438dc16)

- Before working with the applications, it is important to understand the AXI4-Stream protocol, which is utilized by the Xilinx DMA engine for interfacing with other IP cores. Official documentation is available online, but a brief overview is provided here.\
The AXI4-Stream interface defines a unidirectional data channel with separate master and slave roles. At a minimum, it requires three signals: TVALID, TREADY, and TDATA. The master asserts TVALID to indicate that valid data is available on TDATA, while the slave asserts TREADY to signal its ability to accept data.\
A successful data transfer occurs only when both TVALID and TREADY are high during the same rising edge of the clock. Once TVALID is asserted by the master, both TVALID and TDATA must remain stable until TREADY is asserted by the slave. The master must not change TDATA or de-assert TVALID until a handshake (i.e., TVALID && TREADY) has occurred. This ensures reliable, lossless data transfer.

### 1.DMA - Inverter
- The objective of this application is still learning about DMA, but what does this application do? Old move but we do it again, send image via gtkterm(virtual terminal) by Uart then the IP inverter will change value of each pixel by (255-value) then send back to the ddr, this application applies for gray image.
- Three essential IPs are Inverter, DMA and Zynq processing system. 
![Screenshot from 2025-04-16 17-55-37](https://github.com/user-attachments/assets/1a98a747-9547-4bf3-aa2c-7941ed78dd21)

- We need config Zynq by adding one HP(High Performance) Slave Interface, so PS can control DMA via HP port. 
#### IP - Inverter
- IP Inverter includes 2 side channels, master and slave stream. Slave channel will receive data from DMA, process it, put data in master channel, then send back to DMA. As I described, it will invert all pixel value.

#### Develop software C on Vitis  
