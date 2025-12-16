set SynModuleInfo {
  {SRCNAME sobel_rgb_green_outline_fixed MODELNAME sobel_rgb_green_outline_fixed RTLNAME sobel_rgb_green_outline_fixed IS_TOP 1
    SUBMODULES {
      {MODELNAME sobel_rgb_green_outline_fixed_mul_41ns_43ns_56_3_1 RTLNAME sobel_rgb_green_outline_fixed_mul_41ns_43ns_56_3_1 BINDTYPE op TYPE mul IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME sobel_rgb_green_outline_fixed_mul_8ns_7ns_14_1_1 RTLNAME sobel_rgb_green_outline_fixed_mul_8ns_7ns_14_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME sobel_rgb_green_outline_fixed_mux_2_1_8_1_1 RTLNAME sobel_rgb_green_outline_fixed_mux_2_1_8_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME sobel_rgb_green_outline_fixed_mul_11s_11s_21_1_1 RTLNAME sobel_rgb_green_outline_fixed_mul_11s_11s_21_1_1 BINDTYPE op TYPE mul IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME sobel_rgb_green_outline_fixed_mac_muladd_8ns_4ns_14ns_41_4_1 RTLNAME sobel_rgb_green_outline_fixed_mac_muladd_8ns_4ns_14ns_41_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME sobel_rgb_green_outline_fixed_mac_muladd_11s_11s_21s_21_4_1 RTLNAME sobel_rgb_green_outline_fixed_mac_muladd_11s_11s_21s_21_4_1 BINDTYPE op TYPE all IMPL dsp48 LATENCY 3 ALLOW_PRAGMA 1}
      {MODELNAME sobel_rgb_green_outline_fixed_sobel_rgb_green_outline_fixed_stream_stream_axis_0_linebuf_1_RAM_AUTO_1R1W RTLNAME sobel_rgb_green_outline_fixed_sobel_rgb_green_outline_fixed_stream_stream_axis_0_linebuf_1_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME sobel_rgb_green_outline_fixed_regslice_both RTLNAME sobel_rgb_green_outline_fixed_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME sobel_rgb_green_outline_fixed_regslice_both_U}
      {MODELNAME sobel_rgb_green_outline_fixed_flow_control_loop_pipe_no_ap_cont RTLNAME sobel_rgb_green_outline_fixed_flow_control_loop_pipe_no_ap_cont BINDTYPE interface TYPE internal_upc_flow_control INSTNAME sobel_rgb_green_outline_fixed_flow_control_loop_pipe_no_ap_cont_U}
    }
  }
}
