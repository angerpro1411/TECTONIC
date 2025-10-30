----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/24/2025 11:17:08 AM
-- Design Name: 
-- Module Name: AXIS_SLICE24to8 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXIS_SLICE24to8 is
    generic(
        DATA_WIDTH_IN        : integer := 24;
        DATA_WIDTH_OUT       : integer := 8
    );
    port(
        i_CLK       : in std_logic;
        i_RSTn      : in std_logic;
        
        --AXI4-S master i/f
        M_AXIS_VALID :   out std_logic;
        M_AXIS_READY :   in std_logic;
        M_AXIS_DATA  :   out std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
        
        --Slave AXI Stream interface
        S_AXIS_DATA     : in std_logic_vector(DATA_WIDTH_IN-1 downto 0);
        S_AXIS_VALID    : in std_logic;
        S_AXIS_READY    : out std_logic
    );
end entity;

--Input is 24 bit in order RGB, but we need output be BGR because the next VGA component, 
--      first component inside it, treat data with order BGR. 

architecture RTL of AXIS_SLICE24to8 is
    signal SLICE_R,SLICE_G,SLICE_B : std_logic_vector(DATA_WIDTH_OUT-1 downto 0);
    
    signal s_S_AXIS_READY : std_logic;
    signal s_M_AXIS_VALID : std_logic;
    
    
    --Get 4 slots for 24bit-input stream, create more throughput
    type t_REG is array (0 to 3) of std_logic_vector(DATA_WIDTH_IN-1 downto 0);
    signal STORE_REG : t_REG;
    
    signal REG24b_OUT : std_logic_vector(23 downto 0);
    
    --In counter for 24 bits
    signal SLOT_CNT : integer range 0 to 3;
    
    --out counter for 8 bits output
    signal CNT_OUT  : integer range 0 to 2;
    
    --Counter to choose the 24b-reg will be sliced
    signal SLICE_CNT : integer range 0 to 3;
    
    --Numbers of data available
    signal NBs_DATAs_AVAI : integer range 0 to 12;
    
begin
    
    S_AXIS_READY <= s_S_AXIS_READY;
    M_AXIS_VALID <= s_M_AXIS_VALID;
    
    --Cnt 0,1,2 then back to 0, for 3 bytes follow in order.
    COUNT_OUTPUT : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                CNT_OUT <= 0;
            else
                if s_M_AXIS_VALID = '1' and M_AXIS_READY = '1' then
                    if  CNT_OUT = 2 then
                        CNT_OUT <= 0;
                    else   
                        CNT_OUT <= CNT_OUT + 1;
                    end if;
                end if;
            end if;
         end if;
    end process;
    
    M_AXIS_DATA <= REG24b_OUT(8*(CNT_OUT+1)-1 downto 8*CNT_OUT);
    
    
    WHICH_SLOT_WEare_PROC : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                SLOT_CNT <= 0;
            else
                if s_S_AXIS_READY = '1' and S_AXIS_VALID = '1' then
                    if SLOT_CNT = 3 then
                        SLOT_CNT <= 0;
                    else
                        SLOT_CNT <= SLOT_CNT + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;        
    
    
    
    IN_DATA_DISTRIB : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                for I in 0 to 3 loop    
                    STORE_REG(I) <= (others => '0');
                end loop;
            else
                if S_AXIS_VALID = '1' and s_S_AXIS_READY = '1' then
                    STORE_REG(SLOT_CNT) <= S_AXIS_DATA;    
                end if;
            end if;
        end if;      
    end process;
    
    WHICH_REG_WILL_BE_SLICED : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                SLICE_CNT <= 0;
            else
                if s_M_AXIS_VALID = '1' and M_AXIS_READY = '1' and CNT_OUT = 2 then
                    if SLICE_CNT = 3 then
                        SLICE_CNT <= 0;
                    else   
                        SLICE_CNT <= SLICE_CNT + 1;
                    end if;
                end if;
            end if;
         end if;
    end process;
    
    REG24b_OUT <= STORE_REG(SLICE_CNT);
    
    
    -- M_AXIS_VALID will be asserted after one cycle when S_AXIS_VALID = '1' and s_S_AXIS_READY = '1'.
    -- after that, 3-8 bits data available at output M_AXIS_DATA, so if 3-8bits are poped without any push,
    -- M_AXIS_VALID will be de-asserted.
    
    --Control Number of data available
    NBs_DATAs_AVAI_PROC : process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                NBs_DATAs_AVAI <= 0;
            else
                if s_S_AXIS_READY = '1' and S_AXIS_VALID = '1' and
                    s_M_AXIS_VALID = '1' and M_AXIS_READY = '1' then
                    NBs_DATAs_AVAI <= NBs_DATAs_AVAI + 2;
                elsif s_S_AXIS_READY = '1' and S_AXIS_VALID = '1' then
                    NBs_DATAs_AVAI <= NBs_DATAs_AVAI + 3;
                elsif s_M_AXIS_VALID = '1' and M_AXIS_READY = '1' then
                    NBs_DATAs_AVAI <= NBs_DATAs_AVAI - 1;
                end if;
            end if;
         end if;
    end process;
    
    s_S_AXIS_READY <= '1' when NBs_DATAs_AVAI <= 9 else '0';
    s_M_AXIS_VALID <= '1' when NBs_DATAs_AVAI >= 1 else '0';
                  
    
end RTL;
