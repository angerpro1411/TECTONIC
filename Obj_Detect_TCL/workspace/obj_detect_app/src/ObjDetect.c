#include "ObjDetect.h"


//Following the _hw.h: Data
static u8 read_is_green(int i,XHls_object_green_classification *InstancePtr){

	//This data will store the result
	u32 word = 0;

	//Each 32 bits(1 word), contain only 4 entries, so if i = 0,1,2,3
	//obj[i] will stay in word 0, and i = 4,5,6,7 -> word 1
	u32 word_idx = i / 4;

	//Data is the first bit of each byte in words. For example, in word 0,
	//we have 4 bytes, so datas would be at bit 0,8,16,24(write in details at _hw.h)
	u32 bit_pos = (i % 4) * 8;

	//Function call
	//Word_idx will help us to push the correct word into &word,
	//For example, word_idx = 0, so push first 32 bits to word, word_idx = 1, second 32 bits
	XHls_object_green_classification_Read_obj_is_green_Words(InstancePtr, word_idx, &word, 1);

	return ((word >> bit_pos) & 0x01);
}


static int16_t read_x(int i,XHls_object_green_classification *InstancePtr){

	u32 word = 0;

	u32 word_idx = i/2;

	u32 which_16_offset = (i % 2) * 16;

	XHls_object_green_classification_Read_obj_x_Words(InstancePtr,word_idx,&word,1);

	return (int16_t)((word >> which_16_offset) & 0xFFFF);

}

static int16_t read_y(int i,XHls_object_green_classification *InstancePtr){

	u32 word = 0;

	u32 word_idx = i/2;

	u32 which_16_offset = (i % 2) * 16;

	XHls_object_green_classification_Read_obj_y_Words(InstancePtr,word_idx,&word,1);

	return (int16_t)((word >> which_16_offset) & 0xFFFF);

}


u8 ReadObj(ObjDetect *list, u8 max_obj,XHls_object_green_classification *InstancePtr){
	u32 count = XHls_object_green_classification_Get_object_count(InstancePtr);
	if (count > max_obj) count = max_obj;

	for(u8 i=0;i<count;i++){
		list[i].x = read_x(i,InstancePtr);
		list[i].y = read_y(i,InstancePtr);
		list[i].is_green = read_is_green(i,InstancePtr);
	}
	return count;
}




