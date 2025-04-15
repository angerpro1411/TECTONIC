# PS - DMA - VGA(Xilinx - Zedboard)
- The objective of this project is stocking images in DDR(no more worry about the memory's capacity) \
then using DMA to get pixel data from DDR, display into screen via VGA. Display all images in VGA can \
help us avoid waste time that we need to change header file of png,bmp,.. each time we want to see result\
image after processing.
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
