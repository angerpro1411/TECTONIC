----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Duy-Manh NGUYEN
-- 
-- Create Date: 04/22/2024 02:32:56 PM
-- Design Name: 
-- Module Name: AXI_LITE_SLAVE - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Follow the blog zipcpu.com/blog/2020/03/08/easyaxil.html
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------



LIBRARY ieee;
use ieee.std_logic_1164.all;



entity AXI_LITE_SLAVE is
	GENERIC(
		DATA_WIDTH		: integer := 32;
		STROBE_WIDTH	: integer := 4; --DATA_WIDTH/8
		ADDRESS_WIDTH	: integer := 4;
		ADDRLSB			: integer := 2 -- log2(DATA_WIDTH) - 3	
	);
	PORT(
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
		
		S_AXI_AWLEN		: in std_logic_vector(7 downto 0);	
		S_AXI_AWSIZE		: in std_logic_vector(2 downto 0);
		S_AXI_AWBURST		: in std_logic_vector(1 downto 0);
		
		--Write channel protection type : Data access or Instruction access.
		S_AXI_AWPROT		: in std_logic;
		
		----------------------------Write data channel----------------------------
		
		--Writa date, issue by Master, accepted by Slave.
		S_AXI_WDATA		: in std_logic_vector(DATA_WIDTH-1 downto 0);
		
		--Write strobe. Indicate which bytes lane hold valid data. Each bit
		--of strobe corressponde to one byte valid data. Check code for deeply understanding.
		S_AXI_WSTRB		: in std_logic_vector(STROBE_WIDTH-1 downto 0);
		
		
		S_AXI_WLAST		: in std_logic;
		
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
		
		S_AXI_ARLEN		: in std_logic_vector(7 downto 0);
		S_AXI_ARSIZE		: in std_logic_vector(2 downto 0);
		S_AXI_ARBURST		: in std_logic_vector(1 downto 0);
		
		--Read address valid. address from Master is valid, and Slave can accept it.
		S_AXI_ARVALID		: in std_logic;
		
		--Read address ready. Slave is ready to accept the read address from Master.
		S_AXI_ARREADDY	: out std_logic;
		
		------------------------------Read data channel----------------------------
		
		--Read data, issued by Slave, Master accept it.
		S_AXI_RDATA		: out std_logic_vector(DATA_WIDTH-1 downto 0);
		
		--Read response. Status of read transaction.
		S_AXI_RRESP		: out std_logic_vector(1 downto 0);
		
		S_AXI_RLAST		: out std_logic;
		
		--Read valid, signaling data from Slave is fresh and Master can accept it.
		S_AXI_RVALID		: out std_logic;
		
		--Read ready, Master is ready to receive the data from Slave.
		S_AXI_RREADY		: in std_logic -- Master tells ready to read
		
	);
	
end entity;

architecture RTL of AXI_LITE_SLAVE is

    --components
    component SKID_BUFFER is
        generic(
                DATA_WIDTH : integer := 8
        );
        port(
            i_CLK     : in std_logic;
            i_RST_n : in std_logic;
           
            --from Side A
            i_VALID    : in std_logic;
            i_DATA    : in std_logic_vector(DATA_WIDTH-1 downto 0);
            --to Side A
            o_READY : out std_logic;
               
            --to Side B
            o_VALID    : out std_logic;
            o_DATA  : out std_logic_vector(DATA_WIDTH-1 downto 0);   
            --from Side B
            i_READY : in std_logic   
                    );
    end component;

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
	signal AXI_RVALID : std_logic;
	signal AXI_BVALID : std_logic;
	signal AXI_WREADY : std_logic;
	signal AXI_RREADY : std_logic;
	signal AXI_AWREADY: std_logic;
	signal AXI_RDATA  : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal AXI_ARREADY: std_logic;
	
	--SKID BUFFER
	signal W_SKD_R0,W_SKD_R1,W_SKD_R2,W_SKD_R3: std_logic_vector(DATA_WIDTH-1 downto 0);
	
	signal W_SKD_DATA : std_logic_vector(DATA_WIDTH-1 downto 0);
	
	signal AW_SKD_ADDR : std_logic_vector(1 downto 0);
	
	signal W_SKD_STRB : std_logic_vector(STROBE_WIDTH-1 downto 0);
	
	signal AR_SKD_ADDR : std_logic_vector(ADDRESS_WIDTH-1 downto 0);
	
begin
	
	--Connections between signals and inout
	 S_AXI_RVALID <= AXI_RVALID;
	 S_AXI_BVALID <= AXI_BVALID;
	 S_AXI_WREADY <= AXI_WREADY;
	 S_AXI_ARREADDY <= AXI_ARREADY;
	
	
	--Simplification the response from Slave that no error in transaction(no in reality)
	S_AXI_BRESP <= "00";
	S_AXI_RRESP <= "00"; 
	
	--updating skid buffer for 4 registers
	W_SKD_R0 <= APPLY_W_STRB(AXI_SLAVE_R0,W_SKD_DATA,W_SKD_STRB);
	W_SKD_R1 <= APPLY_W_STRB(AXI_SLAVE_R1,W_SKD_DATA,W_SKD_STRB);
	W_SKD_R2 <= APPLY_W_STRB(AXI_SLAVE_R2,W_SKD_DATA,W_SKD_STRB);
	W_SKD_R3 <= APPLY_W_STRB(AXI_SLAVE_R3,W_SKD_DATA,W_SKD_STRB);
	
	
	--Write data in to register when it ready to read
	FOURS_REGISTER:	process (S_AXI_ACLK)
	begin
		if rising_edge(S_AXI_ACLK) then
			if S_AXI_ARESETN = '0' then
				AXI_SLAVE_R0 <= (others => '0');
				AXI_SLAVE_R1 <= (others => '0');
				AXI_SLAVE_R2 <= (others => '0');
				AXI_SLAVE_R3 <= (others => '0');
			elsif AXI_WREADY = '1' then
				case (AW_SKD_ADDR) is
					when "00" =>
						AXI_SLAVE_R0 <= W_SKD_R0;
					when "01" =>
					 	AXI_SLAVE_R1 <= W_SKD_R1;
					when "10" => 
						AXI_SLAVE_R2 <= W_SKD_R2;
					when "11" =>
						AXI_SLAVE_R3 <= W_SKD_R3;
					when others =>
						AXI_SLAVE_R0 <= W_SKD_R0;
				end case;
			end if;
		end if;
	end process;
	
	READ_FROM_REGS: process (S_AXI_ACLK)
	begin
		if rising_edge(S_AXI_ACLK) then
			if S_AXI_ARESETN = '0' then
				S_AXI_RDATA <= (others => '0');
			-- check if Slave is ready to be read and no valid data is in process at buffer.
			-- explain more this case, if S_AXI_RVALID is asserted before we put data from registers to buffer,
			-- it means some process is still on, and we will ruin the previous process then.
			elsif(S_AXI_RREADY = '1' and AXI_RVALID = '0' ) then  
				case (AR_SKD_ADDR) is
					when "00" =>
						S_AXI_RDATA <= AXI_SLAVE_R0;
					when "01" =>
						S_AXI_RDATA <= AXI_SLAVE_R1;
					when "10" =>
						S_AXI_RDATA <= AXI_SLAVE_R2;
					when "11" =>
						S_AXI_RDATA <= AXI_SLAVE_R3;
					when others =>
					    S_AXI_RDATA <= AXI_SLAVE_R0;
				end case;
		    end if;
		end if;
	end process;

	------------------------------------------------------------------------------------------------------------
	WRITE_VALID_CONTROL : process(S_AXI_ACLK)
	begin
		if rising_edge(S_AXI_ACLK) then
			if S_AXI_ARESETN = '0' then
				AXI_BVALID <= '0';
			--When Slave is ready to accept data, we asserted Write response valid to read the transaction status
			elsif (AXI_WREADY = '1') then
				AXI_BVALID <= '1';
			--When slave doesn't accept data(AXI_WREADY = '0' - it passes the precedent condition). 
			elsif (S_AXI_BREADY = '1') then
				AXI_BVALID <= '0';
			end if;
		end if;
	end process;
	
	S_AXI_BVALID <= AXI_BVALID;
	------------------------------------------------------------------------------------------------------------
	
	------------------------------------------------------------------------------------------------------------
	READ_VALID_CONTROL : process(S_AXI_ACLK)
	begin
	    if rising_edge(S_AXI_ACLK) then
	    	if S_AXI_ARESETN = '0' then
	    		AXI_RVALID <= '0';
	    	elsif (AXI_RREADY = '1') then
	    		AXI_RVALID <= '1';
	    	elsif (S_AXI_RREADY = '1') then
	    		AXI_RVALID <= '0';
	    	end if;
	    end if;
	end process;
	
	S_AXI_RVALID <= AXI_RVALID;
	
	S_AXI_RDATA <= AXI_RDATA;
	------------------------------------------------------------------------------------------------------------
	
	------------------------------------------------------------------------------------------------------------
	ADDRESS_WRITE_READY_CONTROL : process(S_AXI_ACLK)
	begin
		if rising_edge(S_AXI_ACLK) then
			if(S_AXI_ARESETN = '0') then
				AXI_AWREADY <= '0';
			elsif (AXI_AWREADY = '0') and (S_AXI_AWVALID = '1' and S_AXI_WVALID = '1') and (AXI_BVALID = '0' or S_AXI_BREADY = '1') then
                AXI_AWREADY <= '1'; 
			else
			    AXI_AWREADY <= '0';
			end if;
		end if;
	end process;

	--synchronize slave to accept write addr and write data at the same time.
	S_AXI_AWREADY <= AXI_AWREADY;
	S_AXI_WREADY <= AXI_AWREADY;
	------------------------------------------------------------------------------------------------------------
	
	AW_SKD_ADDR <= S_AXI_AWADDR(ADDRESS_WIDTH-1 downto ADDRLSB);
	W_SKD_DATA <= S_AXI_WDATA;
	W_SKD_STRB <= S_AXI_WSTRB;
	
	--synchronize write ready and address write ready at the same time
	AXI_WREADY <= AXI_AWREADY;
	
	--when read valid, it means data from slave is fresh. So it means, slave not ready to read the new read address.
	AXI_ARREADY <= not AXI_RVALID;
	
	--when Master puts Read Address Valid and Slave puts read address ready. We will read address from AXI_ARADDR
	AXI_RREADY <= '1' when (S_AXI_ARVALID = '1' and AXI_ARREADY = '1') else '0'; 

end architecture;

