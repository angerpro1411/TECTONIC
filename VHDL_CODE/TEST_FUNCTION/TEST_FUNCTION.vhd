LIBRARY ieee;
use ieee.std_logic_1164.all;

entity TEST_FUNCTION is
    port(
        i_CLK : in std_logic;
        i_WR : in std_logic
    );
end;

architecture RTL of TEST_FUNCTION is
    signal FF : std_logic;
begin
    process(i_CLK) 
    begin
        if rising_edge(i_CLK) then
            if i_WR = '1' then
                FF <= '1';
            elsif FF = '1' then
                FF <= '0';
            end if;
        end if;
    end process;
    

end architecture;