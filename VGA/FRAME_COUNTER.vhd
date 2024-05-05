--05/05/2024 Non confirm and check syntax yet.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FRAME_COUNTER is
    generic(
    		SYS_CLK : integer := 100; --100MHz
            HMAX : integer := 640;
            VMAX : integer := 480;
             )
    port(
         i_CLK   : in std_logic;
         i_RST_n : in std_logic;
         SYNC_CLR: in std_logic;
         HC      : out std_logic_vector(10 downto 0);
         VC      : out std_logic(10 downto 0)
         FRAME_START : out std_logic;
         FRAME_END   : out std_logic             
);

end entity;

architecture RTL of FRAME_COUNTER is
	signal TICK_25M : std_logic;
	
	signal HC_REG,HC_NX : unsigned(10 downto 0);
	signal VC_REG,VC_NX : unsigned(10 downto 0);
	
begin

	--CLK divider divides 100MHz to 25MHz
    CLK_DIV : process(i_CLK,i_RST_n)
    	signal COUNT : integer range 0 to COUNT_MAX;
    	signal COUNT_MAX : integer := 3;
	begin
		if i_RST_n = '0' then
			COUNT <= 0;
			TICK_25M <= '0';
		else
			if rising_edge(i_CLK) then
				COUNT <= COUNT + 1;
				TICK_25M <= '0';
				if COUNT = COUNT_MAX then
					COUNT <= 0;
					TICK_25M = '1';
				end if;
			end if;
		end if;
	end process;
	
	--CONTROL HC and VC bus.
	STATE REGIS : process(i_CLK,i_RST_n)
	begin
		if i_RST_n = '0' then
			HC_REG <= (others => '0');
			VC_REG <= (others => '0');
		elsif rising_edge(i_CLK) then
			if SYNC_CLR = '1' then
				HC_REG <= (others => '0');
				VC_REG <= (others => '0');
			else 
				HC_REG <= HC_NX;
				HC_REG <= HC_NX;
			end if;
		end if;					
	end process;
	
	HC_INCREASE : process (TICK_25M,HC_REG)
	begin
		HC_NX <= HC_REG;
		if TICK_25M = '1' then
			HC_NX <= HC_REG + 1;
			if HC_REG = HMAX - 1 then
				HC_NX <= (others => '0');
			end if;
		end if;
	end process;
	
	VC_INCREASE : process (TICK_25M,VC_REG)
	begin
		VC_NX <= VC_REG;
		if (TICK_25M = '1' and HC_REG = HMAX - 1) then
			VC_NX <= VC_REG + 1;
			if VC_REG = VMAX - 1 then
				VC_NX <= (others => '0');
			end if;
		end if;
	end process;
	
	HC <= std_logic_vector(HC_REG);
	VC <= std_logic_vector(VC_REG);
	
	FRAME_START <= '1' when HC_REG = (others => '0') and VC_REG = (others => '0');
	FRAME_END <= '1' when HC_REG = HMAX - 1 and VC_REG = VMAX - 1;
	
end architecture;
