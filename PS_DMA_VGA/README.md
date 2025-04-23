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

### 0.AXI STREAM
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
- Now how can you know that your IP works correctly ? In my case, I created an array to send some elements, another array to store back the return elements. I print my result when the program finishes and check whether the values are correct invert values or not. Just simple. One more thing we need to config DMA Xilinx, that the sending direction and the receiving need to active at the same time, unless the data will be stuck in DMA's FIFO. And when do you know that transfers finish? DMA has their own status register, so we can check DMA's status. If it stops, it means no tranfer is working at that time, so we can read safe-correct data.
- Play a big shot, we invert more data, this time, we try to invert an image, lenna gray and check our image result, see our IP works well or not. Here is my result. 
![Screenshot from 2025-04-22 11-30-30](https://github.com/user-attachments/assets/b232baf7-3f36-4a60-9666-ee60e307f88b)
Yeah, our IP works well, our AXI-STREAM protocol HDL that we wrote works well with simple IPs. Time to move on more complicated IP.

### 2.DMA - VGA
- Now we want to see our images who are stored in DMA that display via VGA, so we can check the result rightaway, no need for changing header image file(too tedious with repetitive code). If you really want to see how I can change header file from color to gray(under BMP format), you can check in the RGB_GRAY_SOBEL_nAXI folder, c file, NEW_HEAD_GRAY_IMAGE function. But it is boring honestly.

#### New VGA IP
- Hey it isn't totally new, actually now older VGA will combine to other IPs so that it will appropriate for different type of images. 
- Not like when we want to get data from block ram, data from block ram is easy to get, when you have their address correspond to each pixel. With DMA, data sends in stream, so atleast you want something to control your stream, so adding FIFO is important. => **Adding FIFO, our FIFO that we create so we can control it as we want, change the parameter, not Xilinx FIFO.**
- Imagine that if we want to display a color image, we config DMA send one byte each? Why?
> The default Xilinx DMA interface typically operates with 32-bit word transfers. However, in color image data, each pixel is commonly represented using 24 bits(3 consecutive bytes) - 8 bits each for Red-Green-Blue). Transfering 32 bits per time cause misaligne, resulting in undesired patterns as (Red-Green-Blue-Red) where the last byte belongs to the next pixel. This not only make data harder to control, but also creates confusion in the future when trying to understand or debug system, even if we are the ones who originally wrote it. It causes waste time and unnecessary problem. Keep everything simple is our choice. \
While 24-bit transfers would preserve pixel structure, they are inefficient in most architecture since 24 isn't power of 2. It requires extra logic to handle, multiple cycles to process, so just avoid it.

- Now, we know that DMA will send byte in order and it will be RED-GREEN-BLUE and repeat RED-GREEN-BLUE. While VGA Zedboard using 12 bits data for each pixel - 4 bits each for R-G-B, we need create an IP who has input data 8-bit(receive from DMA), slice 4 bits MSB, do it 3 times, to have 4-bit RED, 4-bit GREEN and 4-bit BLUE. Gather them into 12 bits data and put it in FIFO./
=> **Adding one IP called PIXEL_CONTROLLER**.

- One more IP that I want to add, it called Posistion_Controller. It helps us control image position on VGA screen.
=> **Adding one IP called POSITION_CONTROLLER**.

-Finally we have total 4 component in new VGA(VGA included).
![Screenshot from 2025-04-22 16-27-55](https://github.com/user-attachments/assets/52e338f3-3fc7-4481-a1f4-6130798f2fc8)


#### Simulation
- We will not declare the simulation at IP level because each IP is around 100-150 code line with not too compicated logic.
##### 1.First check: Pixel_controller -> FIFO
- Create a test bench and hope to see when we send a stream data, every 3 consecutive bytes will create one pixel data and on the 4th cycle, Pixel_controller will launch a write fifo command, and write the correct data into FIFO. Check it several times, compare data in FIFO with 3 consecutive precedent bytes. If everything is fine, means nothing problem in syntax, connections or simple logic.

##### 2.Second check: Position controller -> VGA
- Create a test bench and hope to see the data only appears under desired Horizontal counter and Vertical counter. Unless, we fail.

#### 3.Third check: Pixel_controller -> FIFO -> Position controller -> VGA
- Create a test bench and hope the data flow is correct. That includes the conditions as first check and second check. If it works well, means nothing wrong with connections, syntax and data flow.

#### 4.Fourth check: AXI STREAM
- It is very important to check whether AXI STREAM works well or not. Two conditions need to be checked that, data only is accepted only when TVALID and TREADY asserted same time, second condition that if FIFO full, mean the TREADY isn't high, TVALID must keep high and TDATA can not change till the handshake takes place.
- Check at 2 level, simulation and debug ILA(Intergrated Logic Analyzer) - real time check.

#### Block Design under VIVADO
- All these IPs combine to new Integrated_VGA, connects with Xilinx IP under Vivado block design.
![image](https://github.com/user-attachments/assets/1087f2ab-df9a-4d30-b99c-20fe684e81fa)

- There are 3 main components that we need to focus: Processing system(Zynq), DMA and our IP. Our IP is done with all checks before. Now is the time to config Xilinx's IP
