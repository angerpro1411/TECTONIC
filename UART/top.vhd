----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 02:22:33 PM
-- Design Name: 
-- Module Name: Top_Design - STRUCTURE
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


entity Top_Design is
	port (	i_CLK,i_RST_n :	in 	std_logic;
					 DVSR : in 	std_logic_vector(5 downto 0);
					 RX	  : in 	std_logic;
				DIN_TX	  : in  std_logic_vector(7 downto 0);
				TX_START  : in 	std_logic;
				DOUT_RX	  : out std_logic_vector(7 downto 0);
				RX_DONE	  : out std_logic;
					 TX   : out std_logic;
				TX_DONE	  : out std_logic
	 );
end Top_Design;

architecture STRUCTURE of Top_Design is

---------------------------COMPONENT INSTANTIATION------------------------------------	
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

	COMPONENT Uart_TX is
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
	end COMPONENT Uart_TX;

	COMPONENT BaudRate_Gen is
		port(
			i_CLK,i_RST_n : in	std_logic;
			DVSR		  : in 	std_logic_vector(5 downto 0);
			TICK 		  : out std_logic
		);
	end COMPONENT BaudRate_Gen;

---------------------------SIGNAL DECLARATION------------------------------------
	signal TICK_SIGNAL: std_logic;
	
	--constant DVSR     : std_logic_vector(5 downto 0) := "110101";
    --constant DIN_TX	  : std_logic_vector(7 downto 0) := X"00" ;
    --constant TX_START : std_logic := '0';
begin
	DVSR_PORT_MAP: BaudRate_Gen PORT MAP(
										DVSR => DVSR,
										i_CLK => i_CLK,
										i_RST_n => i_RST_n,
										TICK => TICK_SIGNAL
										);
	RX_PORT_MAP: Uart_RX		PORT MAP(
										i_CLK => i_CLK,
										i_RST_n => i_RST_n,
										RX		=> RX,
										S_TICK  => TICK_SIGNAL,
										RX_DONE  => RX_DONE,
										DOUT	 => DOUT_RX        
										);
	TX_PORT_MAP: Uart_TX		PORT MAP(
										i_RST_n => i_RST_n,
										i_CLK 	=> i_CLK,
										TX_START => TX_START,
										DIN	     => DIN_TX,
										S_TICK	 => TICK_SIGNAL,
										TX_DONE  => TX_DONE,
										TX       => TX										
	);	   

end STRUCTURE;
