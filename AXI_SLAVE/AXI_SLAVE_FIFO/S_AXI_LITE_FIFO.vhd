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



entity S_AXI_LITE_FIFO is
	GENERIC(
		DATA_WIDTH		: integer := 32;
		STROBE_WIDTH	: integer := 4;--datawidth/8
		ADDRESS_WIDTH	: integer := 4;-- 4 configuration words, System 32-b byte addressable -----------------------------------
									   --													  |	  8	   |   8   |   8   |    8   |    => one word = 32 bits
									   --													  ---------	-------------------------
		ADDRLSB			: integer := 2 -- log2(DATA_WIDTH) - 3	
	);
	PORT(
	    
	  --USER Input and Output
        AXI_OUT_FIFO_IN : out std_logic_vector(7 downto 0);
        AXI_IN_FIFO_OUT : in std_logic_vector(7 downto 0);
        WR_FIFO,RD_FIFO : out std_logic;
        FIFO_FULL,EMPTY_FIFO : in std_logic;

	    
	  ---------------------------------------------------------------------

    
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
		--of strobe correspond to one byte valid data. Check code for deeply understanding.
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

architecture RTL of S_AXI_LITE_FIFO is

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
	signal AXI_SLAVE_R0, AXI_SLAVE_R1, AXI_SLAVE_R2, AXI_SLAVE_R3: std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
	
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

    --USER signals and registers
    signal RD_CMD,WR_CMD :std_logic;
    signal DECODE_EN : std_logic;
    
    signal RD_DATA_FIFO_REG : std_logic_vector(DATA_WIDTH-1 downto 0);
    
    signal WR_FIFO_REG,RD_FIFO_REG : std_logic;
    signal FIFO_STATUS :  std_logic_vector(1 downto 0);
    
    ---------------------------------------------------------------------
    
    
begin

    --Connect buffers and outputs
    S_AXI_BVALID <= AXI_BVALID;
    S_AXI_AWREADY <= AXI_AWREADY;
    S_AXI_WREADY <= AXI_WREADY;
    S_AXI_ARREADY <= AXI_ARREADY;
    S_AXI_RVALID <= AXI_RVALID;
    

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
			else
				LOC_ADDR := AWADDR_REG(ADDRESS_WIDTH-1 downto ADDRLSB);
				if WR_TO_SLAVE_REG_EN = '1' then
					case (LOC_ADDR) is
						when "00" =>
							AXI_SLAVE_R0 <= APPLY_W_STRB(AXI_SLAVE_R0,S_AXI_WDATA,S_AXI_WSTRB);
						when "01" =>
							AXI_SLAVE_R1 <= APPLY_W_STRB(AXI_SLAVE_R1,S_AXI_WDATA,S_AXI_WSTRB);
						when "10" =>
							AXI_SLAVE_R2 <= APPLY_W_STRB(AXI_SLAVE_R2,S_AXI_WDATA,S_AXI_WSTRB);
						when "11" =>
							AXI_SLAVE_R3 <= APPLY_W_STRB(AXI_SLAVE_R3,S_AXI_WDATA,S_AXI_WSTRB);
				    	when others =>
    		    			AXI_SLAVE_R0 <= AXI_SLAVE_R0;
							AXI_SLAVE_R1 <= AXI_SLAVE_R1;
							AXI_SLAVE_R2 <= AXI_SLAVE_R2;
							AXI_SLAVE_R3 <= AXI_SLAVE_R3;
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
						when "00" =>
							S_AXI_RDATA <= AXI_SLAVE_R0;
						when "01" =>
							S_AXI_RDATA <= RD_DATA_FIFO_REG;--AXI_SLAVE_R1;
						when "10" =>
							S_AXI_RDATA <= AXI_SLAVE_R2;    			
						when "11" =>
							S_AXI_RDATA <= AXI_SLAVE_R3;
						when others =>
							S_AXI_RDATA <= AXI_SLAVE_R0;	
					end case;
				end if;
			end if;
		end if;						    	
    end process;
    
    ---------------- USERs can write processes here ------------------------------

    -------------------------------------------------------------------------------

    --Based on FIFO status, we put 2 bit status into RD_DATA_FIFO_REG(base address 01 when read)
    --that allows us
	FIFO_STATUS <= FIFO_FULL & EMPTY_FIFO;
    RD_DATA_FIFO_REG(9 downto 8)  <= FIFO_STATUS;

    --DATA exists in Register 0 one cycle after WR_TO_SLAVE_REG_EN raised,
    --so if we want to make sure we read the correct data, we get a pipeline, to read data
    --only one cycle after WR_TO_SLAVE_REG_EN raised    
    DECODE_COMMAND : process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then
				WR_CMD <= '0';
				RD_CMD <= '0';
				DECODE_EN <= '1';
		    elsif(WR_TO_SLAVE_REG_EN = '1'and DECODE_EN = '1') then
		    	DECODE_EN <= '0';
	        elsif(AXI_SLAVE_R0(10) = '1' and DECODE_EN = '0') then
	        	DECODE_EN <= '1';
	            case AXI_SLAVE_R0(9 downto 8) is
	                when "00" =>
	                    RD_CMD <= '0';
	                    WR_CMD <= '0'; 
	                when "01" =>
	                    RD_CMD <= '0';
	                    WR_CMD <= '1';                                                
	                when "10" =>
	                    RD_CMD <= '1';
	                    WR_CMD <= '0';                                                
	                when "11" =>
	                    RD_CMD <= '1';
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
    
    WR_FIFO_REG <= WR_CMD and (not FIFO_FULL);
    RD_FIFO_REG <= RD_CMD and (not EMPTY_FIFO);
    WR_FIFO <= WR_FIFO_REG;
    RD_FIFO <= RD_FIFO_REG;
    
    WR_DATA_FIFO: process(WR_FIFO_REG)
    begin	
    	if WR_FIFO_REG = '1' then
        	AXI_OUT_FIFO_IN <= AXI_SLAVE_R0(7 downto 0);
        end if;	      
    end process;
    
    
    RD_DATA_FIFO : process(S_AXI_ACLK)
    begin
        if(RD_FIFO_REG = '1') then
            RD_DATA_FIFO_REG(7 downto 0) <= AXI_IN_FIFO_OUT;
        end if;
    end process;        
end architecture;
