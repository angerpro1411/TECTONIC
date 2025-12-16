----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12/03/2024 04:52:51 PM
-- Design Name: 
-- Module Name: inverter - RTL
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
use IEEE.NUMERIC_STD.ALL;


entity INVERTER is
  GENERIC(
        DATA_WIDTH : integer := 32
  );

  PORT (
        AXI_CLK : in std_logic;
        AXI_RSTN : in std_logic;
        
        -- AXI4-S slave i/f
        S_AXIS_VALID :   in std_logic;
        S_AXIS_READY :   out std_logic;
        S_AXIS_DATA :    in std_logic_vector(DATA_WIDTH-1 downto 0);
        
        
        --AXI4-S master i/f
        M_AXIS_VALID :   out std_logic;
        M_AXIS_READY :   in std_logic;
        M_AXIS_DATA  :   out std_logic_vector(DATA_WIDTH-1 downto 0)
   );
end INVERTER;

architecture RTL of INVERTER is
    
    --Signal declarations    
    signal S_AXIS_READY_SIGN : std_logic;
    signal M_AXIS_VALID_SIGN : std_logic;

begin

    S_AXIS_READY <= S_AXIS_READY_SIGN;
    M_AXIS_VALID <= M_AXIS_VALID_SIGN;
    RECEIVE_DATA: process(AXI_CLK)
    begin
        if rising_edge(AXI_CLK) then
            if (AXI_RSTN = '0') then
                M_AXIS_DATA <= (others => '0');
            elsif S_AXIS_VALID = '1' and S_AXIS_READY_SIGN = '1' then
                for I in DATA_WIDTH/8 downto 1 loop
                    M_AXIS_DATA(8*I-1 downto 8*(I-1)) <= std_logic_vector(255 - unsigned(S_AXIS_DATA(8*I-1 downto 8*(I-1))));
                end loop;
            end if;
        end if; 
    end process;

    SEND_VALID_CONTROL: process(AXI_CLK)
    begin
        if rising_edge(AXI_CLK) then
            if (AXI_RSTN = '0') then
                M_AXIS_VALID_SIGN <= '0';
            elsif S_AXIS_VALID = '1' and S_AXIS_READY_SIGN = '1' then --After one cycle, we have new valid data
                M_AXIS_VALID_SIGN <= '1';
            end if; 
        end if;  
    end process;
    
    -- When M_AXIS_READY = '1', Master need data => IP needs to provide data => get DATA from slave, IP_READY = '1'.
    -- When M_AXIS_READY = '0', All data need to keep the same, then M_AXIS_REAY = '0 '; 
    S_AXIS_READY <= M_AXIS_READY;

end RTL;
