LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LINEBUFFER is
    GENERIC(
        IMAGE_WIDTH     : integer := 320;
        IMAGE_HEIGHT    : integer := 240;

        VGA_ZEDBOARD    : integer := 12;
        DATA_WIDTH      : integer := 23
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
        
        
        --each pixel is 3 bytes
        i_DATA          : in std_logic_vector(DATA_WIDTH-1 downto 0);
        
        --Use to notify each time, we finish writing a line.
        o_INTR          : out std_logic;
        
        
        o_DATA          : out std_logic_vector(DATA_WIDTH-1 downto 0)
        
    );

end entity;

ARCHITECTURE RTL of LINEBUFFER is

    --output 11 o_DATA_SIGNAL at once.
    signal o_DATA_SIGNAL : std_logic_vector(DATA_WIDTH-1 downto 0);
    
    type READ_11p_DATA_SIGNAL is array (0 to 10) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal PIXEL_ARRAY : READ_11p_DATA_SIGNAL;
    
    --One line buffer
    type LINE_BUFF is array(0 to 319) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal LINE_INST : LINE_BUFF;
    
    --WR counter
    signal WR_PTR,RD_PTR : integer range 0 to 320;

    signal WHITEN_ADDR_INTEGER : integer range 0 to 320;

BEGIN

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
                if RD_PTR = 319 then
                    RD_PTR <= 0;
                else 
                    RD_PTR <= RD_PTR + 1;
                end if;
            end if;
         end if;
    end process;
    
    -- instantly got output but only read when read signal is asserted
    -- prefetching stage
    o_DATA_SIGNAL <= LINE_INST(RD_PTR);

END ARCHITECTURE;
    