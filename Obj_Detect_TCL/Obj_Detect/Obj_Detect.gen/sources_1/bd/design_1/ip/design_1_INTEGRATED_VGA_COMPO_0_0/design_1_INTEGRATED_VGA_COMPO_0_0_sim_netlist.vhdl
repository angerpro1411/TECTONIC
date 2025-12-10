-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
-- Date        : Wed Dec 10 10:10:20 2025
-- Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode funcsim
--               /home/dell3561-49/Obj_Detect_TCL/Obj_Detect/Obj_Detect.gen/sources_1/bd/design_1/ip/design_1_INTEGRATED_VGA_COMPO_0_0/design_1_INTEGRATED_VGA_COMPO_0_0_sim_netlist.vhdl
-- Design      : design_1_INTEGRATED_VGA_COMPO_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_CONTROLLER is
  port (
    EMPTY_REG_reg_0 : out STD_LOGIC;
    FULL_REG_reg_0 : out STD_LOGIC;
    Q : out STD_LOGIC_VECTOR ( 9 downto 0 );
    \RD_ADDR_REG_reg[9]_0\ : out STD_LOGIC_VECTOR ( 9 downto 0 );
    S_AXIS_READY : out STD_LOGIC;
    i_CLK : in STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    WR_FIFO : in STD_LOGIC;
    \RD_ADDR_REG_reg[9]_1\ : in STD_LOGIC;
    RD_FIFO : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_CONTROLLER : entity is "FIFO_CONTROLLER";
end design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_CONTROLLER;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_CONTROLLER is
  signal EMPTY_NX0 : STD_LOGIC;
  signal EMPTY_NX0_carry_i_1_n_0 : STD_LOGIC;
  signal EMPTY_NX0_carry_i_2_n_0 : STD_LOGIC;
  signal EMPTY_NX0_carry_i_3_n_0 : STD_LOGIC;
  signal EMPTY_NX0_carry_i_4_n_0 : STD_LOGIC;
  signal EMPTY_NX0_carry_i_5_n_0 : STD_LOGIC;
  signal EMPTY_NX0_carry_i_6_n_0 : STD_LOGIC;
  signal EMPTY_NX0_carry_n_1 : STD_LOGIC;
  signal EMPTY_NX0_carry_n_2 : STD_LOGIC;
  signal EMPTY_NX0_carry_n_3 : STD_LOGIC;
  signal EMPTY_REG_i_1_n_0 : STD_LOGIC;
  signal \^empty_reg_reg_0\ : STD_LOGIC;
  signal FULL_NX0 : STD_LOGIC;
  signal FULL_NX0_carry_i_1_n_0 : STD_LOGIC;
  signal FULL_NX0_carry_i_2_n_0 : STD_LOGIC;
  signal FULL_NX0_carry_i_3_n_0 : STD_LOGIC;
  signal FULL_NX0_carry_i_4_n_0 : STD_LOGIC;
  signal FULL_NX0_carry_i_5_n_0 : STD_LOGIC;
  signal FULL_NX0_carry_i_6_n_0 : STD_LOGIC;
  signal FULL_NX0_carry_i_7_n_0 : STD_LOGIC;
  signal FULL_NX0_carry_n_1 : STD_LOGIC;
  signal FULL_NX0_carry_n_2 : STD_LOGIC;
  signal FULL_NX0_carry_n_3 : STD_LOGIC;
  signal FULL_REG_i_1_n_0 : STD_LOGIC;
  signal \^full_reg_reg_0\ : STD_LOGIC;
  signal \^q\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal RD_ADDR_NX : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal \RD_ADDR_REG[5]_i_2_n_0\ : STD_LOGIC;
  signal \RD_ADDR_REG[9]_i_2_n_0\ : STD_LOGIC;
  signal \^rd_addr_reg_reg[9]_0\ : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal WR_ADDR_NX : STD_LOGIC_VECTOR ( 9 downto 1 );
  signal \WR_ADDR_REG[0]_i_1_n_0\ : STD_LOGIC;
  signal \WR_ADDR_REG[4]_i_2_n_0\ : STD_LOGIC;
  signal \WR_ADDR_REG[5]_i_1_n_0\ : STD_LOGIC;
  signal \WR_ADDR_REG[6]_i_1_n_0\ : STD_LOGIC;
  signal \WR_ADDR_REG[8]_i_2_n_0\ : STD_LOGIC;
  signal \WR_ADDR_REG[9]_i_2_n_0\ : STD_LOGIC;
  signal NLW_EMPTY_NX0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal NLW_FULL_NX0_carry_O_UNCONNECTED : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of EMPTY_NX0_carry_i_5 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of EMPTY_REG_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of FULL_NX0_carry_i_5 : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of FULL_REG_i_1 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \RD_ADDR_REG[0]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \RD_ADDR_REG[1]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \RD_ADDR_REG[2]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \RD_ADDR_REG[6]_i_1\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \RD_ADDR_REG[7]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of S_AXIS_READY_INST_0 : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \WR_ADDR_REG[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \WR_ADDR_REG[2]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \WR_ADDR_REG[4]_i_2\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \WR_ADDR_REG[5]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \WR_ADDR_REG[6]_i_1\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \WR_ADDR_REG[7]_i_1\ : label is "soft_lutpair1";
begin
  EMPTY_REG_reg_0 <= \^empty_reg_reg_0\;
  FULL_REG_reg_0 <= \^full_reg_reg_0\;
  Q(9 downto 0) <= \^q\(9 downto 0);
  \RD_ADDR_REG_reg[9]_0\(9 downto 0) <= \^rd_addr_reg_reg[9]_0\(9 downto 0);
EMPTY_NX0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => EMPTY_NX0,
      CO(2) => EMPTY_NX0_carry_n_1,
      CO(1) => EMPTY_NX0_carry_n_2,
      CO(0) => EMPTY_NX0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_EMPTY_NX0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => EMPTY_NX0_carry_i_1_n_0,
      S(2) => EMPTY_NX0_carry_i_2_n_0,
      S(1) => EMPTY_NX0_carry_i_3_n_0,
      S(0) => EMPTY_NX0_carry_i_4_n_0
    );
EMPTY_NX0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A95"
    )
        port map (
      I0 => \^q\(9),
      I1 => EMPTY_NX0_carry_i_5_n_0,
      I2 => \^rd_addr_reg_reg[9]_0\(8),
      I3 => \^rd_addr_reg_reg[9]_0\(9),
      O => EMPTY_NX0_carry_i_1_n_0
    );
EMPTY_NX0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => RD_ADDR_NX(6),
      I1 => \^q\(6),
      I2 => \^q\(8),
      I3 => RD_ADDR_NX(8),
      I4 => \^q\(7),
      I5 => RD_ADDR_NX(7),
      O => EMPTY_NX0_carry_i_2_n_0
    );
EMPTY_NX0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => RD_ADDR_NX(5),
      I1 => \^q\(5),
      I2 => \^q\(4),
      I3 => RD_ADDR_NX(4),
      I4 => \^q\(3),
      I5 => RD_ADDR_NX(3),
      O => EMPTY_NX0_carry_i_3_n_0
    );
EMPTY_NX0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0041410014000041"
    )
        port map (
      I0 => EMPTY_NX0_carry_i_6_n_0,
      I1 => \^q\(1),
      I2 => \^rd_addr_reg_reg[9]_0\(1),
      I3 => \^rd_addr_reg_reg[9]_0\(0),
      I4 => \RD_ADDR_REG_reg[9]_1\,
      I5 => \^q\(0),
      O => EMPTY_NX0_carry_i_4_n_0
    );
EMPTY_NX0_carry_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00002000"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(7),
      I1 => \RD_ADDR_REG[9]_i_2_n_0\,
      I2 => \^rd_addr_reg_reg[9]_0\(6),
      I3 => RD_FIFO,
      I4 => \^empty_reg_reg_0\,
      O => EMPTY_NX0_carry_i_5_n_0
    );
EMPTY_NX0_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"655555559AAAAAAA"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^empty_reg_reg_0\,
      I2 => RD_FIFO,
      I3 => \^rd_addr_reg_reg[9]_0\(0),
      I4 => \^rd_addr_reg_reg[9]_0\(1),
      I5 => \^rd_addr_reg_reg[9]_0\(2),
      O => EMPTY_NX0_carry_i_6_n_0
    );
EMPTY_REG_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF005540"
    )
        port map (
      I0 => WR_FIFO,
      I1 => RD_FIFO,
      I2 => EMPTY_NX0,
      I3 => \^empty_reg_reg_0\,
      I4 => \^full_reg_reg_0\,
      O => EMPTY_REG_i_1_n_0
    );
EMPTY_REG_reg: unisim.vcomponents.FDPE
     port map (
      C => i_CLK,
      CE => '1',
      D => EMPTY_REG_i_1_n_0,
      PRE => SR(0),
      Q => \^empty_reg_reg_0\
    );
FULL_NX0_carry: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => FULL_NX0,
      CO(2) => FULL_NX0_carry_n_1,
      CO(1) => FULL_NX0_carry_n_2,
      CO(0) => FULL_NX0_carry_n_3,
      CYINIT => '1',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => NLW_FULL_NX0_carry_O_UNCONNECTED(3 downto 0),
      S(3) => FULL_NX0_carry_i_1_n_0,
      S(2) => FULL_NX0_carry_i_2_n_0,
      S(1) => FULL_NX0_carry_i_3_n_0,
      S(0) => FULL_NX0_carry_i_4_n_0
    );
FULL_NX0_carry_i_1: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6A95"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(9),
      I1 => \^q\(8),
      I2 => FULL_NX0_carry_i_5_n_0,
      I3 => \^q\(9),
      O => FULL_NX0_carry_i_1_n_0
    );
FULL_NX0_carry_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"9009000000009009"
    )
        port map (
      I0 => WR_ADDR_NX(8),
      I1 => \^rd_addr_reg_reg[9]_0\(8),
      I2 => \^rd_addr_reg_reg[9]_0\(7),
      I3 => WR_ADDR_NX(7),
      I4 => \^rd_addr_reg_reg[9]_0\(6),
      I5 => \WR_ADDR_REG[6]_i_1_n_0\,
      O => FULL_NX0_carry_i_2_n_0
    );
FULL_NX0_carry_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000006909009"
    )
        port map (
      I0 => \^q\(5),
      I1 => \^rd_addr_reg_reg[9]_0\(5),
      I2 => \^rd_addr_reg_reg[9]_0\(4),
      I3 => \WR_ADDR_REG[8]_i_2_n_0\,
      I4 => \^q\(4),
      I5 => FULL_NX0_carry_i_6_n_0,
      O => FULL_NX0_carry_i_3_n_0
    );
FULL_NX0_carry_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4010014004011004"
    )
        port map (
      I0 => FULL_NX0_carry_i_7_n_0,
      I1 => \^rd_addr_reg_reg[9]_0\(0),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \WR_ADDR_REG[4]_i_2_n_0\,
      I5 => \^rd_addr_reg_reg[9]_0\(1),
      O => FULL_NX0_carry_i_4_n_0
    );
FULL_NX0_carry_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"80000000"
    )
        port map (
      I0 => \^q\(7),
      I1 => \WR_ADDR_REG[8]_i_2_n_0\,
      I2 => \^q\(4),
      I3 => \^q\(5),
      I4 => \^q\(6),
      O => FULL_NX0_carry_i_5_n_0
    );
FULL_NX0_carry_i_6: unisim.vcomponents.LUT6
    generic map(
      INIT => X"655555559AAAAAAA"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(3),
      I1 => \WR_ADDR_REG[4]_i_2_n_0\,
      I2 => \^q\(2),
      I3 => \^q\(1),
      I4 => \^q\(0),
      I5 => \^q\(3),
      O => FULL_NX0_carry_i_6_n_0
    );
FULL_NX0_carry_i_7: unisim.vcomponents.LUT6
    generic map(
      INIT => X"59555555A6AAAAAA"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(2),
      I1 => WR_FIFO,
      I2 => \^full_reg_reg_0\,
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \^q\(2),
      O => FULL_NX0_carry_i_7_n_0
    );
FULL_REG_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"8B8A8A8A"
    )
        port map (
      I0 => \^full_reg_reg_0\,
      I1 => \^empty_reg_reg_0\,
      I2 => RD_FIFO,
      I3 => FULL_NX0,
      I4 => WR_FIFO,
      O => FULL_REG_i_1_n_0
    );
FULL_REG_reg: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => FULL_REG_i_1_n_0,
      Q => \^full_reg_reg_0\
    );
\RD_ADDR_REG[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(0),
      I1 => \^empty_reg_reg_0\,
      I2 => RD_FIFO,
      O => RD_ADDR_NX(0)
    );
\RD_ADDR_REG[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA6A"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(1),
      I1 => \^rd_addr_reg_reg[9]_0\(0),
      I2 => RD_FIFO,
      I3 => \^empty_reg_reg_0\,
      O => RD_ADDR_NX(1)
    );
\RD_ADDR_REG[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA6AAA"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(2),
      I1 => \^rd_addr_reg_reg[9]_0\(1),
      I2 => \^rd_addr_reg_reg[9]_0\(0),
      I3 => RD_FIFO,
      I4 => \^empty_reg_reg_0\,
      O => RD_ADDR_NX(2)
    );
\RD_ADDR_REG[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA6AAAAAAA"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(3),
      I1 => \^rd_addr_reg_reg[9]_0\(0),
      I2 => \^rd_addr_reg_reg[9]_0\(1),
      I3 => \^rd_addr_reg_reg[9]_0\(2),
      I4 => RD_FIFO,
      I5 => \^empty_reg_reg_0\,
      O => RD_ADDR_NX(3)
    );
\RD_ADDR_REG[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(4),
      I1 => \^rd_addr_reg_reg[9]_0\(2),
      I2 => \^rd_addr_reg_reg[9]_0\(1),
      I3 => \^rd_addr_reg_reg[9]_0\(0),
      I4 => \^rd_addr_reg_reg[9]_0\(3),
      I5 => \RD_ADDR_REG_reg[9]_1\,
      O => RD_ADDR_NX(4)
    );
\RD_ADDR_REG[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA9A"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(5),
      I1 => \RD_ADDR_REG[5]_i_2_n_0\,
      I2 => RD_FIFO,
      I3 => \^empty_reg_reg_0\,
      O => RD_ADDR_NX(5)
    );
\RD_ADDR_REG[5]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFFFFFF"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(3),
      I1 => \^rd_addr_reg_reg[9]_0\(0),
      I2 => \^rd_addr_reg_reg[9]_0\(1),
      I3 => \^rd_addr_reg_reg[9]_0\(2),
      I4 => \^rd_addr_reg_reg[9]_0\(4),
      O => \RD_ADDR_REG[5]_i_2_n_0\
    );
\RD_ADDR_REG[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA9A"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(6),
      I1 => \RD_ADDR_REG[9]_i_2_n_0\,
      I2 => RD_FIFO,
      I3 => \^empty_reg_reg_0\,
      O => RD_ADDR_NX(6)
    );
\RD_ADDR_REG[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA9AAA"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(7),
      I1 => \RD_ADDR_REG[9]_i_2_n_0\,
      I2 => \^rd_addr_reg_reg[9]_0\(6),
      I3 => RD_FIFO,
      I4 => \^empty_reg_reg_0\,
      O => RD_ADDR_NX(7)
    );
\RD_ADDR_REG[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA9AAAAAAAAAAA"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(8),
      I1 => \^empty_reg_reg_0\,
      I2 => RD_FIFO,
      I3 => \^rd_addr_reg_reg[9]_0\(6),
      I4 => \RD_ADDR_REG[9]_i_2_n_0\,
      I5 => \^rd_addr_reg_reg[9]_0\(7),
      O => RD_ADDR_NX(8)
    );
\RD_ADDR_REG[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAAAAA"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(9),
      I1 => \^rd_addr_reg_reg[9]_0\(8),
      I2 => \^rd_addr_reg_reg[9]_0\(7),
      I3 => \RD_ADDR_REG[9]_i_2_n_0\,
      I4 => \^rd_addr_reg_reg[9]_0\(6),
      I5 => \RD_ADDR_REG_reg[9]_1\,
      O => RD_ADDR_NX(9)
    );
\RD_ADDR_REG[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => \^rd_addr_reg_reg[9]_0\(4),
      I1 => \^rd_addr_reg_reg[9]_0\(2),
      I2 => \^rd_addr_reg_reg[9]_0\(1),
      I3 => \^rd_addr_reg_reg[9]_0\(0),
      I4 => \^rd_addr_reg_reg[9]_0\(3),
      I5 => \^rd_addr_reg_reg[9]_0\(5),
      O => \RD_ADDR_REG[9]_i_2_n_0\
    );
\RD_ADDR_REG_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => RD_ADDR_NX(0),
      Q => \^rd_addr_reg_reg[9]_0\(0)
    );
\RD_ADDR_REG_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => RD_ADDR_NX(1),
      Q => \^rd_addr_reg_reg[9]_0\(1)
    );
\RD_ADDR_REG_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => RD_ADDR_NX(2),
      Q => \^rd_addr_reg_reg[9]_0\(2)
    );
\RD_ADDR_REG_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => RD_ADDR_NX(3),
      Q => \^rd_addr_reg_reg[9]_0\(3)
    );
\RD_ADDR_REG_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => RD_ADDR_NX(4),
      Q => \^rd_addr_reg_reg[9]_0\(4)
    );
\RD_ADDR_REG_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => RD_ADDR_NX(5),
      Q => \^rd_addr_reg_reg[9]_0\(5)
    );
\RD_ADDR_REG_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => RD_ADDR_NX(6),
      Q => \^rd_addr_reg_reg[9]_0\(6)
    );
\RD_ADDR_REG_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => RD_ADDR_NX(7),
      Q => \^rd_addr_reg_reg[9]_0\(7)
    );
\RD_ADDR_REG_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => RD_ADDR_NX(8),
      Q => \^rd_addr_reg_reg[9]_0\(8)
    );
\RD_ADDR_REG_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => RD_ADDR_NX(9),
      Q => \^rd_addr_reg_reg[9]_0\(9)
    );
S_AXIS_READY_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^full_reg_reg_0\,
      O => S_AXIS_READY
    );
\WR_ADDR_REG[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => \^q\(0),
      I1 => WR_FIFO,
      I2 => \^full_reg_reg_0\,
      O => \WR_ADDR_REG[0]_i_1_n_0\
    );
\WR_ADDR_REG[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"A6AA"
    )
        port map (
      I0 => \^q\(1),
      I1 => \^q\(0),
      I2 => \^full_reg_reg_0\,
      I3 => WR_FIFO,
      O => WR_ADDR_NX(1)
    );
\WR_ADDR_REG[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AA6AAAAA"
    )
        port map (
      I0 => \^q\(2),
      I1 => \^q\(1),
      I2 => \^q\(0),
      I3 => \^full_reg_reg_0\,
      I4 => WR_FIFO,
      O => WR_ADDR_NX(2)
    );
\WR_ADDR_REG[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAA6AAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(3),
      I1 => \^q\(0),
      I2 => \^q\(1),
      I3 => \^q\(2),
      I4 => \^full_reg_reg_0\,
      I5 => WR_FIFO,
      O => WR_ADDR_NX(3)
    );
\WR_ADDR_REG[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAA6AAAAAAA"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(3),
      I5 => \WR_ADDR_REG[4]_i_2_n_0\,
      O => WR_ADDR_NX(4)
    );
\WR_ADDR_REG[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"B"
    )
        port map (
      I0 => \^full_reg_reg_0\,
      I1 => WR_FIFO,
      O => \WR_ADDR_REG[4]_i_2_n_0\
    );
\WR_ADDR_REG[5]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => \^q\(5),
      I1 => \WR_ADDR_REG[8]_i_2_n_0\,
      I2 => \^q\(4),
      O => \WR_ADDR_REG[5]_i_1_n_0\
    );
\WR_ADDR_REG[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => \^q\(6),
      I1 => \^q\(5),
      I2 => \^q\(4),
      I3 => \WR_ADDR_REG[8]_i_2_n_0\,
      O => \WR_ADDR_REG[6]_i_1_n_0\
    );
\WR_ADDR_REG[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => \^q\(7),
      I1 => \WR_ADDR_REG[8]_i_2_n_0\,
      I2 => \^q\(4),
      I3 => \^q\(5),
      I4 => \^q\(6),
      O => WR_ADDR_NX(7)
    );
\WR_ADDR_REG[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(8),
      I1 => \^q\(6),
      I2 => \^q\(5),
      I3 => \^q\(4),
      I4 => \WR_ADDR_REG[8]_i_2_n_0\,
      I5 => \^q\(7),
      O => WR_ADDR_NX(8)
    );
\WR_ADDR_REG[8]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000000000000000"
    )
        port map (
      I0 => WR_FIFO,
      I1 => \^full_reg_reg_0\,
      I2 => \^q\(3),
      I3 => \^q\(0),
      I4 => \^q\(1),
      I5 => \^q\(2),
      O => \WR_ADDR_REG[8]_i_2_n_0\
    );
\WR_ADDR_REG[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => \^q\(9),
      I1 => \^q\(7),
      I2 => \WR_ADDR_REG[9]_i_2_n_0\,
      I3 => \^q\(5),
      I4 => \^q\(6),
      I5 => \^q\(8),
      O => WR_ADDR_NX(9)
    );
\WR_ADDR_REG[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF7FFFFFFF"
    )
        port map (
      I0 => \^q\(4),
      I1 => \^q\(2),
      I2 => \^q\(1),
      I3 => \^q\(0),
      I4 => \^q\(3),
      I5 => \WR_ADDR_REG[4]_i_2_n_0\,
      O => \WR_ADDR_REG[9]_i_2_n_0\
    );
\WR_ADDR_REG_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => \WR_ADDR_REG[0]_i_1_n_0\,
      Q => \^q\(0)
    );
\WR_ADDR_REG_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => WR_ADDR_NX(1),
      Q => \^q\(1)
    );
\WR_ADDR_REG_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => WR_ADDR_NX(2),
      Q => \^q\(2)
    );
\WR_ADDR_REG_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => WR_ADDR_NX(3),
      Q => \^q\(3)
    );
\WR_ADDR_REG_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => WR_ADDR_NX(4),
      Q => \^q\(4)
    );
\WR_ADDR_REG_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => \WR_ADDR_REG[5]_i_1_n_0\,
      Q => \^q\(5)
    );
\WR_ADDR_REG_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => \WR_ADDR_REG[6]_i_1_n_0\,
      Q => \^q\(6)
    );
\WR_ADDR_REG_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => WR_ADDR_NX(7),
      Q => \^q\(7)
    );
\WR_ADDR_REG_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => WR_ADDR_NX(8),
      Q => \^q\(8)
    );
\WR_ADDR_REG_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => i_CLK,
      CE => '1',
      CLR => SR(0),
      D => WR_ADDR_NX(9),
      Q => \^q\(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0_FRAME_COUNTER is
  port (
    \HC_REG_reg[5]_0\ : out STD_LOGIC;
    D_2_VGA : out STD_LOGIC_VECTOR ( 11 downto 0 );
    RD_FIFO0 : out STD_LOGIC;
    VIDEO_ON_BUFF : out STD_LOGIC;
    \VC_REG_reg[7]_0\ : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \HC_REG_reg[7]_0\ : out STD_LOGIC;
    DOBDO : in STD_LOGIC_VECTOR ( 11 downto 0 );
    PRE_STATE : in STD_LOGIC;
    EMPTY : in STD_LOGIC;
    i_RSTn : in STD_LOGIC;
    i_CLK : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_INTEGRATED_VGA_COMPO_0_0_FRAME_COUNTER : entity is "FRAME_COUNTER";
end design_1_INTEGRATED_VGA_COMPO_0_0_FRAME_COUNTER;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0_FRAME_COUNTER is
  signal COUNT : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \COUNT[0]_i_1_n_0\ : STD_LOGIC;
  signal \COUNT[1]_i_1_n_0\ : STD_LOGIC;
  signal HC : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal HC_NX : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal \HC_REG[10]_i_3_n_0\ : STD_LOGIC;
  signal \HC_REG[5]_i_2_n_0\ : STD_LOGIC;
  signal \HC_REG[5]_i_3_n_0\ : STD_LOGIC;
  signal \HC_REG[9]_i_2_n_0\ : STD_LOGIC;
  signal PRE_STATE_i_2_n_0 : STD_LOGIC;
  signal PRE_STATE_i_3_n_0 : STD_LOGIC;
  signal PRE_STATE_i_4_n_0 : STD_LOGIC;
  signal PRE_STATE_i_5_n_0 : STD_LOGIC;
  signal PRE_STATE_i_6_n_0 : STD_LOGIC;
  signal PRE_STATE_i_7_n_0 : STD_LOGIC;
  signal RD_FIFO_i_2_n_0 : STD_LOGIC;
  signal \^sr\ : STD_LOGIC_VECTOR ( 0 to 0 );
  signal VC : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal VC_NX : STD_LOGIC_VECTOR ( 10 downto 0 );
  signal VC_REG0 : STD_LOGIC;
  signal \VC_REG[10]_i_3_n_0\ : STD_LOGIC;
  signal \VC_REG[4]_i_1_n_0\ : STD_LOGIC;
  signal \VC_REG[5]_i_1_n_0\ : STD_LOGIC;
  signal \VC_REG[6]_i_2_n_0\ : STD_LOGIC;
  signal \VC_REG[8]_i_1_n_0\ : STD_LOGIC;
  signal \VC_REG[9]_i_2_n_0\ : STD_LOGIC;
  signal \VC_REG[9]_i_3_n_0\ : STD_LOGIC;
  signal \VC_REG[9]_i_4_n_0\ : STD_LOGIC;
  signal VIDEO_ON_inv_i_2_n_0 : STD_LOGIC;
  signal VIDEO_ON_inv_i_3_n_0 : STD_LOGIC;
  signal VIDEO_ON_inv_i_4_n_0 : STD_LOGIC;
  signal VIDEO_ON_inv_i_5_n_0 : STD_LOGIC;
  signal VSYNC_i_2_n_0 : STD_LOGIC;
  signal \o_RGB_DATA[11]_i_2_n_0\ : STD_LOGIC;
  signal \o_RGB_DATA[11]_i_3_n_0\ : STD_LOGIC;
  signal \o_RGB_DATA[11]_i_4_n_0\ : STD_LOGIC;
  signal tick_25 : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \COUNT[0]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \COUNT[1]_i_1\ : label is "soft_lutpair22";
  attribute SOFT_HLUTNM of \HC_REG[0]_i_1\ : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of \HC_REG[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \HC_REG[2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \HC_REG[3]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \HC_REG[4]_i_1\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \HC_REG[5]_i_2\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \HC_REG[7]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \HC_REG[8]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of PRE_STATE_i_3 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of PRE_STATE_i_4 : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of PRE_STATE_i_5 : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of PRE_STATE_i_6 : label is "soft_lutpair19";
  attribute SOFT_HLUTNM of PRE_STATE_i_7 : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \VC_REG[0]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \VC_REG[10]_i_2\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \VC_REG[1]_i_1\ : label is "soft_lutpair21";
  attribute SOFT_HLUTNM of \VC_REG[2]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \VC_REG[3]_i_1\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \VC_REG[4]_i_1\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \VC_REG[6]_i_2\ : label is "soft_lutpair20";
  attribute SOFT_HLUTNM of \VC_REG[8]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \VC_REG[9]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \VC_REG[9]_i_3\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \VC_REG[9]_i_4\ : label is "soft_lutpair18";
  attribute SOFT_HLUTNM of VIDEO_ON_inv_i_5 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \o_RGB_DATA[11]_i_4\ : label is "soft_lutpair20";
begin
  SR(0) <= \^sr\(0);
\COUNT[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => COUNT(0),
      O => \COUNT[0]_i_1_n_0\
    );
\COUNT[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => COUNT(0),
      I1 => COUNT(1),
      O => \COUNT[1]_i_1_n_0\
    );
\COUNT_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => \COUNT[0]_i_1_n_0\,
      Q => COUNT(0),
      R => \^sr\(0)
    );
\COUNT_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => \COUNT[1]_i_1_n_0\,
      Q => COUNT(1),
      R => \^sr\(0)
    );
\HC_REG[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => HC(0),
      O => HC_NX(0)
    );
\HC_REG[10]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => COUNT(0),
      I1 => COUNT(1),
      O => tick_25
    );
\HC_REG[10]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AA6AAAAAAAAAAAAA"
    )
        port map (
      I0 => HC(10),
      I1 => HC(7),
      I2 => HC(6),
      I3 => \HC_REG[10]_i_3_n_0\,
      I4 => HC(8),
      I5 => HC(9),
      O => HC_NX(10)
    );
\HC_REG[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFFFFFFFFFF"
    )
        port map (
      I0 => HC(3),
      I1 => HC(0),
      I2 => HC(1),
      I3 => HC(2),
      I4 => HC(4),
      I5 => HC(5),
      O => \HC_REG[10]_i_3_n_0\
    );
\HC_REG[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => HC(1),
      I1 => HC(0),
      O => HC_NX(1)
    );
\HC_REG[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"6A"
    )
        port map (
      I0 => HC(2),
      I1 => HC(1),
      I2 => HC(0),
      O => HC_NX(2)
    );
\HC_REG[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"6AAA"
    )
        port map (
      I0 => HC(3),
      I1 => HC(0),
      I2 => HC(1),
      I3 => HC(2),
      O => HC_NX(3)
    );
\HC_REG[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => HC(2),
      I1 => HC(1),
      I2 => HC(0),
      I3 => HC(3),
      I4 => HC(4),
      O => HC_NX(4)
    );
\HC_REG[5]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"B400"
    )
        port map (
      I0 => \HC_REG[5]_i_2_n_0\,
      I1 => HC(4),
      I2 => HC(5),
      I3 => \HC_REG[5]_i_3_n_0\,
      O => HC_NX(5)
    );
\HC_REG[5]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => HC(2),
      I1 => HC(1),
      I2 => HC(0),
      I3 => HC(3),
      O => \HC_REG[5]_i_2_n_0\
    );
\HC_REG[5]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFDF"
    )
        port map (
      I0 => HC(8),
      I1 => HC(10),
      I2 => HC(9),
      I3 => HC(7),
      I4 => HC(6),
      I5 => HC(5),
      O => \HC_REG[5]_i_3_n_0\
    );
\HC_REG[6]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \HC_REG[10]_i_3_n_0\,
      I1 => HC(6),
      O => HC_NX(6)
    );
\HC_REG[7]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"9A"
    )
        port map (
      I0 => HC(7),
      I1 => \HC_REG[10]_i_3_n_0\,
      I2 => HC(6),
      O => HC_NX(7)
    );
\HC_REG[8]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0000F708"
    )
        port map (
      I0 => HC(7),
      I1 => HC(6),
      I2 => \HC_REG[10]_i_3_n_0\,
      I3 => HC(8),
      I4 => \HC_REG[9]_i_2_n_0\,
      O => HC_NX(8)
    );
\HC_REG[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"5515555500400000"
    )
        port map (
      I0 => \HC_REG[9]_i_2_n_0\,
      I1 => HC(7),
      I2 => HC(6),
      I3 => \HC_REG[10]_i_3_n_0\,
      I4 => HC(8),
      I5 => HC(9),
      O => HC_NX(9)
    );
\HC_REG[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000080000000"
    )
        port map (
      I0 => HC(2),
      I1 => HC(1),
      I2 => HC(0),
      I3 => HC(3),
      I4 => HC(4),
      I5 => \HC_REG[5]_i_3_n_0\,
      O => \HC_REG[9]_i_2_n_0\
    );
\HC_REG_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(0),
      Q => HC(0),
      R => \^sr\(0)
    );
\HC_REG_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(10),
      Q => HC(10),
      R => \^sr\(0)
    );
\HC_REG_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(1),
      Q => HC(1),
      R => \^sr\(0)
    );
\HC_REG_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(2),
      Q => HC(2),
      R => \^sr\(0)
    );
\HC_REG_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(3),
      Q => HC(3),
      R => \^sr\(0)
    );
\HC_REG_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(4),
      Q => HC(4),
      R => \^sr\(0)
    );
\HC_REG_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(5),
      Q => HC(5),
      R => \^sr\(0)
    );
\HC_REG_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(6),
      Q => HC(6),
      R => \^sr\(0)
    );
\HC_REG_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(7),
      Q => HC(7),
      R => \^sr\(0)
    );
\HC_REG_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(8),
      Q => HC(8),
      R => \^sr\(0)
    );
\HC_REG_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => tick_25,
      D => HC_NX(9),
      Q => HC(9),
      R => \^sr\(0)
    );
HSYNC_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFCFFBFFFFFFFF"
    )
        port map (
      I0 => HC(5),
      I1 => HC(8),
      I2 => HC(6),
      I3 => HC(7),
      I4 => HC(10),
      I5 => HC(9),
      O => \HC_REG_reg[5]_0\
    );
PRE_STATE_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00001000"
    )
        port map (
      I0 => PRE_STATE_i_2_n_0,
      I1 => PRE_STATE_i_3_n_0,
      I2 => HC(7),
      I3 => HC(6),
      I4 => PRE_STATE_i_4_n_0,
      I5 => PRE_STATE,
      O => \HC_REG_reg[7]_0\
    );
PRE_STATE_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFEFFFF"
    )
        port map (
      I0 => PRE_STATE_i_5_n_0,
      I1 => PRE_STATE_i_6_n_0,
      I2 => PRE_STATE_i_7_n_0,
      I3 => HC(2),
      I4 => VC(0),
      I5 => HC(5),
      O => PRE_STATE_i_2_n_0
    );
PRE_STATE_i_3: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => VC(6),
      I1 => VC(5),
      O => PRE_STATE_i_3_n_0
    );
PRE_STATE_i_4: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FEFF"
    )
        port map (
      I0 => VC(10),
      I1 => VC(9),
      I2 => VC(8),
      I3 => VC(7),
      O => PRE_STATE_i_4_n_0
    );
PRE_STATE_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFF7"
    )
        port map (
      I0 => VC(3),
      I1 => VC(4),
      I2 => VC(1),
      I3 => EMPTY,
      O => PRE_STATE_i_5_n_0
    );
PRE_STATE_i_6: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => HC(0),
      I1 => HC(9),
      I2 => HC(3),
      I3 => VC(2),
      O => PRE_STATE_i_6_n_0
    );
PRE_STATE_i_7: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFEF"
    )
        port map (
      I0 => HC(1),
      I1 => HC(8),
      I2 => HC(4),
      I3 => HC(10),
      O => PRE_STATE_i_7_n_0
    );
RD_FIFO_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0001000000000000"
    )
        port map (
      I0 => \o_RGB_DATA[11]_i_2_n_0\,
      I1 => RD_FIFO_i_2_n_0,
      I2 => HC(10),
      I3 => \o_RGB_DATA[11]_i_3_n_0\,
      I4 => tick_25,
      I5 => PRE_STATE,
      O => RD_FIFO0
    );
RD_FIFO_i_2: unisim.vcomponents.LUT2
    generic map(
      INIT => X"E"
    )
        port map (
      I0 => VC(9),
      I1 => VC(10),
      O => RD_FIFO_i_2_n_0
    );
TIMING_AGGREGATE_i_1: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => i_RSTn,
      O => \^sr\(0)
    );
\VC_REG[0]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => VC(0),
      I1 => \VC_REG[9]_i_2_n_0\,
      O => VC_NX(0)
    );
\VC_REG[10]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => COUNT(1),
      I1 => COUNT(0),
      I2 => \HC_REG[9]_i_2_n_0\,
      O => VC_REG0
    );
\VC_REG[10]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"AAAA6AAA"
    )
        port map (
      I0 => VC(10),
      I1 => VC(9),
      I2 => VC(8),
      I3 => VC(7),
      I4 => \VC_REG[10]_i_3_n_0\,
      O => VC_NX(10)
    );
\VC_REG[10]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF7FFFFFFFFFFFFF"
    )
        port map (
      I0 => VC(5),
      I1 => VC(2),
      I2 => VC(3),
      I3 => \VC_REG[6]_i_2_n_0\,
      I4 => VC(4),
      I5 => VC(6),
      O => \VC_REG[10]_i_3_n_0\
    );
\VC_REG[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => VC(0),
      I1 => VC(1),
      O => VC_NX(1)
    );
\VC_REG[2]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0078"
    )
        port map (
      I0 => VC(0),
      I1 => VC(1),
      I2 => VC(2),
      I3 => \VC_REG[9]_i_2_n_0\,
      O => VC_NX(2)
    );
\VC_REG[3]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00007F80"
    )
        port map (
      I0 => VC(1),
      I1 => VC(0),
      I2 => VC(2),
      I3 => VC(3),
      I4 => \VC_REG[9]_i_2_n_0\,
      O => VC_NX(3)
    );
\VC_REG[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"6AAAAAAA"
    )
        port map (
      I0 => VC(4),
      I1 => VC(2),
      I2 => VC(3),
      I3 => VC(0),
      I4 => VC(1),
      O => \VC_REG[4]_i_1_n_0\
    );
\VC_REG[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"6AAAAAAAAAAAAAAA"
    )
        port map (
      I0 => VC(5),
      I1 => VC(4),
      I2 => VC(1),
      I3 => VC(0),
      I4 => VC(3),
      I5 => VC(2),
      O => \VC_REG[5]_i_1_n_0\
    );
\VC_REG[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"A6AAAAAAAAAAAAAA"
    )
        port map (
      I0 => VC(6),
      I1 => VC(4),
      I2 => \VC_REG[6]_i_2_n_0\,
      I3 => VC(3),
      I4 => VC(2),
      I5 => VC(5),
      O => VC_NX(6)
    );
\VC_REG[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => VC(0),
      I1 => VC(1),
      O => \VC_REG[6]_i_2_n_0\
    );
\VC_REG[7]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => VC(7),
      I1 => \VC_REG[10]_i_3_n_0\,
      O => VC_NX(7)
    );
\VC_REG[8]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"A6"
    )
        port map (
      I0 => VC(8),
      I1 => VC(7),
      I2 => \VC_REG[10]_i_3_n_0\,
      O => \VC_REG[8]_i_1_n_0\
    );
\VC_REG[9]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"44441444"
    )
        port map (
      I0 => \VC_REG[9]_i_2_n_0\,
      I1 => VC(9),
      I2 => VC(8),
      I3 => VC(7),
      I4 => \VC_REG[10]_i_3_n_0\,
      O => VC_NX(9)
    );
\VC_REG[9]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000400"
    )
        port map (
      I0 => \VC_REG[9]_i_3_n_0\,
      I1 => VC(9),
      I2 => VC(10),
      I3 => \VC_REG[9]_i_4_n_0\,
      I4 => VC(0),
      I5 => VC(1),
      O => \VC_REG[9]_i_2_n_0\
    );
\VC_REG[9]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => VC(4),
      I1 => VC(6),
      I2 => VC(5),
      I3 => VC(8),
      I4 => VC(7),
      O => \VC_REG[9]_i_3_n_0\
    );
\VC_REG[9]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => VC(2),
      I1 => VC(3),
      O => \VC_REG[9]_i_4_n_0\
    );
\VC_REG_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => VC_NX(0),
      Q => VC(0),
      R => \^sr\(0)
    );
\VC_REG_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => VC_NX(10),
      Q => VC(10),
      R => \^sr\(0)
    );
\VC_REG_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => VC_NX(1),
      Q => VC(1),
      R => \^sr\(0)
    );
\VC_REG_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => VC_NX(2),
      Q => VC(2),
      R => \^sr\(0)
    );
\VC_REG_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => VC_NX(3),
      Q => VC(3),
      R => \^sr\(0)
    );
\VC_REG_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => \VC_REG[4]_i_1_n_0\,
      Q => VC(4),
      R => \^sr\(0)
    );
\VC_REG_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => \VC_REG[5]_i_1_n_0\,
      Q => VC(5),
      R => \^sr\(0)
    );
\VC_REG_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => VC_NX(6),
      Q => VC(6),
      R => \^sr\(0)
    );
\VC_REG_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => VC_NX(7),
      Q => VC(7),
      R => \^sr\(0)
    );
\VC_REG_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => \VC_REG[8]_i_1_n_0\,
      Q => VC(8),
      R => \^sr\(0)
    );
\VC_REG_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => VC_REG0,
      D => VC_NX(9),
      Q => VC(9),
      R => \^sr\(0)
    );
VIDEO_ON_inv_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => VIDEO_ON_inv_i_2_n_0,
      I1 => VC(10),
      I2 => HC(10),
      I3 => VIDEO_ON_inv_i_3_n_0,
      I4 => VIDEO_ON_inv_i_4_n_0,
      O => VIDEO_ON_BUFF
    );
VIDEO_ON_inv_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000000D"
    )
        port map (
      I0 => VC(5),
      I1 => VIDEO_ON_inv_i_5_n_0,
      I2 => VC(6),
      I3 => VC(7),
      I4 => VC(8),
      I5 => VC(9),
      O => VIDEO_ON_inv_i_2_n_0
    );
VIDEO_ON_inv_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF00F000FF008007"
    )
        port map (
      I0 => HC(5),
      I1 => HC(4),
      I2 => HC(7),
      I3 => HC(9),
      I4 => HC(8),
      I5 => HC(6),
      O => VIDEO_ON_inv_i_3_n_0
    );
VIDEO_ON_inv_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAAAAAAAAAAAAA2"
    )
        port map (
      I0 => VC(9),
      I1 => VIDEO_ON_inv_i_5_n_0,
      I2 => VC(7),
      I3 => VC(8),
      I4 => VC(5),
      I5 => VC(6),
      O => VIDEO_ON_inv_i_4_n_0
    );
VIDEO_ON_inv_i_5: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000001"
    )
        port map (
      I0 => VC(0),
      I1 => VC(1),
      I2 => VC(2),
      I3 => VC(3),
      I4 => VC(4),
      O => VIDEO_ON_inv_i_5_n_0
    );
VSYNC_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => VC(7),
      I1 => VC(8),
      I2 => VC(5),
      I3 => VC(6),
      I4 => VC(4),
      I5 => VSYNC_i_2_n_0,
      O => \VC_REG_reg[7]_0\
    );
VSYNC_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFDFFFFFFFFFDFFF"
    )
        port map (
      I0 => VC(9),
      I1 => VC(10),
      I2 => VC(3),
      I3 => VC(2),
      I4 => VC(1),
      I5 => VC(0),
      O => VSYNC_i_2_n_0
    );
\o_RGB_DATA[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(0),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(0)
    );
\o_RGB_DATA[10]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(10),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(10)
    );
\o_RGB_DATA[11]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(11),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(11)
    );
\o_RGB_DATA[11]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFAE000000F7FFFF"
    )
        port map (
      I0 => VC(4),
      I1 => VC(3),
      I2 => \o_RGB_DATA[11]_i_4_n_0\,
      I3 => PRE_STATE_i_3_n_0,
      I4 => VC(7),
      I5 => VC(8),
      O => \o_RGB_DATA[11]_i_2_n_0\
    );
\o_RGB_DATA[11]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F1F3F3F3F3F3E3"
    )
        port map (
      I0 => HC(4),
      I1 => HC(8),
      I2 => HC(9),
      I3 => HC(5),
      I4 => HC(6),
      I5 => HC(7),
      O => \o_RGB_DATA[11]_i_3_n_0\
    );
\o_RGB_DATA[11]_i_4\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => VC(2),
      I1 => VC(1),
      I2 => VC(0),
      O => \o_RGB_DATA[11]_i_4_n_0\
    );
\o_RGB_DATA[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(1),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(1)
    );
\o_RGB_DATA[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(2),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(2)
    );
\o_RGB_DATA[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(3),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(3)
    );
\o_RGB_DATA[4]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(4),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(4)
    );
\o_RGB_DATA[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(5),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(5)
    );
\o_RGB_DATA[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(6),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(6)
    );
\o_RGB_DATA[7]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(7),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(7)
    );
\o_RGB_DATA[8]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(8),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(8)
    );
\o_RGB_DATA[9]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => DOBDO(9),
      I1 => \o_RGB_DATA[11]_i_2_n_0\,
      I2 => VC(9),
      I3 => VC(10),
      I4 => HC(10),
      I5 => \o_RGB_DATA[11]_i_3_n_0\,
      O => D_2_VGA(9)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0_PIXEL_DATA_CONTROLLER is
  port (
    WR_FIFO : out STD_LOGIC;
    WE : out STD_LOGIC;
    DIADI : out STD_LOGIC_VECTOR ( 11 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    i_CLK : in STD_LOGIC;
    FULL_FIFO : in STD_LOGIC;
    S_AXIS_VALID : in STD_LOGIC;
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_INTEGRATED_VGA_COMPO_0_0_PIXEL_DATA_CONTROLLER : entity is "PIXEL_DATA_CONTROLLER";
end design_1_INTEGRATED_VGA_COMPO_0_0_PIXEL_DATA_CONTROLLER;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0_PIXEL_DATA_CONTROLLER is
  signal B0 : STD_LOGIC;
  signal CNT2THREE : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \CNT2THREE[0]_i_1_n_0\ : STD_LOGIC;
  signal \CNT2THREE[1]_i_1_n_0\ : STD_LOGIC;
  signal G0 : STD_LOGIC;
  signal R0 : STD_LOGIC;
  signal \^wr_fifo\ : STD_LOGIC;
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \CNT2THREE[0]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \CNT2THREE[1]_i_1\ : label is "soft_lutpair0";
begin
  WR_FIFO <= \^wr_fifo\;
\B[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0004"
    )
        port map (
      I0 => FULL_FIFO,
      I1 => S_AXIS_VALID,
      I2 => CNT2THREE(1),
      I3 => CNT2THREE(0),
      O => B0
    );
\B_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => B0,
      D => S_AXIS_DATA(0),
      Q => DIADI(0),
      R => SR(0)
    );
\B_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => B0,
      D => S_AXIS_DATA(1),
      Q => DIADI(1),
      R => SR(0)
    );
\B_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => B0,
      D => S_AXIS_DATA(2),
      Q => DIADI(2),
      R => SR(0)
    );
\B_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => B0,
      D => S_AXIS_DATA(3),
      Q => DIADI(3),
      R => SR(0)
    );
\CNT2THREE[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F304"
    )
        port map (
      I0 => CNT2THREE(1),
      I1 => S_AXIS_VALID,
      I2 => FULL_FIFO,
      I3 => CNT2THREE(0),
      O => \CNT2THREE[0]_i_1_n_0\
    );
\CNT2THREE[1]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"F308"
    )
        port map (
      I0 => CNT2THREE(0),
      I1 => S_AXIS_VALID,
      I2 => FULL_FIFO,
      I3 => CNT2THREE(1),
      O => \CNT2THREE[1]_i_1_n_0\
    );
\CNT2THREE_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => \CNT2THREE[0]_i_1_n_0\,
      Q => CNT2THREE(0),
      R => SR(0)
    );
\CNT2THREE_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => \CNT2THREE[1]_i_1_n_0\,
      Q => CNT2THREE(1),
      R => SR(0)
    );
\G[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0400"
    )
        port map (
      I0 => FULL_FIFO,
      I1 => S_AXIS_VALID,
      I2 => CNT2THREE(1),
      I3 => CNT2THREE(0),
      O => G0
    );
\G_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => G0,
      D => S_AXIS_DATA(0),
      Q => DIADI(4),
      R => SR(0)
    );
\G_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => G0,
      D => S_AXIS_DATA(1),
      Q => DIADI(5),
      R => SR(0)
    );
\G_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => G0,
      D => S_AXIS_DATA(2),
      Q => DIADI(6),
      R => SR(0)
    );
\G_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => G0,
      D => S_AXIS_DATA(3),
      Q => DIADI(7),
      R => SR(0)
    );
RAM_reg_i_1: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^wr_fifo\,
      I1 => FULL_FIFO,
      O => WE
    );
\R_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => R0,
      D => S_AXIS_DATA(0),
      Q => DIADI(8),
      R => SR(0)
    );
\R_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => R0,
      D => S_AXIS_DATA(1),
      Q => DIADI(9),
      R => SR(0)
    );
\R_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => R0,
      D => S_AXIS_DATA(2),
      Q => DIADI(10),
      R => SR(0)
    );
\R_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => R0,
      D => S_AXIS_DATA(3),
      Q => DIADI(11),
      R => SR(0)
    );
TIMING_AGGREGATE_i_2: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0040"
    )
        port map (
      I0 => FULL_FIFO,
      I1 => S_AXIS_VALID,
      I2 => CNT2THREE(1),
      I3 => CNT2THREE(0),
      O => R0
    );
TIMING_AGGREGATE_reg: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => R0,
      Q => \^wr_fifo\,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0_POSITION_CONTROLLER is
  port (
    RD_FIFO : out STD_LOGIC;
    PRE_STATE : out STD_LOGIC;
    RD_FIFO_reg_0 : out STD_LOGIC;
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    RD_FIFO0 : in STD_LOGIC;
    i_CLK : in STD_LOGIC;
    PRE_STATE_reg_0 : in STD_LOGIC;
    EMPTY : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_INTEGRATED_VGA_COMPO_0_0_POSITION_CONTROLLER : entity is "POSITION_CONTROLLER";
end design_1_INTEGRATED_VGA_COMPO_0_0_POSITION_CONTROLLER;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0_POSITION_CONTROLLER is
  signal \^rd_fifo\ : STD_LOGIC;
begin
  RD_FIFO <= \^rd_fifo\;
PRE_STATE_reg: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => PRE_STATE_reg_0,
      Q => PRE_STATE,
      R => SR(0)
    );
\RD_ADDR_REG[9]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^rd_fifo\,
      I1 => EMPTY,
      O => RD_FIFO_reg_0
    );
RD_FIFO_reg: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => RD_FIFO0,
      Q => \^rd_fifo\,
      R => SR(0)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0_RAM_2PORT is
  port (
    DOBDO : out STD_LOGIC_VECTOR ( 11 downto 0 );
    i_CLK : in STD_LOGIC;
    WE : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 9 downto 0 );
    RAM_reg_0 : in STD_LOGIC_VECTOR ( 9 downto 0 );
    DIADI : in STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_INTEGRATED_VGA_COMPO_0_0_RAM_2PORT : entity is "RAM_2PORT";
end design_1_INTEGRATED_VGA_COMPO_0_0_RAM_2PORT;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0_RAM_2PORT is
  signal NLW_RAM_reg_DOADO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal NLW_RAM_reg_DOBDO_UNCONNECTED : STD_LOGIC_VECTOR ( 15 downto 12 );
  signal NLW_RAM_reg_DOPADOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal NLW_RAM_reg_DOPBDOP_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTA.DATA_BIT_LAYOUT\ of RAM_reg : label is "p0_d12";
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ : string;
  attribute \MEM.PORTB.DATA_BIT_LAYOUT\ of RAM_reg : label is "p0_d12";
  attribute METHODOLOGY_DRC_VIOS : string;
  attribute METHODOLOGY_DRC_VIOS of RAM_reg : label is "{SYNTH-6 {cell *THIS*}}";
  attribute RTL_RAM_BITS : integer;
  attribute RTL_RAM_BITS of RAM_reg : label is 12288;
  attribute RTL_RAM_NAME : string;
  attribute RTL_RAM_NAME of RAM_reg : label is "U0/INTEGRATED_VGA_COMPONENT_SV_2_VHDL/FIFO_COMP/RAM_COMPONENT/RAM_reg";
  attribute RTL_RAM_TYPE : string;
  attribute RTL_RAM_TYPE of RAM_reg : label is "RAM_SDP";
  attribute ram_addr_begin : integer;
  attribute ram_addr_begin of RAM_reg : label is 0;
  attribute ram_addr_end : integer;
  attribute ram_addr_end of RAM_reg : label is 1023;
  attribute ram_offset : integer;
  attribute ram_offset of RAM_reg : label is 0;
  attribute ram_slice_begin : integer;
  attribute ram_slice_begin of RAM_reg : label is 0;
  attribute ram_slice_end : integer;
  attribute ram_slice_end of RAM_reg : label is 11;
begin
RAM_reg: unisim.vcomponents.RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INIT_A => X"00000",
      INIT_B => X"00000",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "RSTREG",
      RSTREG_PRIORITY_B => "RSTREG",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "7SERIES",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "READ_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
        port map (
      ADDRARDADDR(13 downto 4) => Q(9 downto 0),
      ADDRARDADDR(3 downto 0) => B"1111",
      ADDRBWRADDR(13 downto 4) => RAM_reg_0(9 downto 0),
      ADDRBWRADDR(3 downto 0) => B"1111",
      CLKARDCLK => i_CLK,
      CLKBWRCLK => i_CLK,
      DIADI(15 downto 12) => B"0000",
      DIADI(11 downto 0) => DIADI(11 downto 0),
      DIBDI(15 downto 0) => B"0000111111111111",
      DIPADIP(1 downto 0) => B"00",
      DIPBDIP(1 downto 0) => B"00",
      DOADO(15 downto 0) => NLW_RAM_reg_DOADO_UNCONNECTED(15 downto 0),
      DOBDO(15 downto 12) => NLW_RAM_reg_DOBDO_UNCONNECTED(15 downto 12),
      DOBDO(11 downto 0) => DOBDO(11 downto 0),
      DOPADOP(1 downto 0) => NLW_RAM_reg_DOPADOP_UNCONNECTED(1 downto 0),
      DOPBDOP(1 downto 0) => NLW_RAM_reg_DOPBDOP_UNCONNECTED(1 downto 0),
      ENARDEN => WE,
      ENBWREN => '1',
      REGCEAREGCE => '0',
      REGCEB => '0',
      RSTRAMARSTRAM => '0',
      RSTRAMB => '0',
      RSTREGARSTREG => '0',
      RSTREGB => '0',
      WEA(1 downto 0) => B"11",
      WEBWE(3 downto 0) => B"0000"
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0_VGA_SYNC is
  port (
    VIDEO_ON : out STD_LOGIC;
    HSYNC : out STD_LOGIC;
    VSYNC : out STD_LOGIC;
    VIDEO_ON_BUFF : in STD_LOGIC;
    i_CLK : in STD_LOGIC;
    HSYNC_reg_0 : in STD_LOGIC;
    VSYNC_reg_0 : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_INTEGRATED_VGA_COMPO_0_0_VGA_SYNC : entity is "VGA_SYNC";
end design_1_INTEGRATED_VGA_COMPO_0_0_VGA_SYNC;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0_VGA_SYNC is
  attribute inverted : string;
  attribute inverted of VIDEO_ON_reg_inv : label is "yes";
begin
HSYNC_reg: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => HSYNC_reg_0,
      Q => HSYNC,
      R => '0'
    );
VIDEO_ON_reg_inv: unisim.vcomponents.FDRE
    generic map(
      INIT => '1'
    )
        port map (
      C => i_CLK,
      CE => '1',
      D => VIDEO_ON_BUFF,
      Q => VIDEO_ON,
      R => '0'
    );
VSYNC_reg: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => VSYNC_reg_0,
      Q => VSYNC,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_TOP is
  port (
    DOBDO : out STD_LOGIC_VECTOR ( 11 downto 0 );
    EMPTY : out STD_LOGIC;
    FULL_FIFO : out STD_LOGIC;
    S_AXIS_READY : out STD_LOGIC;
    i_CLK : in STD_LOGIC;
    WE : in STD_LOGIC;
    DIADI : in STD_LOGIC_VECTOR ( 11 downto 0 );
    SR : in STD_LOGIC_VECTOR ( 0 to 0 );
    WR_FIFO : in STD_LOGIC;
    \RD_ADDR_REG_reg[9]\ : in STD_LOGIC;
    RD_FIFO : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_TOP : entity is "FIFO_TOP";
end design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_TOP;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_TOP is
  signal RD_ADDR_SIGNAL : STD_LOGIC_VECTOR ( 9 downto 0 );
  signal WR_ADDR_SIGNAL : STD_LOGIC_VECTOR ( 9 downto 0 );
begin
FIFO_CONTROLLER_COMPONENT: entity work.design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_CONTROLLER
     port map (
      EMPTY_REG_reg_0 => EMPTY,
      FULL_REG_reg_0 => FULL_FIFO,
      Q(9 downto 0) => WR_ADDR_SIGNAL(9 downto 0),
      \RD_ADDR_REG_reg[9]_0\(9 downto 0) => RD_ADDR_SIGNAL(9 downto 0),
      \RD_ADDR_REG_reg[9]_1\ => \RD_ADDR_REG_reg[9]\,
      RD_FIFO => RD_FIFO,
      SR(0) => SR(0),
      S_AXIS_READY => S_AXIS_READY,
      WR_FIFO => WR_FIFO,
      i_CLK => i_CLK
    );
RAM_COMPONENT: entity work.design_1_INTEGRATED_VGA_COMPO_0_0_RAM_2PORT
     port map (
      DIADI(11 downto 0) => DIADI(11 downto 0),
      DOBDO(11 downto 0) => DOBDO(11 downto 0),
      Q(9 downto 0) => WR_ADDR_SIGNAL(9 downto 0),
      RAM_reg_0(9 downto 0) => RD_ADDR_SIGNAL(9 downto 0),
      WE => WE,
      i_CLK => i_CLK
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0_VGA_TOP_DESIGN is
  port (
    HSYNC : out STD_LOGIC;
    VSYNC : out STD_LOGIC;
    RD_FIFO0 : out STD_LOGIC;
    SR : out STD_LOGIC_VECTOR ( 0 to 0 );
    \HC_REG_reg[7]\ : out STD_LOGIC;
    OUT_VGA : out STD_LOGIC_VECTOR ( 11 downto 0 );
    i_CLK : in STD_LOGIC;
    DOBDO : in STD_LOGIC_VECTOR ( 11 downto 0 );
    PRE_STATE : in STD_LOGIC;
    EMPTY : in STD_LOGIC;
    i_RSTn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_INTEGRATED_VGA_COMPO_0_0_VGA_TOP_DESIGN : entity is "VGA_TOP_DESIGN";
end design_1_INTEGRATED_VGA_COMPO_0_0_VGA_TOP_DESIGN;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0_VGA_TOP_DESIGN is
  signal D_2_VGA : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal FRAME_COUNTER_COMPONENT_n_0 : STD_LOGIC;
  signal FRAME_COUNTER_COMPONENT_n_15 : STD_LOGIC;
  signal VIDEO_ON : STD_LOGIC;
  signal VIDEO_ON_BUFF : STD_LOGIC;
begin
FRAME_COUNTER_COMPONENT: entity work.design_1_INTEGRATED_VGA_COMPO_0_0_FRAME_COUNTER
     port map (
      DOBDO(11 downto 0) => DOBDO(11 downto 0),
      D_2_VGA(11 downto 0) => D_2_VGA(11 downto 0),
      EMPTY => EMPTY,
      \HC_REG_reg[5]_0\ => FRAME_COUNTER_COMPONENT_n_0,
      \HC_REG_reg[7]_0\ => \HC_REG_reg[7]\,
      PRE_STATE => PRE_STATE,
      RD_FIFO0 => RD_FIFO0,
      SR(0) => SR(0),
      \VC_REG_reg[7]_0\ => FRAME_COUNTER_COMPONENT_n_15,
      VIDEO_ON_BUFF => VIDEO_ON_BUFF,
      i_CLK => i_CLK,
      i_RSTn => i_RSTn
    );
VGA_SYNC_COMPONENT: entity work.design_1_INTEGRATED_VGA_COMPO_0_0_VGA_SYNC
     port map (
      HSYNC => HSYNC,
      HSYNC_reg_0 => FRAME_COUNTER_COMPONENT_n_0,
      VIDEO_ON => VIDEO_ON,
      VIDEO_ON_BUFF => VIDEO_ON_BUFF,
      VSYNC => VSYNC,
      VSYNC_reg_0 => FRAME_COUNTER_COMPONENT_n_15,
      i_CLK => i_CLK
    );
\o_RGB_DATA_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(0),
      Q => OUT_VGA(0),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[10]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(10),
      Q => OUT_VGA(10),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[11]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(11),
      Q => OUT_VGA(11),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[1]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(1),
      Q => OUT_VGA(1),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[2]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(2),
      Q => OUT_VGA(2),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[3]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(3),
      Q => OUT_VGA(3),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[4]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(4),
      Q => OUT_VGA(4),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[5]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(5),
      Q => OUT_VGA(5),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[6]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(6),
      Q => OUT_VGA(6),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[7]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(7),
      Q => OUT_VGA(7),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[8]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(8),
      Q => OUT_VGA(8),
      R => VIDEO_ON
    );
\o_RGB_DATA_reg[9]\: unisim.vcomponents.FDRE
     port map (
      C => i_CLK,
      CE => '1',
      D => D_2_VGA(9),
      Q => OUT_VGA(9),
      R => VIDEO_ON
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT is
  port (
    OUT_VGA : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXIS_READY : out STD_LOGIC;
    HSYNC : out STD_LOGIC;
    VSYNC : out STD_LOGIC;
    i_CLK : in STD_LOGIC;
    S_AXIS_VALID : in STD_LOGIC;
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i_RSTn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT : entity is "INTEGRATED_VGA_COMPONENT";
end design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT is
  signal D_2_FIFO : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal D_OUT_FIFO : STD_LOGIC_VECTOR ( 11 downto 0 );
  signal EMPTY : STD_LOGIC;
  signal FULL_FIFO : STD_LOGIC;
  signal POSITION_CONTROLLER_COMP_n_2 : STD_LOGIC;
  signal PRE_STATE : STD_LOGIC;
  signal RD_FIFO : STD_LOGIC;
  signal RD_FIFO0 : STD_LOGIC;
  signal VGA_COMP_n_3 : STD_LOGIC;
  signal VGA_COMP_n_4 : STD_LOGIC;
  signal WE : STD_LOGIC;
  signal WR_FIFO : STD_LOGIC;
begin
CONTROLLER_COMP: entity work.design_1_INTEGRATED_VGA_COMPO_0_0_PIXEL_DATA_CONTROLLER
     port map (
      DIADI(11 downto 0) => D_2_FIFO(11 downto 0),
      FULL_FIFO => FULL_FIFO,
      SR(0) => VGA_COMP_n_3,
      S_AXIS_DATA(3 downto 0) => S_AXIS_DATA(3 downto 0),
      S_AXIS_VALID => S_AXIS_VALID,
      WE => WE,
      WR_FIFO => WR_FIFO,
      i_CLK => i_CLK
    );
FIFO_COMP: entity work.design_1_INTEGRATED_VGA_COMPO_0_0_FIFO_TOP
     port map (
      DIADI(11 downto 0) => D_2_FIFO(11 downto 0),
      DOBDO(11 downto 0) => D_OUT_FIFO(11 downto 0),
      EMPTY => EMPTY,
      FULL_FIFO => FULL_FIFO,
      \RD_ADDR_REG_reg[9]\ => POSITION_CONTROLLER_COMP_n_2,
      RD_FIFO => RD_FIFO,
      SR(0) => VGA_COMP_n_3,
      S_AXIS_READY => S_AXIS_READY,
      WE => WE,
      WR_FIFO => WR_FIFO,
      i_CLK => i_CLK
    );
POSITION_CONTROLLER_COMP: entity work.design_1_INTEGRATED_VGA_COMPO_0_0_POSITION_CONTROLLER
     port map (
      EMPTY => EMPTY,
      PRE_STATE => PRE_STATE,
      PRE_STATE_reg_0 => VGA_COMP_n_4,
      RD_FIFO => RD_FIFO,
      RD_FIFO0 => RD_FIFO0,
      RD_FIFO_reg_0 => POSITION_CONTROLLER_COMP_n_2,
      SR(0) => VGA_COMP_n_3,
      i_CLK => i_CLK
    );
VGA_COMP: entity work.design_1_INTEGRATED_VGA_COMPO_0_0_VGA_TOP_DESIGN
     port map (
      DOBDO(11 downto 0) => D_OUT_FIFO(11 downto 0),
      EMPTY => EMPTY,
      \HC_REG_reg[7]\ => VGA_COMP_n_4,
      HSYNC => HSYNC,
      OUT_VGA(11 downto 0) => OUT_VGA(11 downto 0),
      PRE_STATE => PRE_STATE,
      RD_FIFO0 => RD_FIFO0,
      SR(0) => VGA_COMP_n_3,
      VSYNC => VSYNC,
      i_CLK => i_CLK,
      i_RSTn => i_RSTn
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT_WRAP_VHDL is
  port (
    OUT_VGA : out STD_LOGIC_VECTOR ( 11 downto 0 );
    S_AXIS_READY : out STD_LOGIC;
    HSYNC : out STD_LOGIC;
    VSYNC : out STD_LOGIC;
    i_CLK : in STD_LOGIC;
    S_AXIS_VALID : in STD_LOGIC;
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 3 downto 0 );
    i_RSTn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT_WRAP_VHDL : entity is "INTEGRATED_VGA_COMPONENT_WRAP_VHDL";
end design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT_WRAP_VHDL;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT_WRAP_VHDL is
begin
INTEGRATED_VGA_COMPONENT_SV_2_VHDL: entity work.design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT
     port map (
      HSYNC => HSYNC,
      OUT_VGA(11 downto 0) => OUT_VGA(11 downto 0),
      S_AXIS_DATA(3 downto 0) => S_AXIS_DATA(3 downto 0),
      S_AXIS_READY => S_AXIS_READY,
      S_AXIS_VALID => S_AXIS_VALID,
      VSYNC => VSYNC,
      i_CLK => i_CLK,
      i_RSTn => i_RSTn
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_INTEGRATED_VGA_COMPO_0_0 is
  port (
    i_CLK : in STD_LOGIC;
    i_RSTn : in STD_LOGIC;
    S_AXIS_VALID : in STD_LOGIC;
    S_AXIS_READY : out STD_LOGIC;
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 7 downto 0 );
    HSYNC : out STD_LOGIC;
    VSYNC : out STD_LOGIC;
    OUT_VGA : out STD_LOGIC_VECTOR ( 11 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_INTEGRATED_VGA_COMPO_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_INTEGRATED_VGA_COMPO_0_0 : entity is "design_1_INTEGRATED_VGA_COMPO_0_0,INTEGRATED_VGA_COMPONENT_WRAP_VHDL,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_INTEGRATED_VGA_COMPO_0_0 : entity is "yes";
  attribute ip_definition_source : string;
  attribute ip_definition_source of design_1_INTEGRATED_VGA_COMPO_0_0 : entity is "package_project";
  attribute x_core_info : string;
  attribute x_core_info of design_1_INTEGRATED_VGA_COMPO_0_0 : entity is "INTEGRATED_VGA_COMPONENT_WRAP_VHDL,Vivado 2023.1";
end design_1_INTEGRATED_VGA_COMPO_0_0;

architecture STRUCTURE of design_1_INTEGRATED_VGA_COMPO_0_0 is
  attribute x_interface_info : string;
  attribute x_interface_info of S_AXIS_READY : signal is "xilinx.com:interface:axis:1.0 S_AXIS TREADY";
  attribute x_interface_info of S_AXIS_VALID : signal is "xilinx.com:interface:axis:1.0 S_AXIS TVALID";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of S_AXIS_VALID : signal is "XIL_INTERFACENAME S_AXIS, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, LAYERED_METADATA undef, INSERT_VIP 0";
  attribute x_interface_info of i_CLK : signal is "xilinx.com:signal:clock:1.0 i_CLK CLK";
  attribute x_interface_parameter of i_CLK : signal is "XIL_INTERFACENAME i_CLK, ASSOCIATED_RESET i_RSTn, FREQ_HZ 100000000, ASSOCIATED_BUSIF S_AXIS, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_processing_system7_0_0_FCLK_CLK0, INSERT_VIP 0";
  attribute x_interface_info of i_RSTn : signal is "xilinx.com:signal:reset:1.0 i_RSTn RST";
  attribute x_interface_parameter of i_RSTn : signal is "XIL_INTERFACENAME i_RSTn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute x_interface_info of S_AXIS_DATA : signal is "xilinx.com:interface:axis:1.0 S_AXIS TDATA";
begin
U0: entity work.design_1_INTEGRATED_VGA_COMPO_0_0_INTEGRATED_VGA_COMPONENT_WRAP_VHDL
     port map (
      HSYNC => HSYNC,
      OUT_VGA(11 downto 0) => OUT_VGA(11 downto 0),
      S_AXIS_DATA(3 downto 0) => S_AXIS_DATA(7 downto 4),
      S_AXIS_READY => S_AXIS_READY,
      S_AXIS_VALID => S_AXIS_VALID,
      VSYNC => VSYNC,
      i_CLK => i_CLK,
      i_RSTn => i_RSTn
    );
end STRUCTURE;
