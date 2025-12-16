----------------------------------------------------------------------------------
-- Company: ENSTA-Bretagne
-- Engineer: Duy-Manh NGUYEN
--
-- Create Date: 04/14/2024 10:45:21 AM
-- Design Name: Baud rate generator - RTL
-- Module Name: Baud rate generator - RTL
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: How to calculate the baud rate  
-- so we need to get one input call "DVSR" to get the value that we need, 
-- with system clk 'f' and baud rate is 'b', each bit lasts 16 TICKs.
-- so each time COUNTer COUNTs to = f/(16xb) - 1 then we get one TICK.
-- with system 100Mhz and baud rate is 115200, we need COUNT to 53. 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

ENTITY BaudRate_Gen is
	port(
		i_CLK,i_RST_n : in	std_logic;
		DVSR		  : in 	std_logic_vector(5 downto 0);
		TICK 		  : out std_logic
	);
end ENTITY;

ARCHITECTURE RTL of BaudRate_Gen is
	signal COUNT,COUNT_NX : unsigned(5 downto 0);
begin
	STATE_REGIS: process(i_CLK,i_RST_n)
	begin
		if i_RST_n = '0' then
			COUNT <= (others => '0');
		elsif rising_edge(i_CLK) then
			COUNT <= COUNT_NX;
		end if;
	end process;
	
	COUNTER_BAUD: process(DVSR,COUNT) 
	begin
	    TICK <= '0';
		COUNT_NX <= COUNT + 1;
		if COUNT = unsigned(DVSR) then
			COUNT_NX <= (others => '0');
			TICK <= '1';
		end if;
	end process;

end ARCHITECTURE;
