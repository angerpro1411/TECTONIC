library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY INPUT4MASK_CALCUL is
    GENERIC(
        DATA_WIDTH : integer := 24
    );

    PORT(
        i_CLK   : in std_logic;
        i_RSTn  : in std_logic;
        i_VALID : in std_logic;
        i_DATA  : in std_logic_vector(DATA_WIDTH-1 downto 0);


        o_DATA0   : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID0  : out std_logic;
        o_DATA1   : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID1  : out std_logic;
        o_DATA2   : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID2  : out std_logic;
        o_DATA3   : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID3 : out std_logic                        
    );
end entity;

architecture RTL of INPUT4MASK_CALCUL is
    signal COUNT : unsigned(1 downto 0);
begin
    
    CNT_2_4: process(i_CLK) 
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                COUNT <= (others => '0');
            else
                if i_VALID = '1' then
                    COUNT <= COUNT + 1;
                end if;
            end if;
        end if;
    end process;

    DATA_OUT_PROC : process(COUNT,i_DATA,i_VALID)
    begin
        case COUNT is 
            when "00" =>
                o_DATA0 <= i_DATA;
                o_VALID0 <= i_VALID;
                
                o_DATA1   <= (others => '0');
                o_VALID1  <= '0';
                o_DATA2   <= (others => '0');
                o_VALID2  <= '0';
                o_DATA3   <= (others => '0');
                o_VALID3  <= '0';  
            when "01" =>
                o_DATA1 <= i_DATA;
                o_VALID1 <= i_VALID;

                o_DATA0   <= (others => '0');
                o_VALID0  <= '0';
                o_DATA2   <= (others => '0');
                o_VALID2  <= '0';
                o_DATA3   <= (others => '0');
                o_VALID3  <= '0';                   
            when "10" =>
                o_DATA2 <= i_DATA;
                o_VALID2 <= i_VALID;

                o_DATA0   <= (others => '0');
                o_VALID0  <= '0';
                o_DATA1   <= (others => '0');
                o_VALID1  <= '0';
                o_DATA3   <= (others => '0');
                o_VALID3  <= '0';                  
            when "11" =>
                o_DATA3 <= i_DATA;
                o_VALID3 <= i_VALID;

                o_DATA1   <= (others => '0');
                o_VALID1  <= '0';
                o_DATA2   <= (others => '0');
                o_VALID2  <= '0';
                o_DATA0   <= (others => '0');
                o_VALID0  <= '0';  

            when others =>
                o_DATA0   <= (others => '0');
                o_VALID0  <= '0';
                o_DATA1   <= (others => '0');
                o_VALID1  <= '0';
                o_DATA2   <= (others => '0');
                o_VALID2  <= '0';
                o_DATA3   <= (others => '0');
                o_VALID3  <= '0';  
        end case;
    end process;
end architecture;