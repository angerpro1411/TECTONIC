----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 05:05:49 PM
-- Design Name: 
-- Module Name: FIFO_CONTROLLER - RTL
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



entity FIFO_CONTROLLER is
	GENERIC(
			ADDR_WIDTH : integer := 3
	       );
	PORT   (	
		i_CLK,i_RST_n	: in std_logic;
		WR,RD 			: in std_logic;
		WR_ADDR,RD_ADDR : out std_logic_vector(ADDR_WIDTH-1 downto 0);
		FULL,EMPTY		: out std_logic
	 );
end FIFO_CONTROLLER;

architecture RTL of FIFO_CONTROLLER is
	signal WR_ADDR_REG,WR_ADDR_NX : unsigned(ADDR_WIDTH-1 downto 0);
	signal RD_ADDR_REG,RD_ADDR_NX : unsigned(ADDR_WIDTH-1 downto 0);
	signal EMPTY_REG,EMPTY_NX	  : std_logic;
	signal FULL_REG, FULL_NX	  : std_logic;
	
	
	signal COMMAND 		: std_logic_vector(1 downto 0);
	signal STATE_FIFO	:std_logic_vector(1 downto 0);
begin
	
	COMMAND <= RD & WR;
	STATE_FIFO <= EMPTY_REG & FULL_REG;

	STATE_REGIS:process (i_CLK,i_RST_n)
	begin
		if i_RST_n = '0' then
			WR_ADDR_REG <= (others => '0');
			RD_ADDR_REG <= (others => '0');
			EMPTY_REG <= '1';
			FULL_REG <= '0';
		elsif rising_edge(i_CLK) then
			WR_ADDR_REG <= WR_ADDR_NX;
			RD_ADDR_REG <= RD_ADDR_NX;
			EMPTY_REG <= EMPTY_NX;
			FULL_REG <= FULL_NX;			
		end if;
	end process;
	
	NEXT_STATE: process(WR_ADDR_REG,RD_ADDR_REG,EMPTY_REG,FULL_REG,COMMAND,WR_ADDR_NX,RD_ADDR_NX)
	begin
		WR_ADDR_NX <= WR_ADDR_REG;
		RD_ADDR_NX <= RD_ADDR_REG;
		EMPTY_NX <= EMPTY_REG;
		FULL_NX <= FULL_REG;
		case COMMAND is
			when "01" => --Write command
				if EMPTY_REG = '1' and FULL_REG = '0' then --at the beginning
					WR_ADDR_NX <= WR_ADDR_REG + 1;
					EMPTY_NX <= '0';--no more empty
				elsif EMPTY_REG = '0' and FULL_REG = '0' then 
					WR_ADDR_NX <= WR_ADDR_REG + 1;
					if WR_ADDR_NX = RD_ADDR_REG then -- write till full the FIFO
						FULL_NX <= '1';
					end if;
				end if;
			when "10" => --Read command
				if EMPTY_REG = '0' and FULL_REG = '1' then
					RD_ADDR_NX <= RD_ADDR_REG + 1;
					FULL_NX <= '0';--no more full
				elsif EMPTY_REG = '0' and FULL_REG = '0' then
					RD_ADDR_NX <= RD_ADDR_REG + 1;
					if RD_ADDR_NX = WR_ADDR_REG then -- read till empty the FIFO
						EMPTY_NX <= '1';
					end if;
				end if;
			when "11" => --Read/Write at the same time no perform if FULL, EMPTY
				if STATE_FIFO = "00" then
					RD_ADDR_NX <= RD_ADDR_REG + 1;
					WR_ADDR_NX <= WR_ADDR_REG + 1;
				end if;
			when others =>
					RD_ADDR_NX <= RD_ADDR_REG ;
					WR_ADDR_NX <= WR_ADDR_REG ;				 
		end case;					
	end process;
	
	--OPCODE_DECODE
	WR_ADDR <= std_logic_vector(WR_ADDR_REG);
	RD_ADDR <= std_logic_vector(RD_ADDR_REG);
	FULL <= FULL_REG;
	EMPTY <= EMPTY_REG;
end RTL;

