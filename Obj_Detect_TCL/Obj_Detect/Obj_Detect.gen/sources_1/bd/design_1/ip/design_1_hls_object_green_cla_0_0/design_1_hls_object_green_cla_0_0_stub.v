// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Wed Dec 10 10:11:30 2025
// Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/dell3561-49/Obj_Detect_TCL/Obj_Detect/Obj_Detect.gen/sources_1/bd/design_1/ip/design_1_hls_object_green_cla_0_0/design_1_hls_object_green_cla_0_0_stub.v
// Design      : design_1_hls_object_green_cla_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "hls_object_green_classification,Vivado 2023.1" *)
module design_1_hls_object_green_cla_0_0(s_axi_CTRL_AWADDR, s_axi_CTRL_AWVALID, 
  s_axi_CTRL_AWREADY, s_axi_CTRL_WDATA, s_axi_CTRL_WSTRB, s_axi_CTRL_WVALID, 
  s_axi_CTRL_WREADY, s_axi_CTRL_BRESP, s_axi_CTRL_BVALID, s_axi_CTRL_BREADY, 
  s_axi_CTRL_ARADDR, s_axi_CTRL_ARVALID, s_axi_CTRL_ARREADY, s_axi_CTRL_RDATA, 
  s_axi_CTRL_RRESP, s_axi_CTRL_RVALID, s_axi_CTRL_RREADY, ap_clk, ap_rst_n, interrupt, 
  in_stream_TVALID, in_stream_TREADY, in_stream_TDATA, in_stream_TDEST, in_stream_TKEEP, 
  in_stream_TSTRB, in_stream_TUSER, in_stream_TLAST, in_stream_TID, out_stream_TVALID, 
  out_stream_TREADY, out_stream_TDATA, out_stream_TDEST, out_stream_TKEEP, 
  out_stream_TSTRB, out_stream_TUSER, out_stream_TLAST, out_stream_TID)
/* synthesis syn_black_box black_box_pad_pin="s_axi_CTRL_AWADDR[7:0],s_axi_CTRL_AWVALID,s_axi_CTRL_AWREADY,s_axi_CTRL_WDATA[31:0],s_axi_CTRL_WSTRB[3:0],s_axi_CTRL_WVALID,s_axi_CTRL_WREADY,s_axi_CTRL_BRESP[1:0],s_axi_CTRL_BVALID,s_axi_CTRL_BREADY,s_axi_CTRL_ARADDR[7:0],s_axi_CTRL_ARVALID,s_axi_CTRL_ARREADY,s_axi_CTRL_RDATA[31:0],s_axi_CTRL_RRESP[1:0],s_axi_CTRL_RVALID,s_axi_CTRL_RREADY,ap_rst_n,interrupt,in_stream_TVALID,in_stream_TREADY,in_stream_TDATA[23:0],in_stream_TDEST[0:0],in_stream_TKEEP[2:0],in_stream_TSTRB[2:0],in_stream_TUSER[0:0],in_stream_TLAST[0:0],in_stream_TID[0:0],out_stream_TVALID,out_stream_TREADY,out_stream_TDATA[23:0],out_stream_TDEST[0:0],out_stream_TKEEP[2:0],out_stream_TSTRB[2:0],out_stream_TUSER[0:0],out_stream_TLAST[0:0],out_stream_TID[0:0]" */
/* synthesis syn_force_seq_prim="ap_clk" */;
  input [7:0]s_axi_CTRL_AWADDR;
  input s_axi_CTRL_AWVALID;
  output s_axi_CTRL_AWREADY;
  input [31:0]s_axi_CTRL_WDATA;
  input [3:0]s_axi_CTRL_WSTRB;
  input s_axi_CTRL_WVALID;
  output s_axi_CTRL_WREADY;
  output [1:0]s_axi_CTRL_BRESP;
  output s_axi_CTRL_BVALID;
  input s_axi_CTRL_BREADY;
  input [7:0]s_axi_CTRL_ARADDR;
  input s_axi_CTRL_ARVALID;
  output s_axi_CTRL_ARREADY;
  output [31:0]s_axi_CTRL_RDATA;
  output [1:0]s_axi_CTRL_RRESP;
  output s_axi_CTRL_RVALID;
  input s_axi_CTRL_RREADY;
  input ap_clk /* synthesis syn_isclock = 1 */;
  input ap_rst_n;
  output interrupt;
  input in_stream_TVALID;
  output in_stream_TREADY;
  input [23:0]in_stream_TDATA;
  input [0:0]in_stream_TDEST;
  input [2:0]in_stream_TKEEP;
  input [2:0]in_stream_TSTRB;
  input [0:0]in_stream_TUSER;
  input [0:0]in_stream_TLAST;
  input [0:0]in_stream_TID;
  output out_stream_TVALID;
  input out_stream_TREADY;
  output [23:0]out_stream_TDATA;
  output [0:0]out_stream_TDEST;
  output [2:0]out_stream_TKEEP;
  output [2:0]out_stream_TSTRB;
  output [0:0]out_stream_TUSER;
  output [0:0]out_stream_TLAST;
  output [0:0]out_stream_TID;
endmodule
