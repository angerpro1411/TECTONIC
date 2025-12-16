
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;

typedef struct{
    u8 r,g,b;
} PIXEL;

void MeanShiftFiltering(PIXEL* in,PIXEL* out,u32 ImageWidth,
    u32 ImageHeight, char sd, char cd, u8 max_iter){
        float thresHold = 0.1f;
        float sum_b = 0,sum_g = 0,sum_r = 0;
        u8 pixel_cnt = 0;
        float CENTER_b,CENTER_g,CENTER_r;
        float CURRENT_b,CURRENT_g,CURRENT_r;
        float MEAN_b,MEAN_g,MEAN_r;
        for(int y=0; y < ImageHeight;++y) {
            for (int x=0; x < ImageWidth;++x){
                CENTER_b = in[x+y*ImageHeight].b;
                CENTER_g = in[x+y*ImageHeight].g;
                CENTER_r = in[x+y*ImageHeight].r;

                u8 iter_numb = 0;
                float THRES_HOLD_DIST_SQUARE = 0.0f;
                //find the mean.
                do {
                    THRES_HOLD_DIST_SQUARE = 0.0f;
                    pixel_cnt = 0;
                    sum_b = 0;
                    sum_g = 0;
                    sum_r = 0;
                    for(int i=y-sd;i<=y+sd;++i){
                        for(int j=x-sd;j<=x+sd;++j){
                            
                            //No calculate with pixel out of border
                            if (i < 0 || i >= ImageHeight || j < 0 || j >= ImageWidth){
                                continue;
                            }
                                
                            if((i-y)*(i-y) + (j-x)*(j-x) > sd*sd){
                                continue;
                            }

                            CURRENT_b = in[j+i*ImageHeight].b;
                            CURRENT_g = in[j+i*ImageHeight].g;
                            CURRENT_r = in[j+i*ImageHeight].r;
                            float db = (CURRENT_b-CENTER_b);
                            float dg = (CURRENT_g-CENTER_g);
                            float dr = (CURRENT_r-CENTER_r);
                            float COLOR_DIST_SQ = db*db+dg*dg+dr*dr;
                            if( COLOR_DIST_SQ <= cd*cd ){
                                sum_b += CURRENT_b;
                                sum_g += CURRENT_g;
                                sum_r += CURRENT_r;
                                pixel_cnt++;
                            }
                        }
                    }
                    MEAN_b = sum_b/pixel_cnt;
                    MEAN_g = sum_g/pixel_cnt;
                    MEAN_r = sum_r/pixel_cnt;

                    iter_numb++;
                    THRES_HOLD_DIST_SQUARE = (MEAN_b-CENTER_b)*(MEAN_b-CENTER_b)+
                                             (MEAN_g-CENTER_g)*(MEAN_g-CENTER_g)+
                                             (MEAN_r-CENTER_r)*(MEAN_r-CENTER_r);

                    //Update new mean for center
                    CENTER_b = MEAN_b;
                    CENTER_g = MEAN_g;
                    CENTER_r = MEAN_r;


                }while ( (iter_numb <= max_iter) || THRES_HOLD_DIST_SQUARE >thresHold*thresHold);
                //Finish this while loop means that we found the best mean or for computational cost purpose, after a few iterations, we stop
                //Update to output pixel
                out[x+y*ImageHeight].b = (u8)(MEAN_b + 0.5f);
                out[x+y*ImageHeight].g = (u8)(MEAN_g + 0.5f);
                out[x+y*ImageHeight].r = (u8)(MEAN_r + 0.5f);
            }
    }
}