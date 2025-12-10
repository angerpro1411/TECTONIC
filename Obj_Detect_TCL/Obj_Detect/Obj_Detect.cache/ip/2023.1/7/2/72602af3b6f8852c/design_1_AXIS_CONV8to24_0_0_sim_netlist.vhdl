-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
-- Date        : Wed Dec 10 10:10:18 2025
-- Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_AXIS_CONV8to24_0_0_sim_netlist.vhdl
-- Design      : design_1_AXIS_CONV8to24_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_CONV8to24 is
  port (
    M_AXIS_DATA : out STD_LOGIC_VECTOR ( 23 downto 0 );
    M_AXIS_VALID : out STD_LOGIC;
    S_AXIS_VALID : in STD_LOGIC;
    M_AXIS_READY : in STD_LOGIC;
    i_RSTn : in STD_LOGIC;
    i_CLK : in STD_LOGIC;
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 7 downto 0 )
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_CONV8to24;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_CONV8to24 is
  signal \B0__0\ : STD_LOGIC;
  signal CNT2THREE : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \CNT2THREE[0]_i_1_n_0\ : STD_LOGIC;
  signal \CNT2THREE[1]_i_1_n_0\ : STD_LOGIC;
  signal \G0__0\ : STD_LOGIC;
  signal \^m_axis_valid\ : STD_LOGIC;
  signal M_AXIS_VALID_SIGN_i_1_n_0 : STD_LOGIC;
  signal \R0__0\ : STD_LOGIC;
  signal TIMING_AGGREGATE : STD_LOGIC;
  signal TIMING_AGGREGATE_i_1_n_0 : STD_LOGIC;
  signal p_0_in : STD_LOGIC;
  signal p_1_in : STD_LOGIC_VECTOR ( 23 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CNT2THREE[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \CNT2THREE[1]_i_1\ : label is "soft_lutpair0";
begin
  M_AXIS_VALID <= \^m_axis_valid\;
B0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => S_AXIS_VALID,
      I1 => M_AXIS_READY,
      I2 => CNT2THREE(1),
      I3 => CNT2THREE(0),
      O => \B0__0\
    );
\B_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \B0__0\,
      D => S_AXIS_DATA(0),
      Q => p_1_in(0),
      R => p_0_in
    );
\B_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \B0__0\,
      D => S_AXIS_DATA(1),
      Q => p_1_in(1),
      R => p_0_in
    );
\B_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \B0__0\,
      D => S_AXIS_DATA(2),
      Q => p_1_in(2),
      R => p_0_in
    );
\B_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \B0__0\,
      D => S_AXIS_DATA(3),
      Q => p_1_in(3),
      R => p_0_in
    );
\B_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \B0__0\,
      D => S_AXIS_DATA(4),
      Q => p_1_in(4),
      R => p_0_in
    );
\B_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \B0__0\,
      D => S_AXIS_DATA(5),
      Q => p_1_in(5),
      R => p_0_in
    );
\B_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \B0__0\,
      D => S_AXIS_DATA(6),
      Q => p_1_in(6),
      R => p_0_in
    );
\B_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \B0__0\,
      D => S_AXIS_DATA(7),
      Q => p_1_in(7),
      R => p_0_in
    );
\CNT2THREE[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"2A6A0000"
    )
        port map (
      I0 => CNT2THREE(0),
      I1 => S_AXIS_VALID,
      I2 => M_AXIS_READY,
      I3 => CNT2THREE(1),
      I4 => i_RSTn,
      O => \CNT2THREE[0]_i_1_n_0\
    );
\CNT2THREE[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6A2A0000"
    )
        port map (
      I0 => CNT2THREE(1),
      I1 => S_AXIS_VALID,
      I2 => M_AXIS_READY,
      I3 => CNT2THREE(0),
      I4 => i_RSTn,
      O => \CNT2THREE[1]_i_1_n_0\
    );
\CNT2THREE_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => \CNT2THREE[0]_i_1_n_0\,
      Q => CNT2THREE(0),
      R => '0'
    );
\CNT2THREE_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => \CNT2THREE[1]_i_1_n_0\,
      Q => CNT2THREE(1),
      R => '0'
    );
G0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => S_AXIS_VALID,
      I1 => M_AXIS_READY,
      I2 => CNT2THREE(1),
      I3 => CNT2THREE(0),
      O => \G0__0\
    );
\G_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \G0__0\,
      D => S_AXIS_DATA(0),
      Q => p_1_in(8),
      R => p_0_in
    );
\G_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \G0__0\,
      D => S_AXIS_DATA(1),
      Q => p_1_in(9),
      R => p_0_in
    );
\G_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \G0__0\,
      D => S_AXIS_DATA(2),
      Q => p_1_in(10),
      R => p_0_in
    );
\G_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \G0__0\,
      D => S_AXIS_DATA(3),
      Q => p_1_in(11),
      R => p_0_in
    );
\G_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \G0__0\,
      D => S_AXIS_DATA(4),
      Q => p_1_in(12),
      R => p_0_in
    );
\G_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \G0__0\,
      D => S_AXIS_DATA(5),
      Q => p_1_in(13),
      R => p_0_in
    );
\G_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \G0__0\,
      D => S_AXIS_DATA(6),
      Q => p_1_in(14),
      R => p_0_in
    );
\G_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \G0__0\,
      D => S_AXIS_DATA(7),
      Q => p_1_in(15),
      R => p_0_in
    );
\M_AXIS_DATA[23]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_RSTn,
      O => p_0_in
    );
\M_AXIS_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(0),
      Q => M_AXIS_DATA(0),
      R => p_0_in
    );
\M_AXIS_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(10),
      Q => M_AXIS_DATA(10),
      R => p_0_in
    );
\M_AXIS_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(11),
      Q => M_AXIS_DATA(11),
      R => p_0_in
    );
\M_AXIS_DATA_reg[12]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(12),
      Q => M_AXIS_DATA(12),
      R => p_0_in
    );
\M_AXIS_DATA_reg[13]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(13),
      Q => M_AXIS_DATA(13),
      R => p_0_in
    );
\M_AXIS_DATA_reg[14]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(14),
      Q => M_AXIS_DATA(14),
      R => p_0_in
    );
\M_AXIS_DATA_reg[15]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(15),
      Q => M_AXIS_DATA(15),
      R => p_0_in
    );
\M_AXIS_DATA_reg[16]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(16),
      Q => M_AXIS_DATA(16),
      R => p_0_in
    );
\M_AXIS_DATA_reg[17]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(17),
      Q => M_AXIS_DATA(17),
      R => p_0_in
    );
\M_AXIS_DATA_reg[18]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(18),
      Q => M_AXIS_DATA(18),
      R => p_0_in
    );
\M_AXIS_DATA_reg[19]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(19),
      Q => M_AXIS_DATA(19),
      R => p_0_in
    );
\M_AXIS_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(1),
      Q => M_AXIS_DATA(1),
      R => p_0_in
    );
\M_AXIS_DATA_reg[20]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(20),
      Q => M_AXIS_DATA(20),
      R => p_0_in
    );
\M_AXIS_DATA_reg[21]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(21),
      Q => M_AXIS_DATA(21),
      R => p_0_in
    );
\M_AXIS_DATA_reg[22]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(22),
      Q => M_AXIS_DATA(22),
      R => p_0_in
    );
\M_AXIS_DATA_reg[23]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(23),
      Q => M_AXIS_DATA(23),
      R => p_0_in
    );
\M_AXIS_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(2),
      Q => M_AXIS_DATA(2),
      R => p_0_in
    );
\M_AXIS_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(3),
      Q => M_AXIS_DATA(3),
      R => p_0_in
    );
\M_AXIS_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(4),
      Q => M_AXIS_DATA(4),
      R => p_0_in
    );
\M_AXIS_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(5),
      Q => M_AXIS_DATA(5),
      R => p_0_in
    );
\M_AXIS_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(6),
      Q => M_AXIS_DATA(6),
      R => p_0_in
    );
\M_AXIS_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(7),
      Q => M_AXIS_DATA(7),
      R => p_0_in
    );
\M_AXIS_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(8),
      Q => M_AXIS_DATA(8),
      R => p_0_in
    );
\M_AXIS_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => TIMING_AGGREGATE,
      D => p_1_in(9),
      Q => M_AXIS_DATA(9),
      R => p_0_in
    );
M_AXIS_VALID_SIGN_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F200"
    )
        port map (
      I0 => \^m_axis_valid\,
      I1 => M_AXIS_READY,
      I2 => TIMING_AGGREGATE,
      I3 => i_RSTn,
      O => M_AXIS_VALID_SIGN_i_1_n_0
    );
M_AXIS_VALID_SIGN_reg: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => M_AXIS_VALID_SIGN_i_1_n_0,
      Q => \^m_axis_valid\,
      R => '0'
    );
R0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0800"
    )
        port map (
      I0 => S_AXIS_VALID,
      I1 => M_AXIS_READY,
      I2 => CNT2THREE(0),
      I3 => CNT2THREE(1),
      O => \R0__0\
    );
\R_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \R0__0\,
      D => S_AXIS_DATA(0),
      Q => p_1_in(16),
      R => p_0_in
    );
\R_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \R0__0\,
      D => S_AXIS_DATA(1),
      Q => p_1_in(17),
      R => p_0_in
    );
\R_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \R0__0\,
      D => S_AXIS_DATA(2),
      Q => p_1_in(18),
      R => p_0_in
    );
\R_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \R0__0\,
      D => S_AXIS_DATA(3),
      Q => p_1_in(19),
      R => p_0_in
    );
\R_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \R0__0\,
      D => S_AXIS_DATA(4),
      Q => p_1_in(20),
      R => p_0_in
    );
\R_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \R0__0\,
      D => S_AXIS_DATA(5),
      Q => p_1_in(21),
      R => p_0_in
    );
\R_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \R0__0\,
      D => S_AXIS_DATA(6),
      Q => p_1_in(22),
      R => p_0_in
    );
\R_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \R0__0\,
      D => S_AXIS_DATA(7),
      Q => p_1_in(23),
      R => p_0_in
    );
TIMING_AGGREGATE_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"20000000"
    )
        port map (
      I0 => CNT2THREE(1),
      I1 => CNT2THREE(0),
      I2 => M_AXIS_READY,
      I3 => S_AXIS_VALID,
      I4 => i_RSTn,
      O => TIMING_AGGREGATE_i_1_n_0
    );
TIMING_AGGREGATE_reg: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => TIMING_AGGREGATE_i_1_n_0,
      Q => TIMING_AGGREGATE,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  port (
    i_CLK : in STD_LOGIC;
    i_RSTn : in STD_LOGIC;
    M_AXIS_VALID : out STD_LOGIC;
    M_AXIS_READY : in STD_LOGIC;
    M_AXIS_DATA : out STD_LOGIC_VECTOR ( 23 downto 0 );
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXIS_VALID : in STD_LOGIC;
    S_AXIS_READY : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_AXIS_CONV8to24_0_0,AXIS_CONV8to24,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "AXIS_CONV8to24,Vivado 2023.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  signal \^m_axis_ready\ : STD_LOGIC;
  attribute x_interface_info : string;
  attribute x_interface_info of M_AXIS_READY : signal is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  attribute x_interface_info of M_AXIS_VALID : signal is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of M_AXIS_VALID : signal is "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute x_interface_info of S_AXIS_READY : signal is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  attribute x_interface_info of S_AXIS_VALID : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  attribute x_interface_info of i_CLK : signal is "xilinx.com:signal:clock:1.0 i_CLK CLK";
  attribute x_interface_parameter of i_CLK : signal is "XIL_INTERFACENAME i_CLK, ASSOCIATED_RESET i_RSTn, FREQ_HZ 100000000, ASSOCIATED_BUSIF M_AXIS:S_AXIS, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of i_RSTn : signal is "xilinx.com:signal:reset:1.0 i_RSTn RST";
  attribute x_interface_parameter of i_RSTn : signal is "XIL_INTERFACENAME i_RSTn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of M_AXIS_DATA : signal is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute x_interface_info of S_AXIS_DATA : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
  attribute x_interface_parameter of S_AXIS_DATA : signal is "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
begin
  S_AXIS_READY <= \^m_axis_ready\;
  \^m_axis_ready\ <= M_AXIS_READY;
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_CONV8to24
     port map (
      M_AXIS_DATA(23 downto 0) => M_AXIS_DATA(23 downto 0),
      M_AXIS_READY => \^m_axis_ready\,
      M_AXIS_VALID => M_AXIS_VALID,
      S_AXIS_DATA(7 downto 0) => S_AXIS_DATA(7 downto 0),
      S_AXIS_VALID => S_AXIS_VALID,
      i_CLK => i_CLK,
      i_RSTn => i_RSTn
    );
end STRUCTURE;
