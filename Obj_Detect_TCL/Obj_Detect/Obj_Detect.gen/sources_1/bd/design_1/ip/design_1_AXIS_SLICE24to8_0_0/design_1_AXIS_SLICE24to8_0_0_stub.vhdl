-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
-- Date        : Wed Dec 10 10:10:19 2025
-- Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/dell3561-49/Obj_Detect_TCL/Obj_Detect/Obj_Detect.gen/sources_1/bd/design_1/ip/design_1_AXIS_SLICE24to8_0_0/design_1_AXIS_SLICE24to8_0_0_stub.vhdl
-- Design      : design_1_AXIS_SLICE24to8_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_AXIS_SLICE24to8_0_0 is
  Port ( 
    i_CLK : in STD_LOGIC;
    i_RSTn : in STD_LOGIC;
    M_AXIS_VALID : out STD_LOGIC;
    M_AXIS_READY : in STD_LOGIC;
    M_AXIS_DATA : out STD_LOGIC_VECTOR ( 7 downto 0 );
    S_AXIS_DATA : in STD_LOGIC_VECTOR ( 23 downto 0 );
    S_AXIS_VALID : in STD_LOGIC;
    S_AXIS_READY : out STD_LOGIC
  );

end design_1_AXIS_SLICE24to8_0_0;

architecture stub of design_1_AXIS_SLICE24to8_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "i_CLK,i_RSTn,M_AXIS_VALID,M_AXIS_READY,M_AXIS_DATA[7:0],S_AXIS_DATA[23:0],S_AXIS_VALID,S_AXIS_READY";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "AXIS_SLICE24to8,Vivado 2023.1";
begin
end;
