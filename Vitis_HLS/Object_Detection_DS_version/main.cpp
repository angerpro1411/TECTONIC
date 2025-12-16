#include <hls_math.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <string.h>
#include "parameters.h"
#include "object_detection.h"



// Image processing functions
void adjustBrightness(unsigned char input[240][320][3],
                     unsigned char output[240][320][3],
                     float factor) {
    #pragma HLS PIPELINE
    for (int y = 0; y < 240; y++) {
        for (int x = 0; x < 320; x++) {
            #pragma HLS PIPELINE
            for (int c = 0; c < 3; c++) {
                float pixel = input[y][x][c] * factor;
                if (pixel > 255) pixel = 255;
                output[y][x][c] = (unsigned char)pixel;
            }
        }
    }
}

void convertToGray(unsigned char input[240][320][3],
                  unsigned char output[240][320]) {
    #pragma HLS PIPELINE
    for (int y = 0; y < 240; y++) {
        for (int x = 0; x < 320; x++) {
			#pragma HLS PIPELINE
            output[y][x] = (unsigned char)(
                input[y][x][0] * 0.299 + 
                input[y][x][1] * 0.587 + 
                input[y][x][2] * 0.114
            );
        }
    }
}

void simpleThreshold(unsigned char input[240][320],
                    unsigned char output[240][320],
                    unsigned char threshold) {
    #pragma HLS PIPELINE
    for (int y = 0; y < 240; y++) {
        for (int x = 0; x < 320; x++) {
			#pragma HLS PIPELINE
            output[y][x] = (input[y][x] > threshold) ? 255 : 0;
        }
    }
}

void morphologicalClose(unsigned char input[240][320],
                       unsigned char output[240][320]) {
    #pragma HLS PIPELINE
    
    // Simple 3x3 dilation followed by erosion
    unsigned char temp[240][320];
    
    // Dilation
    for (int y = 1; y < 479; y++) {
        for (int x = 1; x < 639; x++) {
			#pragma HLS PIPELINE
            unsigned char max_val = 0;
            for (int ky = -1; ky <= 1; ky++) {
                for (int kx = -1; kx <= 1; kx++) {
                    if (input[y+ky][x+kx] > max_val) {
                        max_val = input[y+ky][x+kx];
                    }
                }
            }
            temp[y][x] = max_val;
        }
    }
    
    // Erosion
    for (int y = 1; y < 479; y++) {
        for (int x = 1; x < 639; x++) {
			#pragma HLS PIPELINE
            unsigned char min_val = 255;
            for (int ky = -1; ky <= 1; ky++) {
                for (int kx = -1; kx <= 1; kx++) {
                    if (temp[y+ky][x+kx] < min_val) {
                        min_val = temp[y+ky][x+kx];
                    }
                }
            }
            output[y][x] = min_val;
        }
    }
}

// Simple contour detection
void findContours(unsigned char binary[240][320],
                 Contour contours[100],
                 int &num_contours) {
    #pragma HLS INLINE
    
    // Simplified contour detection using border following
    num_contours = 0;
    bool visited[240][320] = {false};
    
    for (int y = 1; y < 479; y++) {
        for (int x = 1; x < 639; x++) {
            if (binary[y][x] == 255 && !visited[y][x]) {
                // Start new contour
                if (num_contours < 100) {
                    traceContour(binary, visited, x, y, contours[num_contours]);
                    if (contours[num_contours].size > 10) { // Minimum contour size
                        num_contours++;
                    }
                }
            }
        }
    }
}

void traceContour(unsigned char binary[240][320],
                 bool visited[240][320],
                 int start_x, int start_y,
                 Contour &contour) {
    // Simplified contour tracing algorithm
    contour.size = 0;
    int x = start_x, y = start_y;
    int dir = 0;
    
    do {
        if (contour.size < 1000) {
            contour.points[contour.size].x = x;
            contour.points[contour.size].y = y;
            contour.size++;
        }
        visited[y][x] = true;
        
        // Find next boundary point
        bool found = false;
        for (int i = 0; i < 8 && !found; i++) {
            int new_dir = (dir + i) % 8;
            int nx = x, ny = y;
            
            switch(new_dir) {
                case 0: nx = x+1; break;
                case 1: nx = x+1; ny = y-1; break;
                case 2: ny = y-1; break;
                case 3: nx = x-1; ny = y-1; break;
                case 4: nx = x-1; break;
                case 5: nx = x-1; ny = y+1; break;
                case 6: ny = y+1; break;
                case 7: nx = x+1; ny = y+1; break;
            }
            
            if (nx >= 0 && nx < 320 && ny >= 0 && ny < 240 &&
                binary[ny][nx] == 255 && !visited[ny][nx]) {
                x = nx;
                y = ny;
                dir = (new_dir + 6) % 8; // Update direction
                found = true;
            }
        }
    } while (!(x == start_x && y == start_y) && contour.size < 1000);
}

// Object labeling function
void objectLabeler(char shape[20], char color[20], char object_type[20]) {
    if (strcmp(color, "green") == 0 && strcmp(shape, "circle") == 0) {
        strcpy(object_type, "Tree");
    } else if (strcmp(shape, "square") == 0 || strcmp(shape, "rectangle") == 0 ||
               strcmp(shape, "pentagon") == 0 || strcmp(shape, "hexagon") == 0) {
        strcpy(object_type, "House");
    } else {
        strcpy(object_type, "Undefined Object");
    }
}

// Main processing function
void objectDetection(unsigned char input_image[240][320][3],
                    DetectionResult results[50],
                    int &num_objects) {
    #pragma HLS DATAFLOW
    
    // Processing pipeline
    unsigned char bright_image[240][320][3];
    unsigned char gray_image[240][320];
    unsigned char binary_image[240][320];
    unsigned char closed_image[240][320];
    
    Contour contours[100];
    int num_contours = 0;
    
    // Initialize detectors
    ColorLabeler color_detector;
    ShapeDetector shape_detector;
    
    // Image processing pipeline
    adjustBrightness(input_image, bright_image, 1.2f);
    convertToGray(bright_image, gray_image);
    simpleThreshold(gray_image, binary_image, 128);
    morphologicalClose(binary_image, closed_image);
    
    // Find contours
    findContours(closed_image, contours, num_contours);
    
    // Process each contour
    num_objects = 0;
    for (int i = 0; i < num_contours; i++) {
        #pragma HLS PIPELINE
        if (num_objects >= 50) break;
        
        // Calculate contour area and filter
        float area = 0.0;
        for (int j = 0; j < contours[i].size; j++) {
            int next_j = (j + 1) % contours[i].size;
            area += (contours[i].points[j].x * contours[i].points[next_j].y - 
                    contours[i].points[next_j].x * contours[i].points[j].y);
        }
        area = hls::abs(area) / 2.0;
        
        // Filter by area
        if (area >= 103.0 && area <= 11983.0) {
            // Calculate centroid
            int sum_x = 0, sum_y = 0;
            for (int j = 0; j < contours[i].size; j++) {
                sum_x += contours[i].points[j].x;
                sum_y += contours[i].points[j].y;
            }
            int center_x = sum_x / contours[i].size;
            int center_y = sum_y / contours[i].size;
            
            // Detect shape and color
            Contour approx;
            char shape_name[20], color_name[20], object_name[20];
            
            shape_detector.detect(contours[i], 0.01f, shape_name, approx);
            color_detector.label(input_image, contours[i], color_name);
            objectLabeler(shape_name, color_name, object_name);
            
            // Store result
            strcpy(results[num_objects].shape, shape_name);
            strcpy(results[num_objects].color, color_name);
            strcpy(results[num_objects].object_type, object_name);
            results[num_objects].perimeter = area; // Using area as perimeter for simplicity
            results[num_objects].center_x = center_x - 320; // Relative to center
            results[num_objects].center_y = 240 - center_y; // Relative to center
            
            num_objects++;
        }
    }
}


