----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2024 02:08:19 PM
-- Design Name: 
-- Module Name: LINE_BUFFER - RTL
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

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LINE_BUFFER is
	generic(
		--Image resolution = 1/4 vga = 320x240 
		IMAGE_WIDTH : integer := 320;
		IMAGE_HEIGHT : integer := 240;
		
		--VGA bit number of each pixel
		VGA_ZEDBOARD : integer := 12
	);
	port(
		i_CLK : in std_logic;
		i_RSTn : in std_logic;
		
		--one compressed pixel with R-G-B 4x3 = 12bits.
		i_DATA : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);
		
		i_WRITE : in std_logic;
		i_READ : in std_logic;
		
		--Data is comprised of 3 pixel.
		o_DATA : out std_logic_vector(VGA_ZEDBOARD-1 downto 0)
		);
end entity;

architecture RTL of LINE_BUFFER is

	--1/4 vga resolution 320x240, wide = 320 pixel
	type RAM_TYPE is array (0 to IMAGE_WIDTH-1) of std_logic_vector(VGA_ZEDBOARD-1 downto 0);
	signal RAM : RAM_TYPE;
	
	--POINTER to RAM_DEPTH
	signal WR_PTR,RD_PTR : integer range 0 to IMAGE_WIDTH-1;
begin

	CONTROL_WRITE_PTR: process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			if i_RSTn = '0' then
				WR_PTR <= 0;
			elsif i_WRITE = '1' then
				WR_PTR <= WR_PTR + 1;
				if WR_PTR = IMAGE_WIDTH-1 then
					WR_PTR <= 0;
				end if;
			end if;
		end if;
	end process;
	
	WRITE_PROCESS: process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			if i_WRITE = '1' then
				RAM(WR_PTR) <= i_DATA;
			end if;
		end if;
	end process;
	
	CONTROL_READ_PTR: process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			if i_RSTn = '0' then
				RD_PTR <= 0;
			elsif i_READ = '1' then
				RD_PTR <= RD_PTR + 1;
				if RD_PTR = IMAGE_WIDTH-1 then
					RD_PTR <= 0;
				end if;
			end if;
		end if;
	end process;
	
	--Output data
	o_DATA <= RAM(RD_PTR);
	
		
end architecture;
