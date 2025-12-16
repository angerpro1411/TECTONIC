set SynModuleInfo {
  {SRCNAME BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1 MODELNAME BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1 RTLNAME BackGrRemoval_stream_v2_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1
    SUBMODULES {
      {MODELNAME BackGrRemoval_stream_v2_sdiv_16ns_9ns_16_20_1 RTLNAME BackGrRemoval_stream_v2_sdiv_16ns_9ns_16_20_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 19 ALLOW_PRAGMA 1}
      {MODELNAME BackGrRemoval_stream_v2_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_BackGrRemoval_stream_v2_strebkb RTLNAME BackGrRemoval_stream_v2_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_BackGrRemoval_stream_v2_strebkb BINDTYPE storage TYPE ram_1p IMPL bram LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME BackGrRemoval_stream_v2 MODELNAME BackGrRemoval_stream_v2 RTLNAME BackGrRemoval_stream_v2 IS_TOP 1
    SUBMODULES {
      {MODELNAME BackGrRemoval_stream_v2_mul_32s_32s_32_2_1 RTLNAME BackGrRemoval_stream_v2_mul_32s_32s_32_2_1 BINDTYPE op TYPE mul IMPL auto LATENCY 1 ALLOW_PRAGMA 1}
      {MODELNAME BackGrRemoval_stream_v2_control_s_axi RTLNAME BackGrRemoval_stream_v2_control_s_axi BINDTYPE interface TYPE interface_s_axilite}
      {MODELNAME BackGrRemoval_stream_v2_regslice_both RTLNAME BackGrRemoval_stream_v2_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME BackGrRemoval_stream_v2_regslice_both_U}
    }
  }
}
