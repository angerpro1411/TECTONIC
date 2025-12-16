set SynModuleInfo {
  {SRCNAME MeanShiftFiltering MODELNAME MeanShiftFiltering RTLNAME MeanShiftFiltering IS_TOP 1
    SUBMODULES {
      {MODELNAME MeanShiftFiltering_faddfsub_32ns_32ns_32_5_full_dsp_1 RTLNAME MeanShiftFiltering_faddfsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME MeanShiftFiltering_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME MeanShiftFiltering_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_fdiv_32ns_32ns_32_12_no_dsp_1 RTLNAME MeanShiftFiltering_fdiv_32ns_32ns_32_12_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 11 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_uitofp_32ns_32_5_no_dsp_1 RTLNAME MeanShiftFiltering_uitofp_32ns_32_5_no_dsp_1 BINDTYPE op TYPE uitofp IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_sitofp_32s_32_5_no_dsp_1 RTLNAME MeanShiftFiltering_sitofp_32s_32_5_no_dsp_1 BINDTYPE op TYPE sitofp IMPL auto LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME MeanShiftFiltering_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_mul_32s_32s_32_1_1 RTLNAME MeanShiftFiltering_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_mul_8s_8s_16_1_1 RTLNAME MeanShiftFiltering_mul_8s_8s_16_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
    }
  }
}
