----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/18/2024 02:04:42 PM
-- Design Name: 
-- Module Name: TOP - Behavioral
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
-- 25-04-2024 after change back RX = '0' instead of check falling_edge of RX, everything works well.
-- First test with baud rate 9600 => OK
-- Second test with baud rate 115200 => OK
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity TOP is
    port ( 
            i_RST_n : in std_logic;
            i_CLK_100 : in std_logic;
            RX        : in std_logic;
            TX        : out std_logic;
            LEDs      : out std_logic_vector(7 downto 0)          
    );
end TOP;


architecture STRUCTURE of TOP is
---------------------------COMPONENT INSTANTIATION------------------------------------	
COMPONENT BaudRate_Gen is
	port(
		i_CLK,i_RST_n : in	std_logic;
		--DVSR		  : in 	std_logic_vector(9 downto 0);
		DVSR		  : in 	std_logic_vector(5 downto 0);
		TICK 		  : out std_logic
	);
end COMPONENT;

COMPONENT Uart_RX is
  Generic(
        DATA_BITS      : integer := 8;
        NB_TICK_MAX    : integer := 16
  );
 
  Port (
        i_CLK,i_RST_n : in std_logic;
        RX,S_TICK   : in std_logic;
        RX_DONE     : out std_logic;
        DOUT        : out std_logic_vector(DATA_BITS-1 downto 0)
   );
end COMPONENT Uart_RX;

---------------------------SIGNAL DECLARATION------------------------------------
    constant DVSR : std_logic_vector(5 downto 0) := "110101";
    --constant DVSR : std_logic_vector(9 downto 0) := "1010001011";
    signal RX_DONE : std_logic;
    signal S_TICK  : std_logic;
    signal DOUT    : std_logic_vector(7 downto 0);
    signal RX_T1, RX_T2 : std_logic;

begin
    
    BaudRate_Gen_COMPONENT : BaudRate_Gen PORT MAP(
        i_CLK => i_CLK_100,
        i_RST_n => i_RST_n,
        DVSR => DVSR,
        TICK => S_TICK
    );
    
    Uart_RX_COMPONENT : Uart_RX PORT MAP(
        i_CLK => i_CLK_100,
        i_RST_n => i_RST_n,
        RX => RX_T2,
        S_TICK => S_TICK,
        RX_DONE => RX_DONE,
        DOUT => DOUT    
    
    );
    
        
    cdc: process(i_RST_n,i_CLK_100)
    begin
        if i_RST_n = '0' then
            RX_T1 <= '1';
            RX_T2 <= '1';
        elsif rising_edge(i_CLK_100) then
            RX_T1 <= RX;
            RX_T2 <= RX_T1;
        end if;
    
    end process;
    
    
    
    display: process(i_RST_n,i_CLK_100)
    begin
        if i_RST_n = '0' then
            LEDs <= X"AA";
        elsif rising_edge(i_CLK_100) then
            if RX_DONE = '1' then
                LEDs <= DOUT;
            end if;
        end if;
    end process;

end STRUCTURE;
