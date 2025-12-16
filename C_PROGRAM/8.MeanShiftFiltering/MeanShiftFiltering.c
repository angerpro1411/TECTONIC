#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct {
    unsigned char r, g, b;
} Pixel;

void mean_shift_filter(Pixel *in, Pixel *out, int width, int height, int hs, float hr, int max_iterations) {
    const float threshold = 0.1f; // Convergence threshold for color change

    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            Pixel initial = in[y * width + x];
            float current_r = initial.r;
            float current_g = initial.g;
            float current_b = initial.b;

            int iterations = 0;
            float delta;

            do {
                float sum_r = 0.0f, sum_g = 0.0f, sum_b = 0.0f;
                int count = 0;

                // Iterate over spatial window
                for (int dy = -hs; dy <= hs; dy++) {
                    for (int dx = -hs; dx <= hs; dx++) {
                        // Check spatial distance
                        if (dx * dx + dy * dy > hs * hs)
                            continue;

                        int xi = x + dx;
                        int yi = y + dy;

                        if (xi >= 0 && xi < width && yi >= 0 && yi < height) {
                            Pixel neighbor = in[yi * width + xi];
                            // Calculate color distance
                            float dr = neighbor.r - current_r;
                            float dg = neighbor.g - current_g;
                            float db = neighbor.b - current_b;
                            float color_dist_sq = dr * dr + dg * dg + db * db;

                            if (color_dist_sq <= hr * hr) {
                                sum_r += neighbor.r;
                                sum_g += neighbor.g;
                                sum_b += neighbor.b;
                                count++;
                            }
                        }
                    }
                }

                if (count == 0) break;

                // Compute mean color
                float mean_r = sum_r / count;
                float mean_g = sum_g / count;
                float mean_b = sum_b / count;

                // Calculate delta
                delta = (mean_r - current_r) * (mean_r - current_r) +
                        (mean_g - current_g) * (mean_g - current_g) +
                        (mean_b - current_b) * (mean_b - current_b);

                // Update current color
                current_r = mean_r;
                current_g = mean_g;
                current_b = mean_b;

                iterations++;
            } while (delta > threshold && iterations < max_iterations);

            // Assign the filtered color to output
            out[y * width + x].r = (unsigned char)(current_r + 0.5f);
            out[y * width + x].g = (unsigned char)(current_g + 0.5f);
            out[y * width + x].b = (unsigned char)(current_b + 0.5f);
        }
    }
}




int main() {
    // Example: Create a dummy image (replace with actual image loading)
    int width = 100;
    int height = 100;
    Pixel *input = (Pixel *)malloc(width * height * sizeof(Pixel));
    Pixel *output = (Pixel *)malloc(width * height * sizeof(Pixel));

    // Initialize input image (example: gradient)
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
            input[y * width + x].r = (x * 255) / width;
            input[y * width + x].g = (y * 255) / height;
            input[y * width + x].b = 128;
        }
    }

    // Apply mean shift filter
    int hs = 5;        // Spatial radius
    float hr = 30.0f;  // Color radius
    int max_iter = 5;  // Maximum iterations
    mean_shift_filter(input, output, width, height, hs, hr, max_iter);

    // Cleanup
    free(input);
    free(output);

    return 0;
}