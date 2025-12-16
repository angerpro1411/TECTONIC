library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PROCESS_11x11 is
    generic(
        -- 80% of 121 pixels
        THRESHOLD_TOTAL_MASK : integer := 60
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

        --Signal to interact with BIG STATE MACHINE
        i_WHICH_STATE : in std_logic_vector(2 downto 0);
        o_FINISH_PROCESS_A_RGB_ROW : out std_logic;


        -- Signal to address where the read pointer is from 0 to 319
        o_ADDR_RD_PTR       : out std_logic_vector(8 downto 0);

        -- Signal to address where the processing pointer is from 0 to 309
        o_ADDR_PROC_PTR     : out std_logic_vector(8 downto 0);

        -- Signal to whiten the kernel
        o_WHITEN_KERNEL       : out std_logic;
        o_VALID_DATA          : out std_logic;

        --Signal to command read mask buffer
        o_READ              : out std_logic
    );
end entity;

architecture RTL of PROCESS_11x11 is
    signal DATA_121_MASK           : std_logic_vector(120 downto 0);
    signal s_o_READ_REG            : std_logic;
    signal o_VALID_DATA_REG        : std_logic;
    signal MASK_CENTER             : std_logic;

    --State signal to control READ STATE MACHINE
    signal READ_STATE : std_logic;
    
    
    --max is 121 elements, so 7 bits 
    signal CNT_UPPER_THRESHOLD     : unsigned(6 downto 0);

    -- sum of 60 bits and sum of 61 bits
    signal SUM60,SUM61             : unsigned(5 downto 0);

    --signals for pipeline adding 
    signal VALID_2_SUMs            : std_logic;
    signal VALID_TOTAL_SUM         : std_logic;

    -- choose keep or clear the kernel
    signal CLEAR_KERNEL : std_logic;
    
    -- This signal uses to check if the kernel has passed condition to check the sum?
    signal PASS_CHECK_KERNEL,PASS_CHECK_KERNEL_DELAY1 : std_logic;

    
    -- Pointing where the Read pointer is
    signal s_o_ADDR_RD_PTR : unsigned(8 downto 0);
    signal s_o_ADDR_PROC_PTR : unsigned(8 downto 0);

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
    DATA_121_MASK <=  i_11DATA_BUFF0 & i_11DATA_BUFF1 & i_11DATA_BUFF2 & i_11DATA_BUFF3
                    & i_11DATA_BUFF4 & i_11DATA_BUFF5 & i_11DATA_BUFF6 & i_11DATA_BUFF7
                    & i_11DATA_BUFF8 & i_11DATA_BUFF9 & i_11DATA_BUFF10 ;

    MASK_CENTER <= DATA_121_MASK(60);

    o_READ <= s_o_READ_REG;
    o_ADDR_RD_PTR <= std_logic_vector(s_o_ADDR_RD_PTR);

    TWO_FIRST_ADD : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                SUM60 <= (others => '0');
                SUM61 <= (others => '0');
                VALID_2_SUMs <= '0';
            else
                VALID_2_SUMs <= s_o_READ_REG;
                if s_o_READ_REG = '1' then
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
                VALID_TOTAL_SUM <= '0';
            else
                VALID_TOTAL_SUM <= VALID_2_SUMs;
                if VALID_2_SUMs = '1' then
                    CNT_UPPER_THRESHOLD <= ('0' & SUM60) + ('0' & SUM61);
                end if;
            end if;
        end if;
    end process;
    
    CHECK_CENTER_MASK : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                PASS_CHECK_KERNEL <= '0';
            else
                if s_o_READ_REG = '1' then
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
                o_VALID_DATA_REG <= '0';
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
            o_VALID_DATA_REG <= VALID_TOTAL_SUM;
        end if;
    end process;

    o_VALID_DATA <= o_VALID_DATA_REG;

    --Processing pointer will increase based on output_valid_data
    PROCESSING_PTR_PROC: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_o_ADDR_PROC_PTR <= (others => '0');
            else
                if o_VALID_DATA_REG = '1' then
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


    SEND_STATE_2_MACHINE: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_FINISH_PROCESS_A_RGB_ROW <= '0';
            else
                if s_o_ADDR_RD_PTR = 309 and o_VALID_DATA_REG = '1' then
                    o_FINISH_PROCESS_A_RGB_ROW <= '1';
                else
                    o_FINISH_PROCESS_A_RGB_ROW <= '0';
                end if;
            end if;
        end if;
    end process;


    --     --STATE MACHINE
    -- constant WAIT_FIRST_RGB_FULL : std_logic_vector(2 downto 0) := "000";
    -- constant WAIT_FIRST_MASK_FULL : std_logic_vector(2 downto 0) := "001";
    -- constant WAIT_DONE_PROCESS_1ROWRGB : std_logic_vector(2 downto 0) := "010";
    -- constant WAIT_RGB_FULL_1ROW : std_logic_vector(2 downto 0) := "011";
    -- constant WAIT_MASK_FULL_1ROW : std_logic_vector(2 downto 0) := "100";

    --READ_CONTROL_PROCESS
    s_o_READ_REG <= '1' when i_WHICH_STATE = "010" else '0';



end architecture;    