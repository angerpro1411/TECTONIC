library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity INPUT12_BUFF is
    GENERIC(
        DATA_WIDTH : integer := 24
    );
    PORT(

        i_CLK       : in std_logic;
        i_RSTn      : in std_logic;

        i_DATA      : in std_logic_vector(DATA_WIDTH-1 downto 0);
        i_VALID     : in std_logic;

        o_FULL12_ROW : out std_logic;

        o_DATA0     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID0    : out std_logic;

        o_DATA1     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID1    : out std_logic;

        o_DATA2     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID2    : out std_logic;
        
        o_DATA3     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID3    : out std_logic;
        
        o_DATA4     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID4    : out std_logic;
        
        o_DATA5     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID5    : out std_logic;
        
        o_DATA6     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID6    : out std_logic;
        
        o_DATA7     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID7    : out std_logic;
        
        o_DATA8     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID8    : out std_logic;
        
        o_DATA9     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID9    : out std_logic;
        
        o_DATA10     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID10    : out std_logic;
        
        o_DATA11     : out std_logic_vector(DATA_WIDTH-1 downto 0);
        o_VALID11    : out std_logic        
    );
end entity;

architecture RTL of INPUT12_BUFF is
    signal CNT_0to_12 : unsigned(3 downto 0);
    
    signal CNT_0to_320 : unsigned(8 downto 0);


begin
    VALID_CNT_ROW : process(i_CLK) 
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                CNT_0to_320 <= (others => '0');
            else
                if i_VALID = '1' then
                    if CNT_0to_320 = 319 then
                        CNT_0to_320 <= (others => '0');
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
            else
                if i_VALID = '1' then
                    if CNT_0to_320 = 319 then
                        if CNT_0to_12 = 11 then
                            CNT_0to_12 <= (others => '0');
                        else
                            CNT_0to_12 <= CNT_0to_12 + 1;
                        end if;
                    end if;
                end if;
            end if;
        end if;
    end process;

    FILL_IN_BUFFER : process(CNT_0to_12)
    begin
        case CNT_0to_12 is
            when "0000" =>
                o_DATA0 <= i_DATA;
                o_VALID0 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';

            when "0001" =>
                o_DATA1 <= i_DATA;
                o_VALID1 <= i_VALID;

                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';
                
            when "0010" =>
                o_DATA2 <= i_DATA;
                o_VALID2 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';
                
            when "0011" =>
                o_DATA3 <= i_DATA;
                o_VALID3 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';
                
            when "0100" =>
                o_DATA4 <= i_DATA;
                o_VALID4 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';
                
            when "0101" =>
                o_DATA5 <= i_DATA;
                o_VALID5 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';
                
            when "0110" =>
                o_DATA6 <= i_DATA;
                o_VALID6 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';
                
            when "0111" =>
                o_DATA7 <= i_DATA;
                o_VALID7 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';
                
            when "1000" =>
                o_DATA8 <= i_DATA;
                o_VALID8 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';
                
            when "1001" =>
                o_DATA9 <= i_DATA;
                o_VALID9 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';
                
            when "1010" =>
                o_DATA10 <= i_DATA;
                o_VALID10 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';
                
            when "1011" =>
                o_DATA11 <= i_DATA;
                o_VALID11 <= i_VALID;

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA0 <= (others => '0');
                o_VALID0 <= '0';
                
            when others =>
                o_DATA0 <= (others => '0') ;
                o_VALID0 <= '0';

                o_DATA1 <= (others => '0');
                o_VALID1 <= '0';
                o_DATA2 <= (others => '0');
                o_VALID2 <= '0';
                o_DATA3 <= (others => '0');
                o_VALID3 <= '0';
                o_DATA4 <= (others => '0');
                o_VALID4 <= '0';
                o_DATA5 <= (others => '0');
                o_VALID5 <= '0';
                o_DATA6 <= (others => '0');
                o_VALID6 <= '0';
                o_DATA7 <= (others => '0');
                o_VALID7 <= '0';
                o_DATA8 <= (others => '0');
                o_VALID8 <= '0';
                o_DATA9 <= (others => '0');
                o_VALID9 <= '0';
                o_DATA10 <= (others => '0');
                o_VALID10 <= '0';
                o_DATA11 <= (others => '0');
                o_VALID11 <= '0';                
            end case;
    end process;


    --Maybe need to modify by delay between RGB buffer and DATA STREAM.
    STOP_RECEVICE_DATA : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                o_FULL12_ROW <= '0';
            else
                if i_VALID = '1' then
                    if CNT_0to_12 = 11 and CNT_0to_320 = 319 then
                        o_FULL12_ROW <= '1';
                    end if;
                else
                    o_FULL12_ROW <= '0';
                end if;
            end if;
        end if;
    end process;



    
end architecture;    