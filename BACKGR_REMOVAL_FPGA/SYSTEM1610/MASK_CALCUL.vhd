----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/18/2025 03:39:09 PM
-- Design Name: 
-- Module Name: MASK_CALCUL - STRUCTURE
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

entity MASK_CALCUL is
    Port ( 
        i_CLK       : in std_logic;
        i_RSTn      : in std_logic;
        i_DATA_RGB  : in std_logic_vector(23 downto 0);
        i_DATA_VALID: in std_logic;
        
        --Hue's threshold value, from 0 to 255 
        i_H_THRESHOLD : in std_logic_vector(7 downto 0);
        
        -- MASK tell us the state of this pixel, pass or fail
        o_MASK_VALID  : out std_logic;
        o_MASK        : out std_logic
    );
end MASK_CALCUL;

architecture STRUCTURE of MASK_CALCUL is
    component MAX_MIN_DIFF is
        Port ( 
            i_CLK       : in std_logic;
            i_RSTn      : in std_logic;
            i_DATA_RGB  : in std_logic_vector(23 downto 0);
            i_DATA_VALID: in std_logic;
            
            --Hue's threshold value, from 0 to 255 
            i_H_THRESHOLD : in std_logic_vector(7 downto 0);
            
            -- MASK tell us the state of this pixel, pass or fail
            o_MASK_VALID  : out std_logic;
            o_MASK        : out std_logic
        );
    end component;    
begin
    MASK_CALCUL_COMPONENT:MAX_MIN_DIFF port map(
    
        i_CLK        => i_CLK,
        i_RSTn       => i_RSTn,
        i_DATA_RGB   => i_DATA_RGB,
        i_DATA_VALID => i_DATA_VALID,
        
        --Hue's threshold value, from 0 to 255 
        i_H_THRESHOLD => i_H_THRESHOLD,
        
        -- MASK tell us the state of this pixel, pass or fail
        o_MASK_VALID  => o_MASK_VALID,
        o_MASK        => o_MASK   
    );

end STRUCTURE;
