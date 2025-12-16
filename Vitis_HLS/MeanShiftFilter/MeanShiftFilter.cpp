#include "MeanShiftFilter.h"

void MeanShiftFiltering(Pixel* in,Pixel* out,u32 ImageWidth,
    u32 ImageHeight, u8 sd, u8 cd, u8 max_iter){


        const fx_t thresHold = 0.1f;
        fx_t sum_b = 0,sum_g = 0,sum_r = 0;
        u32 pixel_cnt = 0;
        fx_t CENTER_b,CENTER_g,CENTER_r;
        fx_t CURRENT_b,CURRENT_g,CURRENT_r;
        fx_t MEAN_b,MEAN_g,MEAN_r;

        Row_loop:
		for(int y=0; y < ImageHeight;++y) {
            Col_loop:
			for (int x=0; x < ImageWidth;++x){
#pragma HLS PIPELINE II=1
                CENTER_b = in[x+y*ImageWidth].b;
                CENTER_g = in[x+y*ImageWidth].g;
                CENTER_r = in[x+y*ImageWidth].r;

                u8 iter_numb = 0;
                fx_t THRES_HOLD_DIST_SQ = 0.0f;

                //find the mean
                do {
                    pixel_cnt = 0;
                    sum_b = 0;
                    sum_g = 0;
                    sum_r = 0;
                    y_window:
                    for(int dy=-sd;dy<=sd;++dy){
                        x_window:
                    	for(int dx=-sd;dx<=sd;++dx){

                            if((dy)*(dy) + (dx)*(dx) > sd*sd){
                                continue;
                            }
                            int xi = x + dx;
                            int yi = y + dy;

                            //No calculate with pixel out of border
                            if (xi < 0 || xi >= imageWidth || yi < 0 || yi >= imageHeight){
                                continue;
                            }

                            CURRENT_b = in[xi+yi*ImageWidth].b;
                            CURRENT_g = in[xi+yi*ImageWidth].g;
                            CURRENT_r = in[xi+yi*ImageWidth].r;
                            fx_t db = (CURRENT_b-CENTER_b);
                            fx_t dg = (CURRENT_g-CENTER_g);
                            fx_t dr = (CURRENT_r-CENTER_r);
                            fx_t COLOR_DIST_SQ = db*db+dg*dg+dr*dr;
                            if( COLOR_DIST_SQ <= cd*cd ){
                                sum_b += CURRENT_b;
                                sum_g += CURRENT_g;
                                sum_r += CURRENT_r;
                                pixel_cnt++;
                            }
                            }
                        }
                    if (pixel_cnt == 0){break;}

                    MEAN_b = sum_b/pixel_cnt;
                    MEAN_g = sum_g/pixel_cnt;
                    MEAN_r = sum_r/pixel_cnt;


                    THRES_HOLD_DIST_SQ = (MEAN_b-CENTER_b)*(MEAN_b-CENTER_b)+
                                             (MEAN_g-CENTER_g)*(MEAN_g-CENTER_g)+
                                             (MEAN_r-CENTER_r)*(MEAN_r-CENTER_r);

                    //Update new mean for center
                    CENTER_b = MEAN_b;
                    CENTER_g = MEAN_g;
                    CENTER_r = MEAN_r;

                    iter_numb++;
                }while ( (iter_numb <= max_iter) && THRES_HOLD_DIST_SQ >thresHold);
                //Finish this while loop means that we found the best mean or for computational cost purpose, after a few iterations, we stop
                //Update to output pixel
                out[x+y*ImageHeight].b = (u8)(CENTER_b + (fx_t)0.5);
                out[x+y*ImageHeight].g = (u8)(CENTER_g + (fx_t)0.5);
                out[x+y*ImageHeight].r = (u8)(CENTER_r + (fx_t)0.5);
            }
    }
}
