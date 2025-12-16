----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 11:51:07 AM
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


entity FIFO_TOP is
	GENERIC(
            ALMOST_FULL_LEFT_SLOTS     : integer := 2;       
            ALMOST_EMPTY_AVAI_SLOTS    : integer := 2;	
	
			DATA_WIDTH : integer := 8;
			ADDR_WIDTH : integer := 3
	);
	PORT(
		i_CLK,i_RST_n : in std_logic;
		WR_DATA		  : in std_logic_vector(DATA_WIDTH-1 downto 0);
		WR,RD 		  : in std_logic;
		RD_DATA 	  : out std_logic_vector(DATA_WIDTH-1 downto 0);
		ALMOST_FULL_FLAG,ALMOST_EMPTY_FLAG : out std_logic;
		FULL,EMPTY	  : out std_logic		
	);
end FIFO_TOP;

architecture STRUCTURE of FIFO_TOP is

---------------------------COMPONENT DECLARATION---------------------------
	COMPONENT RAM_2PORT is
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
	end COMPONENT RAM_2PORT;
	
    COMPONENT FIFO_CONTROLLER is
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
    end COMPONENT FIFO_CONTROLLER;

---------------------------SIGNAL DECLARATION---------------------------
	signal WE_SIGNAL		: std_logic;
	signal FULL_SIGNAL 		: std_logic;
	signal WR_ADDR_SIGNAL, RD_ADDR_SIGNAL : std_logic_vector(ADDR_WIDTH-1 downto 0);
begin

---------------------------SIGNAL ASSIGNMENT---------------------------
	WE_SIGNAL <= WR and (not FULL_SIGNAL);
	FULL <= FULL_SIGNAL;

---------------------------PORT MAP CONNECTION---------------------------
	RAM_COMPONENT: RAM_2PORT 
	GENERIC MAP(
        DATA_WIDTH => DATA_WIDTH,
        ADDR_WIDTH => ADDR_WIDTH  
	)
	PORT MAP(
		i_CLK => i_CLK,
		WE 	  => WE_SIGNAL,	    
		RD_ADDR	=> RD_ADDR_SIGNAL,
		WR_ADDR	=> WR_ADDR_SIGNAL,	
		WR_DATA => WR_DATA,				
		RD_DATA	=> RD_DATA				
	);
	
	FIFO_CONTROLLER_COMPONENT : FIFO_CONTROLLER
    GENERIC MAP(
        ALMOST_FULL_LEFT_SLOTS => ALMOST_FULL_LEFT_SLOTS,
        ALMOST_EMPTY_AVAI_SLOTS => ALMOST_EMPTY_AVAI_SLOTS, 
        ADDR_WIDTH => ADDR_WIDTH   
    )
	PORT MAP(
		i_CLK	=> i_CLK,
		i_RST_n	=> i_RST_n,
		WR		=> WR,
		RD 		=> RD,
		WR_ADDR => WR_ADDR_SIGNAL,
		RD_ADDR => RD_ADDR_SIGNAL,
		ALMOST_FULL_FLAG => ALMOST_FULL_FLAG,
		ALMOST_EMPTY_FLAG => ALMOST_EMPTY_FLAG, 
		FULL	=> FULL_SIGNAL,
		EMPTY	=> EMPTY
	);
end STRUCTURE;