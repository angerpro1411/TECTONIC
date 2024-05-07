----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2024 03:55:20 PM
-- Design Name: 
-- Module Name: RGB_TEST - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- Change at 15:12 07/05/2024, now we can control screen's color by SW1 to SW6 of Zedboard. Each 2 consecutive SW
-- are 2 MSB bits of each color, for example, SW1 and SW2 are 2MSB bits of RED.
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RGB_TEST is
    port(
        i_CLK,i_RST_n : in std_logic;
        SYNC_CLR : in std_logic;
        HSYNC   : out std_logic;
        VSYNC   : out std_logic;
        
        --i_RGB_DATA: in std_logic_vector(11 downto 0);
        SW      : in std_logic_vector(5 downto 0);
        o_RGB_DATA: out std_logic_vector(11 downto 0)
    );
end RGB_TEST;

architecture TEST of RGB_TEST is
    component TOP_DESIGN is
        generic(
            VGA_ZEDBOARD_RESOLUTION : integer := 12 
        );
        port(
            i_CLK,i_RST_n : in std_logic;
            SYNC_CLR : in std_logic;
            HSYNC   : out std_logic;
            VSYNC   : out std_logic;
            
            i_RGB_DATA: in std_logic_vector(VGA_ZEDBOARD_RESOLUTION-1 downto 0);
            o_RGB_DATA: out std_logic_vector(VGA_ZEDBOARD_RESOLUTION-1 downto 0)
        );
    end component TOP_DESIGN;
    
    signal i_RGB_DATA: std_logic_vector(11 downto 0);
begin
    TOP_DESIGN_COMPONENT : TOP_DESIGN port map(
        i_CLK => i_CLK,
        i_RST_n => i_RST_n,
        SYNC_CLR => SYNC_CLR,
        HSYNC => HSYNC,
        VSYNC => VSYNC,
        
        i_RGB_DATA => i_RGB_DATA, 
        o_RGB_DATA => o_RGB_DATA  
    );
    
    i_RGB_DATA(1 downto 0) <= "00";
    i_RGB_DATA(3 downto 2) <= SW(1 downto 0);
    i_RGB_DATA(5 downto 4) <= "00";
    i_RGB_DATA(7 downto 6) <= SW(3 downto 2);
    i_RGB_DATA(9 downto 8) <= "00";
    i_RGB_DATA(11 downto 10) <= SW(5 downto 4);

end TEST;
