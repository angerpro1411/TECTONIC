-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
-- Date        : Wed Dec 10 10:10:19 2025
-- Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_AXIS_SLICE24to8_0_0_sim_netlist.vhdl
-- Design      : design_1_AXIS_SLICE24to8_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_SLICE24to8 is
  port (
    S_AXIS_READY : out STD_LOGIC;
    M_AXIS_VALID : out STD_LOGIC;
    \CNT_OUT_reg[1]_0\ : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXIS_VALID : in STD_LOGIC;
    M_AXIS_READY : in STD_LOGIC;
    i_CLK : in STD_LOGIC;
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 23 downto 0 );
    i_RSTn : in STD_LOGIC
  );
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_SLICE24to8;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_SLICE24to8 is
  signal CNT_OUT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal CNT_OUT0 : STD_LOGIC;
  signal \CNT_OUT[0]_i_1_n_0\ : STD_LOGIC;
  signal \CNT_OUT[1]_i_2_n_0\ : STD_LOGIC;
  signal M_AXIS_DATA : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal M_AXIS_DATA1_in : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \M_AXIS_DATA[0]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \M_AXIS_DATA[1]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \M_AXIS_DATA[2]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \M_AXIS_DATA[3]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \M_AXIS_DATA[4]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \M_AXIS_DATA[5]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \M_AXIS_DATA[6]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \M_AXIS_DATA[7]_INST_0_i_2_n_0\ : STD_LOGIC;
  signal \NBs_DATAs_AVAI[0]_i_1_n_0\ : STD_LOGIC;
  signal \NBs_DATAs_AVAI[0]_i_2_n_0\ : STD_LOGIC;
  signal \NBs_DATAs_AVAI[1]_i_1_n_0\ : STD_LOGIC;
  signal \NBs_DATAs_AVAI[2]_i_1_n_0\ : STD_LOGIC;
  signal \NBs_DATAs_AVAI[3]_i_1_n_0\ : STD_LOGIC;
  signal \NBs_DATAs_AVAI[3]_i_3_n_0\ : STD_LOGIC;
  signal NBs_DATAs_AVAI_reg : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal SLICE_CNT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \SLICE_CNT[0]_i_1_n_0\ : STD_LOGIC;
  signal \SLICE_CNT[1]_i_1_n_0\ : STD_LOGIC;
  signal SLOT_CNT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \SLOT_CNT[0]_i_1_n_0\ : STD_LOGIC;
  signal \SLOT_CNT[1]_i_1_n_0\ : STD_LOGIC;
  signal \STORE_REG[0]_0\ : STD_LOGIC;
  signal \STORE_REG[1]_3\ : STD_LOGIC;
  signal \STORE_REG[2]_1\ : STD_LOGIC;
  signal \STORE_REG[3]_2\ : STD_LOGIC;
  signal \STORE_REG_reg[0]\ : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \STORE_REG_reg[1]\ : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \STORE_REG_reg[2]\ : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \STORE_REG_reg[3]\ : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal clear : STD_LOGIC;
  signal p_0_in : STD_LOGIC_VECTOR ( 3 downto 1 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CNT_OUT[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \CNT_OUT[1]_i_2\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \CNT_OUT[1]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of M_AXIS_VALID_INST_0 : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \NBs_DATAs_AVAI[0]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \NBs_DATAs_AVAI[1]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \NBs_DATAs_AVAI[2]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \NBs_DATAs_AVAI[3]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \SLICE_CNT[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \SLICE_CNT[1]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \SLOT_CNT[0]_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of S_AXIS_READY_INST_0 : label is "soft_lutpair1";
begin
\CNT_OUT[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"34"
    )
        port map (
      I0 => CNT_OUT(1),
      I1 => CNT_OUT0,
      I2 => CNT_OUT(0),
      O => \CNT_OUT[0]_i_1_n_0\
    );
\CNT_OUT[1]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_RSTn,
      O => clear
    );
\CNT_OUT[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
        port map (
      I0 => CNT_OUT(0),
      I1 => CNT_OUT0,
      I2 => CNT_OUT(1),
      O => \CNT_OUT[1]_i_2_n_0\
    );
\CNT_OUT[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0000"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(3),
      I1 => NBs_DATAs_AVAI_reg(0),
      I2 => NBs_DATAs_AVAI_reg(1),
      I3 => NBs_DATAs_AVAI_reg(2),
      I4 => M_AXIS_READY,
      O => CNT_OUT0
    );
\CNT_OUT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => \CNT_OUT[0]_i_1_n_0\,
      Q => CNT_OUT(0),
      R => clear
    );
\CNT_OUT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => \CNT_OUT[1]_i_2_n_0\,
      Q => CNT_OUT(1),
      R => clear
    );
\M_AXIS_DATA[0]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => M_AXIS_DATA(0),
      I1 => \M_AXIS_DATA[0]_INST_0_i_2_n_0\,
      I2 => CNT_OUT(1),
      I3 => CNT_OUT(0),
      I4 => M_AXIS_DATA1_in(0),
      O => \CNT_OUT_reg[1]_0\(0)
    );
\M_AXIS_DATA[0]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(8),
      I1 => \STORE_REG_reg[0]\(8),
      I2 => \STORE_REG_reg[3]\(8),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(8),
      O => M_AXIS_DATA(0)
    );
\M_AXIS_DATA[0]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(0),
      I1 => \STORE_REG_reg[0]\(0),
      I2 => \STORE_REG_reg[3]\(0),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(0),
      O => \M_AXIS_DATA[0]_INST_0_i_2_n_0\
    );
\M_AXIS_DATA[0]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(16),
      I1 => \STORE_REG_reg[0]\(16),
      I2 => \STORE_REG_reg[3]\(16),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(16),
      O => M_AXIS_DATA1_in(0)
    );
\M_AXIS_DATA[1]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => M_AXIS_DATA(1),
      I1 => \M_AXIS_DATA[1]_INST_0_i_2_n_0\,
      I2 => CNT_OUT(1),
      I3 => CNT_OUT(0),
      I4 => M_AXIS_DATA1_in(1),
      O => \CNT_OUT_reg[1]_0\(1)
    );
\M_AXIS_DATA[1]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(9),
      I1 => \STORE_REG_reg[0]\(9),
      I2 => \STORE_REG_reg[3]\(9),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(9),
      O => M_AXIS_DATA(1)
    );
\M_AXIS_DATA[1]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(1),
      I1 => \STORE_REG_reg[0]\(1),
      I2 => \STORE_REG_reg[3]\(1),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(1),
      O => \M_AXIS_DATA[1]_INST_0_i_2_n_0\
    );
\M_AXIS_DATA[1]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(17),
      I1 => \STORE_REG_reg[0]\(17),
      I2 => \STORE_REG_reg[3]\(17),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(17),
      O => M_AXIS_DATA1_in(1)
    );
\M_AXIS_DATA[2]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => M_AXIS_DATA(2),
      I1 => \M_AXIS_DATA[2]_INST_0_i_2_n_0\,
      I2 => CNT_OUT(1),
      I3 => CNT_OUT(0),
      I4 => M_AXIS_DATA1_in(2),
      O => \CNT_OUT_reg[1]_0\(2)
    );
\M_AXIS_DATA[2]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(10),
      I1 => \STORE_REG_reg[0]\(10),
      I2 => \STORE_REG_reg[3]\(10),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(10),
      O => M_AXIS_DATA(2)
    );
\M_AXIS_DATA[2]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(2),
      I1 => \STORE_REG_reg[0]\(2),
      I2 => \STORE_REG_reg[3]\(2),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(2),
      O => \M_AXIS_DATA[2]_INST_0_i_2_n_0\
    );
\M_AXIS_DATA[2]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(18),
      I1 => \STORE_REG_reg[0]\(18),
      I2 => \STORE_REG_reg[3]\(18),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(18),
      O => M_AXIS_DATA1_in(2)
    );
\M_AXIS_DATA[3]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => M_AXIS_DATA(3),
      I1 => \M_AXIS_DATA[3]_INST_0_i_2_n_0\,
      I2 => CNT_OUT(1),
      I3 => CNT_OUT(0),
      I4 => M_AXIS_DATA1_in(3),
      O => \CNT_OUT_reg[1]_0\(3)
    );
\M_AXIS_DATA[3]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(11),
      I1 => \STORE_REG_reg[0]\(11),
      I2 => \STORE_REG_reg[3]\(11),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(11),
      O => M_AXIS_DATA(3)
    );
\M_AXIS_DATA[3]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(3),
      I1 => \STORE_REG_reg[0]\(3),
      I2 => \STORE_REG_reg[3]\(3),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(3),
      O => \M_AXIS_DATA[3]_INST_0_i_2_n_0\
    );
\M_AXIS_DATA[3]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(19),
      I1 => \STORE_REG_reg[0]\(19),
      I2 => \STORE_REG_reg[3]\(19),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(19),
      O => M_AXIS_DATA1_in(3)
    );
\M_AXIS_DATA[4]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => M_AXIS_DATA(4),
      I1 => \M_AXIS_DATA[4]_INST_0_i_2_n_0\,
      I2 => CNT_OUT(1),
      I3 => CNT_OUT(0),
      I4 => M_AXIS_DATA1_in(4),
      O => \CNT_OUT_reg[1]_0\(4)
    );
\M_AXIS_DATA[4]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(12),
      I1 => \STORE_REG_reg[0]\(12),
      I2 => \STORE_REG_reg[3]\(12),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(12),
      O => M_AXIS_DATA(4)
    );
\M_AXIS_DATA[4]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(4),
      I1 => \STORE_REG_reg[0]\(4),
      I2 => \STORE_REG_reg[3]\(4),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(4),
      O => \M_AXIS_DATA[4]_INST_0_i_2_n_0\
    );
\M_AXIS_DATA[4]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(20),
      I1 => \STORE_REG_reg[0]\(20),
      I2 => \STORE_REG_reg[3]\(20),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(20),
      O => M_AXIS_DATA1_in(4)
    );
\M_AXIS_DATA[5]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => M_AXIS_DATA(5),
      I1 => \M_AXIS_DATA[5]_INST_0_i_2_n_0\,
      I2 => CNT_OUT(1),
      I3 => CNT_OUT(0),
      I4 => M_AXIS_DATA1_in(5),
      O => \CNT_OUT_reg[1]_0\(5)
    );
\M_AXIS_DATA[5]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(13),
      I1 => \STORE_REG_reg[0]\(13),
      I2 => \STORE_REG_reg[3]\(13),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(13),
      O => M_AXIS_DATA(5)
    );
\M_AXIS_DATA[5]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(5),
      I1 => \STORE_REG_reg[0]\(5),
      I2 => \STORE_REG_reg[3]\(5),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(5),
      O => \M_AXIS_DATA[5]_INST_0_i_2_n_0\
    );
\M_AXIS_DATA[5]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(21),
      I1 => \STORE_REG_reg[0]\(21),
      I2 => \STORE_REG_reg[3]\(21),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(21),
      O => M_AXIS_DATA1_in(5)
    );
\M_AXIS_DATA[6]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => M_AXIS_DATA(6),
      I1 => \M_AXIS_DATA[6]_INST_0_i_2_n_0\,
      I2 => CNT_OUT(1),
      I3 => CNT_OUT(0),
      I4 => M_AXIS_DATA1_in(6),
      O => \CNT_OUT_reg[1]_0\(6)
    );
\M_AXIS_DATA[6]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(14),
      I1 => \STORE_REG_reg[0]\(14),
      I2 => \STORE_REG_reg[3]\(14),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(14),
      O => M_AXIS_DATA(6)
    );
\M_AXIS_DATA[6]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(6),
      I1 => \STORE_REG_reg[0]\(6),
      I2 => \STORE_REG_reg[3]\(6),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(6),
      O => \M_AXIS_DATA[6]_INST_0_i_2_n_0\
    );
\M_AXIS_DATA[6]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(22),
      I1 => \STORE_REG_reg[0]\(22),
      I2 => \STORE_REG_reg[3]\(22),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(22),
      O => M_AXIS_DATA1_in(6)
    );
\M_AXIS_DATA[7]_INST_0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0AFC0A0C"
    )
        port map (
      I0 => M_AXIS_DATA(7),
      I1 => \M_AXIS_DATA[7]_INST_0_i_2_n_0\,
      I2 => CNT_OUT(1),
      I3 => CNT_OUT(0),
      I4 => M_AXIS_DATA1_in(7),
      O => \CNT_OUT_reg[1]_0\(7)
    );
\M_AXIS_DATA[7]_INST_0_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(15),
      I1 => \STORE_REG_reg[0]\(15),
      I2 => \STORE_REG_reg[3]\(15),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(15),
      O => M_AXIS_DATA(7)
    );
\M_AXIS_DATA[7]_INST_0_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(7),
      I1 => \STORE_REG_reg[0]\(7),
      I2 => \STORE_REG_reg[3]\(7),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(7),
      O => \M_AXIS_DATA[7]_INST_0_i_2_n_0\
    );
\M_AXIS_DATA[7]_INST_0_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0AAFFCCF0AA00CC"
    )
        port map (
      I0 => \STORE_REG_reg[1]\(23),
      I1 => \STORE_REG_reg[0]\(23),
      I2 => \STORE_REG_reg[3]\(23),
      I3 => SLICE_CNT(1),
      I4 => SLICE_CNT(0),
      I5 => \STORE_REG_reg[2]\(23),
      O => M_AXIS_DATA1_in(7)
    );
M_AXIS_VALID_INST_0: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(2),
      I1 => NBs_DATAs_AVAI_reg(1),
      I2 => NBs_DATAs_AVAI_reg(0),
      I3 => NBs_DATAs_AVAI_reg(3),
      O => M_AXIS_VALID
    );
\NBs_DATAs_AVAI[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(0),
      I1 => \NBs_DATAs_AVAI[0]_i_2_n_0\,
      I2 => \NBs_DATAs_AVAI[3]_i_3_n_0\,
      O => \NBs_DATAs_AVAI[0]_i_1_n_0\
    );
\NBs_DATAs_AVAI[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"02AA0000FD57FFFF"
    )
        port map (
      I0 => S_AXIS_VALID,
      I1 => NBs_DATAs_AVAI_reg(1),
      I2 => NBs_DATAs_AVAI_reg(2),
      I3 => NBs_DATAs_AVAI_reg(3),
      I4 => M_AXIS_READY,
      I5 => NBs_DATAs_AVAI_reg(0),
      O => \NBs_DATAs_AVAI[0]_i_2_n_0\
    );
\NBs_DATAs_AVAI[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(1),
      I1 => p_0_in(1),
      I2 => \NBs_DATAs_AVAI[3]_i_3_n_0\,
      O => \NBs_DATAs_AVAI[1]_i_1_n_0\
    );
\NBs_DATAs_AVAI[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"C4C43BBBCCCC3333"
    )
        port map (
      I0 => M_AXIS_READY,
      I1 => NBs_DATAs_AVAI_reg(0),
      I2 => NBs_DATAs_AVAI_reg(3),
      I3 => NBs_DATAs_AVAI_reg(2),
      I4 => NBs_DATAs_AVAI_reg(1),
      I5 => S_AXIS_VALID,
      O => p_0_in(1)
    );
\NBs_DATAs_AVAI[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(2),
      I1 => p_0_in(2),
      I2 => \NBs_DATAs_AVAI[3]_i_3_n_0\,
      O => \NBs_DATAs_AVAI[2]_i_1_n_0\
    );
\NBs_DATAs_AVAI[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F00FCB44FF00CC33"
    )
        port map (
      I0 => M_AXIS_READY,
      I1 => NBs_DATAs_AVAI_reg(0),
      I2 => NBs_DATAs_AVAI_reg(3),
      I3 => NBs_DATAs_AVAI_reg(2),
      I4 => NBs_DATAs_AVAI_reg(1),
      I5 => S_AXIS_VALID,
      O => p_0_in(2)
    );
\NBs_DATAs_AVAI[3]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"CA"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(3),
      I1 => p_0_in(3),
      I2 => \NBs_DATAs_AVAI[3]_i_3_n_0\,
      O => \NBs_DATAs_AVAI[3]_i_1_n_0\
    );
\NBs_DATAs_AVAI[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF0F4F0F0F0F0C3"
    )
        port map (
      I0 => M_AXIS_READY,
      I1 => NBs_DATAs_AVAI_reg(0),
      I2 => NBs_DATAs_AVAI_reg(3),
      I3 => NBs_DATAs_AVAI_reg(2),
      I4 => NBs_DATAs_AVAI_reg(1),
      I5 => S_AXIS_VALID,
      O => p_0_in(3)
    );
\NBs_DATAs_AVAI[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF555FFFFE0000"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(3),
      I1 => NBs_DATAs_AVAI_reg(0),
      I2 => NBs_DATAs_AVAI_reg(1),
      I3 => NBs_DATAs_AVAI_reg(2),
      I4 => M_AXIS_READY,
      I5 => S_AXIS_VALID,
      O => \NBs_DATAs_AVAI[3]_i_3_n_0\
    );
\NBs_DATAs_AVAI_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => \NBs_DATAs_AVAI[0]_i_1_n_0\,
      Q => NBs_DATAs_AVAI_reg(0),
      R => clear
    );
\NBs_DATAs_AVAI_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => \NBs_DATAs_AVAI[1]_i_1_n_0\,
      Q => NBs_DATAs_AVAI_reg(1),
      R => clear
    );
\NBs_DATAs_AVAI_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => \NBs_DATAs_AVAI[2]_i_1_n_0\,
      Q => NBs_DATAs_AVAI_reg(2),
      R => clear
    );
\NBs_DATAs_AVAI_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => \NBs_DATAs_AVAI[3]_i_1_n_0\,
      Q => NBs_DATAs_AVAI_reg(3),
      R => clear
    );
\SLICE_CNT[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"BF40"
    )
        port map (
      I0 => CNT_OUT(0),
      I1 => CNT_OUT(1),
      I2 => CNT_OUT0,
      I3 => SLICE_CNT(0),
      O => \SLICE_CNT[0]_i_1_n_0\
    );
\SLICE_CNT[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"DFFF2000"
    )
        port map (
      I0 => SLICE_CNT(0),
      I1 => CNT_OUT(0),
      I2 => CNT_OUT(1),
      I3 => CNT_OUT0,
      I4 => SLICE_CNT(1),
      O => \SLICE_CNT[1]_i_1_n_0\
    );
\SLICE_CNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => \SLICE_CNT[0]_i_1_n_0\,
      Q => SLICE_CNT(0),
      R => clear
    );
\SLICE_CNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => \SLICE_CNT[1]_i_1_n_0\,
      Q => SLICE_CNT(1),
      R => clear
    );
\SLOT_CNT[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FD5502AA"
    )
        port map (
      I0 => S_AXIS_VALID,
      I1 => NBs_DATAs_AVAI_reg(1),
      I2 => NBs_DATAs_AVAI_reg(2),
      I3 => NBs_DATAs_AVAI_reg(3),
      I4 => SLOT_CNT(0),
      O => \SLOT_CNT[0]_i_1_n_0\
    );
\SLOT_CNT[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFF7777700088888"
    )
        port map (
      I0 => SLOT_CNT(0),
      I1 => S_AXIS_VALID,
      I2 => NBs_DATAs_AVAI_reg(1),
      I3 => NBs_DATAs_AVAI_reg(2),
      I4 => NBs_DATAs_AVAI_reg(3),
      I5 => SLOT_CNT(1),
      O => \SLOT_CNT[1]_i_1_n_0\
    );
\SLOT_CNT_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => \SLOT_CNT[0]_i_1_n_0\,
      Q => SLOT_CNT(0),
      R => clear
    );
\SLOT_CNT_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => \SLOT_CNT[1]_i_1_n_0\,
      Q => SLOT_CNT(1),
      R => clear
    );
\STORE_REG[0][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000005700"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(3),
      I1 => NBs_DATAs_AVAI_reg(2),
      I2 => NBs_DATAs_AVAI_reg(1),
      I3 => S_AXIS_VALID,
      I4 => SLOT_CNT(0),
      I5 => SLOT_CNT(1),
      O => \STORE_REG[0]_0\
    );
\STORE_REG[1][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000570000000000"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(3),
      I1 => NBs_DATAs_AVAI_reg(2),
      I2 => NBs_DATAs_AVAI_reg(1),
      I3 => S_AXIS_VALID,
      I4 => SLOT_CNT(1),
      I5 => SLOT_CNT(0),
      O => \STORE_REG[1]_3\
    );
\STORE_REG[2][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000570000000000"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(3),
      I1 => NBs_DATAs_AVAI_reg(2),
      I2 => NBs_DATAs_AVAI_reg(1),
      I3 => S_AXIS_VALID,
      I4 => SLOT_CNT(0),
      I5 => SLOT_CNT(1),
      O => \STORE_REG[2]_1\
    );
\STORE_REG[3][23]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5700000000000000"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(3),
      I1 => NBs_DATAs_AVAI_reg(2),
      I2 => NBs_DATAs_AVAI_reg(1),
      I3 => S_AXIS_VALID,
      I4 => SLOT_CNT(1),
      I5 => SLOT_CNT(0),
      O => \STORE_REG[3]_2\
    );
\STORE_REG_reg[0][0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(0),
      Q => \STORE_REG_reg[0]\(0),
      R => clear
    );
\STORE_REG_reg[0][10]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(10),
      Q => \STORE_REG_reg[0]\(10),
      R => clear
    );
\STORE_REG_reg[0][11]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(11),
      Q => \STORE_REG_reg[0]\(11),
      R => clear
    );
\STORE_REG_reg[0][12]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(12),
      Q => \STORE_REG_reg[0]\(12),
      R => clear
    );
\STORE_REG_reg[0][13]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(13),
      Q => \STORE_REG_reg[0]\(13),
      R => clear
    );
\STORE_REG_reg[0][14]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(14),
      Q => \STORE_REG_reg[0]\(14),
      R => clear
    );
\STORE_REG_reg[0][15]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(15),
      Q => \STORE_REG_reg[0]\(15),
      R => clear
    );
\STORE_REG_reg[0][16]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(16),
      Q => \STORE_REG_reg[0]\(16),
      R => clear
    );
\STORE_REG_reg[0][17]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(17),
      Q => \STORE_REG_reg[0]\(17),
      R => clear
    );
\STORE_REG_reg[0][18]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(18),
      Q => \STORE_REG_reg[0]\(18),
      R => clear
    );
\STORE_REG_reg[0][19]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(19),
      Q => \STORE_REG_reg[0]\(19),
      R => clear
    );
\STORE_REG_reg[0][1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(1),
      Q => \STORE_REG_reg[0]\(1),
      R => clear
    );
\STORE_REG_reg[0][20]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(20),
      Q => \STORE_REG_reg[0]\(20),
      R => clear
    );
\STORE_REG_reg[0][21]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(21),
      Q => \STORE_REG_reg[0]\(21),
      R => clear
    );
\STORE_REG_reg[0][22]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(22),
      Q => \STORE_REG_reg[0]\(22),
      R => clear
    );
\STORE_REG_reg[0][23]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(23),
      Q => \STORE_REG_reg[0]\(23),
      R => clear
    );
\STORE_REG_reg[0][2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(2),
      Q => \STORE_REG_reg[0]\(2),
      R => clear
    );
\STORE_REG_reg[0][3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(3),
      Q => \STORE_REG_reg[0]\(3),
      R => clear
    );
\STORE_REG_reg[0][4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(4),
      Q => \STORE_REG_reg[0]\(4),
      R => clear
    );
\STORE_REG_reg[0][5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(5),
      Q => \STORE_REG_reg[0]\(5),
      R => clear
    );
\STORE_REG_reg[0][6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(6),
      Q => \STORE_REG_reg[0]\(6),
      R => clear
    );
\STORE_REG_reg[0][7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(7),
      Q => \STORE_REG_reg[0]\(7),
      R => clear
    );
\STORE_REG_reg[0][8]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(8),
      Q => \STORE_REG_reg[0]\(8),
      R => clear
    );
\STORE_REG_reg[0][9]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[0]_0\,
      D => S_AXIS_DATA(9),
      Q => \STORE_REG_reg[0]\(9),
      R => clear
    );
\STORE_REG_reg[1][0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(0),
      Q => \STORE_REG_reg[1]\(0),
      R => clear
    );
\STORE_REG_reg[1][10]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(10),
      Q => \STORE_REG_reg[1]\(10),
      R => clear
    );
\STORE_REG_reg[1][11]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(11),
      Q => \STORE_REG_reg[1]\(11),
      R => clear
    );
\STORE_REG_reg[1][12]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(12),
      Q => \STORE_REG_reg[1]\(12),
      R => clear
    );
\STORE_REG_reg[1][13]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(13),
      Q => \STORE_REG_reg[1]\(13),
      R => clear
    );
\STORE_REG_reg[1][14]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(14),
      Q => \STORE_REG_reg[1]\(14),
      R => clear
    );
\STORE_REG_reg[1][15]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(15),
      Q => \STORE_REG_reg[1]\(15),
      R => clear
    );
\STORE_REG_reg[1][16]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(16),
      Q => \STORE_REG_reg[1]\(16),
      R => clear
    );
\STORE_REG_reg[1][17]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(17),
      Q => \STORE_REG_reg[1]\(17),
      R => clear
    );
\STORE_REG_reg[1][18]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(18),
      Q => \STORE_REG_reg[1]\(18),
      R => clear
    );
\STORE_REG_reg[1][19]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(19),
      Q => \STORE_REG_reg[1]\(19),
      R => clear
    );
\STORE_REG_reg[1][1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(1),
      Q => \STORE_REG_reg[1]\(1),
      R => clear
    );
\STORE_REG_reg[1][20]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(20),
      Q => \STORE_REG_reg[1]\(20),
      R => clear
    );
\STORE_REG_reg[1][21]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(21),
      Q => \STORE_REG_reg[1]\(21),
      R => clear
    );
\STORE_REG_reg[1][22]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(22),
      Q => \STORE_REG_reg[1]\(22),
      R => clear
    );
\STORE_REG_reg[1][23]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(23),
      Q => \STORE_REG_reg[1]\(23),
      R => clear
    );
\STORE_REG_reg[1][2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(2),
      Q => \STORE_REG_reg[1]\(2),
      R => clear
    );
\STORE_REG_reg[1][3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(3),
      Q => \STORE_REG_reg[1]\(3),
      R => clear
    );
\STORE_REG_reg[1][4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(4),
      Q => \STORE_REG_reg[1]\(4),
      R => clear
    );
\STORE_REG_reg[1][5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(5),
      Q => \STORE_REG_reg[1]\(5),
      R => clear
    );
\STORE_REG_reg[1][6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(6),
      Q => \STORE_REG_reg[1]\(6),
      R => clear
    );
\STORE_REG_reg[1][7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(7),
      Q => \STORE_REG_reg[1]\(7),
      R => clear
    );
\STORE_REG_reg[1][8]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(8),
      Q => \STORE_REG_reg[1]\(8),
      R => clear
    );
\STORE_REG_reg[1][9]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[1]_3\,
      D => S_AXIS_DATA(9),
      Q => \STORE_REG_reg[1]\(9),
      R => clear
    );
\STORE_REG_reg[2][0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(0),
      Q => \STORE_REG_reg[2]\(0),
      R => clear
    );
\STORE_REG_reg[2][10]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(10),
      Q => \STORE_REG_reg[2]\(10),
      R => clear
    );
\STORE_REG_reg[2][11]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(11),
      Q => \STORE_REG_reg[2]\(11),
      R => clear
    );
\STORE_REG_reg[2][12]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(12),
      Q => \STORE_REG_reg[2]\(12),
      R => clear
    );
\STORE_REG_reg[2][13]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(13),
      Q => \STORE_REG_reg[2]\(13),
      R => clear
    );
\STORE_REG_reg[2][14]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(14),
      Q => \STORE_REG_reg[2]\(14),
      R => clear
    );
\STORE_REG_reg[2][15]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(15),
      Q => \STORE_REG_reg[2]\(15),
      R => clear
    );
\STORE_REG_reg[2][16]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(16),
      Q => \STORE_REG_reg[2]\(16),
      R => clear
    );
\STORE_REG_reg[2][17]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(17),
      Q => \STORE_REG_reg[2]\(17),
      R => clear
    );
\STORE_REG_reg[2][18]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(18),
      Q => \STORE_REG_reg[2]\(18),
      R => clear
    );
\STORE_REG_reg[2][19]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(19),
      Q => \STORE_REG_reg[2]\(19),
      R => clear
    );
\STORE_REG_reg[2][1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(1),
      Q => \STORE_REG_reg[2]\(1),
      R => clear
    );
\STORE_REG_reg[2][20]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(20),
      Q => \STORE_REG_reg[2]\(20),
      R => clear
    );
\STORE_REG_reg[2][21]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(21),
      Q => \STORE_REG_reg[2]\(21),
      R => clear
    );
\STORE_REG_reg[2][22]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(22),
      Q => \STORE_REG_reg[2]\(22),
      R => clear
    );
\STORE_REG_reg[2][23]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(23),
      Q => \STORE_REG_reg[2]\(23),
      R => clear
    );
\STORE_REG_reg[2][2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(2),
      Q => \STORE_REG_reg[2]\(2),
      R => clear
    );
\STORE_REG_reg[2][3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(3),
      Q => \STORE_REG_reg[2]\(3),
      R => clear
    );
\STORE_REG_reg[2][4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(4),
      Q => \STORE_REG_reg[2]\(4),
      R => clear
    );
\STORE_REG_reg[2][5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(5),
      Q => \STORE_REG_reg[2]\(5),
      R => clear
    );
\STORE_REG_reg[2][6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(6),
      Q => \STORE_REG_reg[2]\(6),
      R => clear
    );
\STORE_REG_reg[2][7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(7),
      Q => \STORE_REG_reg[2]\(7),
      R => clear
    );
\STORE_REG_reg[2][8]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(8),
      Q => \STORE_REG_reg[2]\(8),
      R => clear
    );
\STORE_REG_reg[2][9]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[2]_1\,
      D => S_AXIS_DATA(9),
      Q => \STORE_REG_reg[2]\(9),
      R => clear
    );
\STORE_REG_reg[3][0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(0),
      Q => \STORE_REG_reg[3]\(0),
      R => clear
    );
\STORE_REG_reg[3][10]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(10),
      Q => \STORE_REG_reg[3]\(10),
      R => clear
    );
\STORE_REG_reg[3][11]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(11),
      Q => \STORE_REG_reg[3]\(11),
      R => clear
    );
\STORE_REG_reg[3][12]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(12),
      Q => \STORE_REG_reg[3]\(12),
      R => clear
    );
\STORE_REG_reg[3][13]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(13),
      Q => \STORE_REG_reg[3]\(13),
      R => clear
    );
\STORE_REG_reg[3][14]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(14),
      Q => \STORE_REG_reg[3]\(14),
      R => clear
    );
\STORE_REG_reg[3][15]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(15),
      Q => \STORE_REG_reg[3]\(15),
      R => clear
    );
\STORE_REG_reg[3][16]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(16),
      Q => \STORE_REG_reg[3]\(16),
      R => clear
    );
\STORE_REG_reg[3][17]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(17),
      Q => \STORE_REG_reg[3]\(17),
      R => clear
    );
\STORE_REG_reg[3][18]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(18),
      Q => \STORE_REG_reg[3]\(18),
      R => clear
    );
\STORE_REG_reg[3][19]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(19),
      Q => \STORE_REG_reg[3]\(19),
      R => clear
    );
\STORE_REG_reg[3][1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(1),
      Q => \STORE_REG_reg[3]\(1),
      R => clear
    );
\STORE_REG_reg[3][20]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(20),
      Q => \STORE_REG_reg[3]\(20),
      R => clear
    );
\STORE_REG_reg[3][21]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(21),
      Q => \STORE_REG_reg[3]\(21),
      R => clear
    );
\STORE_REG_reg[3][22]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(22),
      Q => \STORE_REG_reg[3]\(22),
      R => clear
    );
\STORE_REG_reg[3][23]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(23),
      Q => \STORE_REG_reg[3]\(23),
      R => clear
    );
\STORE_REG_reg[3][2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(2),
      Q => \STORE_REG_reg[3]\(2),
      R => clear
    );
\STORE_REG_reg[3][3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(3),
      Q => \STORE_REG_reg[3]\(3),
      R => clear
    );
\STORE_REG_reg[3][4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(4),
      Q => \STORE_REG_reg[3]\(4),
      R => clear
    );
\STORE_REG_reg[3][5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(5),
      Q => \STORE_REG_reg[3]\(5),
      R => clear
    );
\STORE_REG_reg[3][6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(6),
      Q => \STORE_REG_reg[3]\(6),
      R => clear
    );
\STORE_REG_reg[3][7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(7),
      Q => \STORE_REG_reg[3]\(7),
      R => clear
    );
\STORE_REG_reg[3][8]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(8),
      Q => \STORE_REG_reg[3]\(8),
      R => clear
    );
\STORE_REG_reg[3][9]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => \STORE_REG[3]_2\,
      D => S_AXIS_DATA(9),
      Q => \STORE_REG_reg[3]\(9),
      R => clear
    );
S_AXIS_READY_INST_0: unisim.vcomponents.LUT3
    generic map(
      INIT => X"57"
    )
        port map (
      I0 => NBs_DATAs_AVAI_reg(3),
      I1 => NBs_DATAs_AVAI_reg(2),
      I2 => NBs_DATAs_AVAI_reg(1),
      O => S_AXIS_READY
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
    M_AXIS_DATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 23 downto 0 );
    S_AXIS_VALID : in STD_LOGIC;
    S_AXIS_READY : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "design_1_AXIS_SLICE24to8_0_0,AXIS_SLICE24to8,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix : entity is "AXIS_SLICE24to8,Vivado 2023.1";
end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture STRUCTURE of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  attribute x_interface_info : string;
  attribute x_interface_info of M_AXIS_READY : signal is "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  attribute x_interface_info of M_AXIS_VALID : signal is "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of M_AXIS_VALID : signal is "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute x_interface_info of S_AXIS_READY : signal is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  attribute x_interface_info of S_AXIS_VALID : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  attribute x_interface_info of i_CLK : signal is "xilinx.com:signal:clock:1.0 i_CLK CLK";
  attribute x_interface_parameter of i_CLK : signal is "XIL_INTERFACENAME i_CLK, ASSOCIATED_RESET i_RSTn, FREQ_HZ 100000000, ASSOCIATED_BUSIF M_AXIS:S_AXIS, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of i_RSTn : signal is "xilinx.com:signal:reset:1.0 i_RSTn RST";
  attribute x_interface_parameter of i_RSTn : signal is "XIL_INTERFACENAME i_RSTn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of M_AXIS_DATA : signal is "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  attribute x_interface_info of S_AXIS_DATA : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
  attribute x_interface_parameter of S_AXIS_DATA : signal is "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 3, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
begin
U0: entity work.decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_AXIS_SLICE24to8
     port map (
      \CNT_OUT_reg[1]_0\(7 downto 0) => M_AXIS_DATA(7 downto 0),
      M_AXIS_READY => M_AXIS_READY,
      M_AXIS_VALID => M_AXIS_VALID,
      S_AXIS_DATA(23 downto 0) => S_AXIS_DATA(23 downto 0),
      S_AXIS_READY => S_AXIS_READY,
      S_AXIS_VALID => S_AXIS_VALID,
      i_CLK => i_CLK,
      i_RSTn => i_RSTn
    );
end STRUCTURE;
