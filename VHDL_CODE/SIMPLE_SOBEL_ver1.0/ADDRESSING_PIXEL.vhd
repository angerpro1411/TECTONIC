----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/19/2024 03:29:02 PM
-- Design Name: 
-- Module Name: ADDRESSING_PIXEL - RTL
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

entity ADDRESSING_PIXEL is
	generic(
	
		--VGA bit number of each pixel
		VGA_ZEDBOARD : integer := 12;
	
		IMAGE_HEIGHT : integer := 240;
		
		IMAGE_WIDTH : integer := 320;
		
		--240 height = 240 lines => 0 to 239
		FIRST_LINE_ADDRESS: std_logic_vector :=x"00";
		LAST_LINE_ADDRESS: std_logic_vector := x"EF"
	);
	
	port(
		i_CLK : in std_logic;
		i_RSTn : in std_logic;	
		
		--one compressed pixel with R-G-B 4x3 = 12bits.
		i_DATA : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);			
		i_WRITE : in std_logic;
		i_READ : in std_logic;
		
		--8-bit lines from 0 to 239 and 9 bits row from 0 to 319
		READ_ADDRESS : in std_logic_vector(16 downto 0);
		
		o_DATA : out std_logic_vector(VGA_ZEDBOARD-1 downto 0);
		--
		DONE_WRITE : out std_logic	
	);

end entity;

architecture RTL of ADDRESSING_PIXEL is

	--Component declaration
	component LINE_BUFFER is
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
	end component;
	
	--This array uses to control which line we will use to write in,or read from.
	type WRITE_ARRAY_REG_t is array (0 to IMAGE_HEIGHT - 1) of std_logic;
	signal i_WRITE_LINE,i_READ_LINE : WRITE_ARRAY_REG_t;
	
	--Variable to counter number of pixel in line.
	signal PIXEL_WRLINE_COUNTER,PIXEL_RDLINE_COUNTER: integer range 0 to IMAGE_WIDTH-1;
	
	--Variable to point to the line where we are in.
	signal LINE_IN_WR_PTR,LINE_IN_RD_PTR : integer range 0 to IMAGE_HEIGHT-1;
	
begin

	LINE_BUFFER_GEN: for I in 0 to IMAGE_HEIGHT - 1 generate
		LINE_BUFFER_X : LINE_BUFFER port map(
			i_CLK => i_CLK,
			i_RSTn => i_RSTn,
			i_DATA => i_DATA,
			i_WRITE => i_WRITE_LINE(I),
			i_READ => i_READ_LINE(I),
			o_DATA => 
		);
	end generate;
	
	PIXEL_WRLINE_COUNTER_PROCESS : process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			if i_RSTn = '0' then
				PIXEL_WRLINE_COUNTER <= 0;
			elsif (i_WRITE = '1') then
				PIXEL_WRLINE_COUNTER <= PIXEL_WRLINE_COUNTER + 1;
				if PIXEL_WRLINE_COUNTER = IMAGE_WIDTH - 1 then
					PIXEL_WRLINE_COUNTER <= 0;
				end if;
			end if;
		end if;				
	end process;
	
	LINE_IN_WR_PTR_PROCESS: process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			if i_RSTn = '0' then
				LINE_IN_WR_PTR <= 0;
			elsif (PIXEL_WRLINE_COUNTER = IMAGE_WIDTH-1 and i_WRITE = '1') then
				LINE_IN_WR_PTR <= LINE_IN_WR_PTR + 1;
				if LINE_IN_WR_PTR = IMAGE_HEIGHT - 1 then
					LINE_IN_WR_PTR <= 0;
				end if;
			end if;
		end if;
	end process;
	
	i_WRITE_LINE_PROCESS: process(LINE_IN_WR_PTR, i_WRITE)
	begin
		i_WRITE_LINE <= (others => '0');
		i_WRITE_LINE(LINE_IN_WR_PTR) <= i_WRITE;
	end process;
	
	DONE_WRITE_OUTPUT : process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			if i_RSTn = '0' then
				DONE_WRITE <= '0';
			elsif (PIXEL_WRLINE_COUNTER = IMAGE_WIDTH-1 and LINE_IN_WR_PTR = IMAGE_HEIGHT - 1 and i_WRITE = '1' )then --last pixel of last line
				DONE_WRITE <= '1';
			else
				DONE_WRITE <= '0';
			end if;
		end if; 
	end process;
	
	
	
end architecture;
