set SynModuleInfo {
  {SRCNAME Loop_row_loop_proc1 MODELNAME Loop_row_loop_proc1 RTLNAME BackGrRemovalStream_Loop_row_loop_proc1
    SUBMODULES {
      {MODELNAME BackGrRemovalStream_sdiv_16ns_9ns_16_20_1 RTLNAME BackGrRemovalStream_sdiv_16ns_9ns_16_20_1 BINDTYPE op TYPE sdiv IMPL auto LATENCY 19 ALLOW_PRAGMA 1}
      {MODELNAME BackGrRemovalStream_Loop_row_loop_proc1_BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ulbkb RTLNAME BackGrRemovalStream_Loop_row_loop_proc1_BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ulbkb BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME BackGrRemovalStream_Loop_row_loop_proc1_BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ulcud RTLNAME BackGrRemovalStream_Loop_row_loop_proc1_BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ulcud BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME BackGrRemovalStream_regslice_both RTLNAME BackGrRemovalStream_regslice_both BINDTYPE interface TYPE interface_regslice INSTNAME BackGrRemovalStream_regslice_both_U}
      {MODELNAME BackGrRemovalStream_flow_control_loop_pipe RTLNAME BackGrRemovalStream_flow_control_loop_pipe BINDTYPE interface TYPE internal_upc_flow_control INSTNAME BackGrRemovalStream_flow_control_loop_pipe_U}
    }
  }
  {SRCNAME BackGrRemovalStream MODELNAME BackGrRemovalStream RTLNAME BackGrRemovalStream IS_TOP 1}
}
