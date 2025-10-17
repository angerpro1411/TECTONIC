library ieee;
use ieee.std_logic_1164.all;

ENTITY MULTIPLEXER is
    PORT(
        i_CLK : in std_logic;
        i_RSTn : in std_logic;
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
    signal o_DATA_REG   : std_logic;
    signal o_VALID_REG  : std_logic;
begin
    VALID_CHECK <= i_VALID3 & i_VALID2 & i_VALID1 & i_VALID0;

    DATA_OUT_PROC : process(VALID_CHECK,i_VALID0,i_VALID1,
                        i_VALID2,i_VALID3,i_MASK0,i_MASK1,i_MASK2,i_MASK3)
    begin
        case VALID_CHECK is 
            when "0001" =>
                o_DATA_REG <= i_MASK0;
                o_VALID_REG <= i_VALID0;
            when "0010" =>
                o_DATA_REG <= i_MASK1;
                o_VALID_REG <= i_VALID1; 
            when "0100" =>
                o_DATA_REG <= i_MASK2;
                o_VALID_REG <= i_VALID2;
            when "1000" =>
                o_DATA_REG <= i_MASK3;
                o_VALID_REG <= i_VALID3;
            when others =>
                o_DATA_REG <= '0';
                o_VALID_REG <= '0';
        end case;
    end process;

    SYNC_OUTPUT : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_DATA <= '0';
                o_VALID <= '0';
            else
                o_DATA <= o_DATA_REG;
                o_VALID <= o_VALID_REG;
            end if;
        end if;
    end process;

end architecture;