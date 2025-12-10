library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PIXEL_DATA_CONTROLLER is
    generic(
        VGA_SCALE       : integer := 12;
        DATA_WIDTH      : integer := 8
    );
    port(
        i_CLK       : in std_logic;
        i_RSTn      : in std_logic;
        D_2_FIFO     : out std_logic_vector(VGA_SCALE-1 downto 0);
        WR_FIFO     : out std_logic;
        FULL_FIFO   : in std_logic; 
        
        --Slave AXI Stream interface
        S_AXIS_DATA     : in std_logic_vector(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID    : in std_logic;
        S_AXIS_READY    : out std_logic
    );
end entity;

architecture RTL of PIXEL_DATA_CONTROLLER is

    --signal to count to 3 counter
    signal CNT2THREE    : unsigned(1 downto 0);
    signal S_AXIS_READY_SIGN : std_logic;

    --signal to store RGB
    signal R,G,B : std_logic_vector(VGA_SCALE/3-1 downto 0);
    signal TIMING_AGGREGATE : std_logic;


begin

    S_AXIS_READY <= S_AXIS_READY_SIGN;

    CNT_2_3_PROC: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                CNT2THREE <= (others => '0');
            elsif S_AXIS_READY_SIGN = '1' and S_AXIS_VALID = '1' then
                if CNT2THREE = "10" then
                    CNT2THREE <= "00";
                else
                    CNT2THREE <= CNT2THREE + 1;
                end if;
            end if;
        end if;
    end process;

    --Pixel data will come in as B->G->R
    COLLECT_PIXEL_BLUE: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                B <= (others => '0');
            elsif S_AXIS_READY_SIGN = '1' and S_AXIS_VALID = '1'and CNT2THREE = "00" then
                B <= S_AXIS_DATA( DATA_WIDTH-1 downto (DATA_WIDTH-1)-(VGA_SCALE/3-1) );
            end if;
        end if;
    end process;

    COLLECT_PIXEL_GREEN: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                G <= (others => '0');
            elsif S_AXIS_READY_SIGN = '1' and S_AXIS_VALID = '1'and CNT2THREE = "01" then
                G <= S_AXIS_DATA( DATA_WIDTH-1 downto (DATA_WIDTH-1)-(VGA_SCALE/3-1) );
            end if;
        end if;
    end process;
    
    COLLECT_PIXEL_RED: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                R <= (others => '0');
                TIMING_AGGREGATE <= '0';
            elsif S_AXIS_READY_SIGN = '1' and S_AXIS_VALID = '1'and CNT2THREE = "10" then
                R <= S_AXIS_DATA( DATA_WIDTH-1 downto (DATA_WIDTH-1)-(VGA_SCALE/3-1) );
                TIMING_AGGREGATE <= '1';
            else
                TIMING_AGGREGATE <= '0';
            end if;
        end if;
    end process;    

    --Write to FIFO
    --Prefetch output data to FIFO
    D_2_FIFO <= R & G & B;
    WR_FIFO <= TIMING_AGGREGATE;
    
    S_AXIS_READY_SIGN <= '1' when FULL_FIFO = '0' else '0';


end architecture RTL;

