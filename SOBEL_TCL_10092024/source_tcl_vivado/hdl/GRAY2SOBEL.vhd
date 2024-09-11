library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity GRAY2SOBEL is
    port(
        
        THRESHOLD : in std_logic_vector(17 downto 0);
        i_CLK,i_RSTn : in std_logic;

        --Control signal from processor
        START_RDGRAYBRAM : in std_logic;

        --Read data from Gray BRAM
        i_DATA_FR_GRAYBRAM : in std_logic_vector(7 downto 0);
        o_ADDRESS_2GRAYBRAM : out std_logic_vector(16 downto 0);
        o_READ_GRAYBRAM : out std_logic;

        --These signels use to write data into sobel bram.
        o_ADDRESS_2SOBELBRAM : out std_logic_vector(16 downto 0);
        o_WRITE_SOBELBRAM : out std_logic;
        o_DATA_2SOBELBRAM : out std_logic_vector(7 downto 0);

        --This signal informs to processor that sobel operation is done
        DONE_IMAGE: in std_logic;
        DONE_PROCESSING_SOBEL : out std_logic
    );
end entity;

architecture RTL of GRAY2SOBEL is

    signal o_ADDRESS_REG,o_ADDRESS_NX : integer range 0 to 76800;

    --9 regs for store 3x3 matrix
    type MY_KERNEL is array (0 to 8) of signed(8 downto 0);
    signal KERNEL : MY_KERNEL := (others => (others => '0'));
    
    type MY_KERNEL_GRADIENT is array (0 to 8) of signed(2 downto 0);
    signal x_KERNEL : MY_KERNEL_GRADIENT := ("001","000","111",
                                             "010","000","110",
                                             "001","000","111");
    signal y_KERNEL : MY_KERNEL_GRADIENT := ("001","010","001",
                                             "000","000","000",
                                             "111","110","111");
    
    --Maximum value is 2 or -2, product maximum of 255x2 is 9 bit-wide,
    -- with 1 bit sign, so maximumof product is 10 bit.
    type MUL_KERNEL_GRADIENT is array (0 to 8) of signed(9 downto 0);
    signal x_MULDATA,y_MULDATA : MUL_KERNEL_GRADIENT;

    --Maximun value is 255x4 means 10 bits wide, +1 sign-bit = 11 bit in total
    signal x_SUM,x_SUM_COMB,y_SUM,y_SUM_COMB: signed(10 downto 0);

    --Square value
    signal x_SUM_SQUARE,y_SUM_SQUARE : signed(21 downto 0);
    signal SUM_SQUARE : signed(22 downto 0);

    --Pipeline valid signals
    signal MULDATA_VALID, SUMDATA_VALID, SQUARE_VALID, o_DATA_VALID: std_logic;
    signal DONE_MUL_DATA : std_logic;
    --Signals to read data from gray bram
    signal RD_REG,RD_NX : std_logic;
    signal DATANB_REG, DATANB_NX : integer range 0 to 10;
    signal RD_PTR : integer range 0 to 76800;
    signal DONE_READ_ONE_KERNEL : std_logic;

    type STATE_t is (IDLE,READ_DATA,DONE_KERNEL_2_CAL,FINISH_PROCESSING);
    signal STATE_REG,NX_STATE : STATE_t;

    --Put data into KERNEL
    signal DATA_AVAILABLE : std_logic;
    signal KERNEL_NBER_CNT : integer range 0 to 9;
    signal KERNEL_DONE : std_logic;

    --address to SobelBram
    signal o_ADDRESS_2SOBELBRAM_REG : unsigned(16 downto 0);
   
    --signal DONE_PROCESSING_SOBEL
    signal DONE_PROCESSING_SOBEL_SIGN : std_logic;
    
    begin
-----------------------------Get DATA part---------------------------------------
        o_ADDRESS_2GRAYBRAM <= std_logic_vector(to_unsigned(o_ADDRESS_REG,17));
        o_READ_GRAYBRAM <= RD_REG;

        STATE_REGISTER : process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                if i_RSTn = '0' then
                    STATE_REG <= IDLE;
                    RD_REG <= '0';
                    DATANB_REG <= 0;
                    o_ADDRESS_REG <= 0;
                else
                    STATE_REG <= NX_STATE;
                    RD_REG <= RD_NX;
                    DATANB_REG <= DATANB_NX;
                    o_ADDRESS_REG <= o_ADDRESS_NX;
                end if;
            end if;
        end process;

        RD_PTR_PROC : process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                if i_RSTn = '0' then
                    RD_PTR <= 0;
                elsif(DONE_READ_ONE_KERNEL = '1') then
                    RD_PTR <= RD_PTR + 1;
                    if RD_PTR = 76158 then
                        RD_PTR <= 0;
                    end if;
                end if;
            end if;          
        end process;

        STATE_CONTROL : process(STATE_REG,START_RDGRAYBRAM,DATANB_REG,RD_PTR
                        ,DONE_MUL_DATA,RD_REG,o_ADDRESS_REG,DONE_PROCESSING_SOBEL_SIGN)
        begin
            NX_STATE <= STATE_REG;
            DONE_READ_ONE_KERNEL <= '0';
            DATANB_NX <= DATANB_REG;
            RD_NX <= RD_REG;
            o_ADDRESS_NX <= o_ADDRESS_REG;
            case STATE_REG is
                when IDLE =>
                    DATANB_NX <= 0;
                    RD_NX <= '0';
                    o_ADDRESS_NX <= 0;
                    DONE_READ_ONE_KERNEL <= '0';
                    if (START_RDGRAYBRAM = '1') then
                        NX_STATE <= READ_DATA;
                    end if;
                when READ_DATA =>
                    RD_NX <= '1';
                    DATANB_NX <= DATANB_REG + 1;
                    case DATANB_REG is
                        when 0 =>
                            o_ADDRESS_NX <= RD_PTR + 320*0 + 0;
                        when 1 =>
                            o_ADDRESS_NX <= RD_PTR + 320*0 + 1;
                        when 2 =>
                            o_ADDRESS_NX <= RD_PTR + 320*0 + 2;
                        when 3 =>
                            o_ADDRESS_NX <= RD_PTR + 320*1 + 0;
                        when 4 =>
                            o_ADDRESS_NX <= RD_PTR + 320*1 + 1;
                        when 5 =>
                            o_ADDRESS_NX <= RD_PTR + 320*1 + 2;
                        when 6 =>
                            o_ADDRESS_NX <= RD_PTR + 320*2 + 0;
                        when 7 =>
                            o_ADDRESS_NX <= RD_PTR + 320*2 + 1;
                        when 8 =>
                            o_ADDRESS_NX <= RD_PTR + 320*2 + 2;
                        when 9 =>
                            --Fulfill data to kernel, next to other state
                            NX_STATE <= DONE_KERNEL_2_CAL;
                            DATANB_NX <= 0;
                            DONE_READ_ONE_KERNEL <= '1';
                            RD_NX <= '0';
                        when others =>
                            o_ADDRESS_NX <= 0;
                    end case;
                when DONE_KERNEL_2_CAL =>
                    DATANB_NX <= 0;
                    DONE_READ_ONE_KERNEL <= '0';
                    if (DONE_MUL_DATA = '1' and RD_PTR = 76158) then
                        NX_STATE <= FINISH_PROCESSING;
                    elsif DONE_MUL_DATA = '1' and RD_PTR < 76158 then
                        NX_STATE <= READ_DATA;
                    end if;
                when FINISH_PROCESSING =>
                    if DONE_PROCESSING_SOBEL_SIGN = '1' then
                        NX_STATE <= IDLE;
                    end if;
            end case;
        end process;

        --After one cycle clock of RD_REG, DATA will be avaible
        GET_DATA_2_KERNEL_CONTROL : process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                DATA_AVAILABLE <= RD_REG;
            end if;
        end process;

--        WRITING_DATA_2_KERNEL : process(DATA_AVAILABLE,KERNEL_NBER_CNT,i_DATA_FR_GRAYBRAM)
--        begin    
--            if DATA_AVAILABLE = '1' then
--                case KERNEL_NBER_CNT is
--                    when 0 =>
--                        KERNEL(0) <= signed('0' & i_DATA_FR_GRAYBRAM);
--                    when 1 =>
--                        KERNEL(1) <= signed('0' & i_DATA_FR_GRAYBRAM);
--                    when 2 =>
--                        KERNEL(2) <= signed('0' & i_DATA_FR_GRAYBRAM);
--                    when 3 =>
--                        KERNEL(3) <= signed('0' & i_DATA_FR_GRAYBRAM);
--                    when 4 =>
--                        KERNEL(4) <= signed('0' & i_DATA_FR_GRAYBRAM);
--                    when 5 =>
--                        KERNEL(5) <= signed('0' & i_DATA_FR_GRAYBRAM);
--                    when 6 =>
--                        KERNEL(6) <= signed('0' & i_DATA_FR_GRAYBRAM);
--                    when 7 =>
--                        KERNEL(7) <= signed('0' & i_DATA_FR_GRAYBRAM);
--                    when 8 =>
--                        KERNEL(8) <= signed('0' & i_DATA_FR_GRAYBRAM);
--                    when others =>
--                        for I in 0 to 8 loop
--                            KERNEL(i) <= (others => '0');
--                        end loop;
--                end case;
--            end if;
--        end process;

        WRITING_DATA_2_KERNEL : process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                if i_RSTn = '0' then
                    for I in 0 to 8 loop
                        KERNEL(i) <= (others => '0');
                    end loop;                        
                elsif DATA_AVAILABLE = '1' then
                    case KERNEL_NBER_CNT is
                        when 0 =>
                            KERNEL(0) <= signed('0' & i_DATA_FR_GRAYBRAM);
                        when 1 =>
                            KERNEL(1) <= signed('0' & i_DATA_FR_GRAYBRAM);
                        when 2 =>
                            KERNEL(2) <= signed('0' & i_DATA_FR_GRAYBRAM);
                        when 3 =>
                            KERNEL(3) <= signed('0' & i_DATA_FR_GRAYBRAM);
                        when 4 =>
                            KERNEL(4) <= signed('0' & i_DATA_FR_GRAYBRAM);
                        when 5 =>
                            KERNEL(5) <= signed('0' & i_DATA_FR_GRAYBRAM);
                        when 6 =>
                            KERNEL(6) <= signed('0' & i_DATA_FR_GRAYBRAM);
                        when 7 =>
                            KERNEL(7) <= signed('0' & i_DATA_FR_GRAYBRAM);
                        when 8 =>
                            KERNEL(8) <= signed('0' & i_DATA_FR_GRAYBRAM);
                        when others =>
                            for I in 0 to 8 loop
                                KERNEL(i) <= (others => '0');
                            end loop;
                    end case;
                end if;
            end if;
        end process;        
        
        KERNEL_NBER_CNT_PROC : process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                if i_RSTn = '0' then
                    KERNEL_NBER_CNT <= 0;
                    KERNEL_DONE <= '0';
                elsif DATA_AVAILABLE = '1' then
                    KERNEL_NBER_CNT <= KERNEL_NBER_CNT + 1;
                    KERNEL_DONE <= '0';
                    if KERNEL_NBER_CNT = 8 then
                        KERNEL_NBER_CNT <= 0;
                        KERNEL_DONE <= '1';
                    end if;
                else
                    KERNEL_DONE <= '0';
                end if;
            end if;
        end process;
----------------------------------------------------------------------------------

-----------------------------Process DATA part---------------------------------------
        MUL_PROCESS: process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                if (KERNEL_DONE = '1') then
                    for I in 0 to 8 loop
                        x_MULDATA(I) <= RESIZE(x_KERNEL(I) * KERNEL(I),10);
                        y_MULDATA(I) <= RESIZE(y_KERNEL(I) * KERNEL(I),10);
                    end loop;
                end if;
                MULDATA_VALID <= KERNEL_DONE;
            end if;
        end process;
        DONE_MUL_DATA <= MULDATA_VALID;

        SUM_COMBINATION:process(x_MULDATA,y_MULDATA)
            variable x_SUM_TEMP,y_SUM_TEMP : signed(10 downto 0);
        begin
            x_SUM_TEMP := (others => '0');
            y_SUM_TEMP := (others => '0');
            for I in 0 to 8 loop
                x_SUM_TEMP := RESIZE(x_SUM_TEMP + x_MULDATA(I),11);
                y_SUM_TEMP := RESIZE(y_SUM_TEMP + y_MULDATA(I),11);
            end loop;
            x_SUM_COMB <= x_SUM_TEMP;
            y_SUM_COMB <= y_SUM_TEMP;    
        end process;
        

        SUM_PROCESS:process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                x_SUM <= x_SUM_COMB;
                y_SUM <= y_SUM_COMB;
                SUMDATA_VALID <= MULDATA_VALID;
            end if;
        end process;

        SQUARE_PROCESS: process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                x_SUM_SQUARE <= x_SUM*x_SUM;
                y_SUM_SQUARE <= y_SUM*y_SUM;
                SQUARE_VALID <= SUMDATA_VALID;
            end if;
        end process;        

        SUM_SQUARE <= ('0' & x_SUM_SQUARE) + ('0' & y_SUM_SQUARE);

        --Normally, after find that sum of 2 square, we need to find the squareroot
        --of it, and make a comparison between squareroot and a threshold,
        --if squareroot > threshold => output pixel = white, else = black.
        --But finding squareroot cost us a lot of cycles. So instead of comparison
        --squareroot and threshold, we compare (squareroot)^2 and (threshold)^2.
        --Then what is the best threshold that we need to choose.

        OUTPUT_PROCESS: process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                if SUM_SQUARE > signed('0' & THRESHOLD) then
                    o_DATA_2SOBELBRAM <= x"FF";
                else
                    o_DATA_2SOBELBRAM <= x"00";
                end if;
                o_DATA_VALID <= SQUARE_VALID;
            end if;
        end process;
        o_WRITE_SOBELBRAM <= o_DATA_VALID;
-------------------------------------------------------------------------------------

-----------------------------Control SENDING DATA part---------------------------------------
--There are 3 signals we need to control to send data: input data, addr and write signal--
--input data and addr signal get control from "OUTPUT_PROCESS", now we need control address
        ADDR_2SOBELBRAM_CONTROL: process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                if i_RSTn = '0' then 
                    o_ADDRESS_2SOBELBRAM_REG <= (others => '0');
                elsif  o_DATA_VALID = '1' then
                    o_ADDRESS_2SOBELBRAM_REG <= o_ADDRESS_2SOBELBRAM_REG + 1;
                    if STATE_REG = FINISH_PROCESSING then
                        o_ADDRESS_2SOBELBRAM_REG <= (others => '0');
                    end if;
                end if;
            end if;
        end process;

        o_ADDRESS_2SOBELBRAM <= std_logic_vector(o_ADDRESS_2SOBELBRAM_REG);
---------------------------------------------------------------------------------------------

--When is Sobel done? The last writing to sobel bram and no more processing other data(state : Finish_processing)
        SOBEL_DONE_PROCESS: process(i_CLK)
        begin
            if rising_edge(i_CLK) then
                if i_RSTn = '0' then 
                    DONE_PROCESSING_SOBEL_SIGN <= '0';
                elsif o_DATA_VALID = '1' and STATE_REG = FINISH_PROCESSING then
                    DONE_PROCESSING_SOBEL_SIGN <= '1';
                elsif STATE_REG /= FINISH_PROCESSING then
                    DONE_PROCESSING_SOBEL_SIGN <= '0';
                else 
                    DONE_PROCESSING_SOBEL_SIGN <= '0';
                end if;
            end if;
        end process;
        DONE_PROCESSING_SOBEL <= DONE_PROCESSING_SOBEL_SIGN;

end architecture;