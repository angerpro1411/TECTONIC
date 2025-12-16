#include <hls_stream.h>
#include <ap_int.h>
#include <ap_axi_sdata.h>
#include <cstdint>

#define IMG_WIDTH 320
#define IMG_HEIGHT 240
#define THRESHOLD_EDGE 220
#define MAX_LABELS 512
#define MAX_OBJECTS 32 //Limit number of objects
#define MIN_OBJECT_PIXELS 200   //Bounding box for small noises

typedef ap_axiu<24,1,1,1> axis_rgb_t;

// Simple green detection
static inline bool is_green_rgb(ap_uint<8> R, ap_uint<8> G, ap_uint<8> B) {
#pragma HLS INLINE
return (G > R) && (G > B) && (G > 80); // simple threshold
}

// Union-Find helpers
static inline ap_uint<16> uf_find(ap_uint<16> parent[MAX_LABELS], ap_uint<16> x) {

	#pragma HLS INLINE
	ap_uint<16> root = x;
	while(parent[root] != root) root = parent[root];
	ap_uint<16> cur = x;
	while(parent[cur] != root) {
	ap_uint<16> next = parent[cur];
	parent[cur] = root;
	cur = next;
	}
	return root;
}

static inline void uf_union(ap_uint<16> parent[MAX_LABELS], ap_uint<16> a, ap_uint<16> b) {

	#pragma HLS INLINE
	ap_uint<16> ra = uf_find(parent, a);
	ap_uint<16> rb = uf_find(parent, b);
	if(ra != rb) parent[rb] = ra;
}


void hls_object_green_classification(
	hls::stream<axis_rgb_t> &in_stream,
	hls::stream<axis_rgb_t> &out_stream,
	int16_t obj_x[MAX_OBJECTS],
	int16_t obj_y[MAX_OBJECTS],
	ap_uint<1> obj_is_green[MAX_OBJECTS],
	ap_uint<16>& object_count) {

#pragma HLS INTERFACE axis port=in_stream
#pragma HLS INTERFACE axis port=out_stream

#pragma HLS INTERFACE s_axilite port=obj_x        bundle=CTRL
#pragma HLS INTERFACE s_axilite port=obj_y        bundle=CTRL
#pragma HLS INTERFACE s_axilite port=obj_is_green bundle=CTRL
#pragma HLS INTERFACE s_axilite port=object_count bundle=CTRL

#pragma HLS INTERFACE s_axilite port=return bundle=CTRL   // <-- CONTROL BUS

	static int16_t obj_x_buf[MAX_OBJECTS];
	static int16_t obj_y_buf[MAX_OBJECTS];
	static ap_uint<1> obj_is_green_buf[MAX_OBJECTS];
	static ap_uint<16> object_count_buf;

	static ap_uint<8> imgR[IMG_HEIGHT][IMG_WIDTH];
	static ap_uint<8> imgG[IMG_HEIGHT][IMG_WIDTH];
	static ap_uint<8> imgB[IMG_HEIGHT][IMG_WIDTH];

	#pragma HLS BIND_STORAGE variable=imgR type=ram_2p impl=bram
	#pragma HLS BIND_STORAGE variable=imgG type=ram_2p impl=bram
	#pragma HLS BIND_STORAGE variable=imgB type=ram_2p impl=bram

	static ap_uint<1> edge_mask[IMG_HEIGHT][IMG_WIDTH];

	#pragma HLS BIND_STORAGE variable=edge_mask type=ram_2p impl=bram

	static ap_uint<16> label_map[IMG_HEIGHT][IMG_WIDTH];

	#pragma HLS BIND_STORAGE variable=label_map type=ram_2p impl=bram

	static ap_uint<16> parent[MAX_LABELS];

	#pragma HLS BIND_STORAGE variable=parent type=ram_2p impl=bram

	// Object bounding boxes to find center
	static ap_uint<16> min_x[MAX_LABELS];
	static ap_uint<16> max_x[MAX_LABELS];
	static ap_uint<16> min_y[MAX_LABELS];
	static ap_uint<16> max_y[MAX_LABELS];
	static ap_uint<1> center_is_green[MAX_LABELS];

	#pragma HLS BIND_STORAGE variable=min_x type=ram_2p impl=bram
	#pragma HLS BIND_STORAGE variable=max_x type=ram_2p impl=bram
	#pragma HLS BIND_STORAGE variable=min_y type=ram_2p impl=bram
	#pragma HLS BIND_STORAGE variable=max_y type=ram_2p impl=bram


	static ap_uint<16> pixel_count[MAX_LABELS];
	#pragma HLS BIND_STORAGE variable=pixel_count type=ram_2p impl=lutram

	// Initialize
	InitLoop: for(int i=0;i<MAX_LABELS;i++){

	#pragma HLS PIPELINE II=1
	parent[i]=i;
	min_x[i]=IMG_WIDTH; max_x[i]=0;
	min_y[i]=IMG_HEIGHT; max_y[i]=0;
	center_is_green[i]=0;
	pixel_count[i]=0;      // NEW
	}

	// Sobel line buffers
	static ap_uint<8> linebuf[2][IMG_WIDTH];

	#pragma HLS ARRAY_PARTITION variable=linebuf complete dim=1
	ap_uint<8> window[3][3];
	#pragma HLS ARRAY_PARTITION variable=window complete dim=0

	int row=0, col=0;
	ap_uint<16> next_label=1;

	// PASS 1: read input, store RGB, compute gray, edge mask, provisional label
	PASS_1: for(int i=0;i<IMG_HEIGHT*IMG_WIDTH;i++){

//	#pragma HLS PIPELINE off
	axis_rgb_t in_pix = in_stream.read();
	ap_uint<8> R = in_pix.data & 0xFF;
	ap_uint<8> G = (in_pix.data >> 8) & 0xFF;
	ap_uint<8> B = (in_pix.data >> 16) & 0xFF;

		imgR[row][col]=R;
		imgG[row][col]=G;
		imgB[row][col]=B;

		ap_uint<8> gray_pix = (R*30 + G*59 + B*11)/100;

		// Shift window
		Shift_window: for(int wy=0;wy<3;wy++){

			#pragma HLS UNROLL
			window[wy][0]=window[wy][1];
			window[wy][1]=window[wy][2];
		}
	ap_uint<8> top = (row>=2)? linebuf[(row-2)&1][col]:(ap_uint<8>)0;
	ap_uint<8> middle = (row>=1)? linebuf[(row-1)&1][col]:(ap_uint<8>)0;
	ap_uint<8> bottom = gray_pix;
	window[0][2]=top;
	window[1][2]=middle;
	window[2][2]=bottom;
	linebuf[row&1][col]=gray_pix;

    // Sobel edge
    ap_uint<1> edge=0;
    if(row>=2 && col>=2){
        ap_int<11> gx=-window[0][0]+window[0][2]-2*window[1][0]+2*window[1][2]-window[2][0]+window[2][2];
        ap_int<11> gy=-window[0][0]-2*window[0][1]-window[0][2]+window[2][0]+2*window[2][1]+window[2][2];
        ap_uint<21> mag_sq=gx*gx+gy*gy;
        if(mag_sq>THRESHOLD_EDGE*THRESHOLD_EDGE) edge=1;
    }
    edge_mask[row][col]=edge;

    // 4-connected labeling
    ap_uint<16> lbl=0;
    if(edge){
        ap_uint<16> left=(col>0)?label_map[row][col-1]:(ap_uint<16>)0;
        ap_uint<16> up=(row>0)?label_map[row-1][col]:(ap_uint<16>)0;
        if(left!=0) lbl=left;
        else if(up!=0) lbl=up;
        else lbl=next_label++;
        if(left!=0 && up!=0 && left!=up) uf_union(parent,left,up);
    }
    label_map[row][col]=lbl;

    col++;
    if(col==IMG_WIDTH){col=0; row++;}
}


	// PASS 1.5: Morphological Dilation to connect nearby edge pixels
	PASS1_5_Outer: for(int y=1; y<IMG_HEIGHT-1; y++) {
	    Pass1_5_inner0: for(int x=1; x<IMG_WIDTH-1; x++) {
	        #pragma HLS PIPELINE II=1
	        ap_uint<1> dilated = 0;
	        Pass1_5_inner1:for(int dy=-1; dy<=1; dy++) {
	        	Pass1_5_inner2:for(int dx=-1; dx<=1; dx++) {
	                #pragma HLS UNROLL
	                if(edge_mask[y+dy][x+dx]) dilated = 1;
	            }
	        }
	        edge_mask[y][x] = dilated;
	    }
	}


	// PASS 2: compress labels
	PASS2: for(ap_uint<16> i=1;i<next_label;i++){

//	#pragma HLS PIPELINE II=1
	if(parent[i]!=i) parent[i]=uf_find(parent,i);
	}

	// PASS 3a: Compress label_map
	for (int y=0; y<IMG_HEIGHT; y++) {
	    for (int x=0; x<IMG_WIDTH; x++) {
	        #pragma HLS PIPELINE II=3
	        ap_uint<16> lbl = label_map[y][x];
	        if (lbl != 0) {
	            ap_uint<16> root = parent[lbl];
	            label_map[y][x] = root;
	        }
	    }
	}

	// PASS 3b: Compute bounding boxes
	for (int y=0; y<IMG_HEIGHT; y++) {
	    for (int x=0; x<IMG_WIDTH; x++) {
	        #pragma HLS PIPELINE II=3
	        ap_uint<16> lbl = label_map[y][x];
	        if (lbl != 0) {
	            if (x < min_x[lbl]) min_x[lbl] = x;
	            if (x > max_x[lbl]) max_x[lbl] = x;
	            if (y < min_y[lbl]) min_y[lbl] = y;
	            if (y > max_y[lbl]) max_y[lbl] = y;
	            pixel_count[lbl]++;   // NEW
	        }
	    }
	}

	// PASS 3.5: Keep only external contours (approximation)
	static ap_uint<1> is_external[MAX_LABELS];
	#pragma HLS BIND_STORAGE variable=is_external type=ram_2p impl=bram

	// Initialize all as external
	PASS_3_5_1: for(int i=1; i<next_label; i++) {
	    #pragma HLS PIPELINE II=1
	    is_external[i] = (parent[i]==i) ? 1 : 0;
	}

	// For each pair of objects, mark inner ones as non-external
	PASS_3_5_2_out: for(int i=1; i<next_label; i++) {
	    if(parent[i]==i) {
	    	PASS_3_5_2_in: for(int j=1; j<next_label; j++) {
	            #pragma HLS PIPELINE II=1
	            if(parent[j]==j && i!=j) {
	                bool inside =
	                    (min_x[j] > min_x[i]) && (max_x[j] < max_x[i]) &&
	                    (min_y[j] > min_y[i]) && (max_y[j] < max_y[i]);
	                if(inside)
	                    is_external[j] = 0; // j is inside i
	            }
	        }
	    }
	}

	// PASS 4: determine center pixel color for each object
	ap_uint<16> count = 0;
	pass_4: for (ap_uint<16> i = 1; i < next_label && count < MAX_OBJECTS; i++) {
	    #pragma HLS PIPELINE II=3
	    if(parent[i]==i &&
	    		is_external[i] &&
					pixel_count[i] >= MIN_OBJECT_PIXELS) {  // only external
	        int cx = (min_x[i]+max_x[i])/2;
	        int cy = (min_y[i]+max_y[i])/2;
	        center_is_green[i] = is_green_rgb(imgR[cy][cx], imgG[cy][cx], imgB[cy][cx]) ? 1 : 0;
	        obj_x[count] = (int16_t)(cx - IMG_WIDTH / 2);
	        obj_y[count] = (int16_t)(IMG_HEIGHT / 2 - cy);
	        obj_is_green[count] = center_is_green[i];
	        count++;
	    }
	}

	// Save to internal buffer first
	for(int k=0; k<count; k++) {
		#pragma HLS PIPELINE II=1
	    obj_x_buf[k]        = obj_x[k];
	    obj_y_buf[k]        = obj_y[k];
	    obj_is_green_buf[k] = obj_is_green[k];
	}
	object_count_buf = count;

	// PASS 5: output original image, recolor edges by object center color
	pass5_out: for(int y=0;y<IMG_HEIGHT;y++){
		pass5_in: for(int x=0;x<IMG_WIDTH;x++){

	#pragma HLS PIPELINE II=1
	ap_uint<8> R=imgR[y][x];
	ap_uint<8> G=imgG[y][x];
	ap_uint<8> B=imgB[y][x];

			ap_uint<16> lbl=label_map[y][x];
			if(edge_mask[y][x] && lbl!=0 && pixel_count[lbl] >= MIN_OBJECT_PIXELS)
				{
				if(center_is_green[lbl]) { R=0; G=255; B=0; }
				else { R=255; G=0; B=0; }
			}

			axis_rgb_t out_pix;
			out_pix.data = ((ap_uint<24>)B<<16)|((ap_uint<24>)G<<8)|R;
			out_pix.keep = -1;
			out_pix.strb = -1;
			out_pix.user = 0;
			out_pix.last = (y==IMG_HEIGHT-1 && x==IMG_WIDTH-1);

			out_stream.write(out_pix);
		}
	}
	// Copy buffered results to AXI-Lite output registers
	for(int k=0; k<object_count_buf; k++) {
		#pragma HLS PIPELINE II=1
	    obj_x[k]        = obj_x_buf[k];
	    obj_y[k]        = obj_y_buf[k];
	    obj_is_green[k] = obj_is_green_buf[k];
	}
	object_count = object_count_buf;

}
