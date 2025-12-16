----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2024 01:31:54 PM
-- Design Name: 
-- Module Name: FRAME_COUNTER - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- --05/05/2024 Non confirm and check syntax yet.
-- 06/05/2024 Check syntax -> OK
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FRAME_COUNTER is
    generic(
    		SYS_CLK : integer := 100; --100MHz
    		COUNT_MAX : integer := 3;
            HMAX : integer := 640;
            VMAX : integer := 480
             );
    port(
         i_CLK   : in std_logic;
         i_RST_n : in std_logic;
         o_TICK_25 : out std_logic;
         SYNC_CLR: in std_logic;
         HC      : out std_logic_vector(10 downto 0);
         VC      : out std_logic_vector(10 downto 0);
         FRAME_START : out std_logic;
         FRAME_END   : out std_logic             
);
end entity;

architecture RTL of FRAME_COUNTER is
	signal TICK_25M : std_logic;
	
	--signal to count as 4, divide 100MHz by 4 to get 25MHz
	signal COUNT : unsigned(1 downto 0);
	
	signal HC_REG,HC_NX : unsigned(10 downto 0);
	signal VC_REG,VC_NX : unsigned(10 downto 0);
	
begin

	--CLK divider divides 100MHz to 25MHz
    CLK_DIV : process(i_CLK)	
	begin
        if rising_edge(i_CLK) then
            if i_RST_n = '0' then
                COUNT <= (others => '0');
            else
				COUNT <= COUNT + 1;
            end if;
        end if;
	end process;
	
	TICK_25M <= '1' when COUNT = COUNT_MAX else '0';
	o_TICK_25 <=  TICK_25M;
	
	--CONTROL HC and VC bus.
	STATE_REGIS : process(i_CLK)
	begin
		if rising_edge(i_CLK) then
            if i_RST_n = '0' then
                HC_REG <= (others => '0');
                VC_REG <= (others => '0');		
			elsif SYNC_CLR = '1' then
				HC_REG <= (others => '0');
				VC_REG <= (others => '0');
			else 
				HC_REG <= HC_NX;
				VC_REG <= VC_NX;
			end if;
		end if;					
	end process;
	
	HC_INCREASE : process (TICK_25M,HC_REG)
	begin
		HC_NX <= HC_REG;
		if TICK_25M = '1' then
			HC_NX <= HC_REG + 1;
			if HC_REG = HMAX - 1 then
				HC_NX <= (others => '0');
			end if;
		end if;
	end process;
	
	VC_INCREASE : process (TICK_25M,VC_REG,HC_REG)
	begin
		VC_NX <= VC_REG;
		if (TICK_25M = '1' and HC_REG = HMAX - 1) then
			VC_NX <= VC_REG + 1;
			if VC_REG = VMAX - 1 then
				VC_NX <= (others => '0');
			end if;
		end if;
	end process;
	
	HC <= std_logic_vector(HC_REG);
	VC <= std_logic_vector(VC_REG);
	
	FRAME_START <= '1' when to_integer(HC_REG) = 0 and to_integer(VC_REG) = 0 else '0';
	FRAME_END <= '1' when HC_REG = HMAX - 1 and VC_REG = VMAX - 1 else '0';
	
end architecture;