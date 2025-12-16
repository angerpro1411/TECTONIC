set SynModuleInfo {
  {SRCNAME LinearLine MODELNAME LinearLine RTLNAME ContourApproximation_LinearLine
    SUBMODULES {
      {MODELNAME ContourApproximation_fsub_32ns_32ns_32_5_full_dsp_1 RTLNAME ContourApproximation_fsub_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fsub IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
      {MODELNAME ContourApproximation_fmul_32ns_32ns_32_4_max_dsp_1 RTLNAME ContourApproximation_fmul_32ns_32ns_32_4_max_dsp_1 BINDTYPE op TYPE fmul IMPL maxdsp LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME ContourApproximation_fdiv_32ns_32ns_32_12_no_dsp_1 RTLNAME ContourApproximation_fdiv_32ns_32ns_32_12_no_dsp_1 BINDTYPE op TYPE fdiv IMPL fabric LATENCY 11 ALLOW_PRAGMA 1}
      {MODELNAME ContourApproximation_fcmp_32ns_32ns_1_2_no_dsp_1 RTLNAME ContourApproximation_fcmp_32ns_32ns_1_2_no_dsp_1 BINDTYPE op TYPE fcmp IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME Distance_Point_Line_Square MODELNAME Distance_Point_Line_Square RTLNAME ContourApproximation_Distance_Point_Line_Square
    SUBMODULES {
      {MODELNAME ContourApproximation_fadd_32ns_32ns_32_5_full_dsp_1 RTLNAME ContourApproximation_fadd_32ns_32ns_32_5_full_dsp_1 BINDTYPE op TYPE fadd IMPL fulldsp LATENCY 4 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME ContourApproximation_Pipeline_CHECK_DIFFER_LOOP MODELNAME ContourApproximation_Pipeline_CHECK_DIFFER_LOOP RTLNAME ContourApproximation_ContourApproximation_Pipeline_CHECK_DIFFER_LOOP}
  {SRCNAME ContourApproximation_Pipeline_WRITE_BACK MODELNAME ContourApproximation_Pipeline_WRITE_BACK RTLNAME ContourApproximation_ContourApproximation_Pipeline_WRITE_BACK}
  {SRCNAME ContourApproximation MODELNAME ContourApproximation RTLNAME ContourApproximation IS_TOP 1}
}
