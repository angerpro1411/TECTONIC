#include <iostream>
#include <fstream>
#include "object_detection.h"
#include "parameters.h"

using namespace std;

void save_test_image(unsigned char image[480][640][3]);
float PositionDetector(int x, int y);


// Test bench function that doesn't use streams
int main() {
    cout << "=== Object Detection Test Bench ===" << endl;

    // Method 1: Create synthetic test pattern
    unsigned char test_image[480][640][3] = {0};

    // Create a white background
    for (int y = 0; y < 480; y++) {
        for (int x = 0; x < 640; x++) {
            test_image[y][x][0] = 200;  // R
            test_image[y][x][1] = 200;  // G
            test_image[y][x][2] = 200;  // B
        }
    }

    // Draw a RED SQUARE (should be detected as "House")
    for (int y = 100; y < 200; y++) {
        for (int x = 100; x < 200; x++) {
            test_image[y][x][0] = 255;  // R
            test_image[y][x][1] = 0;    // G
            test_image[y][x][2] = 0;    // B
        }
    }

    // Draw a GREEN CIRCLE (should be detected as "Tree")
    int center_x = 400, center_y = 300, radius = 40;
    for (int y = center_y - radius; y <= center_y + radius; y++) {
        for (int x = center_x - radius; x <= center_x + radius; x++) {
            if (x >= 0 && x < 640 && y >= 0 && y < 480) {
                int dx = x - center_x;
                int dy = y - center_y;
                if (dx * dx + dy * dy <= radius * radius) {
                    test_image[y][x][0] = 0;    // R
                    test_image[y][x][1] = 255;  // G
                    test_image[y][x][2] = 0;    // B
                }
            }
        }
    }

    // Draw a BLUE RECTANGLE (should be detected as "House")
    for (int y = 350; y < 420; y++) {
        for (int x = 300; x < 450; x++) {
            test_image[y][x][0] = 0;    // R
            test_image[y][x][1] = 0;    // G
            test_image[y][x][2] = 255;  // B
        }
    }

    // Call the object detection function directly
    DetectionResult results[50];
    int num_objects = 0;

    cout << "Running object detection..." << endl;
    objectDetection(test_image, results, num_objects);

    // Display results
    cout << "\n=== DETECTION RESULTS ===" << endl;
    cout << "Number of objects detected: " << num_objects << endl;
    cout << "----------------------------" << endl;

    for (int i = 0; i < num_objects; i++) {
        cout << "Object " << i+1 << ":" << endl;
        cout << "  Type: " << results[i].object_type << endl;
        cout << "  Color: " << results[i].color << endl;
        cout << "  Shape: " << results[i].shape << endl;
        cout << "  Perimeter: " << results[i].perimeter << endl;
        cout << "  Position: (" << results[i].center_x << ", " << results[i].center_y << ")" << endl;
        cout << "  Tangent: " << PositionDetector(results[i].center_x, results[i].center_y) << endl;
        cout << "----------------------------" << endl;
    }

    // Save test image to file for verification
    save_test_image(test_image);
    return 0;
}

// Helper function to save the test image (for debugging)
void save_test_image(unsigned char image[480][640][3]) {
    #ifndef __SYNTHESIS__
    ofstream ppm_file("test_image.ppm");
    ppm_file << "P3" << endl;
    ppm_file << "640 480" << endl;
    ppm_file << "255" << endl;

    for (int y = 0; y < 480; y++) {
        for (int x = 0; x < 640; x++) {
            ppm_file << (int)image[y][x][0] << " "
                     << (int)image[y][x][1] << " "
                     << (int)image[y][x][2] << " ";
        }
        ppm_file << endl;
    }
    ppm_file.close();
    cout << "Test image saved as 'test_image.ppm'" << endl;
    #endif
}

// Simplified PositionDetector for test bench
float PositionDetector(int x, int y) {
    if (x == 0) {
        return (y > 0) ? 99999.0f : -99999.0f;
    }
    return (float)y / x;
}


