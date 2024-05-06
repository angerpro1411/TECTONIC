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
-- 
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
    
    i_RGB_DATA <= X"ABC";

end TEST;
