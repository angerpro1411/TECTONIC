----------------------------------------------------------------------------------
-- Company: ENSTA-Bretagne
-- Engineer: Duy-Manh NGUYEN
--
-- Create Date: 04/10/2024 10:20:25 AM
-- Design Name: Uart_RX - RTL
-- Module Name: Uart_RX - RTL
-- Project Name: UART
-- Target Devices: ZedBoard
-- Tool Versions: 2023.1
-- Description:
--  The signal goes with 'n' at the end, it means "active low"
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Uart_RX is
  Generic(
        DATA_BITS      : integer := 8;
        NB_TICK_MAX    : integer := 16
  );
 
  Port (
        i_CLK,i_RST_n : in std_logic;
        RX,S_TICK   : in std_logic;
        RX_DONE     : out std_logic;
        DOUT        : out std_logic_vector(DATA_BITS-1 downto 0)
   );
end Uart_RX;


architecture RTL of Uart_RX is
    type UART_STATE is (IDLE, START, DATA, STOP);
    signal PRE_ST,NX_ST : UART_STATE;
   
    signal TICKNB_REG,TICKNB_NX : unsigned(3 downto 0); --counter to count number of tick
    signal DATANB_REG,DATANB_NX : unsigned(3 downto 0); --normally data from 6,7,8 and 9 with parity
    signal DATA_REG,DATA_NX     : std_logic_vector(DATA_BITS-1 downto 0); --data register to shift data
begin
    STATE_REGISTER: process(i_CLK,i_RST_n)
    begin
        if i_RST_n = '0' then
            PRE_ST <= IDLE;
            TICKNB_REG <= (others => '0');
            DATANB_REG <= (others => '0');
            DATA_REG <= (others => '0');
        elsif rising_edge(i_CLK) then
            PRE_ST <= NX_ST;
            TICKNB_REG <= TICKNB_NX;
            DATANB_REG <= DATANB_NX;
            DATA_REG <= DATA_NX;      
        end if;    
     end process;
     
     NEXTSTATE: process(RX,S_TICK,PRE_ST,TICKNB_REG,DATANB_REG,DATA_REG)
     begin
     
     --very beginning to set up all values
        RX_DONE <= '0';
        NX_ST <= PRE_ST;
        TICKNB_NX <= TICKNB_REG;
        DATANB_NX <= DATANB_REG;
        DATA_NX <= DATA_REG;
     
     --state decision by case statement  
        case PRE_ST is
            when IDLE =>
                if RX = '0' then
                    NX_ST <= START;
                    TICKNB_NX <= (others => '0');
                end if;
            when START =>
                if S_TICK = '1' then
                    TICKNB_NX <= TICKNB_REG + 1;
                    if TICKNB_REG = 7 then
                        NX_ST <= DATA;
                        DATANB_NX <= (others => '0');
                        TICKNB_NX <= (others => '0');
                    end if;
                end if;
            when DATA =>
                if S_TICK = '1' then
                    TICKNB_NX <= TICKNB_REG + 1;
                    if TICKNB_REG = NB_TICK_MAX-1 then
                        TICKNB_NX <= (others => '0');
                        DATA_NX <= RX & DATA_REG(DATA_BITS-1 downto 1);
                        DATANB_NX <= DATANB_REG + 1;
                        if (DATANB_REG = DATA_BITS-1) then --maximum
                            --DATANB_NX <= (others => '0');
                            NX_ST <= STOP;
                        end if;
                      end if;
                end if;
            when STOP =>
            --DOUT <= std_logic_vector(DATA_REG);
                if S_TICK = '1' then
                    TICKNB_NX <= TICKNB_REG + 1;
                    if TICKNB_REG = NB_TICK_MAX-1 then
                        --TICKNB_NX <= (others => '0');
                        RX_DONE <= '1';
                        NX_ST <= IDLE;
                    end if;
                end if;                                                          
            end case;            
     end process;
     
     --result output
     DOUT <= std_logic_vector(DATA_REG);

end RTL;
