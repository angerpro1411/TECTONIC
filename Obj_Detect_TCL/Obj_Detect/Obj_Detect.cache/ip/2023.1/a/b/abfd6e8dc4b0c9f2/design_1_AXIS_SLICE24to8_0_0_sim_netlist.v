// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
// Date        : Wed Dec 10 10:10:19 2025
// Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_AXIS_SLICE24to8_0_0_sim_netlist.v
// Design      : design_1_AXIS_SLICE24to8_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z020clg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_SLICE24to8
   (S_AXIS_READY,
    M_AXIS_VALID,
    \CNT_OUT_reg[1]_0 ,
    S_AXIS_VALID,
    M_AXIS_READY,
    i_CLK,
    S_AXIS_DATA,
    i_RSTn);
  output S_AXIS_READY;
  output M_AXIS_VALID;
  output [7:0]\CNT_OUT_reg[1]_0 ;
  input S_AXIS_VALID;
  input M_AXIS_READY;
  input i_CLK;
  input [23:0]S_AXIS_DATA;
  input i_RSTn;

  wire [1:0]CNT_OUT;
  wire CNT_OUT0;
  wire \CNT_OUT[0]_i_1_n_0 ;
  wire \CNT_OUT[1]_i_2_n_0 ;
  wire [7:0]\CNT_OUT_reg[1]_0 ;
  wire [7:0]M_AXIS_DATA;
  wire [7:0]M_AXIS_DATA1_in;
  wire \M_AXIS_DATA[0]_INST_0_i_2_n_0 ;
  wire \M_AXIS_DATA[1]_INST_0_i_2_n_0 ;
  wire \M_AXIS_DATA[2]_INST_0_i_2_n_0 ;
  wire \M_AXIS_DATA[3]_INST_0_i_2_n_0 ;
  wire \M_AXIS_DATA[4]_INST_0_i_2_n_0 ;
  wire \M_AXIS_DATA[5]_INST_0_i_2_n_0 ;
  wire \M_AXIS_DATA[6]_INST_0_i_2_n_0 ;
  wire \M_AXIS_DATA[7]_INST_0_i_2_n_0 ;
  wire M_AXIS_READY;
  wire M_AXIS_VALID;
  wire \NBs_DATAs_AVAI[0]_i_1_n_0 ;
  wire \NBs_DATAs_AVAI[0]_i_2_n_0 ;
  wire \NBs_DATAs_AVAI[1]_i_1_n_0 ;
  wire \NBs_DATAs_AVAI[2]_i_1_n_0 ;
  wire \NBs_DATAs_AVAI[3]_i_1_n_0 ;
  wire \NBs_DATAs_AVAI[3]_i_3_n_0 ;
  wire [3:0]NBs_DATAs_AVAI_reg;
  wire [1:0]SLICE_CNT;
  wire \SLICE_CNT[0]_i_1_n_0 ;
  wire \SLICE_CNT[1]_i_1_n_0 ;
  wire [1:0]SLOT_CNT;
  wire \SLOT_CNT[0]_i_1_n_0 ;
  wire \SLOT_CNT[1]_i_1_n_0 ;
  wire \STORE_REG[0]_0 ;
  wire \STORE_REG[1]_3 ;
  wire \STORE_REG[2]_1 ;
  wire \STORE_REG[3]_2 ;
  wire [23:0]\STORE_REG_reg[0] ;
  wire [23:0]\STORE_REG_reg[1] ;
  wire [23:0]\STORE_REG_reg[2] ;
  wire [23:0]\STORE_REG_reg[3] ;
  wire [23:0]S_AXIS_DATA;
  wire S_AXIS_READY;
  wire S_AXIS_VALID;
  wire clear;
  wire i_CLK;
  wire i_RSTn;
  wire [3:1]p_0_in;

  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h34)) 
    \CNT_OUT[0]_i_1 
       (.I0(CNT_OUT[1]),
        .I1(CNT_OUT0),
        .I2(CNT_OUT[0]),
        .O(\CNT_OUT[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \CNT_OUT[1]_i_1 
       (.I0(i_RSTn),
        .O(clear));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h38)) 
    \CNT_OUT[1]_i_2 
       (.I0(CNT_OUT[0]),
        .I1(CNT_OUT0),
        .I2(CNT_OUT[1]),
        .O(\CNT_OUT[1]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'hFFFE0000)) 
    \CNT_OUT[1]_i_3 
       (.I0(NBs_DATAs_AVAI_reg[3]),
        .I1(NBs_DATAs_AVAI_reg[0]),
        .I2(NBs_DATAs_AVAI_reg[1]),
        .I3(NBs_DATAs_AVAI_reg[2]),
        .I4(M_AXIS_READY),
        .O(CNT_OUT0));
  FDRE #(
    .INIT(1'b0)) 
    \CNT_OUT_reg[0] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\CNT_OUT[0]_i_1_n_0 ),
        .Q(CNT_OUT[0]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \CNT_OUT_reg[1] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\CNT_OUT[1]_i_2_n_0 ),
        .Q(CNT_OUT[1]),
        .R(clear));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \M_AXIS_DATA[0]_INST_0 
       (.I0(M_AXIS_DATA[0]),
        .I1(\M_AXIS_DATA[0]_INST_0_i_2_n_0 ),
        .I2(CNT_OUT[1]),
        .I3(CNT_OUT[0]),
        .I4(M_AXIS_DATA1_in[0]),
        .O(\CNT_OUT_reg[1]_0 [0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[0]_INST_0_i_1 
       (.I0(\STORE_REG_reg[1] [8]),
        .I1(\STORE_REG_reg[0] [8]),
        .I2(\STORE_REG_reg[3] [8]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [8]),
        .O(M_AXIS_DATA[0]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[0]_INST_0_i_2 
       (.I0(\STORE_REG_reg[1] [0]),
        .I1(\STORE_REG_reg[0] [0]),
        .I2(\STORE_REG_reg[3] [0]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [0]),
        .O(\M_AXIS_DATA[0]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[0]_INST_0_i_3 
       (.I0(\STORE_REG_reg[1] [16]),
        .I1(\STORE_REG_reg[0] [16]),
        .I2(\STORE_REG_reg[3] [16]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [16]),
        .O(M_AXIS_DATA1_in[0]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \M_AXIS_DATA[1]_INST_0 
       (.I0(M_AXIS_DATA[1]),
        .I1(\M_AXIS_DATA[1]_INST_0_i_2_n_0 ),
        .I2(CNT_OUT[1]),
        .I3(CNT_OUT[0]),
        .I4(M_AXIS_DATA1_in[1]),
        .O(\CNT_OUT_reg[1]_0 [1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[1]_INST_0_i_1 
       (.I0(\STORE_REG_reg[1] [9]),
        .I1(\STORE_REG_reg[0] [9]),
        .I2(\STORE_REG_reg[3] [9]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [9]),
        .O(M_AXIS_DATA[1]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[1]_INST_0_i_2 
       (.I0(\STORE_REG_reg[1] [1]),
        .I1(\STORE_REG_reg[0] [1]),
        .I2(\STORE_REG_reg[3] [1]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [1]),
        .O(\M_AXIS_DATA[1]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[1]_INST_0_i_3 
       (.I0(\STORE_REG_reg[1] [17]),
        .I1(\STORE_REG_reg[0] [17]),
        .I2(\STORE_REG_reg[3] [17]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [17]),
        .O(M_AXIS_DATA1_in[1]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \M_AXIS_DATA[2]_INST_0 
       (.I0(M_AXIS_DATA[2]),
        .I1(\M_AXIS_DATA[2]_INST_0_i_2_n_0 ),
        .I2(CNT_OUT[1]),
        .I3(CNT_OUT[0]),
        .I4(M_AXIS_DATA1_in[2]),
        .O(\CNT_OUT_reg[1]_0 [2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[2]_INST_0_i_1 
       (.I0(\STORE_REG_reg[1] [10]),
        .I1(\STORE_REG_reg[0] [10]),
        .I2(\STORE_REG_reg[3] [10]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [10]),
        .O(M_AXIS_DATA[2]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[2]_INST_0_i_2 
       (.I0(\STORE_REG_reg[1] [2]),
        .I1(\STORE_REG_reg[0] [2]),
        .I2(\STORE_REG_reg[3] [2]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [2]),
        .O(\M_AXIS_DATA[2]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[2]_INST_0_i_3 
       (.I0(\STORE_REG_reg[1] [18]),
        .I1(\STORE_REG_reg[0] [18]),
        .I2(\STORE_REG_reg[3] [18]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [18]),
        .O(M_AXIS_DATA1_in[2]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \M_AXIS_DATA[3]_INST_0 
       (.I0(M_AXIS_DATA[3]),
        .I1(\M_AXIS_DATA[3]_INST_0_i_2_n_0 ),
        .I2(CNT_OUT[1]),
        .I3(CNT_OUT[0]),
        .I4(M_AXIS_DATA1_in[3]),
        .O(\CNT_OUT_reg[1]_0 [3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[3]_INST_0_i_1 
       (.I0(\STORE_REG_reg[1] [11]),
        .I1(\STORE_REG_reg[0] [11]),
        .I2(\STORE_REG_reg[3] [11]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [11]),
        .O(M_AXIS_DATA[3]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[3]_INST_0_i_2 
       (.I0(\STORE_REG_reg[1] [3]),
        .I1(\STORE_REG_reg[0] [3]),
        .I2(\STORE_REG_reg[3] [3]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [3]),
        .O(\M_AXIS_DATA[3]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[3]_INST_0_i_3 
       (.I0(\STORE_REG_reg[1] [19]),
        .I1(\STORE_REG_reg[0] [19]),
        .I2(\STORE_REG_reg[3] [19]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [19]),
        .O(M_AXIS_DATA1_in[3]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \M_AXIS_DATA[4]_INST_0 
       (.I0(M_AXIS_DATA[4]),
        .I1(\M_AXIS_DATA[4]_INST_0_i_2_n_0 ),
        .I2(CNT_OUT[1]),
        .I3(CNT_OUT[0]),
        .I4(M_AXIS_DATA1_in[4]),
        .O(\CNT_OUT_reg[1]_0 [4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[4]_INST_0_i_1 
       (.I0(\STORE_REG_reg[1] [12]),
        .I1(\STORE_REG_reg[0] [12]),
        .I2(\STORE_REG_reg[3] [12]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [12]),
        .O(M_AXIS_DATA[4]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[4]_INST_0_i_2 
       (.I0(\STORE_REG_reg[1] [4]),
        .I1(\STORE_REG_reg[0] [4]),
        .I2(\STORE_REG_reg[3] [4]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [4]),
        .O(\M_AXIS_DATA[4]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[4]_INST_0_i_3 
       (.I0(\STORE_REG_reg[1] [20]),
        .I1(\STORE_REG_reg[0] [20]),
        .I2(\STORE_REG_reg[3] [20]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [20]),
        .O(M_AXIS_DATA1_in[4]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \M_AXIS_DATA[5]_INST_0 
       (.I0(M_AXIS_DATA[5]),
        .I1(\M_AXIS_DATA[5]_INST_0_i_2_n_0 ),
        .I2(CNT_OUT[1]),
        .I3(CNT_OUT[0]),
        .I4(M_AXIS_DATA1_in[5]),
        .O(\CNT_OUT_reg[1]_0 [5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[5]_INST_0_i_1 
       (.I0(\STORE_REG_reg[1] [13]),
        .I1(\STORE_REG_reg[0] [13]),
        .I2(\STORE_REG_reg[3] [13]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [13]),
        .O(M_AXIS_DATA[5]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[5]_INST_0_i_2 
       (.I0(\STORE_REG_reg[1] [5]),
        .I1(\STORE_REG_reg[0] [5]),
        .I2(\STORE_REG_reg[3] [5]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [5]),
        .O(\M_AXIS_DATA[5]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[5]_INST_0_i_3 
       (.I0(\STORE_REG_reg[1] [21]),
        .I1(\STORE_REG_reg[0] [21]),
        .I2(\STORE_REG_reg[3] [21]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [21]),
        .O(M_AXIS_DATA1_in[5]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \M_AXIS_DATA[6]_INST_0 
       (.I0(M_AXIS_DATA[6]),
        .I1(\M_AXIS_DATA[6]_INST_0_i_2_n_0 ),
        .I2(CNT_OUT[1]),
        .I3(CNT_OUT[0]),
        .I4(M_AXIS_DATA1_in[6]),
        .O(\CNT_OUT_reg[1]_0 [6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[6]_INST_0_i_1 
       (.I0(\STORE_REG_reg[1] [14]),
        .I1(\STORE_REG_reg[0] [14]),
        .I2(\STORE_REG_reg[3] [14]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [14]),
        .O(M_AXIS_DATA[6]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[6]_INST_0_i_2 
       (.I0(\STORE_REG_reg[1] [6]),
        .I1(\STORE_REG_reg[0] [6]),
        .I2(\STORE_REG_reg[3] [6]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [6]),
        .O(\M_AXIS_DATA[6]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[6]_INST_0_i_3 
       (.I0(\STORE_REG_reg[1] [22]),
        .I1(\STORE_REG_reg[0] [22]),
        .I2(\STORE_REG_reg[3] [22]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [22]),
        .O(M_AXIS_DATA1_in[6]));
  LUT5 #(
    .INIT(32'h0AFC0A0C)) 
    \M_AXIS_DATA[7]_INST_0 
       (.I0(M_AXIS_DATA[7]),
        .I1(\M_AXIS_DATA[7]_INST_0_i_2_n_0 ),
        .I2(CNT_OUT[1]),
        .I3(CNT_OUT[0]),
        .I4(M_AXIS_DATA1_in[7]),
        .O(\CNT_OUT_reg[1]_0 [7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[7]_INST_0_i_1 
       (.I0(\STORE_REG_reg[1] [15]),
        .I1(\STORE_REG_reg[0] [15]),
        .I2(\STORE_REG_reg[3] [15]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [15]),
        .O(M_AXIS_DATA[7]));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[7]_INST_0_i_2 
       (.I0(\STORE_REG_reg[1] [7]),
        .I1(\STORE_REG_reg[0] [7]),
        .I2(\STORE_REG_reg[3] [7]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [7]),
        .O(\M_AXIS_DATA[7]_INST_0_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hF0AAFFCCF0AA00CC)) 
    \M_AXIS_DATA[7]_INST_0_i_3 
       (.I0(\STORE_REG_reg[1] [23]),
        .I1(\STORE_REG_reg[0] [23]),
        .I2(\STORE_REG_reg[3] [23]),
        .I3(SLICE_CNT[1]),
        .I4(SLICE_CNT[0]),
        .I5(\STORE_REG_reg[2] [23]),
        .O(M_AXIS_DATA1_in[7]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    M_AXIS_VALID_INST_0
       (.I0(NBs_DATAs_AVAI_reg[2]),
        .I1(NBs_DATAs_AVAI_reg[1]),
        .I2(NBs_DATAs_AVAI_reg[0]),
        .I3(NBs_DATAs_AVAI_reg[3]),
        .O(M_AXIS_VALID));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \NBs_DATAs_AVAI[0]_i_1 
       (.I0(NBs_DATAs_AVAI_reg[0]),
        .I1(\NBs_DATAs_AVAI[0]_i_2_n_0 ),
        .I2(\NBs_DATAs_AVAI[3]_i_3_n_0 ),
        .O(\NBs_DATAs_AVAI[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h02AA0000FD57FFFF)) 
    \NBs_DATAs_AVAI[0]_i_2 
       (.I0(S_AXIS_VALID),
        .I1(NBs_DATAs_AVAI_reg[1]),
        .I2(NBs_DATAs_AVAI_reg[2]),
        .I3(NBs_DATAs_AVAI_reg[3]),
        .I4(M_AXIS_READY),
        .I5(NBs_DATAs_AVAI_reg[0]),
        .O(\NBs_DATAs_AVAI[0]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \NBs_DATAs_AVAI[1]_i_1 
       (.I0(NBs_DATAs_AVAI_reg[1]),
        .I1(p_0_in[1]),
        .I2(\NBs_DATAs_AVAI[3]_i_3_n_0 ),
        .O(\NBs_DATAs_AVAI[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hC4C43BBBCCCC3333)) 
    \NBs_DATAs_AVAI[1]_i_2 
       (.I0(M_AXIS_READY),
        .I1(NBs_DATAs_AVAI_reg[0]),
        .I2(NBs_DATAs_AVAI_reg[3]),
        .I3(NBs_DATAs_AVAI_reg[2]),
        .I4(NBs_DATAs_AVAI_reg[1]),
        .I5(S_AXIS_VALID),
        .O(p_0_in[1]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \NBs_DATAs_AVAI[2]_i_1 
       (.I0(NBs_DATAs_AVAI_reg[2]),
        .I1(p_0_in[2]),
        .I2(\NBs_DATAs_AVAI[3]_i_3_n_0 ),
        .O(\NBs_DATAs_AVAI[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF00FCB44FF00CC33)) 
    \NBs_DATAs_AVAI[2]_i_2 
       (.I0(M_AXIS_READY),
        .I1(NBs_DATAs_AVAI_reg[0]),
        .I2(NBs_DATAs_AVAI_reg[3]),
        .I3(NBs_DATAs_AVAI_reg[2]),
        .I4(NBs_DATAs_AVAI_reg[1]),
        .I5(S_AXIS_VALID),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT3 #(
    .INIT(8'hCA)) 
    \NBs_DATAs_AVAI[3]_i_1 
       (.I0(NBs_DATAs_AVAI_reg[3]),
        .I1(p_0_in[3]),
        .I2(\NBs_DATAs_AVAI[3]_i_3_n_0 ),
        .O(\NBs_DATAs_AVAI[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFF0F4F0F0F0F0C3)) 
    \NBs_DATAs_AVAI[3]_i_2 
       (.I0(M_AXIS_READY),
        .I1(NBs_DATAs_AVAI_reg[0]),
        .I2(NBs_DATAs_AVAI_reg[3]),
        .I3(NBs_DATAs_AVAI_reg[2]),
        .I4(NBs_DATAs_AVAI_reg[1]),
        .I5(S_AXIS_VALID),
        .O(p_0_in[3]));
  LUT6 #(
    .INIT(64'hFFFF555FFFFE0000)) 
    \NBs_DATAs_AVAI[3]_i_3 
       (.I0(NBs_DATAs_AVAI_reg[3]),
        .I1(NBs_DATAs_AVAI_reg[0]),
        .I2(NBs_DATAs_AVAI_reg[1]),
        .I3(NBs_DATAs_AVAI_reg[2]),
        .I4(M_AXIS_READY),
        .I5(S_AXIS_VALID),
        .O(\NBs_DATAs_AVAI[3]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \NBs_DATAs_AVAI_reg[0] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\NBs_DATAs_AVAI[0]_i_1_n_0 ),
        .Q(NBs_DATAs_AVAI_reg[0]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \NBs_DATAs_AVAI_reg[1] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\NBs_DATAs_AVAI[1]_i_1_n_0 ),
        .Q(NBs_DATAs_AVAI_reg[1]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \NBs_DATAs_AVAI_reg[2] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\NBs_DATAs_AVAI[2]_i_1_n_0 ),
        .Q(NBs_DATAs_AVAI_reg[2]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \NBs_DATAs_AVAI_reg[3] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\NBs_DATAs_AVAI[3]_i_1_n_0 ),
        .Q(NBs_DATAs_AVAI_reg[3]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hBF40)) 
    \SLICE_CNT[0]_i_1 
       (.I0(CNT_OUT[0]),
        .I1(CNT_OUT[1]),
        .I2(CNT_OUT0),
        .I3(SLICE_CNT[0]),
        .O(\SLICE_CNT[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hDFFF2000)) 
    \SLICE_CNT[1]_i_1 
       (.I0(SLICE_CNT[0]),
        .I1(CNT_OUT[0]),
        .I2(CNT_OUT[1]),
        .I3(CNT_OUT0),
        .I4(SLICE_CNT[1]),
        .O(\SLICE_CNT[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SLICE_CNT_reg[0] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\SLICE_CNT[0]_i_1_n_0 ),
        .Q(SLICE_CNT[0]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \SLICE_CNT_reg[1] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\SLICE_CNT[1]_i_1_n_0 ),
        .Q(SLICE_CNT[1]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT5 #(
    .INIT(32'hFD5502AA)) 
    \SLOT_CNT[0]_i_1 
       (.I0(S_AXIS_VALID),
        .I1(NBs_DATAs_AVAI_reg[1]),
        .I2(NBs_DATAs_AVAI_reg[2]),
        .I3(NBs_DATAs_AVAI_reg[3]),
        .I4(SLOT_CNT[0]),
        .O(\SLOT_CNT[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFF7777700088888)) 
    \SLOT_CNT[1]_i_1 
       (.I0(SLOT_CNT[0]),
        .I1(S_AXIS_VALID),
        .I2(NBs_DATAs_AVAI_reg[1]),
        .I3(NBs_DATAs_AVAI_reg[2]),
        .I4(NBs_DATAs_AVAI_reg[3]),
        .I5(SLOT_CNT[1]),
        .O(\SLOT_CNT[1]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \SLOT_CNT_reg[0] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\SLOT_CNT[0]_i_1_n_0 ),
        .Q(SLOT_CNT[0]),
        .R(clear));
  FDRE #(
    .INIT(1'b0)) 
    \SLOT_CNT_reg[1] 
       (.C(i_CLK),
        .CE(1'b1),
        .D(\SLOT_CNT[1]_i_1_n_0 ),
        .Q(SLOT_CNT[1]),
        .R(clear));
  LUT6 #(
    .INIT(64'h0000000000005700)) 
    \STORE_REG[0][23]_i_1 
       (.I0(NBs_DATAs_AVAI_reg[3]),
        .I1(NBs_DATAs_AVAI_reg[2]),
        .I2(NBs_DATAs_AVAI_reg[1]),
        .I3(S_AXIS_VALID),
        .I4(SLOT_CNT[0]),
        .I5(SLOT_CNT[1]),
        .O(\STORE_REG[0]_0 ));
  LUT6 #(
    .INIT(64'h0000570000000000)) 
    \STORE_REG[1][23]_i_1 
       (.I0(NBs_DATAs_AVAI_reg[3]),
        .I1(NBs_DATAs_AVAI_reg[2]),
        .I2(NBs_DATAs_AVAI_reg[1]),
        .I3(S_AXIS_VALID),
        .I4(SLOT_CNT[1]),
        .I5(SLOT_CNT[0]),
        .O(\STORE_REG[1]_3 ));
  LUT6 #(
    .INIT(64'h0000570000000000)) 
    \STORE_REG[2][23]_i_1 
       (.I0(NBs_DATAs_AVAI_reg[3]),
        .I1(NBs_DATAs_AVAI_reg[2]),
        .I2(NBs_DATAs_AVAI_reg[1]),
        .I3(S_AXIS_VALID),
        .I4(SLOT_CNT[0]),
        .I5(SLOT_CNT[1]),
        .O(\STORE_REG[2]_1 ));
  LUT6 #(
    .INIT(64'h5700000000000000)) 
    \STORE_REG[3][23]_i_1 
       (.I0(NBs_DATAs_AVAI_reg[3]),
        .I1(NBs_DATAs_AVAI_reg[2]),
        .I2(NBs_DATAs_AVAI_reg[1]),
        .I3(S_AXIS_VALID),
        .I4(SLOT_CNT[1]),
        .I5(SLOT_CNT[0]),
        .O(\STORE_REG[3]_2 ));
  FDRE \STORE_REG_reg[0][0] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[0]),
        .Q(\STORE_REG_reg[0] [0]),
        .R(clear));
  FDRE \STORE_REG_reg[0][10] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[10]),
        .Q(\STORE_REG_reg[0] [10]),
        .R(clear));
  FDRE \STORE_REG_reg[0][11] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[11]),
        .Q(\STORE_REG_reg[0] [11]),
        .R(clear));
  FDRE \STORE_REG_reg[0][12] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[12]),
        .Q(\STORE_REG_reg[0] [12]),
        .R(clear));
  FDRE \STORE_REG_reg[0][13] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[13]),
        .Q(\STORE_REG_reg[0] [13]),
        .R(clear));
  FDRE \STORE_REG_reg[0][14] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[14]),
        .Q(\STORE_REG_reg[0] [14]),
        .R(clear));
  FDRE \STORE_REG_reg[0][15] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[15]),
        .Q(\STORE_REG_reg[0] [15]),
        .R(clear));
  FDRE \STORE_REG_reg[0][16] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[16]),
        .Q(\STORE_REG_reg[0] [16]),
        .R(clear));
  FDRE \STORE_REG_reg[0][17] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[17]),
        .Q(\STORE_REG_reg[0] [17]),
        .R(clear));
  FDRE \STORE_REG_reg[0][18] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[18]),
        .Q(\STORE_REG_reg[0] [18]),
        .R(clear));
  FDRE \STORE_REG_reg[0][19] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[19]),
        .Q(\STORE_REG_reg[0] [19]),
        .R(clear));
  FDRE \STORE_REG_reg[0][1] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[1]),
        .Q(\STORE_REG_reg[0] [1]),
        .R(clear));
  FDRE \STORE_REG_reg[0][20] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[20]),
        .Q(\STORE_REG_reg[0] [20]),
        .R(clear));
  FDRE \STORE_REG_reg[0][21] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[21]),
        .Q(\STORE_REG_reg[0] [21]),
        .R(clear));
  FDRE \STORE_REG_reg[0][22] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[22]),
        .Q(\STORE_REG_reg[0] [22]),
        .R(clear));
  FDRE \STORE_REG_reg[0][23] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[23]),
        .Q(\STORE_REG_reg[0] [23]),
        .R(clear));
  FDRE \STORE_REG_reg[0][2] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[2]),
        .Q(\STORE_REG_reg[0] [2]),
        .R(clear));
  FDRE \STORE_REG_reg[0][3] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[3]),
        .Q(\STORE_REG_reg[0] [3]),
        .R(clear));
  FDRE \STORE_REG_reg[0][4] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[4]),
        .Q(\STORE_REG_reg[0] [4]),
        .R(clear));
  FDRE \STORE_REG_reg[0][5] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[5]),
        .Q(\STORE_REG_reg[0] [5]),
        .R(clear));
  FDRE \STORE_REG_reg[0][6] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[6]),
        .Q(\STORE_REG_reg[0] [6]),
        .R(clear));
  FDRE \STORE_REG_reg[0][7] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[7]),
        .Q(\STORE_REG_reg[0] [7]),
        .R(clear));
  FDRE \STORE_REG_reg[0][8] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[8]),
        .Q(\STORE_REG_reg[0] [8]),
        .R(clear));
  FDRE \STORE_REG_reg[0][9] 
       (.C(i_CLK),
        .CE(\STORE_REG[0]_0 ),
        .D(S_AXIS_DATA[9]),
        .Q(\STORE_REG_reg[0] [9]),
        .R(clear));
  FDRE \STORE_REG_reg[1][0] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[0]),
        .Q(\STORE_REG_reg[1] [0]),
        .R(clear));
  FDRE \STORE_REG_reg[1][10] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[10]),
        .Q(\STORE_REG_reg[1] [10]),
        .R(clear));
  FDRE \STORE_REG_reg[1][11] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[11]),
        .Q(\STORE_REG_reg[1] [11]),
        .R(clear));
  FDRE \STORE_REG_reg[1][12] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[12]),
        .Q(\STORE_REG_reg[1] [12]),
        .R(clear));
  FDRE \STORE_REG_reg[1][13] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[13]),
        .Q(\STORE_REG_reg[1] [13]),
        .R(clear));
  FDRE \STORE_REG_reg[1][14] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[14]),
        .Q(\STORE_REG_reg[1] [14]),
        .R(clear));
  FDRE \STORE_REG_reg[1][15] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[15]),
        .Q(\STORE_REG_reg[1] [15]),
        .R(clear));
  FDRE \STORE_REG_reg[1][16] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[16]),
        .Q(\STORE_REG_reg[1] [16]),
        .R(clear));
  FDRE \STORE_REG_reg[1][17] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[17]),
        .Q(\STORE_REG_reg[1] [17]),
        .R(clear));
  FDRE \STORE_REG_reg[1][18] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[18]),
        .Q(\STORE_REG_reg[1] [18]),
        .R(clear));
  FDRE \STORE_REG_reg[1][19] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[19]),
        .Q(\STORE_REG_reg[1] [19]),
        .R(clear));
  FDRE \STORE_REG_reg[1][1] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[1]),
        .Q(\STORE_REG_reg[1] [1]),
        .R(clear));
  FDRE \STORE_REG_reg[1][20] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[20]),
        .Q(\STORE_REG_reg[1] [20]),
        .R(clear));
  FDRE \STORE_REG_reg[1][21] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[21]),
        .Q(\STORE_REG_reg[1] [21]),
        .R(clear));
  FDRE \STORE_REG_reg[1][22] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[22]),
        .Q(\STORE_REG_reg[1] [22]),
        .R(clear));
  FDRE \STORE_REG_reg[1][23] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[23]),
        .Q(\STORE_REG_reg[1] [23]),
        .R(clear));
  FDRE \STORE_REG_reg[1][2] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[2]),
        .Q(\STORE_REG_reg[1] [2]),
        .R(clear));
  FDRE \STORE_REG_reg[1][3] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[3]),
        .Q(\STORE_REG_reg[1] [3]),
        .R(clear));
  FDRE \STORE_REG_reg[1][4] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[4]),
        .Q(\STORE_REG_reg[1] [4]),
        .R(clear));
  FDRE \STORE_REG_reg[1][5] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[5]),
        .Q(\STORE_REG_reg[1] [5]),
        .R(clear));
  FDRE \STORE_REG_reg[1][6] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[6]),
        .Q(\STORE_REG_reg[1] [6]),
        .R(clear));
  FDRE \STORE_REG_reg[1][7] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[7]),
        .Q(\STORE_REG_reg[1] [7]),
        .R(clear));
  FDRE \STORE_REG_reg[1][8] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[8]),
        .Q(\STORE_REG_reg[1] [8]),
        .R(clear));
  FDRE \STORE_REG_reg[1][9] 
       (.C(i_CLK),
        .CE(\STORE_REG[1]_3 ),
        .D(S_AXIS_DATA[9]),
        .Q(\STORE_REG_reg[1] [9]),
        .R(clear));
  FDRE \STORE_REG_reg[2][0] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[0]),
        .Q(\STORE_REG_reg[2] [0]),
        .R(clear));
  FDRE \STORE_REG_reg[2][10] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[10]),
        .Q(\STORE_REG_reg[2] [10]),
        .R(clear));
  FDRE \STORE_REG_reg[2][11] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[11]),
        .Q(\STORE_REG_reg[2] [11]),
        .R(clear));
  FDRE \STORE_REG_reg[2][12] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[12]),
        .Q(\STORE_REG_reg[2] [12]),
        .R(clear));
  FDRE \STORE_REG_reg[2][13] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[13]),
        .Q(\STORE_REG_reg[2] [13]),
        .R(clear));
  FDRE \STORE_REG_reg[2][14] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[14]),
        .Q(\STORE_REG_reg[2] [14]),
        .R(clear));
  FDRE \STORE_REG_reg[2][15] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[15]),
        .Q(\STORE_REG_reg[2] [15]),
        .R(clear));
  FDRE \STORE_REG_reg[2][16] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[16]),
        .Q(\STORE_REG_reg[2] [16]),
        .R(clear));
  FDRE \STORE_REG_reg[2][17] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[17]),
        .Q(\STORE_REG_reg[2] [17]),
        .R(clear));
  FDRE \STORE_REG_reg[2][18] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[18]),
        .Q(\STORE_REG_reg[2] [18]),
        .R(clear));
  FDRE \STORE_REG_reg[2][19] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[19]),
        .Q(\STORE_REG_reg[2] [19]),
        .R(clear));
  FDRE \STORE_REG_reg[2][1] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[1]),
        .Q(\STORE_REG_reg[2] [1]),
        .R(clear));
  FDRE \STORE_REG_reg[2][20] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[20]),
        .Q(\STORE_REG_reg[2] [20]),
        .R(clear));
  FDRE \STORE_REG_reg[2][21] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[21]),
        .Q(\STORE_REG_reg[2] [21]),
        .R(clear));
  FDRE \STORE_REG_reg[2][22] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[22]),
        .Q(\STORE_REG_reg[2] [22]),
        .R(clear));
  FDRE \STORE_REG_reg[2][23] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[23]),
        .Q(\STORE_REG_reg[2] [23]),
        .R(clear));
  FDRE \STORE_REG_reg[2][2] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[2]),
        .Q(\STORE_REG_reg[2] [2]),
        .R(clear));
  FDRE \STORE_REG_reg[2][3] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[3]),
        .Q(\STORE_REG_reg[2] [3]),
        .R(clear));
  FDRE \STORE_REG_reg[2][4] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[4]),
        .Q(\STORE_REG_reg[2] [4]),
        .R(clear));
  FDRE \STORE_REG_reg[2][5] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[5]),
        .Q(\STORE_REG_reg[2] [5]),
        .R(clear));
  FDRE \STORE_REG_reg[2][6] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[6]),
        .Q(\STORE_REG_reg[2] [6]),
        .R(clear));
  FDRE \STORE_REG_reg[2][7] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[7]),
        .Q(\STORE_REG_reg[2] [7]),
        .R(clear));
  FDRE \STORE_REG_reg[2][8] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[8]),
        .Q(\STORE_REG_reg[2] [8]),
        .R(clear));
  FDRE \STORE_REG_reg[2][9] 
       (.C(i_CLK),
        .CE(\STORE_REG[2]_1 ),
        .D(S_AXIS_DATA[9]),
        .Q(\STORE_REG_reg[2] [9]),
        .R(clear));
  FDRE \STORE_REG_reg[3][0] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[0]),
        .Q(\STORE_REG_reg[3] [0]),
        .R(clear));
  FDRE \STORE_REG_reg[3][10] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[10]),
        .Q(\STORE_REG_reg[3] [10]),
        .R(clear));
  FDRE \STORE_REG_reg[3][11] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[11]),
        .Q(\STORE_REG_reg[3] [11]),
        .R(clear));
  FDRE \STORE_REG_reg[3][12] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[12]),
        .Q(\STORE_REG_reg[3] [12]),
        .R(clear));
  FDRE \STORE_REG_reg[3][13] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[13]),
        .Q(\STORE_REG_reg[3] [13]),
        .R(clear));
  FDRE \STORE_REG_reg[3][14] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[14]),
        .Q(\STORE_REG_reg[3] [14]),
        .R(clear));
  FDRE \STORE_REG_reg[3][15] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[15]),
        .Q(\STORE_REG_reg[3] [15]),
        .R(clear));
  FDRE \STORE_REG_reg[3][16] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[16]),
        .Q(\STORE_REG_reg[3] [16]),
        .R(clear));
  FDRE \STORE_REG_reg[3][17] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[17]),
        .Q(\STORE_REG_reg[3] [17]),
        .R(clear));
  FDRE \STORE_REG_reg[3][18] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[18]),
        .Q(\STORE_REG_reg[3] [18]),
        .R(clear));
  FDRE \STORE_REG_reg[3][19] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[19]),
        .Q(\STORE_REG_reg[3] [19]),
        .R(clear));
  FDRE \STORE_REG_reg[3][1] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[1]),
        .Q(\STORE_REG_reg[3] [1]),
        .R(clear));
  FDRE \STORE_REG_reg[3][20] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[20]),
        .Q(\STORE_REG_reg[3] [20]),
        .R(clear));
  FDRE \STORE_REG_reg[3][21] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[21]),
        .Q(\STORE_REG_reg[3] [21]),
        .R(clear));
  FDRE \STORE_REG_reg[3][22] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[22]),
        .Q(\STORE_REG_reg[3] [22]),
        .R(clear));
  FDRE \STORE_REG_reg[3][23] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[23]),
        .Q(\STORE_REG_reg[3] [23]),
        .R(clear));
  FDRE \STORE_REG_reg[3][2] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[2]),
        .Q(\STORE_REG_reg[3] [2]),
        .R(clear));
  FDRE \STORE_REG_reg[3][3] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[3]),
        .Q(\STORE_REG_reg[3] [3]),
        .R(clear));
  FDRE \STORE_REG_reg[3][4] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[4]),
        .Q(\STORE_REG_reg[3] [4]),
        .R(clear));
  FDRE \STORE_REG_reg[3][5] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[5]),
        .Q(\STORE_REG_reg[3] [5]),
        .R(clear));
  FDRE \STORE_REG_reg[3][6] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[6]),
        .Q(\STORE_REG_reg[3] [6]),
        .R(clear));
  FDRE \STORE_REG_reg[3][7] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[7]),
        .Q(\STORE_REG_reg[3] [7]),
        .R(clear));
  FDRE \STORE_REG_reg[3][8] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[8]),
        .Q(\STORE_REG_reg[3] [8]),
        .R(clear));
  FDRE \STORE_REG_reg[3][9] 
       (.C(i_CLK),
        .CE(\STORE_REG[3]_2 ),
        .D(S_AXIS_DATA[9]),
        .Q(\STORE_REG_reg[3] [9]),
        .R(clear));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h57)) 
    S_AXIS_READY_INST_0
       (.I0(NBs_DATAs_AVAI_reg[3]),
        .I1(NBs_DATAs_AVAI_reg[2]),
        .I2(NBs_DATAs_AVAI_reg[1]),
        .O(S_AXIS_READY));
endmodule

(* CHECK_LICENSE_TYPE = "design_1_AXIS_SLICE24to8_0_0,AXIS_SLICE24to8,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* ip_definition_source = "package_project" *) 
(* x_core_info = "AXIS_SLICE24to8,Vivado 2023.1" *) 
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
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) output M_AXIS_VALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input M_AXIS_READY;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [7:0]M_AXIS_DATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0" *) input [23:0]S_AXIS_DATA;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input S_AXIS_VALID;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output S_AXIS_READY;

  wire [7:0]M_AXIS_DATA;
  wire M_AXIS_READY;
  wire M_AXIS_VALID;
  wire [23:0]S_AXIS_DATA;
  wire S_AXIS_READY;
  wire S_AXIS_VALID;
  wire i_CLK;
  wire i_RSTn;

  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_SLICE24to8 U0
       (.\CNT_OUT_reg[1]_0 (M_AXIS_DATA),
        .M_AXIS_READY(M_AXIS_READY),
        .M_AXIS_VALID(M_AXIS_VALID),
        .S_AXIS_DATA(S_AXIS_DATA),
        .S_AXIS_READY(S_AXIS_READY),
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
