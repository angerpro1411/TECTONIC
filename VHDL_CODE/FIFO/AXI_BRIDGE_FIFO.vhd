library ieee;
use ieee.std_logic_1164.all;

entity AXI_BRIDGE_FIFO is
	port(
		S_AXI_ACLK,S_AXI_ARESETN : in std_logic;
		AXI_SLAVE_R0 : in std_logic_vector(31 downto 0);
		WR_TO_SLAVE_REG_EN : in std_logic;
        AXI_OUT_FIFO_IN : out std_logic_vector(7 downto 0);
        AXI_IN_FIFO_OUT : in std_logic_vector(7 downto 0);
        WR_FIFO,RD_FIFO : out std_logic;
        FIFO_STATUS : out std_logic_vector(1 downto 0);
        FIFO_FULL,EMPTY_FIFO : in std_logic
	);

end;
 
 
architecture RTL of AXI_BRIDGE_FIFO is 

    signal RD_CMD,WR_CMD :std_logic;
    signal WR_FIFO_REG,RD_FIFO_REG : std_logic;
    signal DECODE_EN : std_logic;
    
    signal RD_DATA_FIFO_REG : std_logic_vector(31 downto 0);
    
    

begin  

	FIFO_STATUS <= FIFO_FULL & EMPTY_FIFO;
	
    DECODE_COMMAND : process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then
				WR_CMD <= '0';
				RD_CMD <= '0';
				DECODE_EN <= '1';
		    elsif(WR_TO_SLAVE_REG_EN = '1'and DECODE_EN <= '1') then
		    	DECODE_EN <= '0';
	        elsif(AXI_SLAVE_R0(10) = '1' and DECODE_EN <= '0') then
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
