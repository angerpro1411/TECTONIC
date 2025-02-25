----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2025 04:59:30 PM
-- Design Name: 
-- Module Name: my_S_AXIS - RTL
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_S_AXIS is
    GENERIC(
            DATA_WIDTH          : integer := 32
    );

    Port (
    
            --Fifo signals
            WR_DATA_FIFO        : out std_logic_vector(DATA_WIDTH-1 downto 0);
            WR_FIFO             : out std_logic;
            FIFO_FULL           : in std_logic;
    
            --S AXIS STREAM signals
            S_AXIS_ACLK         : in std_logic;
            S_AXIS_ARESETN      : in std_logic;
            S_AXIS_DATA         : in std_logic_vector(DATA_WIDTH-1 downto 0);
            S_AXIS_VALID        : in std_logic;
            S_AXIS_TLAST        : in std_logic;
            S_AXIS_READY        : out std_logic
       );
end my_S_AXIS;

architecture RTL of my_S_AXIS is

    type STATE is (IDLE_STATE,WRITE_FIFO_STATE);
    signal MASTER_EXEC_STATE: STATE;
    
    signal S_AXIS_READY_SIGN : std_logic;
    signal STOP_WRITE_FIFO   : std_logic;
    
    --Number of bytes each data
    signal BYTE_COUNT : integer range 0 to DATA_WIDTH/8 - 1;
    
begin
    S_AXIS_READY <= S_AXIS_READY_SIGN;
    
    CONTROL_STATE: process(S_AXIS_ACLK)
    begin
        if rising_edge(S_AXIS_ACLK) then
            if S_AXIS_ARESETN = '0' then
                MASTER_EXEC_STATE <= IDLE_STATE;
            else
                case(MASTER_EXEC_STATE) is
                    when IDLE_STATE =>
                        if FIFO_FULL = '0' then
                            MASTER_EXEC_STATE <= WRITE_FIFO_STATE;
                        else
                            MASTER_EXEC_STATE <= IDLE_STATE;
                        end if;
                    when WRITE_FIFO_STATE =>
                        if STOP_WRITE_FIFO = '1' then
                            MASTER_EXEC_STATE <= IDLE_STATE;
                        else
                            MASTER_EXEC_STATE <= WRITE_FIFO_STATE;
                        end if;
                end case;
            end if;
        end if;
    end process;
    
    STOP_WRITE_FIFO <= '1' when (FIFO_FULL = '1' or S_AXIS_TLAST = '1') else '0';
    
    S_AXIS_READY_SIGN <= '1' when (FIFO_FULL = '0' and MASTER_EXEC_STATE = WRITE_FIFO_STATE) else '0';
    
    WR_FIFO <= '1' when (S_AXIS_READY_SIGN = '1' and S_AXIS_VALID = '1') else '0';
    
    WR_DATA_FIFO <= S_AXIS_DATA;

end RTL;
