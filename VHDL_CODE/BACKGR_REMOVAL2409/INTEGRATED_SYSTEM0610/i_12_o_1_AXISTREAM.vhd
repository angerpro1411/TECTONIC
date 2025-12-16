library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i_12_o_1_AXISTREAM is
    generic(
        DATA_WIDTH : integer := 24
    );
    port(
        i_CLK       : in std_logic;
        i_RSTn      : in STD_LOGIC;

        S_AXIS_DATA0    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID0   : in std_logic;
        S_AXIS_READY0   : out std_logic;

        S_AXIS_DATA1    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID1   : in std_logic;
        S_AXIS_READY1   : out std_logic;
        
        S_AXIS_DATA2    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID2   : in std_logic;
        S_AXIS_READY2   : out std_logic;
        
        S_AXIS_DATA3    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID3   : in std_logic;
        S_AXIS_READY3   : out std_logic;
        
        S_AXIS_DATA4    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID4   : in std_logic;
        S_AXIS_READY4   : out std_logic;
        
        S_AXIS_DATA5    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID5   : in std_logic;
        S_AXIS_READY5   : out std_logic;
        
        S_AXIS_DATA6    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID6   : in std_logic;
        S_AXIS_READY6   : out std_logic;
        
        S_AXIS_DATA7    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID7   : in std_logic;
        S_AXIS_READY7   : out std_logic;
        
        S_AXIS_DATA8    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID8   : in std_logic;
        S_AXIS_READY8   : out std_logic;
        
        S_AXIS_DATA9    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID9   : in std_logic;
        S_AXIS_READY9   : out std_logic;
        
        S_AXIS_DATA10    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID10   : in std_logic;
        S_AXIS_READY10   : out std_logic;
        
        S_AXIS_DATA11    : in STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        S_AXIS_VALID11   : in std_logic;
        S_AXIS_READY11   : out std_logic;

        M_AXIS_DATA      : out STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
        M_AXIS_VALID     : out std_logic;
        M_AXIS_READY     : in std_logic
    );
end entity;

architecture rtl of i_12_o_1_AXISTREAM is
    signal CNT_ROW : integer range 0 to 12;
    signal CNT_TIMES : integer range 0  to 320;

    type t_DATA_REG is array(0 to 11) of std_logic_vector(DATA_WIDTH-1 downto 0);
    signal DATA_REG : t_DATA_REG;

    type t_VALID_REG is array (0 to 11) of std_logic;
    signal VALID_REG : t_VALID_REG;

    --Flipflop as FIFO with one vacant
    signal FIFO1_DATA  : STD_LOGIC_VECTOR(DATA_WIDTH-1 downto 0);
    signal FIFO_1_READY  : std_logic;

begin

    DATA_REG(0) <= S_AXIS_DATA0;    
    VALID_REG(0) <= S_AXIS_VALID0;   
    S_AXIS_READY0 <= FIFO_1_READY; 

    DATA_REG(1) <= S_AXIS_DATA1    ;
    VALID_REG(1) <= S_AXIS_VALID1   ;
    S_AXIS_READY1 <= FIFO_1_READY  ;
    
    DATA_REG(2) <= S_AXIS_DATA2    ;
    VALID_REG(2) <= S_AXIS_VALID2   ;
    S_AXIS_READY2 <= FIFO_1_READY  ;
    
    DATA_REG(3) <= S_AXIS_DATA3    ;
    VALID_REG(3) <= S_AXIS_VALID3   ;
    S_AXIS_READY3 <= FIFO_1_READY ;
    
    DATA_REG(4) <= S_AXIS_DATA4    ;
    VALID_REG(4) <= S_AXIS_VALID4   ;
    S_AXIS_READY4 <= FIFO_1_READY  ;
    
    DATA_REG(5) <= S_AXIS_DATA5    ;
    VALID_REG(5) <= S_AXIS_VALID5   ;
    S_AXIS_READY5 <= FIFO_1_READY  ;
    
    DATA_REG(6) <= S_AXIS_DATA6    ;
    VALID_REG(6) <= S_AXIS_VALID6   ;
    S_AXIS_READY6 <= FIFO_1_READY  ;
    
    DATA_REG(7) <= S_AXIS_DATA7    ;
    VALID_REG(7) <= S_AXIS_VALID7   ;
    S_AXIS_READY7 <= FIFO_1_READY  ;
    
    DATA_REG(8) <= S_AXIS_DATA8    ;
    VALID_REG(8) <= S_AXIS_VALID8   ;
    S_AXIS_READY8 <= FIFO_1_READY ;
    
    DATA_REG(9) <= S_AXIS_DATA9    ;
    VALID_REG(9) <= S_AXIS_VALID9   ;
    S_AXIS_READY9 <= FIFO_1_READY  ;
    
    DATA_REG(10) <= S_AXIS_DATA10    ;
    VALID_REG(10) <= S_AXIS_VALID10   ;
    S_AXIS_READY10 <= FIFO_1_READY  ;
    
    DATA_REG(11) <= S_AXIS_DATA11    ;
    VALID_REG(11) <= S_AXIS_VALID11   ;
    S_AXIS_READY11 <= FIFO_1_READY  ;


    FIFO_1_READY <= M_AXIS_READY;
    RECEI_DATA_FROM_S : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            M_AXIS_VALID <= VALID_REG(CNT_ROW);
            if FIFO_1_READY = '1' and VALID_REG(CNT_ROW) = '1' then
                FIFO1_DATA <= DATA_REG(CNT_ROW);
            end if;
        end if;
    end process;

    M_AXIS_DATA <= FIFO1_DATA;

    DATA_CNT_PROC : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                CNT_TIMES <= 0;
            elsif FIFO_1_READY = '1' and VALID_REG(CNT_ROW) = '1' then
                if CNT_TIMES = 319 then
                    CNT_TIMES <= 0;
                else
                    CNT_TIMES <= CNT_TIMES + 1;
                end if;
            end if;
        end if;
    end process;

    RD_ROW_PROC : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                CNT_ROW <= 0;
            elsif FIFO_1_READY = '1' and VALID_REG(CNT_ROW) = '1' then
                if CNT_TIMES = 319 then
                    if CNT_ROW = 11 then
                        CNT_ROW <= 0;
                    else
                        CNT_ROW <= CNT_ROW + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
    

end architecture;