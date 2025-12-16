----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Duy-Manh NGUYEN
-- 
-- Create Date: 04/30/2024 02:32:56 PM
-- Design Name: 
-- Module Name: AXI_LITE_SLAVE - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Follow the xilinx slave example
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- https://www.realdigital.org/doc/a9fee931f7a172423e1ba73f66ca4081
-- https://docs.amd.com/v/u/en-US/axi_lite_ipif_ds765
-- https://docs.amd.com/v/u/en-US/pg155-axi-lite-ipif
-- How to perform Read and Write AXI-LITE in C Vitis : https://www.youtube.com/watch?v=MbteffkRi8Y
----------------------------------------------------------------------------------



LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;



entity AXI_LITE_SLAVE is
	GENERIC(
		
		--User generic

        DATA_WIDTH : integer := 32;
        --VGA bit number of each pixel
		VGA_ZEDBOARD : integer := 12;
	
		IMAGE_HEIGHT : integer := 240;
		
		IMAGE_WIDTH : integer := 320;
		
		GRAY_SCALE : integer := 8	
	);
	PORT(
	    
	    --USER Input and Output	
        S_AXI_ACLK,S_AXI_ARESETN : in std_logic; 

		
        --Vitis writes 4 registers
        REG00,REG01,REG02,REG03 : in std_logic_vector(31 downto 0);
        REG_ADDR : in std_logic_vector(1 downto 0);
        COMMANDER : in std_logic;

		--AXI sets threshold
		THRESHOLD_TOP : out std_logic_vector(17 downto 0);
		
        --AXI controls all access
        ACCESS_CONTROL : out std_logic_vector(1 downto 0);

        ------------AXI connects to COLOR_BRAM------------------
        AXI_WRDATA_COLOR_BRAM : out std_logic_vector(VGA_ZEDBOARD-1 downto 0);
        AXI_WRREQUEST_COLOR_BRAM : out std_logic;
        DONE_WRITE_COLOR_BRAM_SIGN : in std_logic;

        AXI_WRADDR_2COLORBRAM : out std_logic_vector(16 downto 0);
        AXI_RDREQUEST_COLORBRAM : out std_logic;
        AXI_RECV_DATA_FR_COLORBRAM : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);
        -------------------------------------------------------

        ----------AXI controls RGB to GRAY process---------
        AXI_START_RGB2GRAY : out std_logic;
        ----------------------------------

        ----------AXI connects to GRAY_BRAM-----------------
        DONE_WRITE_GRAY_BRAM_SIGN : in std_logic;

        AXI_RDADDR_2GRAYBRAM : out std_logic_vector(16 downto 0);
        AXI_RDREQUEST_GRAYBRAM : out std_logic;
        AXI_RECV_DATA_FR_GRAYBRAM : in std_logic_vector(GRAY_SCALE-1 downto 0);
        ---------------------------------------------------

        ------AXI controls GRAY to SOBEL process------------
        AXI_START_GRAY2SOBEL : out std_logic;
        DONE_PROCESSING_SOBEL : in std_logic;
        ----------------------------------------------------

        --------------------AXI connects Sobel Bram--------------
        RD_REQUEST_FR_AXI : out std_logic;
        SOBEL_DATA_2AXI : in std_logic_vector(7 downto 0);

        AXI_RDADDR_2SOBELBRAM : out std_logic_vector(16 downto 0)
        -------------------------------------------------------

		
	);
	
end entity;

architecture RTL of AXI_LITE_SLAVE is

	--4 registers, can reach to 32 registers like Xilinx
	signal AXI_SLAVE_R0, AXI_SLAVE_R1, AXI_SLAVE_R2, AXI_SLAVE_R3: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
	
	--Enable write to slave
	signal WR_TO_SLAVE_REG_EN : std_logic;
	--Enable read from slave.
	signal RD_FROM_SLAVE_REG_EN : std_logic;
	
    --User signal
    
    --for color bram
    signal COMMANDnADDR_REG : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal DATA_REG         : std_logic_vector(DATA_WIDTH-1 downto 0); 
    signal VALID_RD_DATA,RD_CMD,WR_CMD : std_logic;
    signal DECODE_EN : std_logic;
    
    signal GRAYorSOBEL_DECODE_EN,GRAY_RD_CMD,SOBEL_RD_CMD : std_logic;
    
    signal VALID_RD_DATA_FROM_COLOR_BRAM,VALID_RD_DATA_FROM_GRAY_BRAM,VALID_RD_DATA_FROM_SOBEL_BRAM : std_logic;

    
    --Signals for Register3
    signal EN_REG03, RD_DATA_REG03, RD_GRAY_or_SOBEL: std_logic;
    
    --Signals for Register2
    signal START_PROCESSING_DECODE_EN,EN_REG02 : std_logic;
    
begin

    WR_TO_SLAVE_REG_EN <= COMMANDER;
                                     
    WR_TO_SLAVE_REG : process(S_AXI_ACLK)
    begin
    	if rising_edge(S_AXI_ACLK) then
    		if S_AXI_ARESETN = '0' then
    			AXI_SLAVE_R0 <= (others => '0');
    			AXI_SLAVE_R1 <= (others => '0');
    			AXI_SLAVE_R2 <= (others => '0');
    			AXI_SLAVE_R3 <= (others => '0');
			else
				if WR_TO_SLAVE_REG_EN = '1' then
					case (REG_ADDR) is
						when "00" =>
							AXI_SLAVE_R0 <= REG00;
						when "01" =>
							AXI_SLAVE_R1 <= REG01;
						when "10" =>
							AXI_SLAVE_R2 <= REG02;
						when "11" =>
							AXI_SLAVE_R3 <= REG03;
				    	when others =>
    		    			AXI_SLAVE_R0 <= AXI_SLAVE_R0;
							AXI_SLAVE_R1 <= AXI_SLAVE_R1;
							AXI_SLAVE_R2 <= AXI_SLAVE_R2;
							AXI_SLAVE_R3 <= AXI_SLAVE_R3;
					end case;							
			    elsif VALID_RD_DATA_FROM_COLOR_BRAM = '1' then
			        AXI_SLAVE_R1(DATA_WIDTH-1 downto 12) <= (others => '0');
			        AXI_SLAVE_R1(11 downto 0) <= AXI_RECV_DATA_FR_COLORBRAM;
			        
			        --Fresh data from Color Bram, need to clear when read it by software
			        AXI_SLAVE_R1(31) <= '1';
			        
                elsif VALID_RD_DATA_FROM_GRAY_BRAM = '1' then
                    AXI_SLAVE_R3(7 downto 0) <= AXI_RECV_DATA_FR_GRAYBRAM;
                     
			        --Fresh data from Gray Bram, need to clear when read it by software
			        AXI_SLAVE_R3(31) <= '1';
			    elsif VALID_RD_DATA_FROM_SOBEL_BRAM = '1' then
                    AXI_SLAVE_R3(7 downto 0) <= SOBEL_DATA_2AXI;
                     
			        --Fresh data from Sobel Bram, need to clear when read it by software
			        AXI_SLAVE_R3(31) <= '1';			    
			    elsif DONE_PROCESSING_SOBEL = '1' then
			        AXI_SLAVE_R2(2) <= '1';                
                elsif DONE_WRITE_GRAY_BRAM_SIGN = '1' then
                    AXI_SLAVE_R2(1) <= '1';
                elsif DONE_WRITE_COLOR_BRAM_SIGN = '1' then
                    AXI_SLAVE_R2(0) <= '1';
				end if;
			end if;
		end if;					
    end process;

    
    --USERs can write processes here
    
----------------------------------Color Bram Operations-------------------------------------------    
    COMMANDnADDR_REG <= AXI_SLAVE_R0;
    DATA_REG <= AXI_SLAVE_R1;

    DECODE_COMMAND_FOR_COLOR_BRAM : process(S_AXI_ACLK)
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


    AXI_WRREQUEST_COLOR_BRAM <= WR_CMD;
    AXI_RDREQUEST_COLORBRAM <= RD_CMD;
    AXI_WRADDR_2COLORBRAM <= COMMANDnADDR_REG(16 downto 0);

    --Need to compress data from 24 to 12b.
    --Register 1 who contains 24 bit data
    WR_DATA_TO_COLOR_BRAM: process(WR_CMD,DATA_REG)
    begin
        AXI_WRDATA_COLOR_BRAM <= (others => '0');
        if WR_CMD = '1' then 
            AXI_WRDATA_COLOR_BRAM(11 downto 8) <= DATA_REG(23 downto 20);
            AXI_WRDATA_COLOR_BRAM(7 downto 4) <= DATA_REG(15 downto 12);
            AXI_WRDATA_COLOR_BRAM(3 downto 0) <= DATA_REG(7 downto 4);
        end if;
    end process;
    
    --After one cycle clk of RD_CMD is on, Data will be available at AXI_RD_DATA
    RD_DATA_FROM_COLOR_BRAM: process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            VALID_RD_DATA_FROM_COLOR_BRAM <= RD_CMD;
        end if;
    end process;
            
                
----------------------------------END:Color Bram Operations------------------------------------------- 

----------------------------------AXI controls accessing and processing Operations at REG02 :: START-------------------------------------------
    ACCESS_CONTROL <= AXI_SLAVE_R2(31 downto 30);
    EN_REG02 <= AXI_SLAVE_R2(27);
    DECODE_COMMAND_START_PROCESSING: process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then
                AXI_START_GRAY2SOBEL <= '0';
                AXI_START_RGB2GRAY <= '0';
                START_PROCESSING_DECODE_EN <= '1';
            elsif (WR_TO_SLAVE_REG_EN = '1' and START_PROCESSING_DECODE_EN = '1') then
                START_PROCESSING_DECODE_EN <= '0';
                AXI_START_GRAY2SOBEL <= '0';
                AXI_START_RGB2GRAY <= '0';
            elsif EN_REG02 = '1' and START_PROCESSING_DECODE_EN = '0' then
                START_PROCESSING_DECODE_EN <= '1';
                case AXI_SLAVE_R2(29 downto 28) is
                    when "11" =>
                        AXI_START_GRAY2SOBEL <= '1';
                        AXI_START_RGB2GRAY <= '1';
                    when "10" =>
                        AXI_START_GRAY2SOBEL <= '1';
                        AXI_START_RGB2GRAY <= '0';
                    when "01" =>
                        AXI_START_GRAY2SOBEL <= '0';
                        AXI_START_RGB2GRAY <= '1';
                    when others => 
                        AXI_START_GRAY2SOBEL <= '0';
                        AXI_START_RGB2GRAY <= '0';
                end case;
            else
                START_PROCESSING_DECODE_EN <= '1';
                AXI_START_GRAY2SOBEL <= '0';
                AXI_START_RGB2GRAY <= '0';
            end if;
        end if;                                         
    end process;                       
                            
----------------------------------AXI controls state and processing Operations :: END-------------------------------------------
    
    --Slave reg03 is dedicated to read data from sobel/gray block after processing.
    
    EN_REG03 <= AXI_SLAVE_R3(26);
    RD_DATA_REG03 <= AXI_SLAVE_R3(25);
    RD_GRAY_or_SOBEL <= AXI_SLAVE_R3(30);
    DECODE_COMMAND_GRAYorSOBEL_BRAM : process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then    
                GRAYorSOBEL_DECODE_EN <= '1';
                GRAY_RD_CMD <= '0';
                SOBEL_RD_CMD <= '0';              
            elsif (WR_TO_SLAVE_REG_EN = '1' and GRAYorSOBEL_DECODE_EN = '1') then
                GRAYorSOBEL_DECODE_EN <= '0';
                GRAY_RD_CMD <= '0';
                SOBEL_RD_CMD <= '0'; 
            elsif (EN_REG03 = '1' and GRAYorSOBEL_DECODE_EN = '0') then
                GRAYorSOBEL_DECODE_EN <= '1';
                GRAY_RD_CMD <= '0';
                SOBEL_RD_CMD <= '0';
                if RD_DATA_REG03 = '1' then
                    if RD_GRAY_or_SOBEL = '1' then
                        GRAY_RD_CMD <= '1';
                        SOBEL_RD_CMD <= '0';
                    elsif RD_GRAY_or_SOBEL = '0' then
                        GRAY_RD_CMD <= '0';
                        SOBEL_RD_CMD <= '1';
                    else
                        GRAY_RD_CMD <= '0';
                        SOBEL_RD_CMD <= '0';
                    end if;
                end if;                                     
            else
                GRAYorSOBEL_DECODE_EN <= '1';
                GRAY_RD_CMD <= '0';
                SOBEL_RD_CMD <= '0';
            end if;
        end if;
    end process;
    
    AXI_RDREQUEST_GRAYBRAM <= GRAY_RD_CMD;
    AXI_RDADDR_2GRAYBRAM <= AXI_SLAVE_R3(24 downto 8);
    
    RD_REQUEST_FR_AXI <= SOBEL_RD_CMD;
    AXI_RDADDR_2SOBELBRAM <= AXI_SLAVE_R3(24 downto 8);

    --After one cycle clk of GRAY_RD_CMD is on, Data will be available at DATA_FR_GRAY_BRAM
    RD_DATA_FROM_GRAY_BRAM: process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            VALID_RD_DATA_FROM_GRAY_BRAM <= GRAY_RD_CMD;
            VALID_RD_DATA_FROM_SOBEL_BRAM <= SOBEL_RD_CMD;
        end if;
    end process;  
    
    --Set threshold
    THRESHOLD_TOP <= AXI_SLAVE_R2(20 downto 3);
------------------------------------------------------------------
    
end architecture;