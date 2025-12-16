library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.reciprocal_pkg.all;

entity CHECK_CONDITION_INPUTSTREAM is
    port(
        i_CLK       : in std_logic;
        i_RSTn      : in std_logic;
        
        --signals communicate to BIG state machine
        i_STATE_CONTROL : in std_logic_vector(2 downto 0);
        o_DONE_320      : out std_logic;
        o_DONE_320x12   : out std_logic;
        

        --OUTPUT to BUFF12 RGB
        o_DATA      : out std_logic_vector(23 downto 0);
        o_VALID     : out std_logic;

        --S AXI STREAM INTERFACE
        S_AXIS_DATA     : in STD_LOGIC_VECTOR(23 downto 0);
        S_AXIS_VALID    : in std_logic;
        S_AXIS_READY    : out std_logic
    );
end entity;

architecture RTL of CHECK_CONDITION_INPUTSTREAM is

    signal s_S_AXIS_READY : std_logic;

    signal CNT_0to_12 : unsigned(3 downto 0);
    
    signal CNT_0to_320 : unsigned(8 downto 0);


begin

    S_AXIS_READY <= s_S_AXIS_READY;

    DATA_THROUGHPUT : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_DATA <= (others => '0');
                o_VALID <= '0';
            else
                if S_AXIS_VALID = '1' and s_S_AXIS_READY = '1' then
                    o_DATA <= S_AXIS_DATA;
                    o_VALID <= '1';
                else
                    o_DATA <= ((others => '0') );
                    o_VALID <= '0';
                end if;
            end if;
        end if;                    
    end process;


    
    VALID_CNT_ROW : process(i_CLK) 
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                CNT_0to_320 <= (others => '0');
                o_DONE_320 <= '0';
            else
                o_DONE_320 <= '0';
                if S_AXIS_VALID = '1' and s_S_AXIS_READY = '1' then
                    if CNT_0to_320 = 319 then
                        CNT_0to_320 <= (others => '0');
                        o_DONE_320 <= '1';
                    else
                        CNT_0to_320 <= CNT_0to_320 + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;

    VALID_CNT_COL : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                CNT_0to_12 <= (others => '0');
                o_DONE_320x12 <= '0';
            else
                o_DONE_320x12 <= '0';
                if S_AXIS_VALID = '1' and s_S_AXIS_READY = '1' then
                    if CNT_0to_320 = 319 then
                        if CNT_0to_12 = 11 then
                            CNT_0to_12 <= (others => '0');
                            o_DONE_320x12 <= '1';
                        else
                            CNT_0to_12 <= CNT_0to_12 + 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;
    
    
    -- Ready signal control by i_STATE_CONTROL
    -- Should change base on BIG_STATE_MACHINE control.
    CONTROL_STREAM_PROC : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_S_AXIS_READY <= '0';
            else
                if i_STATE_CONTROL = WAIT_FIRST_FULL_12RGB and 
                        S_AXIS_VALID = '1' and s_S_AXIS_READY = '1' then
                        if CNT_0to_320 = 319 then
                            if CNT_0to_12 = 11 then
                                s_S_AXIS_READY <= '0';
                            end if;
                        end if;
                    
                elsif i_STATE_CONTROL = RECHARGE_n_NEW_PROCESS and 
                        S_AXIS_VALID = '1' and s_S_AXIS_READY = '1' then
                        if CNT_0to_320 = 319 then
                            s_S_AXIS_READY <= '0';
                        end if;

                elsif i_STATE_CONTROL = WAIT_FIRST_FULL_12RGB or i_STATE_CONTROL = RECHARGE_n_NEW_PROCESS then
                    s_S_AXIS_READY <= '1';                                       
                else
                    s_S_AXIS_READY <= '0';          
                end if;
            end if;
        end if;
    end process;

end architecture;    