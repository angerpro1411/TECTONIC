
#include <cstdint>
#include "parameters.h"
#include <algorithm>

void obj_detect(
    u8 BGRdata[230400],           // Flat array: [B0,G0,R0, B1,G1,R1, ...]
    u8 BGRoutput[230400],         // Flat output array

    // Outputs
    int16_t obj_x[MAX_OBJECTS],
    int16_t obj_y[MAX_OBJECTS],
    uint8_t obj_is_green[MAX_OBJECTS],
    int &obj_count
)
{
    obj_count = 0;

    // --- Step 1: Extract channels & grayscale ---
    static u8 R[PixelNumber], G[PixelNumber], B[PixelNumber];
    static int gray[PixelNumber];

    for (int idx = 0; idx < PixelNumber; idx++) {
        B[idx] = BGRdata[idx*3 + 0];
        G[idx] = BGRdata[idx*3 + 1];
        R[idx] = BGRdata[idx*3 + 2];
        gray[idx] = (R[idx]*30 + G[idx]*59 + B[idx]*11) / 100;
    }

    // --- Step 2: Sobel edge detection (magnitude squared) ---
    static uint8_t edge[PixelNumber] = {0};
    int thr2 = THRESHOLD_EDGE * THRESHOLD_EDGE;

    for (int y = 2; y < IMG_HEIGHT; y++) {
        for (int x = 2; x < IMG_WIDTH; x++) {

            int idx00 = (y-2)*IMG_WIDTH + (x-2);
            int idx01 = (y-2)*IMG_WIDTH + (x-1);
            int idx02 = (y-2)*IMG_WIDTH + (x);
            int idx10 = (y-1)*IMG_WIDTH + (x-2);
            int idx11 = (y-1)*IMG_WIDTH + (x-1);
            int idx12 = (y-1)*IMG_WIDTH + (x);
            int idx20 = (y)*IMG_WIDTH   + (x-2);
            int idx21 = (y)*IMG_WIDTH   + (x-1);
            int idx22 = (y)*IMG_WIDTH   + (x);

            int w00 = gray[idx00], w01 = gray[idx01], w02 = gray[idx02];
            int w10 = gray[idx10], w11 = gray[idx11], w12 = gray[idx12];
            int w20 = gray[idx20], w21 = gray[idx21], w22 = gray[idx22];

            int gx = -w00 + w02 - 2*w10 + 2*w12 - w20 + w22;
            int gy = -w00 - 2*w01 - w02 + w20 + 2*w21 + w22;

            int mag2 = gx*gx + gy*gy;
            if (mag2 > thr2) edge[y*IMG_WIDTH + x] = 1;
        }
    }

    // --- Step 3: 3×3 dilation ---
    static uint8_t dil[PixelNumber];
    for (int i = 0; i < PixelNumber; i++) dil[i] = edge[i];

    for (int y = 1; y < IMG_HEIGHT-1; y++) {
        for (int x = 1; x < IMG_WIDTH-1; x++) {
            if (edge[y*IMG_WIDTH+x]) continue;
            bool any = false;
            for (int dy = -1; dy <= 1 && !any; dy++) {
                for (int dx = -1; dx <= 1; dx++) {
                    if (edge[(y+dy)*IMG_WIDTH + (x+dx)]) any = true;
                }
            }
            dil[y*IMG_WIDTH + x] = any ? 1 : 0;
        }
    }
    std::copy(dil, dil + PixelNumber, edge);

    // --- Step 4: Connected components (4-connect) ---
    static int label[PixelNumber] = {0};
    static int parent[MAX_LABELS];

    int next_label = 1;
    for (int i = 0; i < MAX_LABELS; i++) parent[i] = i;

    auto uf_find = [&](int a) {
        while (parent[a] != a) a = parent[a];
        return a;
    };
    auto uf_union = [&](int a, int b) {
        int ra = uf_find(a), rb = uf_find(b);
        if (ra != rb) parent[rb] = ra;
    };

    for (int y = 0; y < IMG_HEIGHT; y++) {
        for (int x = 0; x < IMG_WIDTH; x++) {
            int idx = y*IMG_WIDTH + x;
            if (!edge[idx]) continue;

            int L = (x > 0) ? label[idx-1] : 0;
            int U = (y > 0) ? label[idx-IMG_WIDTH] : 0;

            if (!L && !U) {
                if (next_label < MAX_LABELS) {
                    label[idx] = next_label++;
                }
            } else if (L && !U) {
                label[idx] = L;
            } else if (!L && U) {
                label[idx] = U;
            } else {
                label[idx] = L;
                if (L != U) uf_union(L, U);
            }
        }
    }

    // Flatten labels
    for (int i = 1; i < next_label; i++)
        parent[i] = uf_find(i);

    // Create compact IDs
    static int idmap[MAX_LABELS] = {0};
    int cid = 1;
    for (int i = 1; i < next_label; i++)
        if (parent[i] == i)
            idmap[i] = cid++;

    int CC = cid - 1;

    for (int i = 0; i < PixelNumber; i++)
        if (label[i])
            label[i] = idmap[parent[label[i]]];

    // --- Step 5: bounding boxes ---
    static int minx[MAX_LABELS], maxx[MAX_LABELS];
    static int miny[MAX_LABELS], maxy[MAX_LABELS];
    std::fill(minx, minx+MAX_LABELS, IMG_WIDTH);
    std::fill(miny, miny+MAX_LABELS, IMG_HEIGHT);
    std::fill(maxx, maxx+MAX_LABELS, 0);
    std::fill(maxy, maxy+MAX_LABELS, 0);

    for (int y = 0; y < IMG_HEIGHT; y++) {
        for (int x = 0; x < IMG_WIDTH; x++) {
            int id = label[y*IMG_WIDTH + x];
            if (!id) continue;
            minx[id] = std::min(minx[id], x);
            maxx[id] = std::max(maxx[id], x);
            miny[id] = std::min(miny[id], y);
            maxy[id] = std::max(maxy[id], y);
        }
    }

    // --- Step 6: External filtering ---
    uint8_t external[MAX_LABELS];
    std::fill(external, external+MAX_LABELS, 1);

    for (int i = 1; i <= CC; i++) {
        for (int j = 1; j <= CC; j++) {
            if (i != j &&
                minx[j] > minx[i] && maxx[j] < maxx[i] &&
                miny[j] > miny[i] && maxy[j] < maxy[i])
                external[j] = 0;
        }
    }

    // --- Step 7: Identify objects ---
    obj_count = 0;

    for (int id = 1; id <= CC; id++) {
        if (!external[id]) continue;
        if (obj_count >= MAX_OBJECTS) break;

        int cx = (minx[id] + maxx[id]) / 2;
        int cy = (miny[id] + maxy[id]) / 2;
        int idx = cy*IMG_WIDTH + cx;

        bool green =
            G[idx] > R[idx] &&
            G[idx] > B[idx] &&
            G[idx] > 80;

        obj_x[obj_count] = cx - IMG_WIDTH/2;
        obj_y[obj_count] = IMG_HEIGHT/2 - cy;
        obj_is_green[obj_count] = green ? 1 : 0;

        obj_count++;
    }

    // --- Step 8: produce BGR output (flat array) ---
    for (int idx = 0; idx < PixelNumber; idx++) {
        int y = idx / IMG_WIDTH;
        int x = idx % IMG_WIDTH;
        int id = label[idx];

        // Default: copy input
        BGRoutput[idx*3 + 0] = BGRdata[idx*3 + 0];  // B
        BGRoutput[idx*3 + 1] = BGRdata[idx*3 + 1];  // G
        BGRoutput[idx*3 + 2] = BGRdata[idx*3 + 2];  // R

        if (edge[idx] && id > 0) {
            // Find component → object mapping
            bool green = false;

            for (int i = 0; i < obj_count; i++) {
                int cx = obj_x[i] + IMG_WIDTH/2;
                int cy = IMG_HEIGHT/2 - obj_y[i];

                if (cx >= minx[id] && cx <= maxx[id] &&
                    cy >= miny[id] && cy <= maxy[id]) {
                    green = obj_is_green[i];
                    break;
                }
            }

            if (green) {
                BGRoutput[idx*3 + 0] = 0;     // B
                BGRoutput[idx*3 + 1] = 255;   // G
                BGRoutput[idx*3 + 2] = 0;     // R (BGR green)
            } else {
                BGRoutput[idx*3 + 0] = 0;     // B
                BGRoutput[idx*3 + 1] = 0;     // G
                BGRoutput[idx*3 + 2] = 255;   // R (BGR red)
            }
        }
    }
}
