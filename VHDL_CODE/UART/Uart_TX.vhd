----------------------------------------------------------------------------------
-- Company: ENSTA-Bretagne
-- Engineer: Duy-Manh NGUYEN
--
-- Create Date: 04/10/2024 10:45:21 AM
-- Design Name: Uart_TX - RTL
-- Module Name: Uart_TX - RTL
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

----VERSION 1
--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;

--entity Uart_TX is
--  Generic( 
--        DATA_BITS : integer := 8;
--        NB_TICK_MAX    : integer := 16
--  );
--  Port (
--        i_RST_n : in std_logic;
--        i_CLK : in std_logic;
--        TX_START : in std_logic;
--        DIN	     : in std_logic_vector(DATA_BITS-1 downto 0);
--        S_TICK	 : in std_logic;
--        TX_DONE  : out std_logic;
--        TX       : out std_logic
--  );
--end Uart_TX;

--architecture RTL of Uart_TX is
--    type UART_STATE is (IDLE, START, DATA, STOP);
--    signal PRE_ST,NX_ST : UART_STATE;
    
--    signal TICKNB_REG,TICKNB_NX : unsigned(3 downto 0); --counter to count number of tick
--    signal DATANB_REG,DATANB_NX : unsigned(3 downto 0); --normally data from 6,7,8 and 9 with parity
--    signal DATA_REG,DATA_NX     : std_logic_vector(DATA_BITS-1 downto 0); --data register to shift data
--    signal TX_REG,TX_NX		: std_logic;

--begin
--	STATE_REGIS: process(i_CLK,i_RST_n)
--	begin
--		if (i_RST_n = '0') then
--			PRE_ST <= IDLE;
--			TICKNB_REG <= (others => '0');
--			DATANB_REG <= (others => '0');
--			DATA_REG <= (others => '0');
--			TX_REG <= '1';	--Ready signal for transmitter with initior = 1
--		elsif rising_edge(i_CLK) then
--			PRE_ST <= NX_ST;
--			TICKNB_REG <= TICKNB_NX;
--			DATANB_REG <= DATANB_NX;
--			DATA_REG <= DATA_NX ;
--			TX_REG <= TX_NX;	--Ready signal for transmitter with initior = 1
--		end if;		
--	end process;
	
--	NEXT_STATE : process(TX_START,DIN,S_TICK,PRE_ST,TICKNB_REG,DATANB_REG,DATA_REG,TX_REG)
--	begin
--	--verybeginning to set init values
--		TX_DONE <= '0';
--		NX_ST <= PRE_ST;
--		TICKNB_NX <= TICKNB_REG;
--		DATANB_NX <= DATANB_REG;
--		DATA_NX <= DATA_REG;
--		TX_NX <= TX_REG;
		
--	--state decision	
--		case PRE_ST is
--			when IDLE =>
--				TX_NX <= '1'; -- stay at asserted if no start signal detected.
--				if TX_START = '1' then
--					NX_ST <= START;
--					TICKNB_NX <= (others => '0');
--					DATA_NX <= DIN;
--				end if;
--			when START =>
--				TX_NX <= '0';--START SIGNAL till 16 ticks
--				if S_TICK = '1' then
--					TICKNB_NX <= TICKNB_REG + 1;
--					if TICKNB_REG = NB_TICK_MAX-1 then
--						TICKNB_NX <= (others => '0');
--						NX_ST <= DATA;
--						DATANB_NX <= (others => '0');
--					end if;
--				end if;
--			when DATA =>
--				TX_NX <= DATA_REG(0);--send from bit0 to bit7
--				if S_TICK = '1' then
--					TICKNB_NX <= TICKNB_REG + 1;
--					if TICKNB_REG = NB_TICK_MAX-1 then
--						TICKNB_NX <= (others => '0');
--						DATANB_NX <= DATANB_REG + 1;
--						DATA_NX <= '0' & DATA_REG(7 downto 1);
--						if DATANB_REG = DATA_BITS-1 then --last time to send data
--							NX_ST <= STOP;
--						end if;
--					end if;
--				end if;
--			when STOP =>
--				TX_NX <= '1';--STOP signal till 16 ticks
--				if S_TICK = '1' then
--					TICKNB_NX <= TICKNB_REG + 1;
--					if TICKNB_REG = NB_TICK_MAX-1 then
--						--TICKNB_NX <= (others => 0); --already reset counter at IDLE
--						NX_ST <= IDLE;
--						TX_DONE <= '1';
--					end if;
--				end if;
--		end case;
--	end process;
	
--	--OPCODE_DECODE
--	TX <= TX_REG;

--end RTL;

--VERSION2
----------------------------------------------------------------------------------
-- Company: ENSTA-Bretagne
-- Engineer: Duy-Manh NGUYEN
--
-- Create Date: 04/10/2024 10:45:21 AM
-- Design Name: Uart_TX - RTL
-- Module Name: Uart_TX - RTL
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

entity Uart_TX is
  Generic( 
        DATA_BITS : integer := 8;
        NB_TICK_MAX    : integer := 16
  );
  Port (
        i_RST_n : in std_logic;
        i_CLK : in std_logic;
        TX_START : in std_logic;
        DIN	     : in std_logic_vector(DATA_BITS-1 downto 0);
        S_TICK	 : in std_logic;
        TX_DONE  : out std_logic;
        TX       : out std_logic
  );
end Uart_TX;

architecture RTL of Uart_TX is
    type UART_STATE is (IDLE, START, DATA, STOP);
    signal PRE_ST,NX_ST : UART_STATE;
    
    signal TICKNB_REG,TICKNB_NX : unsigned(3 downto 0); --counter to count number of tick
    signal DATANB_REG,DATANB_NX : unsigned(3 downto 0); --normally data from 6,7,8 and 9 with parity
    signal DATA_REG,DATA_NX     : std_logic_vector(DATA_BITS-1 downto 0); --data register to shift data
    signal TX_REG,TX_NX		: std_logic;

begin
	STATE_REGIS: process(i_CLK,i_RST_n)
	begin
		if (i_RST_n = '0') then
			PRE_ST <= IDLE;
			TICKNB_REG <= (others => '0');
			DATANB_REG <= (others => '0');
			DATA_REG <= (others => '0');
			TX_REG <= '1';	--Ready signal for transmitter with initior = 1
		elsif rising_edge(i_CLK) then
			PRE_ST <= NX_ST;
			TICKNB_REG <= TICKNB_NX;
			DATANB_REG <= DATANB_NX;
			DATA_REG <= DATA_NX ;
			TX_REG <= TX_NX;	--Ready signal for transmitter with initior = 1
		end if;		
	end process;
	
	NEXT_STATE : process(TX_START,DIN,S_TICK,PRE_ST,TICKNB_REG,DATANB_REG,DATA_REG,TX_REG)
	begin
	--verybeginning to set init values
		TX_DONE <= '0';
		NX_ST <= PRE_ST;
		TICKNB_NX <= TICKNB_REG;
		DATANB_NX <= DATANB_REG;
		DATA_NX <= DATA_REG;
		TX_NX <= TX_REG;
		
	--state decision	
		case PRE_ST is
			when IDLE =>
				TX_NX <= '1'; -- stay at asserted if no start signal detected.
				if TX_START = '1' then
					NX_ST <= START;
					TICKNB_NX <= (others => '0');
					DATA_NX <= DIN;
				end if;
			when START =>
				TX_NX <= '0';--START SIGNAL till 16 ticks
				if S_TICK = '1' then
						if TICKNB_REG = NB_TICK_MAX-1 then
						TICKNB_NX <= (others => '0');
						NX_ST <= DATA;
						DATANB_NX <= (others => '0');
					else
					   TICKNB_NX <= TICKNB_REG + 1;
					end if;
				end if;
			when DATA =>
				TX_NX <= DATA_REG(0);--send from bit0 to bit7
				if S_TICK = '1' then
					if TICKNB_REG = NB_TICK_MAX-1 then
						TICKNB_NX <= (others => '0');
						DATA_NX <= '0' & DATA_REG(7 downto 1);
						if DATANB_REG = DATA_BITS-1 then --last time to send data
							NX_ST <= STOP;
						else
						    DATANB_NX <= DATANB_REG + 1;
						end if;
					else
					    TICKNB_NX <= TICKNB_REG + 1;
					end if;
				end if;
			when STOP =>
				TX_NX <= '1';--STOP signal till 16 ticks
				if S_TICK = '1' then
					if TICKNB_REG = NB_TICK_MAX-1 then
						--TICKNB_NX <= (others => 0); --already reset counter at IDLE
						NX_ST <= IDLE;
						TX_DONE <= '1';
					else
					    TICKNB_NX <= TICKNB_REG + 1;
					end if;
				end if;
		end case;
	end process;
	
	--OPCODE_DECODE
	TX <= TX_REG;

end RTL;
