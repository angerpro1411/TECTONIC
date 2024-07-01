-- Alot of problems raise when we have multiplication with a matrix who contains 
-- negative number(signed number). So we need to change the factors to signed number
-- as after that library numeric_std will treat them as a signed mulplitication.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PIXEL_PROCESSING is
    generic(
        PIXEL_RESOLUTION : integer := 12
    );

	port(
		i_CLK : in std_logic;
		i_RSTn : in std_logic;
        
        --one pixel now is 12bit wide, so 3x3x12
		i_3x3_PIXEL : in std_logic_vector(107 downto 0);
		
        i_VALID : in std_logic;
		o_PROCESSED_PIXEL : out std_logic_vector(PIXEL_RESOLUTION-1 downto 0);
		o_VALID : out std_logic
	
	);
end entity;

architecture RTL of PIXEL_PROCESSING is


	--This function got input and output ain't the same size.
	--In 12 bits and out 13 bits.
	function to_SIGNED_KEEP_VALUE(
							OLD_DATA:std_logic_vector(11 downto 0)
	)
		return signed is
			variable NEW_DATA : signed(12 downto 0);
		begin
			NEW_DATA := signed('0' & OLD_DATA);
			return NEW_DATA;
	end function;


	type KERNEL_TYPE is array (0 to 8) of signed(2 downto 0);
	constant SOBEL_X : KERNEL_TYPE := ("001","000","111",
								"010","000","110",
								"001","000","111");
	constant SOBEL_Y : KERNEL_TYPE := ("111","110","111",
									"001","000","000",
									"001","010","001");

    --use to store multiplication result 12bit x 3bit worst case = 20 bits
	type MUL_RESULT_TYPE is array (0 to 8) of signed(14 downto 0);
	signal MUL_RESULT_X, MUL_RESULT_Y : MUL_RESULT_TYPE; 
	
	signal MUL_RESULT_VALID : std_logic;

	--Base on kernel, we can see 4 times maximum of 12bits worst case scenario,
	--2^12 = 4096, and 4 times it means more 2 bits value and 1 bit sign. In total 
	--15 bits.
	signal SUM_DATA_X_INT,SUM_DATA_Y_INT : signed(14 downto 0):= (others => '0');
	signal SUM_DATA_X,SUM_DATA_Y : signed(14 downto 0);
	signal SUM_RESULT_VALID : std_logic;	
	
	--Square of a signed n bit number only needs 2n-1 bit due to reduce one bit signed 
	signal SQUARE_SUM_X,SQUARE_SUM_Y : signed(29 downto 0);
	signal SQUARE_SUM_TOTAL_XY : signed(30 downto 0);
	
	
begin

	MUL_MATRIX_XY : process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			for I in MUL_RESULT_TYPE'range loop 	
				MUL_RESULT_X(I) <= SOBEL_X(I) * to_SIGNED_KEEP_VALUE(i_3x3_PIXEL((I+1)*8-1 downto I*8));
				MUL_RESULT_Y(I) <= SOBEL_Y(I) * to_SIGNED_KEEP_VALUE(i_3x3_PIXEL((I+1)*8-1 downto I*8));	
			end loop;
			MUL_RESULT_VALID <= i_VALID;
		end if;
	end process;

	SUM_MATRIX_XY: for I in MUL_RESULT_TYPE'range generate 
		SUM_DATA_X_INT <= SUM_DATA_X_INT + MUL_RESULT_X(I);
		SUM_DATA_Y_INT <= SUM_DATA_Y_INT + MUL_RESULT_Y(I);
	end generate;

	SUM_MATRIX_XY_REGISTER : process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			if i_RSTn = '0' then
				SUM_DATA_X <= (others => '0');
				SUM_DATA_Y <= (others => '0');
				SUM_RESULT_VALID <= '0';
			else
				SUM_DATA_X <= SUM_DATA_X_INT;
				SUM_DATA_Y <= SUM_DATA_Y_INT;
				SUM_RESULT_VALID <= MUL_RESULT_VALID;
			end if;
		end if;
	end process;

	SQUARE_SUM_PROCESS: process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			if i_RSTn = '0' then
				SQUARE_SUM_X <= (others => '0');
				SQUARE_SUM_Y <= (others => '0');
			else
				SQUARE_SUM_X <= SUM_DATA_X*SUM_DATA_X;
				SQUARE_SUM_Y <= SUM_DATA_Y*SUM_DATA_Y;
				o_VALID <= SUM_RESULT_VALID;
			end if;
		end if;
	end process;

	SQUARE_SUM_TOTAL_XY <= ('0' & SQUARE_SUM_X) + ('0' & SQUARE_SUM_Y);
		


end architecture;