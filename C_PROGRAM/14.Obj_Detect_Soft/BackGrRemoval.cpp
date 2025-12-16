#include "BackGrRemoval.h"
#include "parameters.h"
#include <algorithm>

#define KERNEL 11
#define HALF   (KERNEL/2)
#define THRESHOLD_DEFAULT 60

static inline u8 MaxOf3(u8 a, u8 b, u8 c) {
    return std::max(a, std::max(b, c));
}
static inline u8 MinOf3(u8 a, u8 b, u8 c) {
    return std::min(a, std::min(b, c));
}

void BackGrRemoval(u8 data[230400], u32 width, u32 height)
{
    static u8 h_line[KERNEL][1920]; // adjust width if needed
    for (int i = 0; i < KERNEL; i++)
        for (u32 x = 0; x < width; x++)
            h_line[i][x] = 0;

    for (u32 y = 0; y < height; y++) {
        for (u32 x = 0; x < width; x++) {

            // Index in flat BGR array
            u32 idx = (y * width + x) * 3;

            u8 b = data[idx + 0];
            u8 g = data[idx + 1];
            u8 r = data[idx + 2];

            // -------- Compute Hue (0–180) --------
            u8 maxVal = MaxOf3(b, g, r);
            u8 minVal = MinOf3(b, g, r);
            u8 diff = maxVal - minVal;
            int tmp;

            if (maxVal == minVal) tmp = 0;
            else if (maxVal == r) tmp = (60 * (g - b) + diff/2) / diff;
            else if (maxVal == g) tmp = 120 + (60 * (b - r) + diff/2) / diff;
            else                   tmp = 240 + (60 * (r - g) + diff/2) / diff;

            if (tmp < 0) tmp += 360;
            u8 h_val = tmp >> 1;

            // -------- Shift line buffer --------
            for (int k = 0; k < KERNEL - 1; k++)
                h_line[k][x] = h_line[k+1][x];
            h_line[KERNEL-1][x] = h_val;

            // -------- Local thresholding --------
            u8 total = 0;
            u8 count = 0;

            for (int i = 0; i < KERNEL; i++) {
                int yy = y + i - HALF;
                if (yy < 0 || yy >= (int)height) continue;

                total++;
                if (h_line[i][x] < THRESHOLD_DEFAULT)
                    count++;
            }

            // condition: count*10 >= total*8
            if (total > 0 && count * 10 >= total * 8) {
                data[idx + 0] = 255;
                data[idx + 1] = 255;
                data[idx + 2] = 255;
            }
            // else leave original pixel unchanged
        }
    }
}
