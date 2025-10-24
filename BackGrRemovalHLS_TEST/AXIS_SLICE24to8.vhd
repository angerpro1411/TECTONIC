----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2025 11:17:08 AM
-- Design Name: 
-- Module Name: AXIS_SLICE24to8 - Behavioral
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


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXIS_SLICE24to8 is
    generic(
        DATA_WIDTH_IN        : integer := 24;
        DATA_WIDTH_OUT       : integer := 8
    );
    port(
        i_CLK       : in std_logic;
        i_RSTn      : in std_logic;
        
        --AXI4-S master i/f
        M_AXIS_VALID :   out std_logic;
        M_AXIS_READY :   in std_logic;
        M_AXIS_DATA  :   out std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
        
        --Slave AXI Stream interface
        S_AXIS_DATA     : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
        S_AXIS_VALID    : in std_logic;
        S_AXIS_READY    : out std_logic
    );
end entity;

--Input is 24 bit in order RGB, but we need output be BGR because the next VGA component, 
--      first component inside it, treat data with order BGR. 

architecture RTL of AXIS_SLICE24to8 is
    signal SLICE_R,SLICE_G,SLICE_B : std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
    signal DELAY1_SLICE_R,DELAY1_SLICE_G,DELAY1_SLICE_B : std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
    signal DELAY2_SLICE_R,DELAY2_SLICE_G,DELAY2_SLICE_B : std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
    
    signal s_S_AXIS_READY : std_logic;
begin
    
    S_AXIS_READY <= s_S_AXIS_READY;
    
    DELAY_PROC : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                SLICE_R <= (others => '0');
                SLICE_G <= (others => '0');
                SLICE_B <= (others => '0');
            else
                if S_AXIS_VALID = '1' and s_S_AXIS_READY = '1' then
                    SLICE_R <= S_AXIS_DATA(23 downto 16);
                    SLICE_G <= S_AXIS_DATA(15 downto 8);
                    SLICE_B <= S_AXIS_DATA(7 downto 0);
                end if;
            end if;
        end if;      
    end process;
    
        
    SLICE_DATA_PROC : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                SLICE_R <= (others => '0');
                SLICE_G <= (others => '0');
                SLICE_B <= (others => '0');
                DELAY1_SLICE_R <= (others => '0');
                DELAY1_SLICE_G <= (others => '0');
                DELAY1_SLICE_B <= (others => '0');
                DELAY2_SLICE_R <= (others => '0');
                DELAY2_SLICE_G <= (others => '0');
                DELAY2_SLICE_B <= (others => '0');                                 
            else
                if S_AXIS_VALID = '1' and s_S_AXIS_READY = '1' then
                    SLICE_R <= S_AXIS_DATA(23 downto 16);
                    SLICE_G <= S_AXIS_DATA(15 downto 8);
                    SLICE_B <= S_AXIS_DATA(7 downto 0);
                    DELAY1_SLICE_R <= SLICE_R;
                    DELAY1_SLICE_G <= SLICE_G;
                    DELAY1_SLICE_B <= SLICE_B;
                    DELAY2_SLICE_R <= DELAY1_SLICE_R;
                    DELAY2_SLICE_G <= DELAY1_SLICE_G;
                    DELAY2_SLICE_B <= DELAY1_SLICE_B;                                        
                end if;
            end if;
        end if;      
    end process;
    
end RTL;
