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
        DONE_WRITE : in std_logic;
		
		--ADDRESS PIXEL is 19 bits wide.
		ADDRESS : out std_logic_vector(16 downto 0);
		i_READ : out std_logic;
		
		--Data is comprised of 3 pixel.
		o_DATA_fr_RAM : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);

        GRAY_MATRIX9_OUT : out std_logic_vector(GRAY_SCALE*9 downto 0)

		);
end entity;

architecture RTL of RGB_2_GRAY is
    
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
    signal DATA_IN_VALID,WEIGHT_VALID,GRAY_OUT_VALID : std_logic;

    signal i_READ_REG : std_logic;

    --Loading state
    type STATE_t is (IDLE,READ0,READ1,READ2,READ3,READ4,READ5,READ6,READ7,READ8,DONE_MATRIX);
    signal STATE,NEXT_STATE: STATE_t;

    --Control 8-bits gray data into registers
    signal WAIT_DATA_IN_VALID, WAIT_WEIGHT_VALID, WAIT_GRAY_OUT_VALID: std_logic;
    signal REG0_DONE, REG1_DONE, REG2_DONE, REG3_DONE, REG4_DONE, REG5_DONE, REG6_DONE, REG7_DONE, REG8_DONE: std_logic;

begin
    --Predefine color, register and output
    i_READ <= i_READ_REG;
    TEMP_B <= unsigned(o_DATA_fr_RAM(VGA_ZEDBOARD-1-0 downto VGA_ZEDBOARD-1-0-3) & "0000") ;
    TEMP_G <= unsigned(o_DATA_fr_RAM(VGA_ZEDBOARD-1-4 downto VGA_ZEDBOARD-1-4-3) & "0000") ;
    TEMP_R <= unsigned(o_DATA_fr_RAM(VGA_ZEDBOARD-1-8 downto VGA_ZEDBOARD-1-8-3) & "0000") ;											
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

    NEXT_STATE_PROC : process(STATE,DONE_WRITE)
    begin
        NEXT_STATE <= STATE;
        case STATE is
            when IDLE => 
                if DONE_WRITE = '1' then
                    NEXT_STATE <= READ0;
                end if;
            when READ0 => 
                NEXT_STATE <= READ1;
            when READ1 => 
                NEXT_STATE <= READ2;
            when READ2 => 
                NEXT_STATE <= READ3;
            when READ3 => 
                NEXT_STATE <= READ4;
            when READ4 => 
                NEXT_STATE <= READ5;
            when READ5 => 
                NEXT_STATE <= READ6;
            when READ6 => 
                NEXT_STATE <= READ7;
            when READ7 => 
                NEXT_STATE <= READ8;
            when READ8 =>
                NEXT_STATE <= DONE_MATRIX;
            when DONE_MATRIX =>
                NEXT_STATE <= READ0;
            end case;            
    end process;

    --Assert 9 consecutive cycles of i_READ_REG to get 9 gray pixels.
    i_READ_CONTROL: process(STATE)
    begin
        case STATE is
            when IDLE =>
                i_READ_REG <= '0';
            when READ0 => 
                i_READ_REG <= '1';
            when READ1 => 
                i_READ_REG <= '1';
            when READ2 => 
                i_READ_REG <= '1';
            when READ3 => 
                i_READ_REG <= '1';
            when READ4 => 
                i_READ_REG <= '1';
            when READ5 => 
                i_READ_REG <= '1';
            when READ6 => 
                i_READ_REG <= '1';
            when READ7 => 
                i_READ_REG <= '1';
            when READ8 =>
                i_READ_REG <= '1';
            when DONE_MATRIX =>
                i_READ_REG <= '0';
        end case; 
    end process;

    PUT_VALID_DATA_IN_MATRIX: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                REG0 <= (others => '0');    
                REG1 <= (others => '0');
                REG2 <= (others => '0');
                REG3 <= (others => '0');
                REG4 <= (others => '0');
                REG5 <= (others => '0');
                REG6 <= (others => '0');
                REG7 <= (others => '0');
                REG8 <= (others => '0');
                WAIT_DATA_IN_VALID <= '0';
                WAIT_WEIGHT_VALID <= '0';
                WAIT_GRAY_OUT_VALID <= '0';
                REG0_DONE <= '0';
                REG1_DONE <= '0';
                REG2_DONE <= '0';
                REG3_DONE <= '0';
                REG4_DONE <= '0';
                REG5_DONE <= '0';
                REG6_DONE <= '0';
                REG7_DONE <= '0';
                REG8_DONE <= '0';
            else
                if STATE = READ0 then --First signal to inform data will come after 3 cycles
                    WAIT_DATA_IN_VALID <= '1';
                    WAIT_WEIGHT_VALID <= '0';
                    WAIT_GRAY_OUT_VALID <= '0';
                elsif WAIT_DATA_IN_VALID = '1' then
                    WAIT_WEIGHT_VALID <= '1';
                    WAIT_DATA_IN_VALID <= '0';
                    WAIT_GRAY_OUT_VALID <= '0';
                elsif WAIT_WEIGHT_VALID = '1' then
                    WAIT_GRAY_OUT_VALID <= '1';
                    WAIT_DATA_IN_VALID <= '0';
                    WAIT_WEIGHT_VALID <= '0';
                elsif WAIT_GRAY_OUT_VALID = '1' then
                    REG0_DONE <= '1';
                    WAIT_GRAY_OUT_VALID <= '0';
                    REG0 <= GRAY_OUT_8;
                elsif REG0_DONE = '1' then
                    REG1_DONE <= '1';
                    REG0_DONE <= '0';
                    REG1 <= GRAY_OUT_8;
                elsif REG1_DONE = '1' then
                    REG2_DONE <= '1';
                    REG1_DONE <= '0';
                    REG2 <= GRAY_OUT_8; 
                elsif REG2_DONE = '1' then
                    REG3_DONE <= '1';
                    REG2_DONE <= '0';
                    REG3 <= GRAY_OUT_8; 
                elsif REG3_DONE = '1' then
                    REG4_DONE <= '1';
                    REG3_DONE <= '0';
                    REG4 <= GRAY_OUT_8; 
                elsif REG4_DONE = '1' then
                    REG5_DONE <= '1';
                    REG4_DONE <= '0';
                    REG5 <= GRAY_OUT_8; 
                elsif REG5_DONE = '1' then
                    REG6_DONE <= '1';
                    REG5_DONE <= '0';
                    REG6 <= GRAY_OUT_8; 
                elsif REG6_DONE = '1' then
                    REG7_DONE <= '1';
                    REG6_DONE <= '0';
                    REG7 <= GRAY_OUT_8; 
                elsif REG7_DONE = '1' then
                    REG8_DONE <= '1';
                    REG7_DONE <= '0';
                    REG8 <= GRAY_OUT_8;
                else
                    REG8_DONE <= '0';                                                                                                                                                                 
                end if;
            end if;
        end if;
    end process;

end architecture;