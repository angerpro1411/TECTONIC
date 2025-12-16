library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PROCESS_11x11 is
    generic(
        -- 80% of 121 pixels
        THRESHOLD_TOTAL_MASK : integer := 96
    );    
    port(
        i_CLK               : in std_logic;
        i_RSTn              : in std_logic;
        
        --Input from MASK BUFFERS
        --READ BUFFERs are designed as first word fall through, so DATA is always available at GATE without
        --valid signal needed.
        i_11DATA_BUFF0      : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF1      : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF2      : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF3      : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF4      : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF5      : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF6      : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF7      : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF8      : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF9      : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF10     : in std_logic_vector(10 downto 0);
        i_11DATA_BUFF11     : in std_logic_vector(10 downto 0);

        --Signal to interact with BIG STATE MACHINE
        i_WHICH_STATE : in std_logic_vector(2 downto 0);
        o_FINISH_PROCESS_MASK_ROW : out std_logic;
        o_FINISH_CHANGE_1ROW_RGB  : out std_logic;


        -- Signal to address where the read pointer is from 0 to 319
        o_ADDR_RD_PTR       : out std_logic_vector(8 downto 0);

        -- Signal to address where the processing pointer is from 0 to 309
        o_ADDR_PROC_PTR     : out std_logic_vector(8 downto 0);

        -- Signal to whiten the kernel
        o_WHITEN_KERNEL       : out std_logic;
        
        --Valid data now uses for 12 outputs, choose 11 out of 12
        o_WHITEN_DATA_VALID          : out std_logic_vector(11 downto 0);


        --Signal to command read mask buffer
        o_READ              : out std_logic
    );
end entity;

architecture RTL of PROCESS_11x11 is

    signal DATA_121_MASK           : std_logic_vector(120 downto 0);
    signal s_o_READ_REG            : std_logic;
    signal s_o_WHITEN_DATA_VALID_REG        : std_logic;
    signal MASK_CENTER             : std_logic;
    
    constant CONST : unsigned := "011111111111" ;


    signal s_ROW_PTR : integer range 0 to 11 ;


    -- Read signal delay1. 
    signal s_DATA_ARRIVE     : std_logic;


    --11/12 signals who are chose to process
    type s_12BUFF is array (0 to 11) of std_logic_vector(10 downto 0);
    signal s_BUFF_IN : s_12BUFF;
    
    --max is 121 elements, so 7 bits 
    signal CNT_UPPER_THRESHOLD     : unsigned(6 downto 0);

    -- sum of 60 bits and sum of 61 bits
    signal SUM60,SUM61             : unsigned(5 downto 0);

    --signals for pipeline adding 
    signal VALID_2_SUMs            : std_logic;
    signal VALID_TOTAL_SUM         : std_logic;

    
    -- This signal uses to check if the kernel has passed condition to check the sum?
    signal PASS_CHECK_KERNEL,PASS_CHECK_KERNEL_DELAY1 : std_logic;

    
    -- Pointing where the Read pointer is
    signal s_o_ADDR_RD_PTR : unsigned(8 downto 0);
    signal s_o_ADDR_PROC_PTR : unsigned(8 downto 0);

    -- PIPELINING CHECK ILDE\
    signal s_PASS_CHECK_KERNEL_VALID : std_logic;

    --signal FINISH READING MASK
    signal s_FINISH_PROCESS_MASK_ROW : std_logic;

    --Small pop count for 60 bits and 61 bits add, so maximum is 64, 6 bits long
    function CNT_ONE_IN121(vec : std_logic_vector) return unsigned is
        variable CNT : unsigned(5 downto 0):=(others => '0');
    begin
        for i IN vec'range loop
            if vec(i) = '1' then
                CNT := CNT+1;
            end if;
        end loop;
        return CNT;
    end function;

begin

    s_BUFF_IN(0) <= i_11DATA_BUFF0;
    s_BUFF_IN(1) <= i_11DATA_BUFF1;
    s_BUFF_IN(2) <= i_11DATA_BUFF2;
    s_BUFF_IN(3) <= i_11DATA_BUFF3;
    s_BUFF_IN(4) <= i_11DATA_BUFF4;
    s_BUFF_IN(5) <= i_11DATA_BUFF5;
    s_BUFF_IN(6) <= i_11DATA_BUFF6;
    s_BUFF_IN(7) <= i_11DATA_BUFF7;
    s_BUFF_IN(8) <= i_11DATA_BUFF8;
    s_BUFF_IN(9) <= i_11DATA_BUFF9;
    s_BUFF_IN(10) <= i_11DATA_BUFF10;
    s_BUFF_IN(11) <= i_11DATA_BUFF11;

    
    WHICH_ROW_ARE_WE_PROCESSING: process(I_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_ROW_PTR <= 0;
            else
                if s_o_ADDR_RD_PTR = 309 and s_o_READ_REG = '1' then
                    if s_ROW_PTR = 11 then
                        s_ROW_PTR <= 0;
                    else
                        s_ROW_PTR <= s_ROW_PTR + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;  



    DISTRIBUTION_11out12 : process(i_CLK)   
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                DATA_121_MASK <=  s_BUFF_IN(0) & s_BUFF_IN(1) & s_BUFF_IN(2) & s_BUFF_IN(3)
                        & s_BUFF_IN(4) & s_BUFF_IN(5) & s_BUFF_IN(6) & s_BUFF_IN(7)
                        & s_BUFF_IN(8) & s_BUFF_IN(9) & s_BUFF_IN(10);
            else
                DATA_121_MASK <=  s_BUFF_IN((0+s_ROW_PTR) mod 12) & s_BUFF_IN((1+s_ROW_PTR) mod 12) & s_BUFF_IN((2+s_ROW_PTR) mod 12) & 
                                  s_BUFF_IN((3+s_ROW_PTR) mod 12) & s_BUFF_IN((4+s_ROW_PTR) mod 12) & s_BUFF_IN((5+s_ROW_PTR) mod 12) &
                                  s_BUFF_IN((6+s_ROW_PTR) mod 12) & s_BUFF_IN((7+s_ROW_PTR) mod 12) & s_BUFF_IN((8+s_ROW_PTR) mod 12) &
                                  s_BUFF_IN((9+s_ROW_PTR) mod 12) & s_BUFF_IN((10+s_ROW_PTR) mod 12);
            end if;
        end if;
    end process;                

    MASK_CENTER <= DATA_121_MASK(60);

    o_READ <= s_o_READ_REG;
    o_ADDR_RD_PTR <= std_logic_vector(s_o_ADDR_RD_PTR);






    -- Due to one distributor between actual 11 output processing operator and 12 inputs buffer.
    -- So I create an register to avoid big delay, close to timing closure.
    
  


    --Condition 1 :  Calculate the sum of all mask in kernel

    PIPELINING_SUM_VALID : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_DATA_ARRIVE <= '0';
                VALID_2_SUMs <= '0';
                VALID_TOTAL_SUM <= '0';
                s_o_WHITEN_DATA_VALID_REG <= '0';                
            else 
                s_DATA_ARRIVE <=  s_o_READ_REG;
                VALID_2_SUMs <= s_DATA_ARRIVE;
                VALID_TOTAL_SUM <= VALID_2_SUMs;  
                s_o_WHITEN_DATA_VALID_REG <= VALID_TOTAL_SUM;                              
            end if;
        end if;
    end process;  

    TWO_FIRST_ADD : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                SUM60 <= (others => '0');
                SUM61 <= (others => '0');
            else
                if s_DATA_ARRIVE = '1' then
                    SUM60 <= CNT_ONE_IN121(DATA_121_MASK(59 downto 0));
                    SUM61 <= CNT_ONE_IN121(DATA_121_MASK(120 downto 60));
                end if;
            end if;
        end if;     
    end process;

    LAST_STEP_ADD : process(i_CLK)
    begin
        if rising_edge(i_CLK) then 
            if i_RSTn = '0' then
                CNT_UPPER_THRESHOLD <= (others =>'0');
            else
                if VALID_2_SUMs = '1' then
                    CNT_UPPER_THRESHOLD <= ('0' & SUM60) + ('0' & SUM61);
                end if;
            end if;
        end if;
    end process;


    --Condition 2: check center of kernel

    PIPELINING_KERNEL_VALID : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_PASS_CHECK_KERNEL_VALID <= '0';
            else 
                s_PASS_CHECK_KERNEL_VALID <= s_DATA_ARRIVE;      
            end if;
        end if;
    end process;      

    CHECK_CENTER_MASK : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                PASS_CHECK_KERNEL <= '0';
            else
                if s_DATA_ARRIVE = '1' then
                    if MASK_CENTER = '1' then
                        PASS_CHECK_KERNEL <= '1';
                    else
                        PASS_CHECK_KERNEL <= '0';
                    end if;
                else
                    PASS_CHECK_KERNEL <= '0';
                end if;
            end if;
        end if;
    end process;

    PASS_CHECK_KERNEL_DELAY1_PROC : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                PASS_CHECK_KERNEL_DELAY1 <= '0';
            else
                PASS_CHECK_KERNEL_DELAY1 <= PASS_CHECK_KERNEL;
            end if;
        end if;
    end process;

    CHECK_PASS_ALL_CONDITIONS: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_WHITEN_KERNEL <= '0';
            else
                if VALID_TOTAL_SUM = '1' then
                    if CNT_UPPER_THRESHOLD >= THRESHOLD_TOTAL_MASK and PASS_CHECK_KERNEL_DELAY1 = '1' then
                        o_WHITEN_KERNEL <= '1';
                    else
                        o_WHITEN_KERNEL <= '0';
                    end if;
                else 
                    o_WHITEN_KERNEL <= '0';
                end if;
            end if;
        end if;
    end process;

    -- --Delay one cycle with s_o_WHITEN_KERNEL_EARLY1 for timing accurate
    -- WHITEN_KERNEL_CMD_PROC : process(i_CLK)
    -- begin
    --     if rising_edge(i_CLK) then
    --         if i_RSTn = '0' then
    --             o_WHITEN_KERNEL <= '0';
    --         else 
    --             o_WHITEN_KERNEL <= s_o_WHITEN_KERNEL_EARLY1;
    --         end if;
    --     end if;
    -- end process;
    
    -- We have 11 out of 12 RGB buffers need to clear after processing,
    -- so we need a distributor to tell which one should be clear.
    -- These address and cmd signal will be read by 12 RGB buffers(broadcast) but only 11 output valid data will be asserted.
    OUTPUT_WHITEN_DISTRIBUTION : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_WHITEN_DATA_VALID <= (others => '0');
            else
                if VALID_TOTAL_SUM = '1' then
                    o_WHITEN_DATA_VALID <=  std_logic_vector(ROTATE_LEFT(CONST, s_ROW_PTR));
                else
                    o_WHITEN_DATA_VALID <= (others => '0');
                end if;
            end if;
        end if;
    end process;


    --We have 2 counters to count 2 different addresses, first address is address to
    --let us know which address we are reading from called "s_o_ADDR_RD_PTR",
    --second address is whiten address, address for whiten purpose called "s_o_ADDR_PROC_PTR"


    --Processing pointer will increase based on output_valid_data
    PROCESSING_PTR_PROC: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_o_ADDR_PROC_PTR <= (others => '0');
            else
                if s_o_WHITEN_DATA_VALID_REG = '1' then
                    if s_o_ADDR_PROC_PTR = 309 then
                        s_o_ADDR_PROC_PTR <= (others => '0');
                    else
                        s_o_ADDR_PROC_PTR <= s_o_ADDR_PROC_PTR + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    o_ADDR_PROC_PTR <= std_logic_vector(s_o_ADDR_PROC_PTR);


    --Only read till 309, because 309 -> 319 is the these last pixels of a buffer
    WHERE_RD_PTR_IS : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_o_ADDR_RD_PTR <= (others => '0');
            else
                if s_o_READ_REG = '1' then
                    if s_o_ADDR_RD_PTR = 309 then
                        s_o_ADDR_RD_PTR <= (others => '0');
                    else
                        s_o_ADDR_RD_PTR <= s_o_ADDR_RD_PTR + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;


    SEND_STATE_2_MACHINE_DONEPROCESS_1ROW: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_FINISH_PROCESS_MASK_ROW <= '0';
            else
                if s_o_ADDR_RD_PTR = 309 and s_DATA_ARRIVE = '1' then
                    o_FINISH_PROCESS_MASK_ROW <= '1';
                else
                    o_FINISH_PROCESS_MASK_ROW <= '0';
                end if;
            end if;
        end if;
    end process;

    SEND_STATE_2_MACHINE_DONECHANGERGB: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_FINISH_CHANGE_1ROW_RGB <= '0';
            else
                if s_o_ADDR_PROC_PTR = 309 and s_o_WHITEN_DATA_VALID_REG = '1' then
                    o_FINISH_CHANGE_1ROW_RGB <= '1';
                else
                    o_FINISH_CHANGE_1ROW_RGB <= '0';
                end if;
            end if;
        end if;
    end process;


    -- --STATE MACHINE
    -- constant IDLE                       : std_logic_vector(2 downto 0) := "000";
    -- constant WAIT_FIRST_FULL_12RGB      : std_logic_vector(2 downto 0) := "001";
    -- constant WAIT_FIRST_FULL_12MASK     : std_logic_vector(2 downto 0) := "010";
    -- constant WAIT_DONE_PROCESS_1ROWMASK : std_logic_vector(2 downto 0) := "011";
    -- constant WAIT_DONE_CHANGE_1ROWRGB   : std_logic_vector(2 downto 0) := "100";
    -- constant WAIT_DONE_SENDING_1_FIFO   : std_logic_vector(2 downto 0) := "101";
    -- constant RECHARGE_n_NEW_PROCESS     : std_logic_vector(2 downto 0) := "110";

    --READ_CONTROL_PROCESS
    READ_CTRL_PROC:process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_o_READ_REG <= '0';
                s_FINISH_PROCESS_MASK_ROW <= '0';
            else
                if i_WHICH_STATE = "011" then
                    if s_o_ADDR_RD_PTR = 309 and s_DATA_ARRIVE = '1' then
                        s_o_READ_REG <= '0';
                        s_FINISH_PROCESS_MASK_ROW <= '1';
                    elsif s_FINISH_PROCESS_MASK_ROW = '0' then
                        s_o_READ_REG <= '1';
                    end if;
                else
                    s_o_READ_REG <= '0';
                    s_FINISH_PROCESS_MASK_ROW <= '0';
                end if;    
            end if;
        end if;
    end process;
end architecture;    