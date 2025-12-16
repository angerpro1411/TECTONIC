----------------------------------------------------------------------------------
-- Company: ENSTA Bretagne
-- Engineer: Duy-Manh NGUYEN
-- 
-- Create Date: 07/16/2024 03:28:05 PM
-- Design Name: 
-- Module Name: RGB_2_GRAY - Behavioral
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

        --Done signal from RAM
        DONE_WRITE_COLOR,DONE_WRITE_GRAY : in std_logic;
		
		--ADDRESS PIXEL is 16 bits wide.
        --We have two ADDRESS, RD_ADDRESS to read address from color block ram, WR_ADDR to write address to gray block ram.
		RD_ADDRESS,WR_ADDRESS : out std_logic_vector(16 downto 0);
		i_READ : out std_logic;
		
		--Data is comprised of 3 pixel.
		o_DATA_fr_RAM : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);

        o_GRAY_OUT8 : out std_logic_vector(GRAY_SCALE-1 downto 0);
        o_GRAY_OUT_VALID : out std_logic;

        GRAY_MATRIX9_OUT : out std_logic_vector(GRAY_SCALE*9-1 downto 0)

		);
end entity;

architecture RTL of RGB_2_GRAY is


    --Function declaration
    function GET_LINE_ROW(
        LINE : integer range 0 to 240;
        ROW  : integer range 0 to 320
    ) return std_logic_vector is
        variable ADDRESS : std_logic_vector(16 downto 0);
    begin
        ADDRESS := std_logic_vector(to_unsigned(LINE*320+ROW,ADDRESS'length));


        return ADDRESS;
    end function GET_LINE_ROW; 


    --REG to get data from RAM and processing.
    --total 9 reg for storing 9 pixels.
    signal REG0,REG1,REG2,REG3,REG4,REG5,REG6,REG7,REG8 : unsigned(GRAY_SCALE-1 downto 0);

    signal TEMP_B,TEMP_G,TEMP_R,GRAY_OUT_8 : unsigned(GRAY_SCALE-1 downto 0);

    --DATApath valid signals.
    signal DATA_IN_VALID,GRAY_OUT_VALID : std_logic;

    signal i_READ_REG : std_logic;

    --Finish read state from color block ram. 
    signal DONE_RD_COLOR_BR : std_logic;

    --Loading state
    type STATE_t is (IDLE,READnPROCESS,DONE_PROCESSING);
    signal STATE,NEXT_STATE: STATE_t;

    --ADDRESS REGISTERS
    signal RDADDR_REG,WRADDR_REG,DELAY_RD1 : integer range 0 to 76800;

begin

    --Predefine color, register and output
    i_READ <= i_READ_REG;
    TEMP_B <= unsigned(o_DATA_fr_RAM(VGA_ZEDBOARD-1-0 downto VGA_ZEDBOARD-1-0-3) & "0000") ;
    TEMP_G <= unsigned(o_DATA_fr_RAM(VGA_ZEDBOARD-1-4 downto VGA_ZEDBOARD-1-4-3) & "0000") ;
    TEMP_R <= unsigned(o_DATA_fr_RAM(VGA_ZEDBOARD-1-8 downto VGA_ZEDBOARD-1-8-3) & "0000") ;
    
    o_GRAY_OUT8 <= std_logic_vector(GRAY_OUT_8);
    o_GRAY_OUT_VALID <= GRAY_OUT_VALID;
    GRAY_MATRIX9_OUT <= std_logic_vector(REG0 & REG1 & REG2 & REG3 & REG4 & REG5 & REG6 & REG7 & REG8);

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
	-- Maximum actually TEMP_B, TEMP_G and TEMP_R are 4 bits MSB each of 8 bits, not normal 4 bits.
	-- Pretend they are actual 8 bit, if we want to get 0.3, 0.59 and 0.11.
	-- For Red, we need actually sum of two shift right 2 and 5. It means we divine by 4 and divine by 32. And 1/4+1/32 = 9/32 ~=0.281.
	-- For Green, sum of two shift right 1 and 4. 1/2+1/16 = 9/16 ~= 0.562.
	-- For Blue, sum of two shift right 4 and 5. 1/16+1/32 = 3/32 ~= 0.093
    GET_SUM : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            GRAY_OUT_8 <= (shift_right(TEMP_B,4) + shift_right(TEMP_B,5)) + (shift_right(TEMP_G,1) + shift_right(TEMP_G,4)) + (shift_right(TEMP_R,2) + shift_right(TEMP_R,5));
            GRAY_OUT_VALID <= DATA_IN_VALID;
        end if;
    end process;



    --FSM to control data path.
    PUT_DATA_TO_MATRIX_FSM : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then    
                STATE <= IDLE;
            else
                STATE <= NEXT_STATE;
            end if;
        end if;
    end process;

    NEXT_STATE_PROC : process(STATE,DONE_WRITE_COLOR,DONE_RD_COLOR_BR)
    begin
        NEXT_STATE <= STATE;
        case STATE is
            when IDLE => 
                if DONE_WRITE_COLOR = '1' then
                    NEXT_STATE <= READnPROCESS;
                end if;
            when READnPROCESS => 
                if DONE_RD_COLOR_BR = '1' then
                    NEXT_STATE <= DONE_PROCESSING;
                end if;
            when DONE_PROCESSING =>
                NEXT_STATE <= IDLE;
            end case;            
    end process;

    --Assert 9 consecutive cycles of i_READ_REG to get 9 gray pixels.
    i_READ_CONTROL: process(STATE)
    begin
        case STATE is
            when IDLE =>
                i_READ_REG <= '0';
            when READnPROCESS => 
                i_READ_REG <= '1';
            when DONE_PROCESSING =>
                i_READ_REG <= '0';
        end case; 
    end process;

    --
    RD_ADDRESS_CONTROL: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then    
                RDADDR_REG <= 0;
            else
                if STATE = READnPROCESS then
                    RDADDR_REG <= RDADDR_REG + 1;
                    if RDADDR_REG = 76799 then 
                        RDADDR_REG <= 0;
                    end if;
                end if;
            end if;
        end if;
    end process;
    RD_ADDRESS <= std_logic_vector(to_unsigned(RDADDR_REG,RD_ADDRESS'length));
    DONE_RD_COLOR_BR <= '1' when RDADDR_REG = 76799 else '0';

    --Gray data available after two cycles of read command.
    --This process just delay wr_address two cycles compare to rd_address
    WR_ADDRESS_CONTROL: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then    
                WRADDR_REG <= 0;
            else
                DELAY_RD1 <= RDADDR_REG;
                WRADDR_REG <= DELAY_RD1;
            end if;
        end if;        
    end process;
    WR_ADDRESS <= std_logic_vector(to_unsigned(WRADDR_REG,WR_ADDRESS'length));        

end architecture;