- We can see the lenna normal at format 320x240
- ![image](https://github.com/angerpro1411/TECTONIC/assets/166725219/db5d7b6c-2616-4bfd-ba49-58690839dcef)
- And after compress by reduce 4 LSB of each color, from 24b/1pixel to 12b/1pixel
- ![image](https://github.com/angerpro1411/TECTONIC/assets/166725219/42b52f18-2025-45db-a43b-48bd51b43dec)
- The difference can not visually see, a bit but not much. So we accept this compression to reduce to space comsumption for FPGA.
- Coding to compress data inside array imageData.
```
	//for compression, we only keep 4 bits MSB and this part will check the image after compression.
	for (i=headerSize; i<fileSize;i++){
		imageData[i] = imageData[i] & 0xF0;
	}
```
- For transfering back from Zynq to computer we can use the function UartPs_Send :
```
	u32 SendBytes = 0;
	while(SendBytes < fileSize){
		SendBytes += XUartPs_Send(&myUart_PS,&imageData[SendBytes], 1);
```
- But also with GTKterm, inside Log tab at toolbar, we have option "Log". Choose Log -> to file. Create a log file name: "compression_lenna.bmp".
- When we send the data back to the computer by using the function "Send" above. Data is send that will store all inside compression_lenne.bmp.
- But sometimes, the loss happens because of UART-USB transaction, you need to modify a little bit by writing till the size of "original lenna" equal to "compression_lenna" or check if you can open it, it means no problem in transaction. 
