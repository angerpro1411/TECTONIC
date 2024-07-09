library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RGB_2_GRAY is
	generic(
        --Gray bit number of each pixel
        GRAY_SCALE : integer := 8;

		--VGA bit number of each pixel
		VGA_ZEDBOARD : integer := 12
	);
	port(
		i_CLK : in std_logic;
		i_RSTn : in std_logic;
		
		--ADDRESS PIXEL is 19 bits wide.
		ADDRESS : out std_logic_vector(16 downto 0);
		i_READ : out std_logic;
		
		--Data is comprised of 3 pixel.
		o_DATA_fr_RAM : in std_logic_vector(VGA_ZEDBOARD-1 downto 0)
		);
end entity;

architecture RTL of RGB_2_GRAY is
    
    --REG to get data from RAM and processing.
    --total 9 reg for storing 9 pixels.
    signal REG0,REG1,REG2,REG3,REG4,REG5,REG6,REG7,REG8 : unsigned(GRAY_SCALE-1 downto 0);

    signal TEMP_B,TEMP_G,TEMP_R : unsigned(GRAY_SCALE-1 downto 0);

    signal DATA_IN_VALID : std_logic;

    signal i_READ_REG : std_logic;

begin

    i_READ <= i_READ_REG;

    --After i_READ one cycle clock, we will have valid data from port "o_DATA_fr_RAM"
    DATA_VALID_CONTROL : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                DATA_IN_VALID <= '0';
            else
                if i_READ_REG = '1' then
                    DATA_IN_VALID <= '1';
                else
                    DATA_IN_VALID <= '0';
                end if;
            end if;
        end if;
    end process;

    -- Gray pixel = 0.3*Red pixel + 0.59*Green pixel + 0.11*Blue pixel
	-- 12 bit value is split into B,G and R components - 4 bit each
	-- and multiplied with their respective weights.
	-- Maximum 4bits is 16. 16*0.3 = 4.8~5, 16*0.59 = 9,44~9 and 16*0.11 = 1.76~2
    GET_WEIGHTS : process(i_CLK)
    begin
        if rising_edge(i_CLK) then 
            TEMP_B <= unsigned(o_DATA_fr_RAM(VGA_ZEDBOARD-1-0 downto VGA_ZEDBOARD-1-0-3))  * "0101";
            TEMP_G <= unsigned(o_DATA_fr_RAM(VGA_ZEDBOARD-1-4 downto VGA_ZEDBOARD-1-4-3))  * "1001";
            TEMP_R <= unsigned(o_DATA_fr_RAM(VGA_ZEDBOARD-1-8 downto VGA_ZEDBOARD-1-8-3))  * "0010";
            WEIGHT_VALID <= DATA_IN_VALID;
        end if;  
    end process;
    
    GET_SUM : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            GRAY_OUT_8 <= TEMP_B + TEMP_G + TEMP_R;
            GRAY_OUT_VALID <= WEIGHTP_VALID;
        end if;
    end process;

    --Concern about change this process, we can put the data into reg asap instead of delay 1 clock.
    PUT_TO_MATRIX : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then    
                REG0 <= (others => '0');
            elsif GRAY_OUT_VALID = '1' then
                REG0 <= GRAY_OUT_8;
            end if;
        end if;
    end process;

end architecture;