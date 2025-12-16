--    constant IDLE                       : std_logic_vector(2 downto 0) := "000";
--    constant WAIT_FIRST_FULL_12RGB      : std_logic_vector(2 downto 0) := "001";
--    constant WAIT_FIRST_FULL_12MASK     : std_logic_vector(2 downto 0) := "001";
--    constant WAIT_DONE_PROCESS_1ROWMASK : std_logic_vector(2 downto 0) := "010";
--    constant WAIT_DONE_CHANGE_1ROWRGB   : std_logic_vector(2 downto 0) := "011";
--    constant WAIT_DONE_SENDING_1_FIFO   : std_logic_vector(2 downto 0) := "100";



library ieee;
use ieee.std_logic_1164.all;
use work.reciprocal_pkg.all;

entity BIG_STATE_MACHINE is
    PORT(
        i_CLK                       : in std_logic;
        i_RSTn                      : in std_logic;
        i_START_STREAM              : in std_logic;
        
        --Signal from input stream
        i_DONE_RGB_320                  : in std_logic;
        i_DONE_RGB_320x12               : in std_logic;
        
        --Signal from processx11
        i_FINISH_PROCESS_MASK_ROW : in std_logic;
        i_FINISH_CHANGE_1ROW_RGB    : in std_logic;
        
        --Signal from mask control
        i_DONE_MASK_320             : in std_logic;
        i_DONE_MASK_320x12          : in std_logic;
        
        
        --Signal from stream out
        i_SEND_BACK_DONE            : in std_logic;
    
        o_WHICH_STATE               : out std_logic_vector(2 downto 0)
    );
end entity;


architecture RTL of BIG_STATE_MACHINE is
    

    --STATE CONTROL SIGNALs
    signal STATE_REG,STATE_NEXT : std_logic_vector(2 downto 0);

begin
    STATE_REGISTER: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                STATE_REG <= IDLE;
            else
                STATE_REG <= STATE_NEXT;
            end if;
        end if;
    end process;

    STATE_MACHINE:process(i_START_STREAM,i_DONE_RGB_320x12,
                            i_DONE_MASK_320x12,i_FINISH_PROCESS_MASK_ROW,
                            i_FINISH_CHANGE_1ROW_RGB,i_SEND_BACK_DONE,
                            i_DONE_RGB_320,i_DONE_MASK_320, STATE_REG)
        variable PASS_RECHARGE_STAGE : std_logic := '0';
    begin
        STATE_NEXT <= STATE_REG;
        
        case STATE_REG is
            when IDLE =>
                if i_START_STREAM = '1' then
                    STATE_NEXT <= WAIT_FIRST_FULL_12RGB;
                end if;
            when WAIT_FIRST_FULL_12RGB =>
                if i_DONE_RGB_320x12 = '1' then
                    STATE_NEXT <= WAIT_FIRST_FULL_12MASK;
                end if;
            when WAIT_FIRST_FULL_12MASK => 
                if i_DONE_MASK_320x12 = '1' then
                    STATE_NEXT <= WAIT_DONE_PROCESS_1ROWMASK;
                elsif PASS_RECHARGE_STAGE = '1' and i_DONE_MASK_320 = '1' then
                    STATE_NEXT <= WAIT_DONE_PROCESS_1ROWMASK;
                end if;
            when WAIT_DONE_PROCESS_1ROWMASK =>
                if i_FINISH_PROCESS_MASK_ROW = '1' then
                    STATE_NEXT <= WAIT_DONE_CHANGE_1ROWRGB;
                end if;
            when WAIT_DONE_CHANGE_1ROWRGB => 
                if i_FINISH_CHANGE_1ROW_RGB = '1' then
                    STATE_NEXT <= WAIT_DONE_SENDING_1_FIFO;
                end if;
            when WAIT_DONE_SENDING_1_FIFO => 
                if i_SEND_BACK_DONE = '1' then
                    STATE_NEXT <= RECHARGE_n_NEW_PROCESS;
                end if;
            when RECHARGE_n_NEW_PROCESS =>
                if i_DONE_RGB_320 = '1' then
                    STATE_NEXT <= WAIT_FIRST_FULL_12MASK;
                end if;
            when others =>
                STATE_NEXT <= STATE_REG;
                PASS_RECHARGE_STAGE := '0';
        end case;
    end process;


    o_WHICH_STATE <= STATE_REG;


end architecture;    