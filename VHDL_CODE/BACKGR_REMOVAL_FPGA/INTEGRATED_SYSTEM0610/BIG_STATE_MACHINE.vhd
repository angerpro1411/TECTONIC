library ieee;
use ieee.std_logic_1164.all;

entity BIG_STATE_MACHINE is
    PORT(
        i_CLK                       : in std_logic;
        i_RSTn                      : in std_logic;
        i_RGB_FULL                  : in std_logic;
        i_MASK_FULL                 : in std_logic;
        i_FINISH_PROCESS_A_RGB_ROW  : in std_logic;
        o_WHICH_STATE               : out std_logic_vector(2 downto 0);
        o_STOP_STREAM               : out std_logic;
        o_START_PROCESS_MASK        : out std_logic
    );
end entity;


architecture RTL of BIG_STATE_MACHINE is
    
    --STATE MACHINE
    constant IDLE                : std_logic_vector(2 downto 0) := "111";
    constant WAIT_FIRST_RGB_FULL : std_logic_vector(2 downto 0) := "000";
    constant WAIT_FIRST_MASK_FULL : std_logic_vector(2 downto 0) := "001";
    constant WAIT_DONE_PROCESS_1ROWRGB : std_logic_vector(2 downto 0) := "010";
    constant WAIT_RGB_FULL_1ROW : std_logic_vector(2 downto 0) := "011";
    constant WAIT_MASK_FULL_1ROW : std_logic_vector(2 downto 0) := "100";

    --STATE CONTROL SIGNALs
    signal STATE_REG,STATE_NEXT : std_logic_vector(2 downto 0);

begin
    STATE_REGISTER: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                STATE_REG <= WAIT_FIRST_RGB_FULL;
            else
                STATE_REG <= STATE_NEXT;
            end if;
        end if;
    end process;

    STATE_MACHINE:process(i_RGB_FULL,i_MASK_FULL,i_FINISH_PROCESS_A_RGB_ROW,STATE_REG)
    begin
        STATE_NEXT <= STATE_REG;
        
        case STATE_REG is
            when WAIT_FIRST_RGB_FULL =>
                if i_RGB_FULL = '1' then
                    STATE_NEXT <= WAIT_FIRST_MASK_FULL;
                end if;
            when WAIT_FIRST_MASK_FULL => 
                if i_MASK_FULL = '1' then
                    STATE_NEXT <= WAIT_DONE_PROCESS_1ROWRGB;
                end if;
            when WAIT_DONE_PROCESS_1ROWRGB =>
                if i_FINISH_PROCESS_A_RGB_ROW = '1' then
                    STATE_NEXT <= WAIT_RGB_FULL_1ROW;
                end if;
            when WAIT_RGB_FULL_1ROW => 
                if i_RGB_FULL = '1' then
                    STATE_NEXT <= WAIT_MASK_FULL_1ROW;
                end if;
            when WAIT_MASK_FULL_1ROW => 
                if i_MASK_FULL = '1' then
                    STATE_NEXT <= WAIT_DONE_PROCESS_1ROWRGB;
                end if;
            when others =>
                STATE_NEXT <= STATE_REG;
        end case;
    end process;

    --Made desicions for output
    o_STOP_STREAM <= '0' when STATE_REG = IDLE or STATE_REG = WAIT_FIRST_RGB_FULL or STATE_REG = WAIT_RGB_FULL_1ROW else '1';
    o_START_PROCESS_MASK <= '1' when STATE_REG = WAIT_DONE_PROCESS_1ROWRGB else '0';

    o_WHICH_STATE <= STATE_REG;


end architecture;    