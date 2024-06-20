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
		ADDRESS : in std_logic_vector(16 downto 0);
		
		o_DATA : out std_logic_vector(VGA_ZEDBOARD-1 downto 0);
		--
		DONE_WRITE : out std_logic	
	);
end entity;

architecture RTL of ADDRESSING_PIXEL is

    --Component declaration
    component BRAM_2CONTROL is
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
    end component;    

    --Signal declarations
    signal LINE_NUMBER : std_logic_vector(7 downto 0); -- from 0 to 239
    signal PIXEL_NUMBER : std_logic_vector(8 downto 0); -- from 0 to 319
    
    --Array to choose which line we are pointing to.
    type LINE_PTR_ARRAY is array (0 to IMAGE_HEIGHT-1) of std_logic;
    signal WRITE_LINE_PTR,READ_LINE_PTR : LINE_PTR_ARRAY;    

    --Array to bring out all of output buffer into a MUX
    type DATA_OUT_ARRAY is array (0 to IMAGE_HEIGHT-1) of std_logic_vector (VGA_ZEDBOARD-1 downto 0);
    signal DATA_OUT: DATA_OUT_ARRAY;    

begin

	LINE_BUFFER_GEN: for I in 0 to IMAGE_HEIGHT - 1 generate
        BRAM_2CONTROL_X : BRAM_2CONTROL port map(
			i_CLK => i_CLK,
			i_RSTn => i_RSTn,
			i_DATA => i_DATA,
            ADDRESS => PIXEL_NUMBER,
			i_WRITE => WRITE_LINE_PTR(I),
			i_READ => READ_LINE_PTR(I),
			o_DATA => DATA_OUT(I)
		);
	end generate;

    DECODE_ADDRESS: process(ADDRESS)
    begin
        LINE_NUMBER <= ADDRESS(16 downto 9);
        PIXEL_NUMBER <= ADDRESS(8 downto 0);
    end process;
    
    CHOOSING_LINE_PROCESS: process(LINE_NUMBER,i_WRITE,i_READ)
    begin
        WRITE_LINE_PTR <= (others => '0');
        READ_LINE_PTR <= (others => '0');
        WRITE_LINE_PTR(    to_integer(unsigned(LINE_NUMBER))    ) <= i_WRITE;
        READ_LINE_PTR(     to_integer(unsigned(LINE_NUMBER))    ) <= i_READ;
    end process;
    
    CHOOSING_LINE_OUTPUT: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_DATA <= (others => '0');
            else
                o_DATA <= DATA_OUT( to_integer(unsigned(LINE_NUMBER))  );
            end if;
        end if;
    end process;

end architecture;