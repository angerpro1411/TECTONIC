----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/31/2025 02:12:05 PM
-- Design Name: 
-- Module Name: INTEGRATED_VGA_COMPONENT_WRAP_VHDL - STRUCTURE
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity INTEGRATED_VGA_COMPONENT_WRAP_VHDL is
    PORT(
        i_CLK   : in std_logic;
        i_RSTn  : in std_logic;
    
        --Axistream interface
        S_AXIS_VALID    : in std_logic;
        S_AXIS_READY    : out std_logic;
        S_AXIS_DATA     : in std_logic_vector(7 downto 0);
    
        HSYNC           : out std_logic;
        VSYNC           : out std_logic;
        OUT_VGA         : out std_logic_vector(11 downto 0)
    );
end INTEGRATED_VGA_COMPONENT_WRAP_VHDL;

architecture STRUCTURE of INTEGRATED_VGA_COMPONENT_WRAP_VHDL is
    component INTEGRATED_VGA_COMPONENT is
        PORT(
            i_CLK   : in std_logic;
            i_RSTn  : in std_logic;
        
            --Axistream interface
            S_AXIS_VALID    : in std_logic;
            S_AXIS_READY    : out std_logic;
            S_AXIS_DATA     : in std_logic_vector(7 downto 0);
        
            HSYNC           : out std_logic;
            VSYNC           : out std_logic;
            OUT_VGA         : out std_logic_vector(11 downto 0)
        );
    end component;
begin
    INTEGRATED_VGA_COMPONENT_SV_2_VHDL : INTEGRATED_VGA_COMPONENT
    port map
    (
        i_CLK  => i_CLK,
        i_RSTn => i_RSTn,
    
        --Axistream interface
        S_AXIS_VALID => S_AXIS_VALID,  
        S_AXIS_READY => S_AXIS_READY,
        S_AXIS_DATA => S_AXIS_DATA,
    
        HSYNC => HSYNC,
        VSYNC => VSYNC,
        OUT_VGA => OUT_VGA    
    );

end STRUCTURE;
