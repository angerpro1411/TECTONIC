// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Wed Dec 10 10:10:19 2025
// Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_INTEGRATED_VGA_COMPO_0_0_stub.v
// Design      : design_1_INTEGRATED_VGA_COMPO_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "INTEGRATED_VGA_COMPONENT_WRAP_VHDL,Vivado 2023.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(i_CLK, i_RSTn, S_AXIS_VALID, S_AXIS_READY, 
  S_AXIS_DATA, HSYNC, VSYNC, OUT_VGA)
/* synthesis syn_black_box black_box_pad_pin="i_RSTn,S_AXIS_VALID,S_AXIS_READY,S_AXIS_DATA[7:0],HSYNC,VSYNC,OUT_VGA[11:0]" */
/* synthesis syn_force_seq_prim="i_CLK" */;
  input i_CLK /* synthesis syn_isclock = 1 */;
  input i_RSTn;
  input S_AXIS_VALID;
  output S_AXIS_READY;
  input [7:0]S_AXIS_DATA;
  output HSYNC;
  output VSYNC;
  output [11:0]OUT_VGA;
endmodule
