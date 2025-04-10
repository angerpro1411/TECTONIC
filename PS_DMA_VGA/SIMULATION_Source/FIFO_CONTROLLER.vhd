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
	
	        ALMOST_FULL_LEFT_SLOTS     : integer := 2;
	        
	        ALMOST_EMPTY_AVAI_SLOTS    : integer := 2;
	        
			ADDR_WIDTH : integer := 3
	       );
	PORT   (	
		i_CLK,i_RST_n	: in std_logic;
		WR,RD 			: in std_logic;
		ALMOST_FULL_FLAG,ALMOST_EMPTY_FLAG : out std_logic;
		WR_ADDR,RD_ADDR : out std_logic_vector(ADDR_WIDTH-1 downto 0);
		FULL,EMPTY		: out std_logic
	 );
end FIFO_CONTROLLER;

architecture RTL of FIFO_CONTROLLER is

	signal WR_ADDR_REG,WR_ADDR_NX : unsigned(ADDR_WIDTH-1 downto 0);
	signal RD_ADDR_REG,RD_ADDR_NX : unsigned(ADDR_WIDTH-1 downto 0);
	signal EMPTY_REG,EMPTY_NX	  : std_logic;
	signal FULL_REG, FULL_NX	  : std_logic;
	
	--One more bit to avoid overflow;
	signal CNT_ELEMENTS : unsigned(ADDR_WIDTH downto 0);
	
	signal COMMAND 		: std_logic_vector(1 downto 0);
	
	constant FIFO_DEPTH : integer := 2**ADDR_WIDTH;
	constant FIFO_DEPTH_UNSIGNED : unsigned(ADDR_WIDTH downto 0) := to_unsigned(FIFO_DEPTH,ADDR_WIDTH+1);
	constant ALMOST_FULL_LEFT_SLOTS_CONST : unsigned(ADDR_WIDTH-1 downto 0) := to_unsigned(ALMOST_FULL_LEFT_SLOTS,ADDR_WIDTH);
	constant ALMOST_EMPTY_AVAI_SLOTS_CONST : unsigned(ADDR_WIDTH-1 downto 0) := TO_UNSIGNED(ALMOST_EMPTY_AVAI_SLOTS,ADDR_WIDTH);
	
	--Test signal to check the result
	signal TEST_DIFFERENCE : unsigned(ADDR_WIDTH downto 0);

begin
	
	COMMAND <= RD & WR;

	STATE_REGIS:process (i_CLK)
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
				if EMPTY_REG = '0' and FULL_REG = '0' then
					RD_ADDR_NX <= RD_ADDR_REG + 1;
					WR_ADDR_NX <= WR_ADDR_REG + 1;
				elsif EMPTY_REG = '0' and FULL_REG = '1' then
				    RD_ADDR_NX <= RD_ADDR_REG + 1;
				    FULL_NX <= '0';
				elsif FULL_REG = '0' and EMPTY_REG = '1' then
					WR_ADDR_NX <= WR_ADDR_REG + 1;
					EMPTY_NX <= '0';--no more empty				    
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
	
	--Keep track the number element inside FIFO
	KEEP_TRACK_ELEMENT: process(i_CLK)
	begin
	    if rising_edge(i_CLK) then
	       if i_RST_n = '0' then
	           CNT_ELEMENTS <= (others => '0');
	       else
	           if COMMAND = "11" then
					if EMPTY_REG = '0' and FULL_REG = '0' then
						CNT_ELEMENTS <= CNT_ELEMENTS;
					elsif EMPTY_REG = '0' and FULL_REG = '1' then
						CNT_ELEMENTS <= CNT_ELEMENTS - 1;
					elsif FULL_REG = '0' and EMPTY_REG = '1' then
						CNT_ELEMENTS <= CNT_ELEMENTS + 1;			    
					end if;
	           elsif COMMAND = "01" and FULL_REG = '0' then -- Succeeded in writing 
	               CNT_ELEMENTS <= CNT_ELEMENTS + 1;
	           elsif COMMAND = "10" and EMPTY_REG = '0' then -- Succeeded in reading
	               CNT_ELEMENTS <= CNT_ELEMENTS - 1;
	           else
	               CNT_ELEMENTS <= CNT_ELEMENTS;
	           end if;
	       end if;
	    end if;    
	end process;
	


	ALMOST_FULL_FLAG <= '1' when (FIFO_DEPTH_UNSIGNED - CNT_ELEMENTS <= ALMOST_FULL_LEFT_SLOTS_CONST) else '0';
	ALMOST_EMPTY_FLAG <= '1' when (CNT_ELEMENTS <= ALMOST_EMPTY_AVAI_SLOTS_CONST) else '0';
	
end RTL;
