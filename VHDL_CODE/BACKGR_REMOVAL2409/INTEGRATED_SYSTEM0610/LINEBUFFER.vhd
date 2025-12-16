LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.reciprocal_pkg.all;

entity LINEBUFFER is
    GENERIC(
        IMAGE_WIDTH     : integer := 320;
        IMAGE_HEIGHT    : integer := 240;

        VGA_ZEDBOARD    : integer := 12;
        DATA_WIDTH      : integer := 24
    );
    PORT(
        i_CLK           : in std_logic;
        i_RSTn          : in std_logic;
        
        i_WRITE         : in std_logic;
        i_READ          : in std_logic;

        --Whiten signals
        i_WHITEN_CMD    : in std_logic;
        i_WHITEN_ADDR   : in std_logic_vector(8 downto 0);
        i_WHITEN_VALID  : in std_logic;

        --Signals to FIFO
        o_in_FIFO_DATA          : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        o_in_FIFO_DATA_VALID    : out std_logic;
        i_FIFO_READY            : in std_logic;

        --Signals to BIG_STATE_MACHINE
        o_SEND_BACK_DONE : out std_logic;
        i_STATE_CONTROL : in std_logic_vector(2 downto 0);
        
        --each pixel is 3 bytes
        i_DATA          : in std_logic_vector(DATA_WIDTH-1 downto 0);
        
        --Use to notify each time, we finish writing a line.
        o_INTR          : out std_logic;
        
        
        o_DATA          : out std_logic_vector(DATA_WIDTH*11-1 downto 0)
        
    );

end entity;

ARCHITECTURE RTL of LINEBUFFER is

    --output 11 o_DATA_SIGNAL at once.
    signal o_DATA_SIGNAL : std_logic_vector(DATA_WIDTH*11-1 downto 0);
    
    
    --One line buffer
    type LINE_BUFF is array(0 to 319) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal LINE_INST : LINE_BUFF;
    
    --WR counter
    signal WR_PTR,RD_PTR : integer range 0 to 320;

    signal WHITEN_ADDR_INTEGER : integer range 0 to 320;

    --signals to send back data
    signal READY_2_SEND_BACK     : std_logic;
    signal SEND_BACK_ADDR_PTR    : integer range 0 to 320;
    
    signal s_o_in_FIFO_DATA_VALID : std_logic;

BEGIN

    o_in_FIFO_DATA_VALID <= s_o_in_FIFO_DATA_VALID;

    o_DATA <= o_DATA_SIGNAL;
    WHITEN_ADDR_INTEGER <= to_integer(unsigned(i_WHITEN_ADDR));

    
    WR_COUNTER_PROC : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                WR_PTR <= 0;
            elsif i_WRITE = '1' then
                if WR_PTR = 319 then
                    WR_PTR <= 0;
                else
                    WR_PTR <= WR_PTR + 1;
                end if;
            end if;
        end if;
    end process;
    
    MODIFY_DATA_IN: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_WRITE = '1' then
                LINE_INST(WR_PTR) <= i_DATA;
            elsif i_WHITEN_VALID = '1' then
                if i_WHITEN_CMD = '1' then
                    for I in 0 to 10 loop
                        LINE_INST(WHITEN_ADDR_INTEGER+I) <= (others => '0');
                    end loop;
                end if;
            end if;
        end if;
    end process;

    
    READ_DATA_OUT: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                RD_PTR <= 0;
            elsif i_READ = '1' then
                if RD_PTR = 309 then
                    RD_PTR <= 0;
                else 
                    RD_PTR <= RD_PTR + 1;
                end if;
            end if;
         end if;
    end process;
    
    -- instantly got output but only read when read signal is asserted
    -- prefetching stage
    o_DATA_SIGNAL <= LINE_INST(RD_PTR)   & LINE_INST(RD_PTR+1) & LINE_INST(RD_PTR+2) &
                     LINE_INST(RD_PTR+3) & LINE_INST(RD_PTR+4) & LINE_INST(RD_PTR+5) &
                     LINE_INST(RD_PTR+6) & LINE_INST(RD_PTR+7) & LINE_INST(RD_PTR+8) &
                     LINE_INST(RD_PTR+9) & LINE_INST(RD_PTR+10) ;



    --Sending back data after change
    SENDING_2_FIFO_VALIDCONTROL: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                READY_2_SEND_BACK <= '0';
                s_o_in_FIFO_DATA_VALID <= '0';
            else
                if i_WHITEN_VALID = '1' then
                    READY_2_SEND_BACK <= '1';
                elsif READY_2_SEND_BACK = '1' and i_STATE_CONTROL = SENDING_DATA_FIFO then
                    s_o_in_FIFO_DATA_VALID <= '1';
                elsif i_STATE_CONTROL /= SENDING_DATA_FIFO then
                    READY_2_SEND_BACK <= '0';
                    s_o_in_FIFO_DATA_VALID <= '0';
                end if;
            end if;
        end if;
    end process;

    
    --Sending back data always ready at output
    o_in_FIFO_DATA <= LINE_INST(SEND_BACK_ADDR_PTR);

    SENDING_2_FIFO_ADDRCONTROL : process(i_CLK)
    begin
        if rising_edge(i_CLK) then 
            if i_RSTn = '0' then
                SEND_BACK_ADDR_PTR <= 0;
                o_SEND_BACK_DONE <= '0';
            else
                o_SEND_BACK_DONE <= '0';
                if s_o_in_FIFO_DATA_VALID = '1' and i_FIFO_READY = '1' then
                    if SEND_BACK_ADDR_PTR = 319 then
                        SEND_BACK_ADDR_PTR <= 0;
                        o_SEND_BACK_DONE <= '1';
                    else
                        SEND_BACK_ADDR_PTR <= SEND_BACK_ADDR_PTR + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

END ARCHITECTURE;
    