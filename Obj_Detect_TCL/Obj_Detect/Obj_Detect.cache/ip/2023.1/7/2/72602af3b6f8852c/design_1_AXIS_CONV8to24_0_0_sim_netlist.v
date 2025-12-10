// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Wed Dec 10 10:10:18 2025
// Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_AXIS_CONV8to24_0_0_sim_netlist.v
// Design      : design_1_AXIS_CONV8to24_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_CONV8to24
   (M_AXIS_DATA,
    M_AXIS_VALID,
    S_AXIS_VALID,
    M_AXIS_READY,
    i_RSTn,
    i_CLK,
    S_AXIS_DATA);
  output [23:0]M_AXIS_DATA;
  output M_AXIS_VALID;
  input S_AXIS_VALID;
  input M_AXIS_READY;
  input i_RSTn;
  input i_CLK;
  input [7:0]S_AXIS_DATA;

  wire B0__0;
  wire [1:0]CNT2THREE;
  wire \CNT2THREE[0]_i_1_n_0 ;
  wire \CNT2THREE[1]_i_1_n_0 ;
  wire G0__0;
  wire [23:0]M_AXIS_DATA;
  wire M_AXIS_READY;
  wire M_AXIS_VALID;
  wire M_AXIS_VALID_SIGN_i_1_n_0;
  wire R0__0;
  wire [7:0]S_AXIS_DATA;
  wire S_AXIS_VALID;
  wire TIMING_AGGREGATE;
  wire TIMING_AGGREGATE_i_1_n_0;
  wire i_CLK;
  wire i_RSTn;
  wire p_0_in;
  wire [23:0]p_1_in;

  LUT4 #(
    .INIT(16'h0008)) 
    B0
       (.I0(S_AXIS_VALID),
        .I1(M_AXIS_READY),
        .I2(CNT2THREE[1]),
        .I3(CNT2THREE[0]),
        .O(B0__0));
  FDRE \B_reg[0] 
       (.C(i_CLK),
        .CE(B0__0),
        .D(S_AXIS_DATA[0]),
        .Q(p_1_in[0]),
        .R(p_0_in));
  FDRE \B_reg[1] 
       (.C(i_CLK),
        .CE(B0__0),
        .D(S_AXIS_DATA[1]),
        .Q(p_1_in[1]),
        .R(p_0_in));
  FDRE \B_reg[2] 
       (.C(i_CLK),
        .CE(B0__0),
        .D(S_AXIS_DATA[2]),
        .Q(p_1_in[2]),
        .R(p_0_in));
  FDRE \B_reg[3] 
       (.C(i_CLK),
        .CE(B0__0),
        .D(S_AXIS_DATA[3]),
        .Q(p_1_in[3]),
        .R(p_0_in));
  FDRE \B_reg[4] 
       (.C(i_CLK),
        .CE(B0__0),
        .D(S_AXIS_DATA[4]),
        .Q(p_1_in[4]),
        .R(p_0_in));
  FDRE \B_reg[5] 
       (.C(i_CLK),
        .CE(B0__0),
        .D(S_AXIS_DATA[5]),
        .Q(p_1_in[5]),
        .R(p_0_in));
  FDRE \B_reg[6] 
       (.C(i_CLK),
        .CE(B0__0),
        .D(S_AXIS_DATA[6]),
        .Q(p_1_in[6]),
        .R(p_0_in));
  FDRE \B_reg[7] 
       (.C(i_CLK),
        .CE(B0__0),
        .D(S_AXIS_DATA[7]),
        .Q(p_1_in[7]),
        .R(p_0_in));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h2A6A0000)) 
    \CNT2THREE[0]_i_1 
       (.I0(CNT2THREE[0]),
        .I1(S_AXIS_VALID),
        .I2(M_AXIS_READY),
        .I3(CNT2THREE[1]),
        .I4(i_RSTn),
        .O(\CNT2THREE[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6A2A0000)) 
    \CNT2THREE[1]_i_1 
       (.I0(CNT2THREE[1]),
        .I1(S_AXIS_VALID),
        .I2(M_AXIS_READY),
        .I3(CNT2THREE[0]),
        .I4(i_RSTn),
        .O(\CNT2THREE[1]_i_1_n_0 ));
  FDRE \CNT2THREE_reg[0] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\CNT2THREE[0]_i_1_n_0 ),
        .Q(CNT2THREE[0]),
        .R(1'b0));
  FDRE \CNT2THREE_reg[1] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\CNT2THREE[1]_i_1_n_0 ),
        .Q(CNT2THREE[1]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0800)) 
    G0
       (.I0(S_AXIS_VALID),
        .I1(M_AXIS_READY),
        .I2(CNT2THREE[1]),
        .I3(CNT2THREE[0]),
        .O(G0__0));
  FDRE \G_reg[0] 
       (.C(i_CLK),
        .CE(G0__0),
        .D(S_AXIS_DATA[0]),
        .Q(p_1_in[8]),
        .R(p_0_in));
  FDRE \G_reg[1] 
       (.C(i_CLK),
        .CE(G0__0),
        .D(S_AXIS_DATA[1]),
        .Q(p_1_in[9]),
        .R(p_0_in));
  FDRE \G_reg[2] 
       (.C(i_CLK),
        .CE(G0__0),
        .D(S_AXIS_DATA[2]),
        .Q(p_1_in[10]),
        .R(p_0_in));
  FDRE \G_reg[3] 
       (.C(i_CLK),
        .CE(G0__0),
        .D(S_AXIS_DATA[3]),
        .Q(p_1_in[11]),
        .R(p_0_in));
  FDRE \G_reg[4] 
       (.C(i_CLK),
        .CE(G0__0),
        .D(S_AXIS_DATA[4]),
        .Q(p_1_in[12]),
        .R(p_0_in));
  FDRE \G_reg[5] 
       (.C(i_CLK),
        .CE(G0__0),
        .D(S_AXIS_DATA[5]),
        .Q(p_1_in[13]),
        .R(p_0_in));
  FDRE \G_reg[6] 
       (.C(i_CLK),
        .CE(G0__0),
        .D(S_AXIS_DATA[6]),
        .Q(p_1_in[14]),
        .R(p_0_in));
  FDRE \G_reg[7] 
       (.C(i_CLK),
        .CE(G0__0),
        .D(S_AXIS_DATA[7]),
        .Q(p_1_in[15]),
        .R(p_0_in));
  LUT1 #(
    .INIT(2'h1)) 
    \M_AXIS_DATA[23]_i_1 
       (.I0(i_RSTn),
        .O(p_0_in));
  FDRE \M_AXIS_DATA_reg[0] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[0]),
        .Q(M_AXIS_DATA[0]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[10] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[10]),
        .Q(M_AXIS_DATA[10]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[11] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[11]),
        .Q(M_AXIS_DATA[11]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[12] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[12]),
        .Q(M_AXIS_DATA[12]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[13] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[13]),
        .Q(M_AXIS_DATA[13]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[14] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[14]),
        .Q(M_AXIS_DATA[14]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[15] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[15]),
        .Q(M_AXIS_DATA[15]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[16] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[16]),
        .Q(M_AXIS_DATA[16]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[17] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[17]),
        .Q(M_AXIS_DATA[17]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[18] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[18]),
        .Q(M_AXIS_DATA[18]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[19] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[19]),
        .Q(M_AXIS_DATA[19]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[1] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[1]),
        .Q(M_AXIS_DATA[1]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[20] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[20]),
        .Q(M_AXIS_DATA[20]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[21] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[21]),
        .Q(M_AXIS_DATA[21]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[22] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[22]),
        .Q(M_AXIS_DATA[22]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[23] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[23]),
        .Q(M_AXIS_DATA[23]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[2] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[2]),
        .Q(M_AXIS_DATA[2]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[3] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[3]),
        .Q(M_AXIS_DATA[3]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[4] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[4]),
        .Q(M_AXIS_DATA[4]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[5] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[5]),
        .Q(M_AXIS_DATA[5]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[6] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[6]),
        .Q(M_AXIS_DATA[6]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[7] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[7]),
        .Q(M_AXIS_DATA[7]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[8] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[8]),
        .Q(M_AXIS_DATA[8]),
        .R(p_0_in));
  FDRE \M_AXIS_DATA_reg[9] 
       (.C(i_CLK),
        .CE(TIMING_AGGREGATE),
        .D(p_1_in[9]),
        .Q(M_AXIS_DATA[9]),
        .R(p_0_in));
  LUT4 #(
    .INIT(16'hF200)) 
    M_AXIS_VALID_SIGN_i_1
       (.I0(M_AXIS_VALID),
        .I1(M_AXIS_READY),
        .I2(TIMING_AGGREGATE),
        .I3(i_RSTn),
        .O(M_AXIS_VALID_SIGN_i_1_n_0));
  FDRE M_AXIS_VALID_SIGN_reg
       (.C(i_CLK),
        .CE(1'b1),
        .D(M_AXIS_VALID_SIGN_i_1_n_0),
        .Q(M_AXIS_VALID),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0800)) 
    R0
       (.I0(S_AXIS_VALID),
        .I1(M_AXIS_READY),
        .I2(CNT2THREE[0]),
        .I3(CNT2THREE[1]),
        .O(R0__0));
  FDRE \R_reg[0] 
       (.C(i_CLK),
        .CE(R0__0),
        .D(S_AXIS_DATA[0]),
        .Q(p_1_in[16]),
        .R(p_0_in));
  FDRE \R_reg[1] 
       (.C(i_CLK),
        .CE(R0__0),
        .D(S_AXIS_DATA[1]),
        .Q(p_1_in[17]),
        .R(p_0_in));
  FDRE \R_reg[2] 
       (.C(i_CLK),
        .CE(R0__0),
        .D(S_AXIS_DATA[2]),
        .Q(p_1_in[18]),
        .R(p_0_in));
  FDRE \R_reg[3] 
       (.C(i_CLK),
        .CE(R0__0),
        .D(S_AXIS_DATA[3]),
        .Q(p_1_in[19]),
        .R(p_0_in));
  FDRE \R_reg[4] 
       (.C(i_CLK),
        .CE(R0__0),
        .D(S_AXIS_DATA[4]),
        .Q(p_1_in[20]),
        .R(p_0_in));
  FDRE \R_reg[5] 
       (.C(i_CLK),
        .CE(R0__0),
        .D(S_AXIS_DATA[5]),
        .Q(p_1_in[21]),
        .R(p_0_in));
  FDRE \R_reg[6] 
       (.C(i_CLK),
        .CE(R0__0),
        .D(S_AXIS_DATA[6]),
        .Q(p_1_in[22]),
        .R(p_0_in));
  FDRE \R_reg[7] 
       (.C(i_CLK),
        .CE(R0__0),
        .D(S_AXIS_DATA[7]),
        .Q(p_1_in[23]),
        .R(p_0_in));
  LUT5 #(
    .INIT(32'h20000000)) 
    TIMING_AGGREGATE_i_1
       (.I0(CNT2THREE[1]),
        .I1(CNT2THREE[0]),
        .I2(M_AXIS_READY),
        .I3(S_AXIS_VALID),
        .I4(i_RSTn),
        .O(TIMING_AGGREGATE_i_1_n_0));
  FDRE TIMING_AGGREGATE_reg
       (.C(i_CLK),
        .CE(1'b1),
        .D(TIMING_AGGREGATE_i_1_n_0),
        .Q(TIMING_AGGREGATE),
        .R(1'b0));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_AXIS_CONV8to24_0_0,AXIS_CONV8to24,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "AXIS_CONV8to24,Vivado 2023.1" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (i_CLK,
    i_RSTn,
    M_AXIS_VALID,
    M_AXIS_READY,
    M_AXIS_DATA,
    S_AXIS_DATA,
    S_AXIS_VALID,
    S_AXIS_READY);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 i_CLK CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME i_CLK, ASSOCIATED_RESET i_RSTn, FREQ_HZ 100000000, ASSOCIATED_BUSIF M_AXIS:S_AXIS, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0" *) input i_CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 i_RSTn RST" *) (* x_interface_parameter = "XIL_INTERFACENAME i_RSTn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input i_RSTn;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output M_AXIS_VALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input M_AXIS_READY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [23:0]M_AXIS_DATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [7:0]S_AXIS_DATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input S_AXIS_VALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output S_AXIS_READY;

  wire [23:0]M_AXIS_DATA;
  wire M_AXIS_READY;
  wire M_AXIS_VALID;
  wire [7:0]S_AXIS_DATA;
  wire S_AXIS_VALID;
  wire i_CLK;
  wire i_RSTn;

  assign S_AXIS_READY = M_AXIS_READY;
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_CONV8to24 U0
       (.M_AXIS_DATA(M_AXIS_DATA),
        .M_AXIS_READY(M_AXIS_READY),
        .M_AXIS_VALID(M_AXIS_VALID),
        .S_AXIS_DATA(S_AXIS_DATA),
        .S_AXIS_VALID(S_AXIS_VALID),
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn));
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
