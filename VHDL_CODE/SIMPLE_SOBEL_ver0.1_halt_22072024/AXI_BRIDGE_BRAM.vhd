library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXI_BRIDGE_BRAM is
	generic(
		--Image resolution = 1/4 vga = 320x240 = 76_800 => need 17 bits for address -> take 19 bits for full VGA.
        --so full VGA is 2^19 = 524_288
        --Full VGA is fail because of size of FPGA, that cost 320 Block Ram, but we only have 280.
        --Finally come back with 1/4 VGA => 17 bit
		IMAGE_WIDTH : integer := 320;
		IMAGE_HEIGHT : integer := 240;
		
		--VGA bit number of each pixel
		VGA_ZEDBOARD : integer := 12
	);
	port(
		S_AXI_ACLK : in std_logic;
		S_AXI_ARESETN : in std_logic;
        AXI_SLAVE_R0 : in std_logic_vector(31 downto 0);
        AXI_SLAVE_R1 : in std_logic_vector(31 downto 0);
        AXI_SLAVE_R3 : in std_logic_vector(31 downto 0);
        WR_TO_SLAVE_REG_EN : in std_logic;
		

        ------------------------The ports who connect to Gray Bram----------------------
        GRAY_RDADDRESS : out std_logic_vector(16 downto 0);
        GRAY_READ : out std_logic;
        i_GRAY_DATA : in std_logic_vector(7 downto 0);
        --------------------------------------------------------------------------------


        ------------------------The ports who connect to Color Bram----------------------
		--one compressed pixel with R-G-B 4x3 = 12bits.
		i_DATA : out std_logic_vector(VGA_ZEDBOARD-1 downto 0);
		
		--ADDRESS PIXEL is 19 bits wide.
		ADDRESS : out std_logic_vector(16 downto 0);		
		i_WRITE : out std_logic;
		i_READ : out std_logic;
		o_DATA : in std_logic_vector(VGA_ZEDBOARD-1 downto 0)
        --------------------------------------------------------------------------------
		);
end entity;

architecture RTL of AXI_BRIDGE_BRAM is

    signal COMMANDnADDR_REG,DATA_REG : std_logic_vector(31 downto 0);
    signal DECODE_EN : std_logic;
    signal WR_CMD,RD_CMD : std_logic;
    signal VALID_RD_DATA : std_logic;
    signal READ_EN : std_logic;
    signal GRAY_DECODE_EN,GRAY_RD_CMD : std_logic;
begin
    --USERs can write processes here
    COMMANDnADDR_REG <= AXI_SLAVE_R0;
    DATA_REG <= AXI_SLAVE_R1;

    DECODE_COMMAND_COLOR_BRAM : process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then    
                DECODE_EN <= '1';
                RD_CMD <= '0';
                WR_CMD <= '0';                
            elsif (WR_TO_SLAVE_REG_EN = '1' and DECODE_EN = '1') then
                DECODE_EN <= '0';
                RD_CMD <= '0';
                WR_CMD <= '0';
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

    RD_DATA_FROM_BLOCK_RAM: process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then
                VALID_RD_DATA <= '0';
            elsif RD_CMD = '1' then
                VALID_RD_DATA <= '1';
            else
                VALID_RD_DATA <= '0';
            end if;
        end if; 
    end process;    


    --Slave reg03 is dedicated to read data from gray block after processing.
    DECODE_COMMAND_GRAY_BRAM : process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then    
                GRAY_DECODE_EN <= '1';
                GRAY_RD_CMD <= '0';               
            elsif (WR_TO_SLAVE_REG_EN = '1' and GRAY_DECODE_EN = '1') then
                GRAY_DECODE_EN <= '0';
                GRAY_RD_CMD <= '0';
            elsif (AXI_SLAVE_R3(31) = '1' and GRAY_DECODE_EN = '0') then
                GRAY_DECODE_EN <= '1';
                GRAY_RD_CMD <= '1';
            else
                GRAY_DECODE_EN <= '1';
                GRAY_RD_CMD <= '0';
            end if;
        end if;
    end process;

    GRAY_READ <= GRAY_RD_CMD;
    GRAY_RDADDRESS <= AXI_SLAVE_R3(24 downto 8);

end RTL ; --AXI_BRIDGE_BRAM