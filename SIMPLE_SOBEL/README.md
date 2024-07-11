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
