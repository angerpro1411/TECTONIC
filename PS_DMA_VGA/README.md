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

- VGA includes 2 main component: Frame counter and Pixel data controlleraa
### Frame counter
- Frame counter works under 25 MHz clock frequency, it helps us know where the CRT beam is on the screen thanks to vertical counter and horizontal counter that we created, 
