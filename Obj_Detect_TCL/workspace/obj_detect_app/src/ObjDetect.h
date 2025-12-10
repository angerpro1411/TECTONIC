#ifndef _OBJDETECT_H
#define _OBJDETECT_H

#include "xhls_object_green_classification_hw.h"
#include "xhls_object_green_classification.h"

#define MAX_OBJECTS 32

typedef struct {
	int16_t x;
	int16_t y;
	uint8_t is_green;
} ObjDetect;

u8 ReadObj(ObjDetect *list, u8 max_obj,XHls_object_green_classification *InstancePtr);

#endif
