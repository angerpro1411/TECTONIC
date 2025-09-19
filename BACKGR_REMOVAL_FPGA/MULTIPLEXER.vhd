library ieee;
use ieee.std_logic_1164.all;

ENTITY MULTIPLEXER is
    PORT(
        i_VALID0 : in std_logic;
        i_VALID1 : in std_logic;
        i_VALID2 : in std_logic;
        i_VALID3 : in std_logic;
        i_MASK0  : in std_logic;
        i_MASK1  : in std_logic;
        i_MASK2  : in std_logic;
        i_MASK3  : in std_logic;

        o_DATA   : out std_logic;
        o_VALID  : out std_logic
    );
end entity;

architecture RTL of MULTIPLEXER is
    signal VALID_CHECK : std_logic_vector(3 downto 0);
begin
    VALID_CHECK <= i_VALID3 & i_VALID2 & i_VALID1 & i_VALID0;

    DATA_OUT_PROC : process(VALID_CHECK,i_VALID0,i_VALID1,
                        i_VALID2,i_VALID3,i_MASK0,i_MASK1,i_MASK2,i_MASK3)
    begin
        case VALID_CHECK is 
            when "0001" =>
                o_DATA <= i_MASK0;
                o_VALID <= i_VALID0;
            when "0010" =>
                o_DATA <= i_MASK1;
                o_VALID <= i_VALID1; 
            when "0100" =>
                o_DATA <= i_MASK2;
                o_VALID <= i_VALID2;
            when "1000" =>
                o_DATA <= i_MASK3;
                o_VALID <= i_VALID3;
            when others =>
                o_DATA <= '0';
                o_VALID <= '0';
        end case;
    end process;
end architecture;