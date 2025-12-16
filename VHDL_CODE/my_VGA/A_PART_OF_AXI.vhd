library ieee;
use ieee.std_logic_1164.all;

entity A_PART_OF_AXI is
    PORT(
        --Input axi
        ADDR_REG : in std_logic_vector(1 downto 0);
        S_AXI_ACLK : in std_logic;
        S_AXI_ARESETN : in std_logic;
        WR_TO_SLAVE_REG_EN : in std_logic;
        BRAM_REG : in std_logic_vector(31 downto 0);
        RD_DATA_FR_BRAM : in std_logic_vector(7 downto 0);

        --Output axi
        o_RD_BRAM,o_WR_BRAM : out std_logic;
        BRAM_ADDR : out std_logic_vector(16 downto 0);
        WDATA_BRAM : out std_logic_vector(7 downto 0)
        
    );
end entity;


architecture RTL of A_PART_OF_AXI is
    signal WR_CMD,RD_CMD : std_logic;
    signal DECODE_EN_REG00 : std_logic;
begin

    
    COMMAND_REG_CHECK: process(S_AXI_ACLK)
    begin
        if rising_edge(S_AXI_ACLK) then
            if S_AXI_ARESETN = '0' then
                DECODE_EN_REG00 <= '1';
                RD_CMD <= '0';
                WR_CMD <= '0';
            else
                if (WR_TO_SLAVE_REG_EN = '1') and ADDR_REG = "00" and DECODE_EN_REG00 = '1' then
                    DECODE_EN_REG00 <= '0';
                    RD_CMD <= '0';
                    WR_CMD <= '0';
                elsif BRAM_REG(18) = '1' and DECODE_EN_REG00 = '0' then
                    DECODE_EN_REG00 <= '1';
                    if BRAM_REG(17) = '1' then
                        WR_CMD <= '1';
                    elsif BRAM_REG(17) = '0' then
                        RD_CMD <= '1';
                    else
                        RD_CMD <= '0';
                        WR_CMD <= '0';                            
                    end if;
                else
                    DECODE_EN_REG00 <= '1';
                    RD_CMD <= '0';
                    WR_CMD <= '0';
                end if;
            end if;
        end if;         
    end process COMMAND_REG_CHECK;
    
    o_RD_BRAM <= RD_CMD;
    o_WR_BRAM <= WR_CMD;
    
    BRAM_ADDR <= BRAM_REG(16 downto 0);
    WDATA_BRAM <= BRAM_REG(26 downto 19);
    
    --After one cycle of RD_CMD high, data will be on at output read, means valid new data
    -- RD_DATA_FR_BRAM_CONTROL:process(S_AXI_ACLK)
    -- begin
    --     if rising_edge(S_AXI_ACLK) then
    --         VALID_RDATA_FR_BRAM <= RD_CMD;
    --     end if;
    -- end process;
    
    --------------------------------
end architecture;