library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXIS_CONV8to24 is
    generic(
        COLOR_DATA_WIDTH : integer := 24;
        DATA_WIDTH       : integer := 8
    );
    port(
        i_CLK       : in std_logic;
        i_RSTn      : in std_logic;
        
        --AXI4-S master i/f
        M_AXIS_VALID :   out std_logic;
        M_AXIS_READY :   in std_logic;
        M_AXIS_DATA  :   out std_logic_vector(COLOR_DATA_WIDTH-1 downto 0);
        
        --Slave AXI Stream interface
        S_AXIS_DATA     : in std_logic_vector(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID    : in std_logic;
        S_AXIS_READY    : out std_logic
    );
end entity;

architecture RTL of AXIS_CONV8to24 is

    --signal to count to 3 counter
    signal CNT2THREE    : unsigned(1 downto 0);
    signal S_AXIS_READY_SIGN : std_logic;
    signal M_AXIS_VALID_SIGN : std_logic;
    

    --signal to store RGB
    signal R,G,B : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal TIMING_AGGREGATE : std_logic;


begin

    S_AXIS_READY <= S_AXIS_READY_SIGN;
    M_AXIS_VALID <= M_AXIS_VALID_SIGN;

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
                B <= S_AXIS_DATA;
            end if;
        end if;
    end process;

    COLLECT_PIXEL_GREEN: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                G <= (others => '0');
            elsif S_AXIS_READY_SIGN = '1' and S_AXIS_VALID = '1'and CNT2THREE = "01" then
                G <= S_AXIS_DATA;
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
                R <= S_AXIS_DATA;
                TIMING_AGGREGATE <= '1';
            else
                TIMING_AGGREGATE <= '0';
            end if;
        end if;
    end process;    


    M_AXIS_DATA_OUT : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                M_AXIS_DATA <= (others => '0');
                M_AXIS_VALID_SIGN <= '0';
            elsif TIMING_AGGREGATE = '1' then
                M_AXIS_DATA <= R & G & B;
                M_AXIS_VALID_SIGN <= '1';
            elsif M_AXIS_VALID_SIGN = '1' and M_AXIS_READY = '1' and TIMING_AGGREGATE = '0' then
                M_AXIS_VALID_SIGN <= '0';
            end if;
        end if;                              
    end process;

    
    -- When M_AXIS_READY = '1', Master need data => IP needs to provide data => get DATA from slave, IP_READY = '1'.
    -- When M_AXIS_READY = '0', All data need to keep the same, then M_AXIS_REAY = '0 '; 
    S_AXIS_READY_SIGN <= M_AXIS_READY;



end architecture RTL;

