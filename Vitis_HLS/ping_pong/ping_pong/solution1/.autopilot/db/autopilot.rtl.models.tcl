set SynModuleInfo {
  {SRCNAME algo_Pipeline_REMAINDER_LOOP MODELNAME algo_Pipeline_REMAINDER_LOOP RTLNAME algo_algo_Pipeline_REMAINDER_LOOP
    SUBMODULES {
      {MODELNAME algo_mux_2_1_8_1_1 RTLNAME algo_mux_2_1_8_1_1 BINDTYPE op TYPE mux IMPL auto LATENCY 0 ALLOW_PRAGMA 1}
      {MODELNAME algo_urem_8ns_5ns_4_12_1 RTLNAME algo_urem_8ns_5ns_4_12_1 BINDTYPE op TYPE urem IMPL auto LATENCY 11 ALLOW_PRAGMA 1}
      {MODELNAME algo_flow_control_loop_pipe_sequential_init RTLNAME algo_flow_control_loop_pipe_sequential_init BINDTYPE interface TYPE internal_upc_flow_control INSTNAME algo_flow_control_loop_pipe_sequential_init_U}
    }
  }
  {SRCNAME algo_Pipeline_ADD_LOOP MODELNAME algo_Pipeline_ADD_LOOP RTLNAME algo_algo_Pipeline_ADD_LOOP}
  {SRCNAME algo_Pipeline_MUL2ADD1_LOOP MODELNAME algo_Pipeline_MUL2ADD1_LOOP RTLNAME algo_algo_Pipeline_MUL2ADD1_LOOP}
  {SRCNAME algo_Pipeline_DIVISION_LOOP MODELNAME algo_Pipeline_DIVISION_LOOP RTLNAME algo_algo_Pipeline_DIVISION_LOOP
    SUBMODULES {
      {MODELNAME algo_udiv_5ns_3ns_5_9_1 RTLNAME algo_udiv_5ns_3ns_5_9_1 BINDTYPE op TYPE udiv IMPL auto LATENCY 8 ALLOW_PRAGMA 1}
    }
  }
  {SRCNAME algo MODELNAME algo RTLNAME algo IS_TOP 1
    SUBMODULES {
      {MODELNAME algo_a_RAM_AUTO_1R1W RTLNAME algo_a_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME algo_b_RAM_AUTO_1R1W RTLNAME algo_b_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME algo_c_RAM_AUTO_1R1W RTLNAME algo_c_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
      {MODELNAME algo_d_RAM_AUTO_1R1W RTLNAME algo_d_RAM_AUTO_1R1W BINDTYPE storage TYPE ram IMPL auto LATENCY 2 ALLOW_PRAGMA 1}
    }
  }
}
