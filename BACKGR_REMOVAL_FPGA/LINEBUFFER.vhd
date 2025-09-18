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

BEGIN

    o_DATA <= o_DATA_SIGNAL;

    -- unpack the 264-bit bus into 11 o_DATA_SIGNAL
    PIXEL_ARRAY(0) <= o_DATA_SIGNAL( 23 downto   0);
    PIXEL_ARRAY(1) <= o_DATA_SIGNAL( 47 downto  24);
    PIXEL_ARRAY(2) <= o_DATA_SIGNAL( 71 downto  48);
    PIXEL_ARRAY(3) <= o_DATA_SIGNAL( 95 downto  72);
    PIXEL_ARRAY(4) <= o_DATA_SIGNAL(119 downto  96);
    PIXEL_ARRAY(5) <= o_DATA_SIGNAL(143 downto 120);
    PIXEL_ARRAY(6) <= o_DATA_SIGNAL(167 downto 144);
    PIXEL_ARRAY(7) <= o_DATA_SIGNAL(191 downto 168);
    PIXEL_ARRAY(8) <= o_DATA_SIGNAL(215 downto 192);
    PIXEL_ARRAY(9) <= o_DATA_SIGNAL(239 downto 216);
    PIXEL_ARRAY(10)<= o_DATA_SIGNAL(263 downto 240);
    
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
    
    PUT_DATA_IN: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_WRITE = '1' then
                LINE_INST(WR_PTR) <= i_DATA;
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
    