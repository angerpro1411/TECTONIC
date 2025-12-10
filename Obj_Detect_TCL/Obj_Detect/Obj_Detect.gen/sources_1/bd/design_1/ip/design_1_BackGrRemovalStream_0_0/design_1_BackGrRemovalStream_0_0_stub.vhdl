-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (lin64) Build 3865809 Sun May  7 15:04:56 MDT 2023
-- Date        : Wed Dec 10 10:11:03 2025
-- Host        : dell3561-49 running 64-bit Ubuntu 22.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/dell3561-49/Obj_Detect_TCL/Obj_Detect/Obj_Detect.gen/sources_1/bd/design_1/ip/design_1_BackGrRemovalStream_0_0/design_1_BackGrRemovalStream_0_0_stub.vhdl
-- Design      : design_1_BackGrRemovalStream_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_BackGrRemovalStream_0_0 is
  Port ( 
    input_stream_TVALID : in STD_LOGIC;
    input_stream_TREADY : out STD_LOGIC;
    input_stream_TDATA : in STD_LOGIC_VECTOR ( 23 downto 0 );
    input_stream_TKEEP : in STD_LOGIC_VECTOR ( 2 downto 0 );
    input_stream_TSTRB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    input_stream_TUSER : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_stream_TLAST : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_stream_TID : in STD_LOGIC_VECTOR ( 0 to 0 );
    input_stream_TDEST : in STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TVALID : out STD_LOGIC;
    output_stream_TREADY : in STD_LOGIC;
    output_stream_TDATA : out STD_LOGIC_VECTOR ( 23 downto 0 );
    output_stream_TKEEP : out STD_LOGIC_VECTOR ( 2 downto 0 );
    output_stream_TSTRB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    output_stream_TUSER : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TLAST : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TID : out STD_LOGIC_VECTOR ( 0 to 0 );
    output_stream_TDEST : out STD_LOGIC_VECTOR ( 0 to 0 );
    ap_clk : in STD_LOGIC;
    ap_rst_n : in STD_LOGIC
  );

end design_1_BackGrRemovalStream_0_0;

architecture stub of design_1_BackGrRemovalStream_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "input_stream_TVALID,input_stream_TREADY,input_stream_TDATA[23:0],input_stream_TKEEP[2:0],input_stream_TSTRB[2:0],input_stream_TUSER[0:0],input_stream_TLAST[0:0],input_stream_TID[0:0],input_stream_TDEST[0:0],output_stream_TVALID,output_stream_TREADY,output_stream_TDATA[23:0],output_stream_TKEEP[2:0],output_stream_TSTRB[2:0],output_stream_TUSER[0:0],output_stream_TLAST[0:0],output_stream_TID[0:0],output_stream_TDEST[0:0],ap_clk,ap_rst_n";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "BackGrRemovalStream,Vivado 2023.1";
begin
end;
