// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Wed Dec 10 10:10:20 2025
// Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/dell3561-49/Obj_Detect_TCL/Obj_Detect/Obj_Detect.gen/sources_1/bd/design_1/ip/design_1_INTEGRATED_VGA_COMPO_0_0/design_1_INTEGRATED_VGA_COMPO_0_0_sim_netlist.v
// Design      : design_1_INTEGRATED_VGA_COMPO_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_INTEGRATED_VGA_COMPO_0_0,INTEGRATED_VGA_COMPONENT_WRAP_VHDL,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "INTEGRATED_VGA_COMPONENT_WRAP_VHDL,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module design_1_INTEGRATED_VGA_COMPO_0_0
   (i_CLK,
    i_RSTn,
    S_AXIS_VALID,
    S_AXIS_READY,
    S_AXIS_DATA,
    HSYNC,
    VSYNC,
    OUT_VGA);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 i_CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME i_CLK, ASSOCIATED_RESET i_RSTn, FREQ_HZ 100000000, ASSOCIATED_BUSIF S_AXIS, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input i_CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 i_RSTn RST" *) (* x_interface_parameter = "XIL_INTERFACENAME i_RSTn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_RSTn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input S_AXIS_VALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output S_AXIS_READY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [7:0]S_AXIS_DATA;
  output HSYNC;
  output VSYNC;
  output [11:0]OUT_VGA;

  wire HSYNC;
  wire [11:0]OUT_VGA;
  wire [7:0]S_AXIS_DATA;
  wire S_AXIS_READY;
  wire S_AXIS_VALID;
  wire VSYNC;
  wire i_CLK;
  wire i_RSTn;

  design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT_WRAP_VHDL U0
       (.HSYNC(HSYNC),
        .OUT_VGA(OUT_VGA),
        .S_AXIS_DATA(S_AXIS_DATA[7:4]),
        .S_AXIS_READY(S_AXIS_READY),
        .S_AXIS_VALID(S_AXIS_VALID),
        .VSYNC(VSYNC),
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn));
endmodule

(* ORIG_REF_NAME = "FIFO_CONTROLLER" *) 
module design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_CONTROLLER
   (EMPTY_REG_reg_0,
    FULL_REG_reg_0,
    Q,
    \RD_ADDR_REG_reg[9]_0 ,
    S_AXIS_READY,
    i_CLK,
    SR,
    WR_FIFO,
    \RD_ADDR_REG_reg[9]_1 ,
    RD_FIFO);
  output EMPTY_REG_reg_0;
  output FULL_REG_reg_0;
  output [9:0]Q;
  output [9:0]\RD_ADDR_REG_reg[9]_0 ;
  output S_AXIS_READY;
  input i_CLK;
  input [0:0]SR;
  input WR_FIFO;
  input \RD_ADDR_REG_reg[9]_1 ;
  input RD_FIFO;

  wire EMPTY_NX0;
  wire EMPTY_NX0_carry_i_1_n_0;
  wire EMPTY_NX0_carry_i_2_n_0;
  wire EMPTY_NX0_carry_i_3_n_0;
  wire EMPTY_NX0_carry_i_4_n_0;
  wire EMPTY_NX0_carry_i_5_n_0;
  wire EMPTY_NX0_carry_i_6_n_0;
  wire EMPTY_NX0_carry_n_1;
  wire EMPTY_NX0_carry_n_2;
  wire EMPTY_NX0_carry_n_3;
  wire EMPTY_REG_i_1_n_0;
  wire EMPTY_REG_reg_0;
  wire FULL_NX0;
  wire FULL_NX0_carry_i_1_n_0;
  wire FULL_NX0_carry_i_2_n_0;
  wire FULL_NX0_carry_i_3_n_0;
  wire FULL_NX0_carry_i_4_n_0;
  wire FULL_NX0_carry_i_5_n_0;
  wire FULL_NX0_carry_i_6_n_0;
  wire FULL_NX0_carry_i_7_n_0;
  wire FULL_NX0_carry_n_1;
  wire FULL_NX0_carry_n_2;
  wire FULL_NX0_carry_n_3;
  wire FULL_REG_i_1_n_0;
  wire FULL_REG_reg_0;
  wire [9:0]Q;
  wire [9:0]RD_ADDR_NX;
  wire \RD_ADDR_REG[5]_i_2_n_0 ;
  wire \RD_ADDR_REG[9]_i_2_n_0 ;
  wire [9:0]\RD_ADDR_REG_reg[9]_0 ;
  wire \RD_ADDR_REG_reg[9]_1 ;
  wire RD_FIFO;
  wire [0:0]SR;
  wire S_AXIS_READY;
  wire [9:1]WR_ADDR_NX;
  wire \WR_ADDR_REG[0]_i_1_n_0 ;
  wire \WR_ADDR_REG[4]_i_2_n_0 ;
  wire \WR_ADDR_REG[5]_i_1_n_0 ;
  wire \WR_ADDR_REG[6]_i_1_n_0 ;
  wire \WR_ADDR_REG[8]_i_2_n_0 ;
  wire \WR_ADDR_REG[9]_i_2_n_0 ;
  wire WR_FIFO;
  wire i_CLK;
  wire [3:0]NLW_EMPTY_NX0_carry_O_UNCONNECTED;
  wire [3:0]NLW_FULL_NX0_carry_O_UNCONNECTED;

  CARRY4 EMPTY_NX0_carry
       (.CI(1'b0),
        .CO({EMPTY_NX0,EMPTY_NX0_carry_n_1,EMPTY_NX0_carry_n_2,EMPTY_NX0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_EMPTY_NX0_carry_O_UNCONNECTED[3:0]),
        .S({EMPTY_NX0_carry_i_1_n_0,EMPTY_NX0_carry_i_2_n_0,EMPTY_NX0_carry_i_3_n_0,EMPTY_NX0_carry_i_4_n_0}));
  LUT4 #(
    .INIT(16'h6A95)) 
    EMPTY_NX0_carry_i_1
       (.I0(Q[9]),
        .I1(EMPTY_NX0_carry_i_5_n_0),
        .I2(\RD_ADDR_REG_reg[9]_0 [8]),
        .I3(\RD_ADDR_REG_reg[9]_0 [9]),
        .O(EMPTY_NX0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    EMPTY_NX0_carry_i_2
       (.I0(RD_ADDR_NX[6]),
        .I1(Q[6]),
        .I2(Q[8]),
        .I3(RD_ADDR_NX[8]),
        .I4(Q[7]),
        .I5(RD_ADDR_NX[7]),
        .O(EMPTY_NX0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    EMPTY_NX0_carry_i_3
       (.I0(RD_ADDR_NX[5]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(RD_ADDR_NX[4]),
        .I4(Q[3]),
        .I5(RD_ADDR_NX[3]),
        .O(EMPTY_NX0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h0041410014000041)) 
    EMPTY_NX0_carry_i_4
       (.I0(EMPTY_NX0_carry_i_6_n_0),
        .I1(Q[1]),
        .I2(\RD_ADDR_REG_reg[9]_0 [1]),
        .I3(\RD_ADDR_REG_reg[9]_0 [0]),
        .I4(\RD_ADDR_REG_reg[9]_1 ),
        .I5(Q[0]),
        .O(EMPTY_NX0_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'h00002000)) 
    EMPTY_NX0_carry_i_5
       (.I0(\RD_ADDR_REG_reg[9]_0 [7]),
        .I1(\RD_ADDR_REG[9]_i_2_n_0 ),
        .I2(\RD_ADDR_REG_reg[9]_0 [6]),
        .I3(RD_FIFO),
        .I4(EMPTY_REG_reg_0),
        .O(EMPTY_NX0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h655555559AAAAAAA)) 
    EMPTY_NX0_carry_i_6
       (.I0(Q[2]),
        .I1(EMPTY_REG_reg_0),
        .I2(RD_FIFO),
        .I3(\RD_ADDR_REG_reg[9]_0 [0]),
        .I4(\RD_ADDR_REG_reg[9]_0 [1]),
        .I5(\RD_ADDR_REG_reg[9]_0 [2]),
        .O(EMPTY_NX0_carry_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT5 #(
    .INIT(32'hFF005540)) 
    EMPTY_REG_i_1
       (.I0(WR_FIFO),
        .I1(RD_FIFO),
        .I2(EMPTY_NX0),
        .I3(EMPTY_REG_reg_0),
        .I4(FULL_REG_reg_0),
        .O(EMPTY_REG_i_1_n_0));
  FDPE EMPTY_REG_reg
       (.C(i_CLK),
        .CE(1'b1),
        .D(EMPTY_REG_i_1_n_0),
        .PRE(SR),
        .Q(EMPTY_REG_reg_0));
  CARRY4 FULL_NX0_carry
       (.CI(1'b0),
        .CO({FULL_NX0,FULL_NX0_carry_n_1,FULL_NX0_carry_n_2,FULL_NX0_carry_n_3}),
        .CYINIT(1'b1),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(NLW_FULL_NX0_carry_O_UNCONNECTED[3:0]),
        .S({FULL_NX0_carry_i_1_n_0,FULL_NX0_carry_i_2_n_0,FULL_NX0_carry_i_3_n_0,FULL_NX0_carry_i_4_n_0}));
  LUT4 #(
    .INIT(16'h6A95)) 
    FULL_NX0_carry_i_1
       (.I0(\RD_ADDR_REG_reg[9]_0 [9]),
        .I1(Q[8]),
        .I2(FULL_NX0_carry_i_5_n_0),
        .I3(Q[9]),
        .O(FULL_NX0_carry_i_1_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    FULL_NX0_carry_i_2
       (.I0(WR_ADDR_NX[8]),
        .I1(\RD_ADDR_REG_reg[9]_0 [8]),
        .I2(\RD_ADDR_REG_reg[9]_0 [7]),
        .I3(WR_ADDR_NX[7]),
        .I4(\RD_ADDR_REG_reg[9]_0 [6]),
        .I5(\WR_ADDR_REG[6]_i_1_n_0 ),
        .O(FULL_NX0_carry_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000006909009)) 
    FULL_NX0_carry_i_3
       (.I0(Q[5]),
        .I1(\RD_ADDR_REG_reg[9]_0 [5]),
        .I2(\RD_ADDR_REG_reg[9]_0 [4]),
        .I3(\WR_ADDR_REG[8]_i_2_n_0 ),
        .I4(Q[4]),
        .I5(FULL_NX0_carry_i_6_n_0),
        .O(FULL_NX0_carry_i_3_n_0));
  LUT6 #(
    .INIT(64'h4010014004011004)) 
    FULL_NX0_carry_i_4
       (.I0(FULL_NX0_carry_i_7_n_0),
        .I1(\RD_ADDR_REG_reg[9]_0 [0]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(\WR_ADDR_REG[4]_i_2_n_0 ),
        .I5(\RD_ADDR_REG_reg[9]_0 [1]),
        .O(FULL_NX0_carry_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h80000000)) 
    FULL_NX0_carry_i_5
       (.I0(Q[7]),
        .I1(\WR_ADDR_REG[8]_i_2_n_0 ),
        .I2(Q[4]),
        .I3(Q[5]),
        .I4(Q[6]),
        .O(FULL_NX0_carry_i_5_n_0));
  LUT6 #(
    .INIT(64'h655555559AAAAAAA)) 
    FULL_NX0_carry_i_6
       (.I0(\RD_ADDR_REG_reg[9]_0 [3]),
        .I1(\WR_ADDR_REG[4]_i_2_n_0 ),
        .I2(Q[2]),
        .I3(Q[1]),
        .I4(Q[0]),
        .I5(Q[3]),
        .O(FULL_NX0_carry_i_6_n_0));
  LUT6 #(
    .INIT(64'h59555555A6AAAAAA)) 
    FULL_NX0_carry_i_7
       (.I0(\RD_ADDR_REG_reg[9]_0 [2]),
        .I1(WR_FIFO),
        .I2(FULL_REG_reg_0),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(FULL_NX0_carry_i_7_n_0));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h8B8A8A8A)) 
    FULL_REG_i_1
       (.I0(FULL_REG_reg_0),
        .I1(EMPTY_REG_reg_0),
        .I2(RD_FIFO),
        .I3(FULL_NX0),
        .I4(WR_FIFO),
        .O(FULL_REG_i_1_n_0));
  FDCE FULL_REG_reg
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(FULL_REG_i_1_n_0),
        .Q(FULL_REG_reg_0));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \RD_ADDR_REG[0]_i_1 
       (.I0(\RD_ADDR_REG_reg[9]_0 [0]),
        .I1(EMPTY_REG_reg_0),
        .I2(RD_FIFO),
        .O(RD_ADDR_NX[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'hAA6A)) 
    \RD_ADDR_REG[1]_i_1 
       (.I0(\RD_ADDR_REG_reg[9]_0 [1]),
        .I1(\RD_ADDR_REG_reg[9]_0 [0]),
        .I2(RD_FIFO),
        .I3(EMPTY_REG_reg_0),
        .O(RD_ADDR_NX[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT5 #(
    .INIT(32'hAAAA6AAA)) 
    \RD_ADDR_REG[2]_i_1 
       (.I0(\RD_ADDR_REG_reg[9]_0 [2]),
        .I1(\RD_ADDR_REG_reg[9]_0 [1]),
        .I2(\RD_ADDR_REG_reg[9]_0 [0]),
        .I3(RD_FIFO),
        .I4(EMPTY_REG_reg_0),
        .O(RD_ADDR_NX[2]));
  LUT6 #(
    .INIT(64'hAAAAAAAA6AAAAAAA)) 
    \RD_ADDR_REG[3]_i_1 
       (.I0(\RD_ADDR_REG_reg[9]_0 [3]),
        .I1(\RD_ADDR_REG_reg[9]_0 [0]),
        .I2(\RD_ADDR_REG_reg[9]_0 [1]),
        .I3(\RD_ADDR_REG_reg[9]_0 [2]),
        .I4(RD_FIFO),
        .I5(EMPTY_REG_reg_0),
        .O(RD_ADDR_NX[3]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \RD_ADDR_REG[4]_i_1 
       (.I0(\RD_ADDR_REG_reg[9]_0 [4]),
        .I1(\RD_ADDR_REG_reg[9]_0 [2]),
        .I2(\RD_ADDR_REG_reg[9]_0 [1]),
        .I3(\RD_ADDR_REG_reg[9]_0 [0]),
        .I4(\RD_ADDR_REG_reg[9]_0 [3]),
        .I5(\RD_ADDR_REG_reg[9]_1 ),
        .O(RD_ADDR_NX[4]));
  LUT4 #(
    .INIT(16'hAA9A)) 
    \RD_ADDR_REG[5]_i_1 
       (.I0(\RD_ADDR_REG_reg[9]_0 [5]),
        .I1(\RD_ADDR_REG[5]_i_2_n_0 ),
        .I2(RD_FIFO),
        .I3(EMPTY_REG_reg_0),
        .O(RD_ADDR_NX[5]));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \RD_ADDR_REG[5]_i_2 
       (.I0(\RD_ADDR_REG_reg[9]_0 [3]),
        .I1(\RD_ADDR_REG_reg[9]_0 [0]),
        .I2(\RD_ADDR_REG_reg[9]_0 [1]),
        .I3(\RD_ADDR_REG_reg[9]_0 [2]),
        .I4(\RD_ADDR_REG_reg[9]_0 [4]),
        .O(\RD_ADDR_REG[5]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hAA9A)) 
    \RD_ADDR_REG[6]_i_1 
       (.I0(\RD_ADDR_REG_reg[9]_0 [6]),
        .I1(\RD_ADDR_REG[9]_i_2_n_0 ),
        .I2(RD_FIFO),
        .I3(EMPTY_REG_reg_0),
        .O(RD_ADDR_NX[6]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT5 #(
    .INIT(32'hAAAA9AAA)) 
    \RD_ADDR_REG[7]_i_1 
       (.I0(\RD_ADDR_REG_reg[9]_0 [7]),
        .I1(\RD_ADDR_REG[9]_i_2_n_0 ),
        .I2(\RD_ADDR_REG_reg[9]_0 [6]),
        .I3(RD_FIFO),
        .I4(EMPTY_REG_reg_0),
        .O(RD_ADDR_NX[7]));
  LUT6 #(
    .INIT(64'hAAAA9AAAAAAAAAAA)) 
    \RD_ADDR_REG[8]_i_1 
       (.I0(\RD_ADDR_REG_reg[9]_0 [8]),
        .I1(EMPTY_REG_reg_0),
        .I2(RD_FIFO),
        .I3(\RD_ADDR_REG_reg[9]_0 [6]),
        .I4(\RD_ADDR_REG[9]_i_2_n_0 ),
        .I5(\RD_ADDR_REG_reg[9]_0 [7]),
        .O(RD_ADDR_NX[8]));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAAAAAA)) 
    \RD_ADDR_REG[9]_i_1 
       (.I0(\RD_ADDR_REG_reg[9]_0 [9]),
        .I1(\RD_ADDR_REG_reg[9]_0 [8]),
        .I2(\RD_ADDR_REG_reg[9]_0 [7]),
        .I3(\RD_ADDR_REG[9]_i_2_n_0 ),
        .I4(\RD_ADDR_REG_reg[9]_0 [6]),
        .I5(\RD_ADDR_REG_reg[9]_1 ),
        .O(RD_ADDR_NX[9]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \RD_ADDR_REG[9]_i_2 
       (.I0(\RD_ADDR_REG_reg[9]_0 [4]),
        .I1(\RD_ADDR_REG_reg[9]_0 [2]),
        .I2(\RD_ADDR_REG_reg[9]_0 [1]),
        .I3(\RD_ADDR_REG_reg[9]_0 [0]),
        .I4(\RD_ADDR_REG_reg[9]_0 [3]),
        .I5(\RD_ADDR_REG_reg[9]_0 [5]),
        .O(\RD_ADDR_REG[9]_i_2_n_0 ));
  FDCE \RD_ADDR_REG_reg[0] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(RD_ADDR_NX[0]),
        .Q(\RD_ADDR_REG_reg[9]_0 [0]));
  FDCE \RD_ADDR_REG_reg[1] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(RD_ADDR_NX[1]),
        .Q(\RD_ADDR_REG_reg[9]_0 [1]));
  FDCE \RD_ADDR_REG_reg[2] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(RD_ADDR_NX[2]),
        .Q(\RD_ADDR_REG_reg[9]_0 [2]));
  FDCE \RD_ADDR_REG_reg[3] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(RD_ADDR_NX[3]),
        .Q(\RD_ADDR_REG_reg[9]_0 [3]));
  FDCE \RD_ADDR_REG_reg[4] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(RD_ADDR_NX[4]),
        .Q(\RD_ADDR_REG_reg[9]_0 [4]));
  FDCE \RD_ADDR_REG_reg[5] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(RD_ADDR_NX[5]),
        .Q(\RD_ADDR_REG_reg[9]_0 [5]));
  FDCE \RD_ADDR_REG_reg[6] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(RD_ADDR_NX[6]),
        .Q(\RD_ADDR_REG_reg[9]_0 [6]));
  FDCE \RD_ADDR_REG_reg[7] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(RD_ADDR_NX[7]),
        .Q(\RD_ADDR_REG_reg[9]_0 [7]));
  FDCE \RD_ADDR_REG_reg[8] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(RD_ADDR_NX[8]),
        .Q(\RD_ADDR_REG_reg[9]_0 [8]));
  FDCE \RD_ADDR_REG_reg[9] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(RD_ADDR_NX[9]),
        .Q(\RD_ADDR_REG_reg[9]_0 [9]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT1 #(
    .INIT(2'h1)) 
    S_AXIS_READY_INST_0
       (.I0(FULL_REG_reg_0),
        .O(S_AXIS_READY));
  LUT3 #(
    .INIT(8'hA6)) 
    \WR_ADDR_REG[0]_i_1 
       (.I0(Q[0]),
        .I1(WR_FIFO),
        .I2(FULL_REG_reg_0),
        .O(\WR_ADDR_REG[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hA6AA)) 
    \WR_ADDR_REG[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .I2(FULL_REG_reg_0),
        .I3(WR_FIFO),
        .O(WR_ADDR_NX[1]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hAA6AAAAA)) 
    \WR_ADDR_REG[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(FULL_REG_reg_0),
        .I4(WR_FIFO),
        .O(WR_ADDR_NX[2]));
  LUT6 #(
    .INIT(64'hAAAA6AAAAAAAAAAA)) 
    \WR_ADDR_REG[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[0]),
        .I2(Q[1]),
        .I3(Q[2]),
        .I4(FULL_REG_reg_0),
        .I5(WR_FIFO),
        .O(WR_ADDR_NX[3]));
  LUT6 #(
    .INIT(64'hAAAAAAAA6AAAAAAA)) 
    \WR_ADDR_REG[4]_i_1 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(\WR_ADDR_REG[4]_i_2_n_0 ),
        .O(WR_ADDR_NX[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \WR_ADDR_REG[4]_i_2 
       (.I0(FULL_REG_reg_0),
        .I1(WR_FIFO),
        .O(\WR_ADDR_REG[4]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \WR_ADDR_REG[5]_i_1 
       (.I0(Q[5]),
        .I1(\WR_ADDR_REG[8]_i_2_n_0 ),
        .I2(Q[4]),
        .O(\WR_ADDR_REG[5]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \WR_ADDR_REG[6]_i_1 
       (.I0(Q[6]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(\WR_ADDR_REG[8]_i_2_n_0 ),
        .O(\WR_ADDR_REG[6]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \WR_ADDR_REG[7]_i_1 
       (.I0(Q[7]),
        .I1(\WR_ADDR_REG[8]_i_2_n_0 ),
        .I2(Q[4]),
        .I3(Q[5]),
        .I4(Q[6]),
        .O(WR_ADDR_NX[7]));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \WR_ADDR_REG[8]_i_1 
       (.I0(Q[8]),
        .I1(Q[6]),
        .I2(Q[5]),
        .I3(Q[4]),
        .I4(\WR_ADDR_REG[8]_i_2_n_0 ),
        .I5(Q[7]),
        .O(WR_ADDR_NX[8]));
  LUT6 #(
    .INIT(64'h2000000000000000)) 
    \WR_ADDR_REG[8]_i_2 
       (.I0(WR_FIFO),
        .I1(FULL_REG_reg_0),
        .I2(Q[3]),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(Q[2]),
        .O(\WR_ADDR_REG[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
    \WR_ADDR_REG[9]_i_1 
       (.I0(Q[9]),
        .I1(Q[7]),
        .I2(\WR_ADDR_REG[9]_i_2_n_0 ),
        .I3(Q[5]),
        .I4(Q[6]),
        .I5(Q[8]),
        .O(WR_ADDR_NX[9]));
  LUT6 #(
    .INIT(64'hFFFFFFFF7FFFFFFF)) 
    \WR_ADDR_REG[9]_i_2 
       (.I0(Q[4]),
        .I1(Q[2]),
        .I2(Q[1]),
        .I3(Q[0]),
        .I4(Q[3]),
        .I5(\WR_ADDR_REG[4]_i_2_n_0 ),
        .O(\WR_ADDR_REG[9]_i_2_n_0 ));
  FDCE \WR_ADDR_REG_reg[0] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(\WR_ADDR_REG[0]_i_1_n_0 ),
        .Q(Q[0]));
  FDCE \WR_ADDR_REG_reg[1] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(WR_ADDR_NX[1]),
        .Q(Q[1]));
  FDCE \WR_ADDR_REG_reg[2] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(WR_ADDR_NX[2]),
        .Q(Q[2]));
  FDCE \WR_ADDR_REG_reg[3] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(WR_ADDR_NX[3]),
        .Q(Q[3]));
  FDCE \WR_ADDR_REG_reg[4] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(WR_ADDR_NX[4]),
        .Q(Q[4]));
  FDCE \WR_ADDR_REG_reg[5] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(\WR_ADDR_REG[5]_i_1_n_0 ),
        .Q(Q[5]));
  FDCE \WR_ADDR_REG_reg[6] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(\WR_ADDR_REG[6]_i_1_n_0 ),
        .Q(Q[6]));
  FDCE \WR_ADDR_REG_reg[7] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(WR_ADDR_NX[7]),
        .Q(Q[7]));
  FDCE \WR_ADDR_REG_reg[8] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(WR_ADDR_NX[8]),
        .Q(Q[8]));
  FDCE \WR_ADDR_REG_reg[9] 
       (.C(i_CLK),
        .CE(1'b1),
        .CLR(SR),
        .D(WR_ADDR_NX[9]),
        .Q(Q[9]));
endmodule

(* ORIG_REF_NAME = "FIFO_TOP" *) 
module design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_TOP
   (DOBDO,
    EMPTY,
    FULL_FIFO,
    S_AXIS_READY,
    i_CLK,
    WE,
    DIADI,
    SR,
    WR_FIFO,
    \RD_ADDR_REG_reg[9] ,
    RD_FIFO);
  output [11:0]DOBDO;
  output EMPTY;
  output FULL_FIFO;
  output S_AXIS_READY;
  input i_CLK;
  input WE;
  input [11:0]DIADI;
  input [0:0]SR;
  input WR_FIFO;
  input \RD_ADDR_REG_reg[9] ;
  input RD_FIFO;

  wire [11:0]DIADI;
  wire [11:0]DOBDO;
  wire EMPTY;
  wire FULL_FIFO;
  wire \RD_ADDR_REG_reg[9] ;
  wire [9:0]RD_ADDR_SIGNAL;
  wire RD_FIFO;
  wire [0:0]SR;
  wire S_AXIS_READY;
  wire WE;
  wire [9:0]WR_ADDR_SIGNAL;
  wire WR_FIFO;
  wire i_CLK;

  design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_CONTROLLER FIFO_CONTROLLER_COMPONENT
       (.EMPTY_REG_reg_0(EMPTY),
        .FULL_REG_reg_0(FULL_FIFO),
        .Q(WR_ADDR_SIGNAL),
        .\RD_ADDR_REG_reg[9]_0 (RD_ADDR_SIGNAL),
        .\RD_ADDR_REG_reg[9]_1 (\RD_ADDR_REG_reg[9] ),
        .RD_FIFO(RD_FIFO),
        .SR(SR),
        .S_AXIS_READY(S_AXIS_READY),
        .WR_FIFO(WR_FIFO),
        .i_CLK(i_CLK));
  design_1_INTEGRATED_VGA_COMPO_0_0_RAM_2PORT RAM_COMPONENT
       (.DIADI(DIADI),
        .DOBDO(DOBDO),
        .Q(WR_ADDR_SIGNAL),
        .RAM_reg_0(RD_ADDR_SIGNAL),
        .WE(WE),
        .i_CLK(i_CLK));
endmodule

(* ORIG_REF_NAME = "FRAME_COUNTER" *) 
module design_1_INTEGRATED_VGA_COMPO_0_0_FRAME_COUNTER
   (\HC_REG_reg[5]_0 ,
    D_2_VGA,
    RD_FIFO0,
    VIDEO_ON_BUFF,
    \VC_REG_reg[7]_0 ,
    SR,
    \HC_REG_reg[7]_0 ,
    DOBDO,
    PRE_STATE,
    EMPTY,
    i_RSTn,
    i_CLK);
  output \HC_REG_reg[5]_0 ;
  output [11:0]D_2_VGA;
  output RD_FIFO0;
  output VIDEO_ON_BUFF;
  output \VC_REG_reg[7]_0 ;
  output [0:0]SR;
  output \HC_REG_reg[7]_0 ;
  input [11:0]DOBDO;
  input PRE_STATE;
  input EMPTY;
  input i_RSTn;
  input i_CLK;

  wire [1:0]COUNT;
  wire \COUNT[0]_i_1_n_0 ;
  wire \COUNT[1]_i_1_n_0 ;
  wire [11:0]DOBDO;
  wire [11:0]D_2_VGA;
  wire EMPTY;
  wire [10:0]HC;
  wire [10:0]HC_NX;
  wire \HC_REG[10]_i_3_n_0 ;
  wire \HC_REG[5]_i_2_n_0 ;
  wire \HC_REG[5]_i_3_n_0 ;
  wire \HC_REG[9]_i_2_n_0 ;
  wire \HC_REG_reg[5]_0 ;
  wire \HC_REG_reg[7]_0 ;
  wire PRE_STATE;
  wire PRE_STATE_i_2_n_0;
  wire PRE_STATE_i_3_n_0;
  wire PRE_STATE_i_4_n_0;
  wire PRE_STATE_i_5_n_0;
  wire PRE_STATE_i_6_n_0;
  wire PRE_STATE_i_7_n_0;
  wire RD_FIFO0;
  wire RD_FIFO_i_2_n_0;
  wire [0:0]SR;
  wire [10:0]VC;
  wire [10:0]VC_NX;
  wire VC_REG0;
  wire \VC_REG[10]_i_3_n_0 ;
  wire \VC_REG[4]_i_1_n_0 ;
  wire \VC_REG[5]_i_1_n_0 ;
  wire \VC_REG[6]_i_2_n_0 ;
  wire \VC_REG[8]_i_1_n_0 ;
  wire \VC_REG[9]_i_2_n_0 ;
  wire \VC_REG[9]_i_3_n_0 ;
  wire \VC_REG[9]_i_4_n_0 ;
  wire \VC_REG_reg[7]_0 ;
  wire VIDEO_ON_BUFF;
  wire VIDEO_ON_inv_i_2_n_0;
  wire VIDEO_ON_inv_i_3_n_0;
  wire VIDEO_ON_inv_i_4_n_0;
  wire VIDEO_ON_inv_i_5_n_0;
  wire VSYNC_i_2_n_0;
  wire i_CLK;
  wire i_RSTn;
  wire \o_RGB_DATA[11]_i_2_n_0 ;
  wire \o_RGB_DATA[11]_i_3_n_0 ;
  wire \o_RGB_DATA[11]_i_4_n_0 ;
  wire tick_25;

  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \COUNT[0]_i_1 
       (.I0(COUNT[0]),
        .O(\COUNT[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair22" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \COUNT[1]_i_1 
       (.I0(COUNT[0]),
        .I1(COUNT[1]),
        .O(\COUNT[1]_i_1_n_0 ));
  FDRE \COUNT_reg[0] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\COUNT[0]_i_1_n_0 ),
        .Q(COUNT[0]),
        .R(SR));
  FDRE \COUNT_reg[1] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\COUNT[1]_i_1_n_0 ),
        .Q(COUNT[1]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \HC_REG[0]_i_1 
       (.I0(HC[0]),
        .O(HC_NX[0]));
  LUT2 #(
    .INIT(4'h8)) 
    \HC_REG[10]_i_1 
       (.I0(COUNT[0]),
        .I1(COUNT[1]),
        .O(tick_25));
  LUT6 #(
    .INIT(64'hAA6AAAAAAAAAAAAA)) 
    \HC_REG[10]_i_2 
       (.I0(HC[10]),
        .I1(HC[7]),
        .I2(HC[6]),
        .I3(\HC_REG[10]_i_3_n_0 ),
        .I4(HC[8]),
        .I5(HC[9]),
        .O(HC_NX[10]));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \HC_REG[10]_i_3 
       (.I0(HC[3]),
        .I1(HC[0]),
        .I2(HC[1]),
        .I3(HC[2]),
        .I4(HC[4]),
        .I5(HC[5]),
        .O(\HC_REG[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \HC_REG[1]_i_1 
       (.I0(HC[1]),
        .I1(HC[0]),
        .O(HC_NX[1]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \HC_REG[2]_i_1 
       (.I0(HC[2]),
        .I1(HC[1]),
        .I2(HC[0]),
        .O(HC_NX[2]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \HC_REG[3]_i_1 
       (.I0(HC[3]),
        .I1(HC[0]),
        .I2(HC[1]),
        .I3(HC[2]),
        .O(HC_NX[3]));
  (* SOFT_HLUTNM = "soft_lutpair12" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \HC_REG[4]_i_1 
       (.I0(HC[2]),
        .I1(HC[1]),
        .I2(HC[0]),
        .I3(HC[3]),
        .I4(HC[4]),
        .O(HC_NX[4]));
  LUT4 #(
    .INIT(16'hB400)) 
    \HC_REG[5]_i_1 
       (.I0(\HC_REG[5]_i_2_n_0 ),
        .I1(HC[4]),
        .I2(HC[5]),
        .I3(\HC_REG[5]_i_3_n_0 ),
        .O(HC_NX[5]));
  (* SOFT_HLUTNM = "soft_lutpair16" *) 
  LUT4 #(
    .INIT(16'h7FFF)) 
    \HC_REG[5]_i_2 
       (.I0(HC[2]),
        .I1(HC[1]),
        .I2(HC[0]),
        .I3(HC[3]),
        .O(\HC_REG[5]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFDF)) 
    \HC_REG[5]_i_3 
       (.I0(HC[8]),
        .I1(HC[10]),
        .I2(HC[9]),
        .I3(HC[7]),
        .I4(HC[6]),
        .I5(HC[5]),
        .O(\HC_REG[5]_i_3_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \HC_REG[6]_i_1 
       (.I0(\HC_REG[10]_i_3_n_0 ),
        .I1(HC[6]),
        .O(HC_NX[6]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'h9A)) 
    \HC_REG[7]_i_1 
       (.I0(HC[7]),
        .I1(\HC_REG[10]_i_3_n_0 ),
        .I2(HC[6]),
        .O(HC_NX[7]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT5 #(
    .INIT(32'h0000F708)) 
    \HC_REG[8]_i_1 
       (.I0(HC[7]),
        .I1(HC[6]),
        .I2(\HC_REG[10]_i_3_n_0 ),
        .I3(HC[8]),
        .I4(\HC_REG[9]_i_2_n_0 ),
        .O(HC_NX[8]));
  LUT6 #(
    .INIT(64'h5515555500400000)) 
    \HC_REG[9]_i_1 
       (.I0(\HC_REG[9]_i_2_n_0 ),
        .I1(HC[7]),
        .I2(HC[6]),
        .I3(\HC_REG[10]_i_3_n_0 ),
        .I4(HC[8]),
        .I5(HC[9]),
        .O(HC_NX[9]));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    \HC_REG[9]_i_2 
       (.I0(HC[2]),
        .I1(HC[1]),
        .I2(HC[0]),
        .I3(HC[3]),
        .I4(HC[4]),
        .I5(\HC_REG[5]_i_3_n_0 ),
        .O(\HC_REG[9]_i_2_n_0 ));
  FDRE \HC_REG_reg[0] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[0]),
        .Q(HC[0]),
        .R(SR));
  FDRE \HC_REG_reg[10] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[10]),
        .Q(HC[10]),
        .R(SR));
  FDRE \HC_REG_reg[1] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[1]),
        .Q(HC[1]),
        .R(SR));
  FDRE \HC_REG_reg[2] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[2]),
        .Q(HC[2]),
        .R(SR));
  FDRE \HC_REG_reg[3] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[3]),
        .Q(HC[3]),
        .R(SR));
  FDRE \HC_REG_reg[4] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[4]),
        .Q(HC[4]),
        .R(SR));
  FDRE \HC_REG_reg[5] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[5]),
        .Q(HC[5]),
        .R(SR));
  FDRE \HC_REG_reg[6] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[6]),
        .Q(HC[6]),
        .R(SR));
  FDRE \HC_REG_reg[7] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[7]),
        .Q(HC[7]),
        .R(SR));
  FDRE \HC_REG_reg[8] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[8]),
        .Q(HC[8]),
        .R(SR));
  FDRE \HC_REG_reg[9] 
       (.C(i_CLK),
        .CE(tick_25),
        .D(HC_NX[9]),
        .Q(HC[9]),
        .R(SR));
  LUT6 #(
    .INIT(64'hFFFFCFFBFFFFFFFF)) 
    HSYNC_i_1
       (.I0(HC[5]),
        .I1(HC[8]),
        .I2(HC[6]),
        .I3(HC[7]),
        .I4(HC[10]),
        .I5(HC[9]),
        .O(\HC_REG_reg[5]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF00001000)) 
    PRE_STATE_i_1
       (.I0(PRE_STATE_i_2_n_0),
        .I1(PRE_STATE_i_3_n_0),
        .I2(HC[7]),
        .I3(HC[6]),
        .I4(PRE_STATE_i_4_n_0),
        .I5(PRE_STATE),
        .O(\HC_REG_reg[7]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFEFFFF)) 
    PRE_STATE_i_2
       (.I0(PRE_STATE_i_5_n_0),
        .I1(PRE_STATE_i_6_n_0),
        .I2(PRE_STATE_i_7_n_0),
        .I3(HC[2]),
        .I4(VC[0]),
        .I5(HC[5]),
        .O(PRE_STATE_i_2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'hE)) 
    PRE_STATE_i_3
       (.I0(VC[6]),
        .I1(VC[5]),
        .O(PRE_STATE_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT4 #(
    .INIT(16'hFEFF)) 
    PRE_STATE_i_4
       (.I0(VC[10]),
        .I1(VC[9]),
        .I2(VC[8]),
        .I3(VC[7]),
        .O(PRE_STATE_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT4 #(
    .INIT(16'hFFF7)) 
    PRE_STATE_i_5
       (.I0(VC[3]),
        .I1(VC[4]),
        .I2(VC[1]),
        .I3(EMPTY),
        .O(PRE_STATE_i_5_n_0));
  (* SOFT_HLUTNM = "soft_lutpair19" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    PRE_STATE_i_6
       (.I0(HC[0]),
        .I1(HC[9]),
        .I2(HC[3]),
        .I3(VC[2]),
        .O(PRE_STATE_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair17" *) 
  LUT4 #(
    .INIT(16'hFFEF)) 
    PRE_STATE_i_7
       (.I0(HC[1]),
        .I1(HC[8]),
        .I2(HC[4]),
        .I3(HC[10]),
        .O(PRE_STATE_i_7_n_0));
  LUT6 #(
    .INIT(64'h0001000000000000)) 
    RD_FIFO_i_1
       (.I0(\o_RGB_DATA[11]_i_2_n_0 ),
        .I1(RD_FIFO_i_2_n_0),
        .I2(HC[10]),
        .I3(\o_RGB_DATA[11]_i_3_n_0 ),
        .I4(tick_25),
        .I5(PRE_STATE),
        .O(RD_FIFO0));
  LUT2 #(
    .INIT(4'hE)) 
    RD_FIFO_i_2
       (.I0(VC[9]),
        .I1(VC[10]),
        .O(RD_FIFO_i_2_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    TIMING_AGGREGATE_i_1
       (.I0(i_RSTn),
        .O(SR));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \VC_REG[0]_i_1 
       (.I0(VC[0]),
        .I1(\VC_REG[9]_i_2_n_0 ),
        .O(VC_NX[0]));
  LUT3 #(
    .INIT(8'h80)) 
    \VC_REG[10]_i_1 
       (.I0(COUNT[1]),
        .I1(COUNT[0]),
        .I2(\HC_REG[9]_i_2_n_0 ),
        .O(VC_REG0));
  (* SOFT_HLUTNM = "soft_lutpair15" *) 
  LUT5 #(
    .INIT(32'hAAAA6AAA)) 
    \VC_REG[10]_i_2 
       (.I0(VC[10]),
        .I1(VC[9]),
        .I2(VC[8]),
        .I3(VC[7]),
        .I4(\VC_REG[10]_i_3_n_0 ),
        .O(VC_NX[10]));
  LUT6 #(
    .INIT(64'hFF7FFFFFFFFFFFFF)) 
    \VC_REG[10]_i_3 
       (.I0(VC[5]),
        .I1(VC[2]),
        .I2(VC[3]),
        .I3(\VC_REG[6]_i_2_n_0 ),
        .I4(VC[4]),
        .I5(VC[6]),
        .O(\VC_REG[10]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair21" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \VC_REG[1]_i_1 
       (.I0(VC[0]),
        .I1(VC[1]),
        .O(VC_NX[1]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT4 #(
    .INIT(16'h0078)) 
    \VC_REG[2]_i_1 
       (.I0(VC[0]),
        .I1(VC[1]),
        .I2(VC[2]),
        .I3(\VC_REG[9]_i_2_n_0 ),
        .O(VC_NX[2]));
  (* SOFT_HLUTNM = "soft_lutpair13" *) 
  LUT5 #(
    .INIT(32'h00007F80)) 
    \VC_REG[3]_i_1 
       (.I0(VC[1]),
        .I1(VC[0]),
        .I2(VC[2]),
        .I3(VC[3]),
        .I4(\VC_REG[9]_i_2_n_0 ),
        .O(VC_NX[3]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \VC_REG[4]_i_1 
       (.I0(VC[4]),
        .I1(VC[2]),
        .I2(VC[3]),
        .I3(VC[0]),
        .I4(VC[1]),
        .O(\VC_REG[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6AAAAAAAAAAAAAAA)) 
    \VC_REG[5]_i_1 
       (.I0(VC[5]),
        .I1(VC[4]),
        .I2(VC[1]),
        .I3(VC[0]),
        .I4(VC[3]),
        .I5(VC[2]),
        .O(\VC_REG[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hA6AAAAAAAAAAAAAA)) 
    \VC_REG[6]_i_1 
       (.I0(VC[6]),
        .I1(VC[4]),
        .I2(\VC_REG[6]_i_2_n_0 ),
        .I3(VC[3]),
        .I4(VC[2]),
        .I5(VC[5]),
        .O(VC_NX[6]));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \VC_REG[6]_i_2 
       (.I0(VC[0]),
        .I1(VC[1]),
        .O(\VC_REG[6]_i_2_n_0 ));
  LUT2 #(
    .INIT(4'h9)) 
    \VC_REG[7]_i_1 
       (.I0(VC[7]),
        .I1(\VC_REG[10]_i_3_n_0 ),
        .O(VC_NX[7]));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT3 #(
    .INIT(8'hA6)) 
    \VC_REG[8]_i_1 
       (.I0(VC[8]),
        .I1(VC[7]),
        .I2(\VC_REG[10]_i_3_n_0 ),
        .O(\VC_REG[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair14" *) 
  LUT5 #(
    .INIT(32'h44441444)) 
    \VC_REG[9]_i_1 
       (.I0(\VC_REG[9]_i_2_n_0 ),
        .I1(VC[9]),
        .I2(VC[8]),
        .I3(VC[7]),
        .I4(\VC_REG[10]_i_3_n_0 ),
        .O(VC_NX[9]));
  LUT6 #(
    .INIT(64'h0000000000000400)) 
    \VC_REG[9]_i_2 
       (.I0(\VC_REG[9]_i_3_n_0 ),
        .I1(VC[9]),
        .I2(VC[10]),
        .I3(\VC_REG[9]_i_4_n_0 ),
        .I4(VC[0]),
        .I5(VC[1]),
        .O(\VC_REG[9]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    \VC_REG[9]_i_3 
       (.I0(VC[4]),
        .I1(VC[6]),
        .I2(VC[5]),
        .I3(VC[8]),
        .I4(VC[7]),
        .O(\VC_REG[9]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair18" *) 
  LUT2 #(
    .INIT(4'h8)) 
    \VC_REG[9]_i_4 
       (.I0(VC[2]),
        .I1(VC[3]),
        .O(\VC_REG[9]_i_4_n_0 ));
  FDRE \VC_REG_reg[0] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(VC_NX[0]),
        .Q(VC[0]),
        .R(SR));
  FDRE \VC_REG_reg[10] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(VC_NX[10]),
        .Q(VC[10]),
        .R(SR));
  FDRE \VC_REG_reg[1] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(VC_NX[1]),
        .Q(VC[1]),
        .R(SR));
  FDRE \VC_REG_reg[2] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(VC_NX[2]),
        .Q(VC[2]),
        .R(SR));
  FDRE \VC_REG_reg[3] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(VC_NX[3]),
        .Q(VC[3]),
        .R(SR));
  FDRE \VC_REG_reg[4] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(\VC_REG[4]_i_1_n_0 ),
        .Q(VC[4]),
        .R(SR));
  FDRE \VC_REG_reg[5] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(\VC_REG[5]_i_1_n_0 ),
        .Q(VC[5]),
        .R(SR));
  FDRE \VC_REG_reg[6] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(VC_NX[6]),
        .Q(VC[6]),
        .R(SR));
  FDRE \VC_REG_reg[7] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(VC_NX[7]),
        .Q(VC[7]),
        .R(SR));
  FDRE \VC_REG_reg[8] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(\VC_REG[8]_i_1_n_0 ),
        .Q(VC[8]),
        .R(SR));
  FDRE \VC_REG_reg[9] 
       (.C(i_CLK),
        .CE(VC_REG0),
        .D(VC_NX[9]),
        .Q(VC[9]),
        .R(SR));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    VIDEO_ON_inv_i_1
       (.I0(VIDEO_ON_inv_i_2_n_0),
        .I1(VC[10]),
        .I2(HC[10]),
        .I3(VIDEO_ON_inv_i_3_n_0),
        .I4(VIDEO_ON_inv_i_4_n_0),
        .O(VIDEO_ON_BUFF));
  LUT6 #(
    .INIT(64'h000000000000000D)) 
    VIDEO_ON_inv_i_2
       (.I0(VC[5]),
        .I1(VIDEO_ON_inv_i_5_n_0),
        .I2(VC[6]),
        .I3(VC[7]),
        .I4(VC[8]),
        .I5(VC[9]),
        .O(VIDEO_ON_inv_i_2_n_0));
  LUT6 #(
    .INIT(64'hFF00F000FF008007)) 
    VIDEO_ON_inv_i_3
       (.I0(HC[5]),
        .I1(HC[4]),
        .I2(HC[7]),
        .I3(HC[9]),
        .I4(HC[8]),
        .I5(HC[6]),
        .O(VIDEO_ON_inv_i_3_n_0));
  LUT6 #(
    .INIT(64'hAAAAAAAAAAAAAAA2)) 
    VIDEO_ON_inv_i_4
       (.I0(VC[9]),
        .I1(VIDEO_ON_inv_i_5_n_0),
        .I2(VC[7]),
        .I3(VC[8]),
        .I4(VC[5]),
        .I5(VC[6]),
        .O(VIDEO_ON_inv_i_4_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT5 #(
    .INIT(32'h00000001)) 
    VIDEO_ON_inv_i_5
       (.I0(VC[0]),
        .I1(VC[1]),
        .I2(VC[2]),
        .I3(VC[3]),
        .I4(VC[4]),
        .O(VIDEO_ON_inv_i_5_n_0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    VSYNC_i_1
       (.I0(VC[7]),
        .I1(VC[8]),
        .I2(VC[5]),
        .I3(VC[6]),
        .I4(VC[4]),
        .I5(VSYNC_i_2_n_0),
        .O(\VC_REG_reg[7]_0 ));
  LUT6 #(
    .INIT(64'hFFDFFFFFFFFFDFFF)) 
    VSYNC_i_2
       (.I0(VC[9]),
        .I1(VC[10]),
        .I2(VC[3]),
        .I3(VC[2]),
        .I4(VC[1]),
        .I5(VC[0]),
        .O(VSYNC_i_2_n_0));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[0]_i_1 
       (.I0(DOBDO[0]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[0]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[10]_i_1 
       (.I0(DOBDO[10]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[10]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[11]_i_1 
       (.I0(DOBDO[11]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[11]));
  LUT6 #(
    .INIT(64'hFFAE000000F7FFFF)) 
    \o_RGB_DATA[11]_i_2 
       (.I0(VC[4]),
        .I1(VC[3]),
        .I2(\o_RGB_DATA[11]_i_4_n_0 ),
        .I3(PRE_STATE_i_3_n_0),
        .I4(VC[7]),
        .I5(VC[8]),
        .O(\o_RGB_DATA[11]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0F1F3F3F3F3F3E3)) 
    \o_RGB_DATA[11]_i_3 
       (.I0(HC[4]),
        .I1(HC[8]),
        .I2(HC[9]),
        .I3(HC[5]),
        .I4(HC[6]),
        .I5(HC[7]),
        .O(\o_RGB_DATA[11]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair20" *) 
  LUT3 #(
    .INIT(8'h01)) 
    \o_RGB_DATA[11]_i_4 
       (.I0(VC[2]),
        .I1(VC[1]),
        .I2(VC[0]),
        .O(\o_RGB_DATA[11]_i_4_n_0 ));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[1]_i_1 
       (.I0(DOBDO[1]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[1]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[2]_i_1 
       (.I0(DOBDO[2]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[2]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[3]_i_1 
       (.I0(DOBDO[3]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[3]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[4]_i_1 
       (.I0(DOBDO[4]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[4]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[5]_i_1 
       (.I0(DOBDO[5]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[5]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[6]_i_1 
       (.I0(DOBDO[6]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[6]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[7]_i_1 
       (.I0(DOBDO[7]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[7]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[8]_i_1 
       (.I0(DOBDO[8]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[8]));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    \o_RGB_DATA[9]_i_1 
       (.I0(DOBDO[9]),
        .I1(\o_RGB_DATA[11]_i_2_n_0 ),
        .I2(VC[9]),
        .I3(VC[10]),
        .I4(HC[10]),
        .I5(\o_RGB_DATA[11]_i_3_n_0 ),
        .O(D_2_VGA[9]));
endmodule

(* ORIG_REF_NAME = "INTEGRATED_VGA_COMPONENT" *) 
module design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT
   (OUT_VGA,
    S_AXIS_READY,
    HSYNC,
    VSYNC,
    i_CLK,
    S_AXIS_VALID,
    S_AXIS_DATA,
    i_RSTn);
  output [11:0]OUT_VGA;
  output S_AXIS_READY;
  output HSYNC;
  output VSYNC;
  input i_CLK;
  input S_AXIS_VALID;
  input [3:0]S_AXIS_DATA;
  input i_RSTn;

  wire [11:0]D_2_FIFO;
  wire [11:0]D_OUT_FIFO;
  wire EMPTY;
  wire FULL_FIFO;
  wire HSYNC;
  wire [11:0]OUT_VGA;
  wire POSITION_CONTROLLER_COMP_n_2;
  wire PRE_STATE;
  wire RD_FIFO;
  wire RD_FIFO0;
  wire [3:0]S_AXIS_DATA;
  wire S_AXIS_READY;
  wire S_AXIS_VALID;
  wire VGA_COMP_n_3;
  wire VGA_COMP_n_4;
  wire VSYNC;
  wire WE;
  wire WR_FIFO;
  wire i_CLK;
  wire i_RSTn;

  design_1_INTEGRATED_VGA_COMPO_0_0_PIXEL_DATA_CONTROLLER CONTROLLER_COMP
       (.DIADI(D_2_FIFO),
        .FULL_FIFO(FULL_FIFO),
        .SR(VGA_COMP_n_3),
        .S_AXIS_DATA(S_AXIS_DATA),
        .S_AXIS_VALID(S_AXIS_VALID),
        .WE(WE),
        .WR_FIFO(WR_FIFO),
        .i_CLK(i_CLK));
  design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_TOP FIFO_COMP
       (.DIADI(D_2_FIFO),
        .DOBDO(D_OUT_FIFO),
        .EMPTY(EMPTY),
        .FULL_FIFO(FULL_FIFO),
        .\RD_ADDR_REG_reg[9] (POSITION_CONTROLLER_COMP_n_2),
        .RD_FIFO(RD_FIFO),
        .SR(VGA_COMP_n_3),
        .S_AXIS_READY(S_AXIS_READY),
        .WE(WE),
        .WR_FIFO(WR_FIFO),
        .i_CLK(i_CLK));
  design_1_INTEGRATED_VGA_COMPO_0_0_POSITION_CONTROLLER POSITION_CONTROLLER_COMP
       (.EMPTY(EMPTY),
        .PRE_STATE(PRE_STATE),
        .PRE_STATE_reg_0(VGA_COMP_n_4),
        .RD_FIFO(RD_FIFO),
        .RD_FIFO0(RD_FIFO0),
        .RD_FIFO_reg_0(POSITION_CONTROLLER_COMP_n_2),
        .SR(VGA_COMP_n_3),
        .i_CLK(i_CLK));
  design_1_INTEGRATED_VGA_COMPO_0_0_VGA_TOP_DESIGN VGA_COMP
       (.DOBDO(D_OUT_FIFO),
        .EMPTY(EMPTY),
        .\HC_REG_reg[7] (VGA_COMP_n_4),
        .HSYNC(HSYNC),
        .OUT_VGA(OUT_VGA),
        .PRE_STATE(PRE_STATE),
        .RD_FIFO0(RD_FIFO0),
        .SR(VGA_COMP_n_3),
        .VSYNC(VSYNC),
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn));
endmodule

(* ORIG_REF_NAME = "INTEGRATED_VGA_COMPONENT_WRAP_VHDL" *) 
module design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT_WRAP_VHDL
   (OUT_VGA,
    S_AXIS_READY,
    HSYNC,
    VSYNC,
    i_CLK,
    S_AXIS_VALID,
    S_AXIS_DATA,
    i_RSTn);
  output [11:0]OUT_VGA;
  output S_AXIS_READY;
  output HSYNC;
  output VSYNC;
  input i_CLK;
  input S_AXIS_VALID;
  input [3:0]S_AXIS_DATA;
  input i_RSTn;

  wire HSYNC;
  wire [11:0]OUT_VGA;
  wire [3:0]S_AXIS_DATA;
  wire S_AXIS_READY;
  wire S_AXIS_VALID;
  wire VSYNC;
  wire i_CLK;
  wire i_RSTn;

  design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT INTEGRATED_VGA_COMPONENT_SV_2_VHDL
       (.HSYNC(HSYNC),
        .OUT_VGA(OUT_VGA),
        .S_AXIS_DATA(S_AXIS_DATA),
        .S_AXIS_READY(S_AXIS_READY),
        .S_AXIS_VALID(S_AXIS_VALID),
        .VSYNC(VSYNC),
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn));
endmodule

(* ORIG_REF_NAME = "PIXEL_DATA_CONTROLLER" *) 
module design_1_INTEGRATED_VGA_COMPO_0_0_PIXEL_DATA_CONTROLLER
   (WR_FIFO,
    WE,
    DIADI,
    SR,
    i_CLK,
    FULL_FIFO,
    S_AXIS_VALID,
    S_AXIS_DATA);
  output WR_FIFO;
  output WE;
  output [11:0]DIADI;
  input [0:0]SR;
  input i_CLK;
  input FULL_FIFO;
  input S_AXIS_VALID;
  input [3:0]S_AXIS_DATA;

  wire B0;
  wire [1:0]CNT2THREE;
  wire \CNT2THREE[0]_i_1_n_0 ;
  wire \CNT2THREE[1]_i_1_n_0 ;
  wire [11:0]DIADI;
  wire FULL_FIFO;
  wire G0;
  wire R0;
  wire [0:0]SR;
  wire [3:0]S_AXIS_DATA;
  wire S_AXIS_VALID;
  wire WE;
  wire WR_FIFO;
  wire i_CLK;

  LUT4 #(
    .INIT(16'h0004)) 
    \B[3]_i_1 
       (.I0(FULL_FIFO),
        .I1(S_AXIS_VALID),
        .I2(CNT2THREE[1]),
        .I3(CNT2THREE[0]),
        .O(B0));
  FDRE \B_reg[0] 
       (.C(i_CLK),
        .CE(B0),
        .D(S_AXIS_DATA[0]),
        .Q(DIADI[0]),
        .R(SR));
  FDRE \B_reg[1] 
       (.C(i_CLK),
        .CE(B0),
        .D(S_AXIS_DATA[1]),
        .Q(DIADI[1]),
        .R(SR));
  FDRE \B_reg[2] 
       (.C(i_CLK),
        .CE(B0),
        .D(S_AXIS_DATA[2]),
        .Q(DIADI[2]),
        .R(SR));
  FDRE \B_reg[3] 
       (.C(i_CLK),
        .CE(B0),
        .D(S_AXIS_DATA[3]),
        .Q(DIADI[3]),
        .R(SR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF304)) 
    \CNT2THREE[0]_i_1 
       (.I0(CNT2THREE[1]),
        .I1(S_AXIS_VALID),
        .I2(FULL_FIFO),
        .I3(CNT2THREE[0]),
        .O(\CNT2THREE[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hF308)) 
    \CNT2THREE[1]_i_1 
       (.I0(CNT2THREE[0]),
        .I1(S_AXIS_VALID),
        .I2(FULL_FIFO),
        .I3(CNT2THREE[1]),
        .O(\CNT2THREE[1]_i_1_n_0 ));
  FDRE \CNT2THREE_reg[0] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\CNT2THREE[0]_i_1_n_0 ),
        .Q(CNT2THREE[0]),
        .R(SR));
  FDRE \CNT2THREE_reg[1] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\CNT2THREE[1]_i_1_n_0 ),
        .Q(CNT2THREE[1]),
        .R(SR));
  LUT4 #(
    .INIT(16'h0400)) 
    \G[3]_i_1 
       (.I0(FULL_FIFO),
        .I1(S_AXIS_VALID),
        .I2(CNT2THREE[1]),
        .I3(CNT2THREE[0]),
        .O(G0));
  FDRE \G_reg[0] 
       (.C(i_CLK),
        .CE(G0),
        .D(S_AXIS_DATA[0]),
        .Q(DIADI[4]),
        .R(SR));
  FDRE \G_reg[1] 
       (.C(i_CLK),
        .CE(G0),
        .D(S_AXIS_DATA[1]),
        .Q(DIADI[5]),
        .R(SR));
  FDRE \G_reg[2] 
       (.C(i_CLK),
        .CE(G0),
        .D(S_AXIS_DATA[2]),
        .Q(DIADI[6]),
        .R(SR));
  FDRE \G_reg[3] 
       (.C(i_CLK),
        .CE(G0),
        .D(S_AXIS_DATA[3]),
        .Q(DIADI[7]),
        .R(SR));
  LUT2 #(
    .INIT(4'h2)) 
    RAM_reg_i_1
       (.I0(WR_FIFO),
        .I1(FULL_FIFO),
        .O(WE));
  FDRE \R_reg[0] 
       (.C(i_CLK),
        .CE(R0),
        .D(S_AXIS_DATA[0]),
        .Q(DIADI[8]),
        .R(SR));
  FDRE \R_reg[1] 
       (.C(i_CLK),
        .CE(R0),
        .D(S_AXIS_DATA[1]),
        .Q(DIADI[9]),
        .R(SR));
  FDRE \R_reg[2] 
       (.C(i_CLK),
        .CE(R0),
        .D(S_AXIS_DATA[2]),
        .Q(DIADI[10]),
        .R(SR));
  FDRE \R_reg[3] 
       (.C(i_CLK),
        .CE(R0),
        .D(S_AXIS_DATA[3]),
        .Q(DIADI[11]),
        .R(SR));
  LUT4 #(
    .INIT(16'h0040)) 
    TIMING_AGGREGATE_i_2
       (.I0(FULL_FIFO),
        .I1(S_AXIS_VALID),
        .I2(CNT2THREE[1]),
        .I3(CNT2THREE[0]),
        .O(R0));
  FDRE TIMING_AGGREGATE_reg
       (.C(i_CLK),
        .CE(1'b1),
        .D(R0),
        .Q(WR_FIFO),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "POSITION_CONTROLLER" *) 
module design_1_INTEGRATED_VGA_COMPO_0_0_POSITION_CONTROLLER
   (RD_FIFO,
    PRE_STATE,
    RD_FIFO_reg_0,
    SR,
    RD_FIFO0,
    i_CLK,
    PRE_STATE_reg_0,
    EMPTY);
  output RD_FIFO;
  output PRE_STATE;
  output RD_FIFO_reg_0;
  input [0:0]SR;
  input RD_FIFO0;
  input i_CLK;
  input PRE_STATE_reg_0;
  input EMPTY;

  wire EMPTY;
  wire PRE_STATE;
  wire PRE_STATE_reg_0;
  wire RD_FIFO;
  wire RD_FIFO0;
  wire RD_FIFO_reg_0;
  wire [0:0]SR;
  wire i_CLK;

  FDRE PRE_STATE_reg
       (.C(i_CLK),
        .CE(1'b1),
        .D(PRE_STATE_reg_0),
        .Q(PRE_STATE),
        .R(SR));
  LUT2 #(
    .INIT(4'h2)) 
    \RD_ADDR_REG[9]_i_3 
       (.I0(RD_FIFO),
        .I1(EMPTY),
        .O(RD_FIFO_reg_0));
  FDRE RD_FIFO_reg
       (.C(i_CLK),
        .CE(1'b1),
        .D(RD_FIFO0),
        .Q(RD_FIFO),
        .R(SR));
endmodule

(* ORIG_REF_NAME = "RAM_2PORT" *) 
module design_1_INTEGRATED_VGA_COMPO_0_0_RAM_2PORT
   (DOBDO,
    i_CLK,
    WE,
    Q,
    RAM_reg_0,
    DIADI);
  output [11:0]DOBDO;
  input i_CLK;
  input WE;
  input [9:0]Q;
  input [9:0]RAM_reg_0;
  input [11:0]DIADI;

  wire [11:0]DIADI;
  wire [11:0]DOBDO;
  wire [9:0]Q;
  wire [9:0]RAM_reg_0;
  wire WE;
  wire i_CLK;
  wire [15:0]NLW_RAM_reg_DOADO_UNCONNECTED;
  wire [15:12]NLW_RAM_reg_DOBDO_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_DOPADOP_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_DOPBDOP_UNCONNECTED;

  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d12" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d12" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "12288" *) 
  (* RTL_RAM_NAME = "U0/INTEGRATED_VGA_COMPONENT_SV_2_VHDL/FIFO_COMP/RAM_COMPONENT/RAM_reg" *) 
  (* RTL_RAM_TYPE = "RAM_SDP" *) 
  (* ram_addr_begin = "0" *) 
  (* ram_addr_end = "1023" *) 
  (* ram_offset = "0" *) 
  (* ram_slice_begin = "0" *) 
  (* ram_slice_end = "11" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    RAM_reg
       (.ADDRARDADDR({Q,1'b1,1'b1,1'b1,1'b1}),
        .ADDRBWRADDR({RAM_reg_0,1'b1,1'b1,1'b1,1'b1}),
        .CLKARDCLK(i_CLK),
        .CLKBWRCLK(i_CLK),
        .DIADI({1'b0,1'b0,1'b0,1'b0,DIADI}),
        .DIBDI({1'b0,1'b0,1'b0,1'b0,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .DIPADIP({1'b0,1'b0}),
        .DIPBDIP({1'b0,1'b0}),
        .DOADO(NLW_RAM_reg_DOADO_UNCONNECTED[15:0]),
        .DOBDO({NLW_RAM_reg_DOBDO_UNCONNECTED[15:12],DOBDO}),
        .DOPADOP(NLW_RAM_reg_DOPADOP_UNCONNECTED[1:0]),
        .DOPBDOP(NLW_RAM_reg_DOPBDOP_UNCONNECTED[1:0]),
        .ENARDEN(WE),
        .ENBWREN(1'b1),
        .REGCEAREGCE(1'b0),
        .REGCEB(1'b0),
        .RSTRAMARSTRAM(1'b0),
        .RSTRAMB(1'b0),
        .RSTREGARSTREG(1'b0),
        .RSTREGB(1'b0),
        .WEA({1'b1,1'b1}),
        .WEBWE({1'b0,1'b0,1'b0,1'b0}));
endmodule

(* ORIG_REF_NAME = "VGA_SYNC" *) 
module design_1_INTEGRATED_VGA_COMPO_0_0_VGA_SYNC
   (VIDEO_ON,
    HSYNC,
    VSYNC,
    VIDEO_ON_BUFF,
    i_CLK,
    HSYNC_reg_0,
    VSYNC_reg_0);
  output VIDEO_ON;
  output HSYNC;
  output VSYNC;
  input VIDEO_ON_BUFF;
  input i_CLK;
  input HSYNC_reg_0;
  input VSYNC_reg_0;

  wire HSYNC;
  wire HSYNC_reg_0;
  wire VIDEO_ON;
  wire VIDEO_ON_BUFF;
  wire VSYNC;
  wire VSYNC_reg_0;
  wire i_CLK;

  FDRE HSYNC_reg
       (.C(i_CLK),
        .CE(1'b1),
        .D(HSYNC_reg_0),
        .Q(HSYNC),
        .R(1'b0));
  (* inverted = "yes" *) 
  FDRE #(
    .INIT(1'b1)) 
    VIDEO_ON_reg_inv
       (.C(i_CLK),
        .CE(1'b1),
        .D(VIDEO_ON_BUFF),
        .Q(VIDEO_ON),
        .R(1'b0));
  FDRE VSYNC_reg
       (.C(i_CLK),
        .CE(1'b1),
        .D(VSYNC_reg_0),
        .Q(VSYNC),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "VGA_TOP_DESIGN" *) 
module design_1_INTEGRATED_VGA_COMPO_0_0_VGA_TOP_DESIGN
   (HSYNC,
    VSYNC,
    RD_FIFO0,
    SR,
    \HC_REG_reg[7] ,
    OUT_VGA,
    i_CLK,
    DOBDO,
    PRE_STATE,
    EMPTY,
    i_RSTn);
  output HSYNC;
  output VSYNC;
  output RD_FIFO0;
  output [0:0]SR;
  output \HC_REG_reg[7] ;
  output [11:0]OUT_VGA;
  input i_CLK;
  input [11:0]DOBDO;
  input PRE_STATE;
  input EMPTY;
  input i_RSTn;

  wire [11:0]DOBDO;
  wire [11:0]D_2_VGA;
  wire EMPTY;
  wire FRAME_COUNTER_COMPONENT_n_0;
  wire FRAME_COUNTER_COMPONENT_n_15;
  wire \HC_REG_reg[7] ;
  wire HSYNC;
  wire [11:0]OUT_VGA;
  wire PRE_STATE;
  wire RD_FIFO0;
  wire [0:0]SR;
  wire VIDEO_ON;
  wire VIDEO_ON_BUFF;
  wire VSYNC;
  wire i_CLK;
  wire i_RSTn;

  design_1_INTEGRATED_VGA_COMPO_0_0_FRAME_COUNTER FRAME_COUNTER_COMPONENT
       (.DOBDO(DOBDO),
        .D_2_VGA(D_2_VGA),
        .EMPTY(EMPTY),
        .\HC_REG_reg[5]_0 (FRAME_COUNTER_COMPONENT_n_0),
        .\HC_REG_reg[7]_0 (\HC_REG_reg[7] ),
        .PRE_STATE(PRE_STATE),
        .RD_FIFO0(RD_FIFO0),
        .SR(SR),
        .\VC_REG_reg[7]_0 (FRAME_COUNTER_COMPONENT_n_15),
        .VIDEO_ON_BUFF(VIDEO_ON_BUFF),
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn));
  design_1_INTEGRATED_VGA_COMPO_0_0_VGA_SYNC VGA_SYNC_COMPONENT
       (.HSYNC(HSYNC),
        .HSYNC_reg_0(FRAME_COUNTER_COMPONENT_n_0),
        .VIDEO_ON(VIDEO_ON),
        .VIDEO_ON_BUFF(VIDEO_ON_BUFF),
        .VSYNC(VSYNC),
        .VSYNC_reg_0(FRAME_COUNTER_COMPONENT_n_15),
        .i_CLK(i_CLK));
  FDRE \o_RGB_DATA_reg[0] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[0]),
        .Q(OUT_VGA[0]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[10] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[10]),
        .Q(OUT_VGA[10]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[11] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[11]),
        .Q(OUT_VGA[11]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[1] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[1]),
        .Q(OUT_VGA[1]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[2] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[2]),
        .Q(OUT_VGA[2]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[3] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[3]),
        .Q(OUT_VGA[3]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[4] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[4]),
        .Q(OUT_VGA[4]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[5] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[5]),
        .Q(OUT_VGA[5]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[6] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[6]),
        .Q(OUT_VGA[6]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[7] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[7]),
        .Q(OUT_VGA[7]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[8] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[8]),
        .Q(OUT_VGA[8]),
        .R(VIDEO_ON));
  FDRE \o_RGB_DATA_reg[9] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(D_2_VGA[9]),
        .Q(OUT_VGA[9]),
        .R(VIDEO_ON));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
