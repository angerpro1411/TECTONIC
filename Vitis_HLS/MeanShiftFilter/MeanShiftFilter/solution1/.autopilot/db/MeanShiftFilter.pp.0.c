# 1 "MeanShiftFilter.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 339 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "/tools/Xilinx/Vitis_HLS/2023.1/common/technology/autopilot/etc/autopilot_ssdm_op.h" 1
# 269 "/tools/Xilinx/Vitis_HLS/2023.1/common/technology/autopilot/etc/autopilot_ssdm_op.h"
    void _ssdm_op_IfRead() __attribute__ ((nothrow));
    void _ssdm_op_IfWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfNbWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_IfCanWrite() __attribute__ ((nothrow));


    void _ssdm_StreamRead() __attribute__ ((nothrow));
    void _ssdm_StreamWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamNbWrite() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanRead() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_StreamCanWrite() __attribute__ ((nothrow));
    void _ssdm_op_ReadReq() __attribute__ ((nothrow));
    void _ssdm_op_Read() __attribute__ ((nothrow));
    void _ssdm_op_WriteReq() __attribute__ ((nothrow));
    void _ssdm_op_Write() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbReadReq() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanReadReq() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_NbWriteReq() __attribute__ ((nothrow));
    unsigned int __attribute__ ((bitwidth(1))) _ssdm_op_CanWriteReq() __attribute__ ((nothrow));




    void _ssdm_op_MemShiftRead() __attribute__ ((nothrow));

    void _ssdm_op_PrintNone() __attribute__ ((nothrow));
    void _ssdm_op_PrintInt() __attribute__ ((nothrow));
    void _ssdm_op_PrintDouble() __attribute__ ((nothrow));

    void _ssdm_op_Wait() __attribute__ ((nothrow));
    void _ssdm_op_Poll() __attribute__ ((nothrow));

    void _ssdm_op_Return() __attribute__ ((nothrow));


    void _ssdm_op_SpecSynModule() __attribute__ ((nothrow));
    void _ssdm_op_SpecTopModule() __attribute__ ((nothrow));
    void _ssdm_op_SpecProcessDecl() __attribute__ ((nothrow));
    void _ssdm_op_SpecProcessDef() __attribute__ ((nothrow));
    void _ssdm_op_SpecPort() __attribute__ ((nothrow));
    void _ssdm_op_SpecConnection() __attribute__ ((nothrow));
    void _ssdm_op_SpecChannel() __attribute__ ((nothrow));
    void _ssdm_op_SpecSensitive() __attribute__ ((nothrow));
    void _ssdm_op_SpecModuleInst() __attribute__ ((nothrow));
    void _ssdm_op_SpecPortMap() __attribute__ ((nothrow));

    void _ssdm_op_SpecReset() __attribute__ ((nothrow));

    void _ssdm_op_SpecPlatform() __attribute__ ((nothrow));
    void _ssdm_op_SpecClockDomain() __attribute__ ((nothrow));
    void _ssdm_op_SpecPowerDomain() __attribute__ ((nothrow));

    int _ssdm_op_SpecRegionBegin() __attribute__ ((nothrow));
    int _ssdm_op_SpecRegionEnd() __attribute__ ((nothrow));

    void _ssdm_op_SpecLoopName() __attribute__ ((nothrow));

    void _ssdm_op_SpecLoopTripCount() __attribute__ ((nothrow));

    int _ssdm_op_SpecStateBegin() __attribute__ ((nothrow));
    int _ssdm_op_SpecStateEnd() __attribute__ ((nothrow));

    void _ssdm_op_SpecInterface() __attribute__ ((nothrow));

    void _ssdm_op_SpecPipeline() __attribute__ ((nothrow));
    void _ssdm_op_SpecDataflowPipeline() __attribute__ ((nothrow));


    void _ssdm_op_SpecLatency() __attribute__ ((nothrow));
    void _ssdm_op_SpecParallel() __attribute__ ((nothrow));
    void _ssdm_op_SpecProtocol() __attribute__ ((nothrow));
    void _ssdm_op_SpecOccurrence() __attribute__ ((nothrow));

    void _ssdm_op_SpecResource() __attribute__ ((nothrow));
    void _ssdm_op_SpecResourceLimit() __attribute__ ((nothrow));
    void _ssdm_op_SpecCHCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecFUCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecIFCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecIPCore() __attribute__ ((nothrow));
    void _ssdm_op_SpecMemCore() __attribute__ ((nothrow));

    void _ssdm_op_SpecExt() __attribute__ ((nothrow));




    void _ssdm_SpecArrayDimSize() __attribute__ ((nothrow));

    void _ssdm_RegionBegin() __attribute__ ((nothrow));
    void _ssdm_RegionEnd() __attribute__ ((nothrow));

    void _ssdm_Unroll() __attribute__ ((nothrow));
    void _ssdm_UnrollRegion() __attribute__ ((nothrow));

    void _ssdm_InlineAll() __attribute__ ((nothrow));
    void _ssdm_InlineLoop() __attribute__ ((nothrow));
    void _ssdm_Inline() __attribute__ ((nothrow));
    void _ssdm_InlineSelf() __attribute__ ((nothrow));
    void _ssdm_InlineRegion() __attribute__ ((nothrow));

    void _ssdm_SpecArrayMap() __attribute__ ((nothrow));
    void _ssdm_SpecArrayPartition() __attribute__ ((nothrow));
    void _ssdm_SpecArrayReshape() __attribute__ ((nothrow));

    void _ssdm_SpecStream() __attribute__ ((nothrow));

    void _ssdm_op_SpecStable() __attribute__ ((nothrow));
    void _ssdm_op_SpecStableContent() __attribute__ ((nothrow));

    void _ssdm_op_SpecBindPort() __attribute__ ((nothrow));

    void _ssdm_op_SpecPipoDepth() __attribute__ ((nothrow));

    void _ssdm_SpecExpr() __attribute__ ((nothrow));
    void _ssdm_SpecExprBalance() __attribute__ ((nothrow));

    void _ssdm_SpecDependence() __attribute__ ((nothrow));

    void _ssdm_SpecLoopMerge() __attribute__ ((nothrow));
    void _ssdm_SpecLoopFlatten() __attribute__ ((nothrow));
    void _ssdm_SpecLoopRewind() __attribute__ ((nothrow));

    void _ssdm_SpecFuncInstantiation() __attribute__ ((nothrow));
    void _ssdm_SpecFuncBuffer() __attribute__ ((nothrow));
    void _ssdm_SpecFuncExtract() __attribute__ ((nothrow));
    void _ssdm_SpecConstant() __attribute__ ((nothrow));

    void _ssdm_DataPack() __attribute__ ((nothrow));
    void _ssdm_SpecDataPack() __attribute__ ((nothrow));

    void _ssdm_op_SpecBitsMap() __attribute__ ((nothrow));
    void _ssdm_op_SpecLicense() __attribute__ ((nothrow));
# 2 "<built-in>" 2
# 1 "MeanShiftFilter.c" 2
# 1 "./MeanShiftFilter.h" 1
# 10 "./MeanShiftFilter.h"
typedef unsigned char u8;
typedef unsigned int u32;
typedef unsigned short int u16;

typedef struct {
    unsigned char r, g, b;
} Pixel;

__attribute__((sdx_kernel("MeanShiftFiltering", 0))) char MeanShiftFiltering(Pixel* in,Pixel* out,u32 ImageWidth,
    u32 ImageHeight, char sd, char cd, u8 max_iter);
# 2 "MeanShiftFilter.c" 2

__attribute__((sdx_kernel("MeanShiftFiltering", 0))) char MeanShiftFiltering(Pixel* in,Pixel* out,u32 ImageWidth,
    u32 ImageHeight, char sd, char cd, u8 max_iter){
#line 19 "/home/dell3561-49/Vitis_HLS_folder/MeanShiftFilter/MeanShiftFilter/solution1/csynth.tcl"
#pragma HLSDIRECTIVE TOP name=MeanShiftFiltering
# 4 "MeanShiftFilter.c"

#pragma HLS PIPELINE
#pragma HLS ARRAY_PARTITION variable=in complete
#pragma HLS ARRAY_PARTITION variable=out complete
 float thresHold = 0.1f;
        float sum_b = 0,sum_g = 0,sum_r = 0;
        u8 pixel_cnt = 0;
        float CENTER_b,CENTER_g,CENTER_r;
        float CURRENT_b,CURRENT_g,CURRENT_r;
        float MEAN_b,MEAN_g,MEAN_r;
        height_loop : for(int y=0; y < ImageHeight;++y) {
            width_loop : for (int x=0; x < ImageWidth;++x){
                CENTER_b = in[x+y*ImageHeight].b;
                CENTER_g = in[x+y*ImageHeight].g;
                CENTER_r = in[x+y*ImageHeight].r;

                u8 iter_numb = 0;
                float THRES_HOLD_DIST_SQ = 0.0f;

                do_while_loop : do {
                    pixel_cnt = 0;
                    sum_b = 0;
                    sum_g = 0;
                    sum_r = 0;
                    VITIS_LOOP_28_1: for(int dy=-sd;dy<=sd;++dy){
                        VITIS_LOOP_29_2: for(int dx=-sd;dx<=sd;++dx){

                            if((dy)*(dy) + (dx)*(dx) > sd*sd){
                                continue;
                            }
                            int xi = x + dx;
                            int yi = y + dy;


                            if (dy < 0 || dy >= ImageHeight || dx < 0 || dx >= ImageWidth){
                                continue;
                            }

                            CURRENT_b = in[xi+yi*ImageHeight].b;
                            CURRENT_g = in[xi+yi*ImageHeight].g;
                            CURRENT_r = in[xi+yi*ImageHeight].r;
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
                    if (pixel_cnt == 0){
                        break;}

                    MEAN_b = sum_b/pixel_cnt;
                    MEAN_g = sum_g/pixel_cnt;
                    MEAN_r = sum_r/pixel_cnt;

                    iter_numb++;
                    THRES_HOLD_DIST_SQ = (MEAN_b-CENTER_b)*(MEAN_b-CENTER_b)+
                                             (MEAN_g-CENTER_g)*(MEAN_g-CENTER_g)+
                                             (MEAN_r-CENTER_r)*(MEAN_r-CENTER_r);


                    CENTER_b = MEAN_b;
                    CENTER_g = MEAN_g;
                    CENTER_r = MEAN_r;


                }while ( (iter_numb <= max_iter) || THRES_HOLD_DIST_SQ >thresHold);


                out[x+y*ImageHeight].b = (u8)(CENTER_b + 0.5f);
                out[x+y*ImageHeight].g = (u8)(CENTER_g + 0.5f);
                out[x+y*ImageHeight].r = (u8)(CENTER_r + 0.5f);
            }
    }
    return 0;
}
