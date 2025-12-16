library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BRAM_2CONTROL is
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
		
		--LINE WIDTH is 320 means 9 bits.
		ADDRESS : in std_logic_vector(8 downto 0);
		
		i_WRITE : in std_logic;
		i_READ : in std_logic;
		
		--Data is comprised of 3 pixel.
		o_DATA : out std_logic_vector(VGA_ZEDBOARD-1 downto 0)
		);
end entity;

architecture RTL of BRAM_2CONTROL is

	--1/4 vga resolution 320x240, wide = 320 pixel
	type RAM_TYPE is array (0 to IMAGE_WIDTH-1) of std_logic_vector(VGA_ZEDBOARD-1 downto 0);
	signal RAM : RAM_TYPE;

	signal ADDRESS_INT : integer range 0 to 319;	
	
begin

	ADDRESS_INT <= to_integer(unsigned(ADDRESS));

	WRITE_PROCESS: process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			if i_WRITE = '1' then
				RAM(ADDRESS_INT) <= i_DATA;
			end if;
		end if;
	end process;
	
	READ_PROCESS: process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			if i_RSTn = '0' then
				o_DATA <= (others => '0');
			elsif i_READ = '1' then
				o_DATA <= RAM(ADDRESS_INT);
			end if;
		end if;
	end process;
	
end architecture;