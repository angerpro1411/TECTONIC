// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Wed Dec 10 10:11:02 2025
// Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_BackGrRemovalStream_0_0_stub.v
// Design      : design_1_BackGrRemovalStream_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "BackGrRemovalStream,Vivado 2023.1" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(input_stream_TVALID, input_stream_TREADY, 
  input_stream_TDATA, input_stream_TKEEP, input_stream_TSTRB, input_stream_TUSER, 
  input_stream_TLAST, input_stream_TID, input_stream_TDEST, output_stream_TVALID, 
  output_stream_TREADY, output_stream_TDATA, output_stream_TKEEP, output_stream_TSTRB, 
  output_stream_TUSER, output_stream_TLAST, output_stream_TID, output_stream_TDEST, ap_clk, 
  ap_rst_n)
/* synthesis syn_black_box black_box_pad_pin="input_stream_TVALID,input_stream_TREADY,input_stream_TDATA[23:0],input_stream_TKEEP[2:0],input_stream_TSTRB[2:0],input_stream_TUSER[0:0],input_stream_TLAST[0:0],input_stream_TID[0:0],input_stream_TDEST[0:0],output_stream_TVALID,output_stream_TREADY,output_stream_TDATA[23:0],output_stream_TKEEP[2:0],output_stream_TSTRB[2:0],output_stream_TUSER[0:0],output_stream_TLAST[0:0],output_stream_TID[0:0],output_stream_TDEST[0:0],ap_rst_n" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  input input_stream_TVALID;
  output input_stream_TREADY;
  input [23:0]input_stream_TDATA;
  input [2:0]input_stream_TKEEP;
  input [2:0]input_stream_TSTRB;
  input [0:0]input_stream_TUSER;
  input [0:0]input_stream_TLAST;
  input [0:0]input_stream_TID;
  input [0:0]input_stream_TDEST;
  output output_stream_TVALID;
  input output_stream_TREADY;
  output [23:0]output_stream_TDATA;
  output [2:0]output_stream_TKEEP;
  output [2:0]output_stream_TSTRB;
  output [0:0]output_stream_TUSER;
  output [0:0]output_stream_TLAST;
  output [0:0]output_stream_TID;
  output [0:0]output_stream_TDEST;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst_n;
endmodule
