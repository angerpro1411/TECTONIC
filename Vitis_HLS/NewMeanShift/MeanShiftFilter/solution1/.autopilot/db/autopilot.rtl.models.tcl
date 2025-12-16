set SynModuleInfo {
  {SRCNAME MeanShiftFiltering MODELNAME MeanShiftFiltering RTLNAME MeanShiftFiltering IS_TOP 1
    SUBMODULES {
      {MODELNAME MeanShiftFiltering_mul_32ns_32ns_64_1_1 RTLNAME MeanShiftFiltering_mul_32ns_32ns_64_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_mul_32s_32s_32_1_1 RTLNAME MeanShiftFiltering_mul_32s_32s_32_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_mul_8ns_8ns_16_1_1 RTLNAME MeanShiftFiltering_mul_8ns_8ns_16_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_mul_16s_16s_24_1_1 RTLNAME MeanShiftFiltering_mul_16s_16s_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_udiv_32s_32ns_16_36_1 RTLNAME MeanShiftFiltering_udiv_32s_32ns_16_36_1 BINDTYPE op TYPE udiv IMPL auto LATENCY 35 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_mul_17s_17s_24_1_1 RTLNAME MeanShiftFiltering_mul_17s_17s_24_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_mac_muladd_16s_16s_24s_24_4_1 RTLNAME MeanShiftFiltering_mac_muladd_16s_16s_24s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_mac_muladd_16s_16s_24ns_24_4_1 RTLNAME MeanShiftFiltering_mac_muladd_16s_16s_24ns_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_mac_muladd_17s_17s_24s_24_4_1 RTLNAME MeanShiftFiltering_mac_muladd_17s_17s_24s_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME MeanShiftFiltering_mac_muladd_17s_17s_24ns_24_4_1 RTLNAME MeanShiftFiltering_mac_muladd_17s_17s_24ns_24_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
    }
  }
}
