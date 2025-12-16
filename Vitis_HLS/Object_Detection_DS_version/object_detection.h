#ifndef OBJECT_DETECTION_H
#define OBJECT_DETECTION_H

#include "parameters.h"
#include <hls_math.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <string.h>

void adjustBrightness(unsigned char input[240][320][3],
                     unsigned char output[240][320][3],
                     float factor);

void convertToGray(unsigned char input[240][320][3],
                  unsigned char output[240][320]);

void objectDetection(unsigned char input_image[240][320][3],
                    DetectionResult results[50],
                    int &num_objects);

void simpleThreshold(unsigned char input[240][320],
                    unsigned char output[240][320],
                    unsigned char threshold);

void morphologicalClose(unsigned char input[240][320],
                       unsigned char output[240][320]);

void findContours(unsigned char binary[240][320],
                 Contour contours[100],
                 int &num_contours);

void traceContour(unsigned char binary[240][320],
                 bool visited[240][320],
                 int start_x, int start_y,
                 Contour &contour);

void objectLabeler(char shape[20], char color[20], char object_type[20]);

#endif
