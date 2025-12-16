LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXI_BRIDGE_DECODE is
	GENERIC(
		
		--User generic
        --VGA bit number of each pixel
		VGA_ZEDBOARD : integer := 12;
	
		IMAGE_HEIGHT : integer := 240;
		
		IMAGE_WIDTH : integer := 320
	);
	PORT(
	    
        
	  --Input from AXI_SLAVE - driven by test-bench
        S_AXI_ACLK,S_AXI_ARESETN : in std_logic;
        AXI_SLAVE_R0 : in std_logic_vector(31 downto 0);
        AXI_SLAVE_R1 : in std_logic_vector(31 downto 0);
        WR_TO_SLAVE_REG_EN : in std_logic;	
		
		--one compressed pixel with R-G-B 4x3 = 12bits.
		i_DATA : out std_logic_vector(VGA_ZEDBOARD-1 downto 0);			
		i_WRITE : out std_logic;
		i_READ : out std_logic;
		
		--8-bit lines from 0 to 239 and 9 bits row from 0 to 319
		ADDRESS : out std_logic_vector(16 downto 0);
		
        READ_EN : in std_logic;
		o_DATA : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);
        VALID_RD_DATA : in std_logic;
		--
		DONE_WRITE : in std_logic)
        ;
end entity;
	
architecture RTL of AXI_BRIDGE_DECODE is
    signal DECODE_EN,VALID_RD_DATA_SIGN : std_logic;
    signal WR_CMD,RD_CMD : std_logic;
    signal COMMANDnADDR_REG,DATA_REG : std_logic_vector(31 downto 0);
begin
   --USERs can write processes here
   COMMANDnADDR_REG <= AXI_SLAVE_R0;
   DATA_REG <= AXI_SLAVE_R1;

   DECODE_COMMAND : process(S_AXI_ACLK)
   begin
       if rising_edge(S_AXI_ACLK) then
           if S_AXI_ARESETN = '0' then    
               DECODE_EN <= '1';
           elsif (WR_TO_SLAVE_REG_EN = '1' and DECODE_EN = '1') then
               DECODE_EN <= '0';
           elsif (COMMANDnADDR_REG(18) = '1' and DECODE_EN = '0') then
               DECODE_EN <= '1';
               case COMMANDnADDR_REG(17) is
                   when '0' =>
                       RD_CMD <= '1';
                       WR_CMD <= '0';
                   when '1' =>
                       RD_CMD <= '0';
                       WR_CMD <= '1';
                   when others =>
                       RD_CMD <= '0';
                       WR_CMD <= '0';
               end case;
           else
               DECODE_EN <= '1';
               RD_CMD <= '0';
               WR_CMD <= '0';
           end if;
       end if;
   end process;


   i_WRITE <= WR_CMD;
   i_READ <= RD_CMD;
   ADDRESS <= COMMANDnADDR_REG(16 downto 0);

   --Need to compress data from 24 to 12b.
   --Register 1 who contains 24 bit data
   WR_DATA_TO_BLOCK_RAM: process(WR_CMD,DATA_REG)
   begin
       i_DATA <= (others => '0');
       if WR_CMD = '1' then 
           i_DATA(11 downto 8) <= DATA_REG(23 downto 20);
           i_DATA(7 downto 4) <= DATA_REG(15 downto 12);
           i_DATA(3 downto 0) <= DATA_REG(7 downto 4);
       end if;
   end process;
               
   --RD_DATA_FROM_BLOCK_RAM
   VALID_RD_DATA_SIGN <= VALID_RD_DATA;
   --------------------------------
end architecture;