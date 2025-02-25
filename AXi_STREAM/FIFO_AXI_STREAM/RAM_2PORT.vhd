----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 03:48:37 PM
-- Design Name: 
-- Module Name: RAM_2PORT - RTL
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


entity RAM_2PORT is
	GENERIC(
			DATA_WIDTH : integer := 8;
			ADDR_WIDTH : integer := 3
	);
	
	PORT (
			i_CLK,WE 		    : in std_logic;
			RD_ADDR,WR_ADDR		: in std_logic_vector(ADDR_WIDTH-1 downto 0);
			WR_DATA				: in std_logic_vector(DATA_WIDTH-1 downto 0);
			RD_DATA				: out std_logic_vector(DATA_WIDTH-1 downto 0)
	
	 );
end RAM_2PORT;

architecture RTL of RAM_2PORT is
	
	
	type RAM_TYPE is array (0 to 2**ADDR_WIDTH - 1) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal RAM : RAM_TYPE;

begin
	
	WRITE_OP : process(i_CLK) 
	begin
		if rising_edge(i_CLK) then
			if WE = '1' then
				RAM(to_integer(unsigned(WR_ADDR)))<= WR_DATA;
			end if; 
		end if;
	end process;

    --First word fall through
    RD_DATA <= RAM(to_integer(unsigned(RD_ADDR)));


end RTL;
