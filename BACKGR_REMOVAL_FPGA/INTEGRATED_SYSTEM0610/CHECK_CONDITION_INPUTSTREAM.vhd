library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CHECK_CONDITION_INPUTSTREAM is
    port(
        i_CLK       : in std_logic;
        i_RSTn      : in std_logic;
        i_RGB_BUFF_FULL : in std_logic;
        i_FINISH_PROCESS_1_ROW : in std_logic;

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

    signal WAIT_4_NOFULL : std_logic;

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

    READY_SIGNAL_CONTROL : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                s_S_AXIS_READY <= '1';
                WAIT_4_NOFULL <= '0';
            else
                if i_RGB_BUFF_FULL = '1' then
                    s_S_AXIS_READY <= '0';
                    WAIT_4_NOFULL <= '1';
                elsif WAIT_4_NOFULL = '1' then
                    if i_FINISH_PROCESS_1_ROW = '1' then --We finished free up one line
                        s_S_AXIS_READY <= '1';
                        WAIT_4_NOFULL <= '0';
                    end if;
                end if;
            end if;
        end if; 
    end process;


end architecture;    