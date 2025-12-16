#ifndef PARAMETERS_H
#define PARAMETERS_H

#include <hls_math.h>
#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_stream.h>
#include <string.h>

// Define fixed-point types for HLS synthesis
typedef ap_fixed<16,8> fixed_type;
typedef ap_uint<8> pixel_type;
typedef ap_uint<24> rgb_pixel;

// Struct for contour points
struct Point {
    int x;
    int y;
};

// Struct for contours
struct Contour {
    Point points[1000]; // Maximum contour points
    int size;
};

// Struct for color information
struct Color {
    char name[20];
    unsigned char r;
    unsigned char g;
    unsigned char b;
};

// Struct for shape and color detection results
struct DetectionResult {
    char shape[20];
    char color[20];
    char object_type[20];
    float perimeter;
    int center_x;
    int center_y;
};

class ColorLabeler {
private:
    Color colors[3];
    unsigned char lab[3][3];

public:
    ColorLabeler() {
        // Initialize colors
        strcpy(colors[0].name, "red");
        colors[0].r = 255; colors[0].g = 0; colors[0].b = 0;

        strcpy(colors[1].name, "green");
        colors[1].r = 0; colors[1].g = 255; colors[1].b = 0;

        strcpy(colors[2].name, "blue");
        colors[2].r = 0; colors[2].g = 0; colors[2].b = 255;

        // Convert RGB to LAB (simplified version)
        for (int i = 0; i < 3; i++) {
            rgb_to_lab_simple(colors[i].r, colors[i].g, colors[i].b,
                             lab[i][0], lab[i][1], lab[i][2]);
        }
    }

    void rgb_to_lab_simple(unsigned char r, unsigned char g, unsigned char b,
                          unsigned char &l, unsigned char &a, unsigned char &b_val) {
        // Simplified RGB to LAB conversion for HLS
        // In practice, you'd implement the full conversion
        l = (r + g + b) / 3;
        a = r - g + 128;  // Simplified
        b_val = b - (r + g) / 2 + 128;  // Simplified
    }

    void label(unsigned char image[480][640][3], Contour c, char color_name[20]) {
        #pragma HLS INLINE

        // Create mask and compute mean (simplified)
        unsigned char mean_l = 0, mean_a = 0, mean_b = 0;
        int count = 0;

        // Simple bounding box approach for mean calculation
        int min_x = 640, min_y = 480, max_x = 0, max_y = 0;

        for (int i = 0; i < c.size; i++) {
            #pragma HLS PIPELINE
            if (c.points[i].x < min_x) min_x = c.points[i].x;
            if (c.points[i].y < min_y) min_y = c.points[i].y;
            if (c.points[i].x > max_x) max_x = c.points[i].x;
            if (c.points[i].y > max_y) max_y = c.points[i].y;
        }

        // Calculate mean in bounding box
        for (int y = min_y; y <= max_y; y++) {
            for (int x = min_x; x <= max_x; x++) {
                #pragma HLS PIPELINE
                if (is_point_in_contour(x, y, c)) {
                    unsigned char r = image[y][x][0];
                    unsigned char g = image[y][x][1];
                    unsigned char b_val = image[y][x][2];
                    unsigned char l, a, b_lab;

                    rgb_to_lab_simple(r, g, b_val, l, a, b_lab);

                    mean_l += l;
                    mean_a += a;
                    mean_b += b_lab;
                    count++;
                }
            }
        }

        if (count > 0) {
            mean_l /= count;
            mean_a /= count;
            mean_b /= count;
        }

        // Find closest color
        float min_dist = 1000000.0;
        int min_index = 0;

        for (int i = 0; i < 3; i++) {
            #pragma HLS PIPELINE
            float dist = hls::sqrt(
                (float)((mean_l - lab[i][0]) * (mean_l - lab[i][0]) +
                       (mean_a - lab[i][1]) * (mean_a - lab[i][1]) +
                       (mean_b - lab[i][2]) * (mean_b - lab[i][2]))
            );

            if (dist < min_dist) {
                min_dist = dist;
                min_index = i;
            }
        }

        strcpy(color_name, colors[min_index].name);
    }

    bool is_point_in_contour(int x, int y, Contour c) {
        // Simplified point-in-contour test
        // In practice, implement ray casting algorithm
        for (int i = 0; i < c.size; i++) {
            if (c.points[i].x == x && c.points[i].y == y) {
                return true;
            }
        }
        return false;
    }
};

class ShapeDetector {
public:
    ShapeDetector() {}

    void detect(Contour c, float epsilon, char shape[20], Contour &approx) {
        #pragma HLS INLINE

        // Calculate perimeter
        float perimeter = 0.0;
        for (int i = 0; i < c.size; i++) {
            int next_i = (i + 1) % c.size;
            int dx = c.points[next_i].x - c.points[i].x;
            int dy = c.points[next_i].y - c.points[i].y;
            perimeter += hls::sqrt((float)(dx * dx + dy * dy));
        }

        // Simple vertex count based shape detection
        int vertex_count = c.size;

        if (vertex_count <= 8) {
            strcpy(shape, "circle");
        } else if (vertex_count <= 12) {
            strcpy(shape, "hexagon");
        } else if (vertex_count <= 16) {
            strcpy(shape, "pentagon");
        } else {
            // Check for rectangle/square
            int min_x = 640, min_y = 480, max_x = 0, max_y = 0;
            for (int i = 0; i < c.size; i++) {
                #pragma HLS PIPELINE
                if (c.points[i].x < min_x) min_x = c.points[i].x;
                if (c.points[i].y < min_y) min_y = c.points[i].y;
                if (c.points[i].x > max_x) max_x = c.points[i].x;
                if (c.points[i].y > max_y) max_y = c.points[i].y;
            }

            int width = max_x - min_x;
            int height = max_y - min_y;
            float aspect_ratio = (float)width / height;

            if (aspect_ratio >= 0.95 && aspect_ratio <= 1.05) {
                strcpy(shape, "square");
            } else {
                strcpy(shape, "rectangle");
            }
        }

        // Simple approximation - just copy original contour
        approx = c;
    }
};

#endif
