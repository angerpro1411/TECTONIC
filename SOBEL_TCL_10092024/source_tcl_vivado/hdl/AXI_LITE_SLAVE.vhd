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
        --VGA bit number of each pixel
		VGA_ZEDBOARD : integer := 12;
	
		IMAGE_HEIGHT : integer := 240;
		
		IMAGE_WIDTH : integer := 320;
		
		GRAY_SCALE : integer := 8;
		
		
		
		
		
		DATA_WIDTH		: integer := 32;
		STROBE_WIDTH	: integer := 4;--datawidth/8
		
		--Correspond to number of registers.
		--For example, ADDress_WIDTH = 4 bits, we lose 2 bit for addrlsb, so we have 2 bits left for address register => 2^2 = 4 register.
		--As we always lose 2 bit for ADDRLSB with 32b system, if we want to have 32 registers => it means 5 bit address regis, so total 2+5=7 bit for address width 
		ADDRESS_WIDTH	: integer := 5;
		
		
        -- Example-specific design signals
        -- local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
        -- ADDR_LSB is used for addressing 32/64 bit registers/memories
        -- ADDR_LSB = 2 for 32 bits address(n downto 2)
        -- ADDR_LSB = 3 for 64 bits address(n downto 3)		
		
		-- 4 configuration words, System 32-b byte addressable  
		-----------------------------------
		--|   8   |   8   |   8   |    8   |    => one word = 32 bits
		----------------------------------
		--With 32 bit data, we need 2-bits address(total 2^2 = 4 addresses) to addressing each 8 bit in one word 32 bits.
		--With 64 bit data, we need 3-bits address(total 2^3 = 8 addresses) to addressing each 8 bit in one word 64 bits.
		ADDRLSB			: integer := 2 -- log2(DATA_WIDTH) - 3	= log2(32) - 3 = 5-3 =2
		
		
		
	);
	PORT(
	    
	  --USER Input and Output	
		
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

        AXI_RDADDR_2SOBELBRAM : out std_logic_vector(16 downto 0);
        --------------------------------------------------------
        
        --------------------Finish image signals :: START -------------------
        DONE_IMAGE: out std_logic;
        --------------------Finish image signals :: END -------------------
    
		----------------------------Global signal----------------------------
		S_AXI_ACLK 		: in std_logic;
		S_AXI_ARESETN		: in std_logic;
		
		----------------------------Write address channel----------------------------
		
		--Write address valid. Indicate that Master signaling valid address and control information.
		S_AXI_AWVALID		: in std_logic;
		
		--Write address ready. Indicate that Slave is ready to accept an address.
		S_AXI_AWREADY		: out std_logic;
		
		--Write address, issue by master, accepted by slave.
		S_AXI_AWADDR		: in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
			
		----------------------------Write data channel----------------------------
		
		--Writa date, issue by Master, accepted by Slave.
		S_AXI_WDATA		: in std_logic_vector(DATA_WIDTH-1 downto 0);
		
		--Write strobe. Indicate which bytes lane hold valid data. Each bit
		--of strobe corressponde to one byte valid data. Check code for deeply understanding.
		S_AXI_WSTRB		: in std_logic_vector(STROBE_WIDTH-1 downto 0);
		
		--Write valid. Indicate valid data is on bus and strobes are available
		S_AXI_WVALID		: in std_logic;
		
		--Write ready. Slave is ready to accept data.
		S_AXI_WREADY		: out std_logic;
		
		----------------------------Write response channel----------------------------
		
		--Response ready. Master can accept the response without problem.
		S_AXI_BREADY		: in std_logic;
		
		--Write response valid. Signaling that the write reponse is valid.
		S_AXI_BVALID		: out std_logic;
		
		--Write response. The status of write transaction "Good, ...." 4 result for 2-bit.
		S_AXI_BRESP		: out std_logic_vector(1 downto 0);
		
		------------------------------Read address channel----------------------------
		
		--Read Address. issue by Master, accepted by Slave.
		S_AXI_ARADDR		: in std_logic_vector(ADDRESS_WIDTH-1 downto 0);
				
		--Read address valid. address from Master is valid, and Slave can accept it.
		S_AXI_ARVALID		: in std_logic;
		
		--Read address ready. Slave is ready to accept the read address from Master.
		S_AXI_ARREADY	: out std_logic;
		
		------------------------------Read data channel----------------------------
		
		--Read data, issued by Slave, Master accept it.
		S_AXI_RDATA		: out std_logic_vector(DATA_WIDTH-1 downto 0);
		
		--Read response. Status of read transaction.
		S_AXI_RRESP		: out std_logic_vector(1 downto 0);
			
		--Read valid, signaling data from Slave is fresh and Master can accept it.
		S_AXI_RVALID		: out std_logic;
		
		--Read ready, Master is ready to receive the data from Slave.
		S_AXI_RREADY		: in std_logic -- Master tells ready to read
		
	);
	
end entity;

architecture RTL of AXI_LITE_SLAVE is

	--functions
	function APPLY_W_STRB(
		OLD_DATA : std_logic_vector(DATA_WIDTH-1 downto 0);
		NEW_DATA : std_logic_vector(DATA_WIDTH-1 downto 0);
		WRITE_STROBE : std_logic_vector(STROBE_WIDTH-1 downto 0)
	)	return std_logic_vector is
		
		variable TMP : std_logic_vector(DATA_WIDTH-1 downto 0);
		begin
			for I in 0 to STROBE_WIDTH-1 loop
				if (WRITE_STROBE(I) = '1') then
					TMP(8*(I+1)-1 downto 8*I) := NEW_DATA(8*(I+1)-1 downto 8*I);
				else 
					TMP(8*(I+1)-1 downto 8*I) := OLD_DATA(8*(I+1)-1 downto 8*I);
				end if;
			end loop;
				return TMP;
	end function APPLY_W_STRB;
	
	--4 registers, can reach to 32 registers like Xilinx
	signal AXI_SLAVE_R0, AXI_SLAVE_R1, AXI_SLAVE_R2, AXI_SLAVE_R3, AXI_SLAVE_R4, AXI_SLAVE_R5, AXI_SLAVE_R6, AXI_SLAVE_R7: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
	
	--AXILITE signals to transactions
	signal WRITEnAWRITE_VALID_EN: std_logic;
	signal B_HANDSHAKE_EN : std_logic;
	
	signal AR_HANDSHAKE_EN: std_logic;
	signal R_HANDSHAKE_EN: std_logic;
	
	signal AWADDR_REG : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	signal ARADDR_REG : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	
	--Enable write to slave
	signal WR_TO_SLAVE_REG_EN : std_logic;
	--Enable read from slave.
	signal RD_FROM_SLAVE_REG_EN : std_logic;
	
	--AW_EN uses to write data one cycle after 
	signal AW_EN : std_logic;
	
	--buffer signals for output
    signal AXI_BVALID,AXI_AWREADY,AXI_WREADY,AXI_ARREADY,AXI_RVALID : std_logic;

    --User signal
    
    --for color bram
    signal COMMANDnADDR_REG : std_logic_vector(DATA_WIDTH-1 downto 0);
    signal DATA_REG         : std_logic_vector(DATA_WIDTH-1 downto 0); 
    signal VALID_RD_DATA,RD_CMD,WR_CMD : std_logic;
    signal DECODE_EN : std_logic;
    
    signal GRAYorSOBEL_DECODE_EN,GRAY_RD_CMD,SOBEL_RD_CMD : std_logic;
    
    signal VALID_RD_DATA_FROM_COLOR_BRAM,VALID_RD_DATA_FROM_GRAY_BRAM,VALID_RD_DATA_FROM_SOBEL_BRAM : std_logic;

	--Read registers
	signal WADDRESSING_REGISTER : std_logic_vector(ADDRESS_WIDTH-1 downto ADDRLSB);
	signal STATUS_REGISTER : std_logic_vector(31 downto 0):= (others => '0') ;
	signal READ_DATA_REG : std_logic_vector(31 downto 0);
	
	--En registers
	signal START_PROC_EN,START_RST_DNSOBEL,START_RST_DNGRAY,START_RST_DNCOLOR,EN_RST_VALID_FRESH_DATA : std_logic;
	
	--Reset done signals
	signal RST_DONE_PROCESSING_SOBEL,RST_DONE_WRITE_GRAY_BRAM_SIGN,RST_DONE_WRITE_COLOR_BRAM_SIGN,RST_VALID_FRESH_DATA : std_logic;


begin

    --Connect buffers and outputs
    S_AXI_BVALID <= AXI_BVALID;
    S_AXI_AWREADY <= AXI_AWREADY;
    S_AXI_WREADY <= AXI_WREADY;
    S_AXI_ARREADY <= AXI_ARREADY;
    S_AXI_RVALID <= AXI_RVALID;
    WADDRESSING_REGISTER <= AWADDR_REG(ADDRESS_WIDTH-1 downto ADDRLSB);

    WRITEnAWRITE_VALID_EN <= '1' when (S_AXI_WVALID = '1' and S_AXI_AWVALID = '1') else '0';
    B_HANDSHAKE_EN <= '1' when (S_AXI_BREADY = '1' and AXI_BVALID = '1') else '0';
   
    AWREADY_CONTROL : process (S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then
                AXI_AWREADY <= '0';
                AW_EN <= '1';
            else
                --First condition makes sure that no AWREADY is high before one cycle,
                --avoid the duplicate address write or wrong address write.
                if (AXI_AWREADY = '0' and WRITEnAWRITE_VALID_EN = '1' and AW_EN ='1') then
                    AXI_AWREADY <= '1';
                    AW_EN <= '0';
                elsif B_HANDSHAKE_EN = '1' then
                    AXI_AWREADY <= '0'; --stop to read the address Write
                    AW_EN <= '1';--enable data into register to finish transaction.
                else --This condition uses to terminate high level of S_AXI_AWREADY
                --Even if B_HANDSHAKE_EN doesn't happend, S_AXI_AWREADY only high in one single clock.
                    AXI_AWREADY <= '0';
                end if;
            end if;
        end if;                  
    end process;
   
    --synchonize WREADY and AWREADY
    AXI_WREADY <= AXI_AWREADY;
   
    --Write address write into register when WRITEnAWRITE_VALID_EN is high
    ADDRESS_WRITE_TO_REGIS: process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then
               AWADDR_REG <= (others => '0');
            else
                if (AXI_AWREADY = '0' and WRITEnAWRITE_VALID_EN = '1' and AW_EN ='1') then
                    AWADDR_REG <= S_AXI_AWADDR;
                end if;
            end if;
        end if;
    end process;
   
    --Slave register write enable is asserted when valid and ready handshake
    WR_TO_SLAVE_REG_EN <= '1' when (AXI_WREADY = '1' and AXI_AWREADY = '1'
                                    and WRITEnAWRITE_VALID_EN = '1') else '0';
                                    
    WR_TO_SLAVE_REG : process(S_AXI_ACLK)
    	variable LOC_ADDR : std_logic_vector(ADDRESS_WIDTH-ADDRLSB-1 downto 0);
    begin
    	if rising_edge(S_AXI_ACLK) then
    		if S_AXI_ARESETN = '0' then
    			AXI_SLAVE_R0 <= (others => '0');
    			AXI_SLAVE_R1 <= (others => '0');
    			AXI_SLAVE_R2 <= (others => '0');
    			AXI_SLAVE_R3 <= (others => '0');
    			AXI_SLAVE_R4 <= (others => '0');
    			AXI_SLAVE_R5 <= (others => '0');
    			AXI_SLAVE_R6 <= (others => '0');
    			AXI_SLAVE_R7 <= (others => '0');
			else
				LOC_ADDR := AWADDR_REG(ADDRESS_WIDTH-1 downto ADDRLSB);
				if WR_TO_SLAVE_REG_EN = '1' then
					case (LOC_ADDR) is
						when "000" =>
							AXI_SLAVE_R0 <= APPLY_W_STRB(AXI_SLAVE_R0,S_AXI_WDATA,S_AXI_WSTRB);
						when "001" =>
							AXI_SLAVE_R1 <= APPLY_W_STRB(AXI_SLAVE_R1,S_AXI_WDATA,S_AXI_WSTRB);
						when "010" =>
							AXI_SLAVE_R2 <= APPLY_W_STRB(AXI_SLAVE_R2,S_AXI_WDATA,S_AXI_WSTRB);
						when "011" =>
							AXI_SLAVE_R3 <= APPLY_W_STRB(AXI_SLAVE_R3,S_AXI_WDATA,S_AXI_WSTRB);
						when "100" =>
							AXI_SLAVE_R4 <= APPLY_W_STRB(AXI_SLAVE_R4,S_AXI_WDATA,S_AXI_WSTRB);
						when "101" =>
							AXI_SLAVE_R5 <= APPLY_W_STRB(AXI_SLAVE_R5,S_AXI_WDATA,S_AXI_WSTRB);
						when "110" =>
							AXI_SLAVE_R6 <= APPLY_W_STRB(AXI_SLAVE_R6,S_AXI_WDATA,S_AXI_WSTRB);
						when "111" =>
							AXI_SLAVE_R7 <= APPLY_W_STRB(AXI_SLAVE_R7,S_AXI_WDATA,S_AXI_WSTRB);																												
				    	when others =>
    		    			AXI_SLAVE_R0 <= AXI_SLAVE_R0;
							AXI_SLAVE_R1 <= AXI_SLAVE_R1;
							AXI_SLAVE_R2 <= AXI_SLAVE_R2;
							AXI_SLAVE_R3 <= AXI_SLAVE_R3;
							AXI_SLAVE_R4 <= AXI_SLAVE_R4;
							AXI_SLAVE_R5 <= AXI_SLAVE_R5;
							AXI_SLAVE_R6 <= AXI_SLAVE_R6;
							AXI_SLAVE_R7 <= AXI_SLAVE_R7;
					end case;			    
				end if;
			end if;
		end if;					
    end process;
    
    --Simplification the S_AXI_BRESP
    S_AXI_BRESP <= "00";
    
    WRITE_RESPONSE : process(S_AXI_ACLK)
    begin
    	if rising_edge(S_AXI_ACLK) then
    		if S_AXI_ARESETN = '0' then
    			AXI_BVALID <= '0';
    		else
    			--Check S_AXI_BVALID = '0' to make sure no duplicate data and previous transaction is done.
    			if (WR_TO_SLAVE_REG_EN = '1' and AXI_BVALID = '0') then
    				AXI_BVALID <= '1';
    			--Normally BREADY is always asserted high. Then S_AXI_BVALID will high only one cycle to 
    			--transfer the BRESP.
    			elsif B_HANDSHAKE_EN = '1' then
    				AXI_BVALID <= '0';
    			end if;
    		end if;
    	end if; 			  			
    end process;

	
	AREAD_VALID_CONTROL : process(S_AXI_ACLK)
	begin
		if rising_edge(S_AXI_ACLK) then
			if S_AXI_ARESETN = '0' then
				AXI_ARREADY <= '0';
			--Reset address at "1111"	
				ARADDR_REG <= (others => '1');
			else
				--Check S_AXI_ARREADY = '0' to make sure no duplicate data and previous transaction is done.
				if (AXI_ARREADY = '0' and S_AXI_ARVALID = '1') then
					AXI_ARREADY <= '1';
					--Latch Address into register.
					ARADDR_REG <= S_AXI_ARADDR;
				else
					--Make sure only raise ARREADY in one cycle clock.
					AXI_ARREADY <= '0';
				end if;
			end if;
		end if;				
	end process;

	--Simplification the S_AXI_RRESP
	S_AXI_RRESP <= "00";
	
	AR_HANDSHAKE_EN <= '1' when S_AXI_ARVALID = '1' and AXI_ARREADY = '1' else '0';
	R_HANDSHAKE_EN <= '1' when AXI_RVALID = '1' and S_AXI_RREADY = '1' else '0';
	
	READ_VALID_CONTROL : process(S_AXI_ACLK)
	begin
		if rising_edge(S_AXI_ACLK) then
			if S_AXI_ARESETN = '0' then
				AXI_RVALID <= '0';
			else
				--Check S_AXI_RVALID = '0' to make sure no duplicate data and previous transaction is done.
				if AXI_RVALID = '0' and AR_HANDSHAKE_EN = '1' and S_AXI_RREADY = '1' then
					AXI_RVALID <= '1';
				elsif R_HANDSHAKE_EN = '1' then
					AXI_RVALID <= '0';
				else
					AXI_RVALID <= '0';
				end if;
			end if;
		end if;			
	end process;
		
    --Slave register read enable is asserted when 
    -- 					AR_HANDSHAKE_EN = '1' and no R_VALID is on(transaction is done).   
    RD_FROM_SLAVE_REG_EN <= '1' when (AR_HANDSHAKE_EN = '1'
                                    and AXI_RVALID = '0') else '0';
                                    
    READ_FROM_SLAVE_REG : process(S_AXI_ACLK)
    	variable LOC_ADDR : std_logic_vector(ADDRESS_WIDTH-ADDRLSB-1 downto 0);
    begin
    	if rising_edge(S_AXI_ACLK) then
    		if S_AXI_ARESETN = '0' then
    			S_AXI_RDATA <= (others => '0');
			else
				LOC_ADDR := ARADDR_REG(ADDRESS_WIDTH-1 downto ADDRLSB);
				if (RD_FROM_SLAVE_REG_EN = '1') then
					case LOC_ADDR is
						when "000" =>
							S_AXI_RDATA <= AXI_SLAVE_R0;
						when "001" =>
							S_AXI_RDATA <= AXI_SLAVE_R1;
						when "010" =>
							S_AXI_RDATA <= AXI_SLAVE_R2;    			
						when "011" =>
							S_AXI_RDATA <= AXI_SLAVE_R3;
						when "100" =>
							S_AXI_RDATA <= READ_DATA_REG;
						when "101" =>
							S_AXI_RDATA <= STATUS_REGISTER;
						when "110" =>
							S_AXI_RDATA <= AXI_SLAVE_R6;
						when "111" =>
							S_AXI_RDATA <= AXI_SLAVE_R7;																												
						when others =>
							S_AXI_RDATA <= AXI_SLAVE_R0;	
					end case;
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
            elsif (WR_TO_SLAVE_REG_EN = '1' and DECODE_EN = '1' and WADDRESSING_REGISTER = "000") then
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

----------------------------------AXI controls accessing and processing Operations-------------------------------------------
    ACCESS_CONTROL <= AXI_SLAVE_R2(31 downto 30);

    DECODE_COMMAND_START_MACHINE : process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then    
                START_PROC_EN <= '1';
				AXI_START_GRAY2SOBEL <= '0';
				AXI_START_RGB2GRAY <= '0';           
            elsif (WR_TO_SLAVE_REG_EN = '1' and START_PROC_EN = '1' and WADDRESSING_REGISTER = "010") then
                START_PROC_EN <= '0';
				AXI_START_GRAY2SOBEL <= '0';
				AXI_START_RGB2GRAY <= '0';  
            elsif START_PROC_EN = '0' then
                START_PROC_EN <= '1';
                if AXI_SLAVE_R2(28) = '1' then
					AXI_START_GRAY2SOBEL <= '0';
					AXI_START_RGB2GRAY <= '1';
                elsif AXI_SLAVE_R2(29) = '1' then
					AXI_START_GRAY2SOBEL <= '1';
					AXI_START_RGB2GRAY <= '0';
                else
					AXI_START_GRAY2SOBEL <= '0';
					AXI_START_RGB2GRAY <= '0';
                end if;                                     
            else
				START_PROC_EN <= '1';
				AXI_START_GRAY2SOBEL <= '0';
				AXI_START_RGB2GRAY <= '0';
            end if;
        end if;
    end process;	
----------------------------------END: AXI controls state and processing Operations-------------------------------------------
    
    --Slave reg03 is dedicated to read data from sobel/gray block after processing.
    DECODE_COMMAND_GRAYorSOBEL_BRAM : process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then    
                GRAYorSOBEL_DECODE_EN <= '1';
                GRAY_RD_CMD <= '0';
                SOBEL_RD_CMD <= '0';              
            elsif (WR_TO_SLAVE_REG_EN = '1' and GRAYorSOBEL_DECODE_EN = '1' and WADDRESSING_REGISTER = "011") then
                GRAYorSOBEL_DECODE_EN <= '0';
                GRAY_RD_CMD <= '0';
                SOBEL_RD_CMD <= '0'; 
            elsif (AXI_SLAVE_R3(25) = '1' and GRAYorSOBEL_DECODE_EN = '0') then
                GRAYorSOBEL_DECODE_EN <= '1';
                if AXI_SLAVE_R3(30) = '1' then
                    GRAY_RD_CMD <= '1';
                    SOBEL_RD_CMD <= '0';
                elsif AXI_SLAVE_R3(30) = '0' then
                    GRAY_RD_CMD <= '0';
                    SOBEL_RD_CMD <= '1';
                else
                    GRAY_RD_CMD <= '0';
                    SOBEL_RD_CMD <= '0';
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

		--Writing to Status_reg
		WRITE_2_STATUS_REG_BIT2 : process(S_AXI_ACLK)
		begin
			if rising_edge(S_AXI_ACLK) then			    
				if DONE_PROCESSING_SOBEL = '1' then
					STATUS_REGISTER(2) <= '1';
				elsif RST_DONE_PROCESSING_SOBEL = '1' then
					STATUS_REGISTER(2) <= '0';                 
				end if;
			end if;
		end process;

		WRITE_2_STATUS_REG_BIT1 : process(S_AXI_ACLK)
		begin
			if rising_edge(S_AXI_ACLK) then			    
				if DONE_WRITE_GRAY_BRAM_SIGN = '1' then
					STATUS_REGISTER(1) <= '1';
				elsif RST_DONE_WRITE_GRAY_BRAM_SIGN = '1' then
					STATUS_REGISTER(1) <= '0';	                 
				end if;
			end if;
		end process;		
			
		WRITE_2_STATUS_REG_BIT0 : process(S_AXI_ACLK)
		begin
			if rising_edge(S_AXI_ACLK) then			    
				if DONE_WRITE_COLOR_BRAM_SIGN = '1' then
					STATUS_REGISTER(0) <= '1';
				elsif RST_DONE_WRITE_COLOR_BRAM_SIGN = '1' then
					STATUS_REGISTER(0) <= '0';
				end if;
			end if;
		end process;
		
		--Decode from R2 to RST status signals
		DECODE_REG02_2_STATUS_REG_RSTBIT02 : process(S_AXI_ACLK)
		begin
			if rising_edge(S_AXI_ACLK) then
				if S_AXI_ARESETN = '0' then    
					START_RST_DNSOBEL <= '1';
					RST_DONE_PROCESSING_SOBEL <= '0';         
				elsif (WR_TO_SLAVE_REG_EN = '1' and START_RST_DNSOBEL = '1' and WADDRESSING_REGISTER = "010") then
					START_RST_DNSOBEL <= '0';
					RST_DONE_PROCESSING_SOBEL <= '0';  
				elsif START_RST_DNSOBEL = '0' then
					START_RST_DNSOBEL <= '1';
					if AXI_SLAVE_R2(2) = '1' then
						RST_DONE_PROCESSING_SOBEL <= '1';
					end if;                                     
				else
					START_RST_DNSOBEL <= '1';
					RST_DONE_PROCESSING_SOBEL <= '0';
				end if;
			end if;
		end process;
		
		DECODE_REG02_2_STATUS_REG_RSTBIT01 : process(S_AXI_ACLK)
		begin
			if rising_edge(S_AXI_ACLK) then
				if S_AXI_ARESETN = '0' then    
					START_RST_DNGRAY <= '1';
					RST_DONE_WRITE_GRAY_BRAM_SIGN <= '0';         
				elsif (WR_TO_SLAVE_REG_EN = '1' and START_RST_DNGRAY = '1' and WADDRESSING_REGISTER = "010") then
					START_RST_DNGRAY <= '0';
					RST_DONE_WRITE_GRAY_BRAM_SIGN <= '0';  
				elsif START_RST_DNGRAY = '0' then
					START_RST_DNGRAY <= '1';
					if AXI_SLAVE_R2(1) = '1' then
						RST_DONE_WRITE_GRAY_BRAM_SIGN <= '1';
					end if;                                     
				else
					START_RST_DNGRAY <= '1';
					RST_DONE_WRITE_GRAY_BRAM_SIGN <= '0';
				end if;
			end if;
		end process;
		
		DECODE_REG02_2_STATUS_REG_RSTBIT00 : process(S_AXI_ACLK)
		begin
			if rising_edge(S_AXI_ACLK) then
				if S_AXI_ARESETN = '0' then    
					START_RST_DNCOLOR <= '1';
					RST_DONE_WRITE_COLOR_BRAM_SIGN <= '0';         
				elsif (WR_TO_SLAVE_REG_EN = '1' and START_RST_DNCOLOR = '1' and WADDRESSING_REGISTER = "010") then
					START_RST_DNCOLOR <= '0';
					RST_DONE_WRITE_COLOR_BRAM_SIGN <= '0';  
				elsif START_RST_DNCOLOR = '0' then
					START_RST_DNCOLOR <= '1';
					if AXI_SLAVE_R2(0) = '1' then
						RST_DONE_WRITE_COLOR_BRAM_SIGN <= '1';  
					end if;                                     
				else
					START_RST_DNCOLOR <= '1';
					RST_DONE_WRITE_COLOR_BRAM_SIGN <= '0';
				end if;
			end if;
		end process;		

		--Write back data that we need to read into read-register(AXI)
		WR_BACK_DATA : process(S_AXI_ACLK)
		begin
			if rising_edge(S_AXI_ACLK) then
				if S_AXI_ARESETN = '0' then
					READ_DATA_REG <= (others => '0');

				elsif VALID_RD_DATA_FROM_COLOR_BRAM = '1' then
					READ_DATA_REG(11 downto 0) <= AXI_RECV_DATA_FR_COLORBRAM;
					
					--Fresh data from Color Bram, need to clear when read it by software
					READ_DATA_REG(31) <= '1';
					
				elsif VALID_RD_DATA_FROM_GRAY_BRAM = '1' then
					READ_DATA_REG(7 downto 0) <= AXI_RECV_DATA_FR_GRAYBRAM;
						
					--Fresh data from Gray Bram, need to clear when read it by software
					READ_DATA_REG(31) <= '1';
				elsif VALID_RD_DATA_FROM_SOBEL_BRAM = '1' then
					READ_DATA_REG(7 downto 0) <= SOBEL_DATA_2AXI;
						
					--Fresh data from Gray Bram, need to clear when read it by software
					READ_DATA_REG(31) <= '1';
				elsif RST_VALID_FRESH_DATA = '1' then
					READ_DATA_REG(31) <= '0';
				end if;
			end if;
		end process;

		--Decode from R3 to Reset valid fresh data.
		DECODE_REG03_2_READ_REG_RSTBIT31 : process(S_AXI_ACLK)
		begin
			if rising_edge(S_AXI_ACLK) then
				if S_AXI_ARESETN = '0' then    
					EN_RST_VALID_FRESH_DATA <= '1';
					RST_VALID_FRESH_DATA <= '0';         
				elsif (WR_TO_SLAVE_REG_EN = '1' and EN_RST_VALID_FRESH_DATA = '1' and WADDRESSING_REGISTER = "011") then
					EN_RST_VALID_FRESH_DATA <= '0';
					RST_VALID_FRESH_DATA <= '0';  
				elsif EN_RST_VALID_FRESH_DATA = '0' then
					EN_RST_VALID_FRESH_DATA <= '1';
					if AXI_SLAVE_R3(31) = '1' then
						RST_VALID_FRESH_DATA <= '1';
					end if;                                     
				else
					EN_RST_VALID_FRESH_DATA <= '1';
					RST_VALID_FRESH_DATA <= '0';
				end if;
			end if;
		end process;
		
		--Done image
		DONE_IMAGE <= AXI_SLAVE_R2(27);
		
    
end architecture;