----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2025 11:21:22 AM
-- Design Name: 
-- Module Name: my_M_AXIS - RTL
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

entity my_M_AXIS is
    GENERIC(
            DATA_WIDTH          : integer := 32
    );

    Port (
    
            --Fifo signals
            RD_DATA_FIFO        : in std_logic_vector(DATA_WIDTH-1 downto 0);
            RD_FIFO             : out std_logic;
            FIFO_EMPTY           : in std_logic;
    
            --M AXIS STREAM signals
            M_AXIS_ACLK         : in std_logic;
            M_AXIS_ARESETN      : in std_logic;
            M_AXIS_DATA         : out std_logic_vector(DATA_WIDTH-1 downto 0);
            M_AXIS_VALID        : out std_logic;
            M_AXIS_TLAST        : out std_logic;
            M_AXIS_READY        : in std_logic
       );
end my_M_AXIS;

architecture RTL of my_M_AXIS is
    
    type STATE is (IDLE_STATE, SEND_STREAM_STATE);
    signal MASTER_EXEC_STATE : STATE;
    
    signal STOP_READ_FIFO : std_logic;
    signal M_AXIS_VALID_SIGN : std_logic;
    signal M_AXIS_TLAST_SIGN : std_logic;
    
begin
    
    M_AXIS_VALID <= M_AXIS_VALID_SIGN;
    M_AXIS_TLAST <= M_AXIS_TLAST_SIGN;
    
    STATE_CONTROL: process(M_AXIS_ACLK)
    begin
        if rising_edge(M_AXIS_ACLK) then
            if M_AXIS_ARESETN = '0' then
                MASTER_EXEC_STATE <= IDLE_STATE;
            else
                case MASTER_EXEC_STATE is
                    when IDLE_STATE =>
                        if FIFO_EMPTY = '0' then
                            MASTER_EXEC_STATE <= SEND_STREAM_STATE;
                        else
                            MASTER_EXEC_STATE <= IDLE_STATE;
                        end if;
                    when SEND_STREAM_STATE =>
                        if STOP_READ_FIFO = '1' then
                            MASTER_EXEC_STATE <= IDLE_STATE;
                        else
                            MASTER_EXEC_STATE <= SEND_STREAM_STATE;
                        end if;
                end case;
            end if;
        end if;        
    end process;

    M_AXIS_VALID_SIGN <= '1' when (MASTER_EXEC_STATE = SEND_STREAM_STATE and FIFO_EMPTY = '0') else '0'; 
    RD_FIFO <= '1' when (M_AXIS_VALID_SIGN = '1' and M_AXIS_READY = '1') else '0';
     
    STOP_READ_FIFO <= '1' when (FIFO_EMPTY = '1' or M_AXIS_TLAST_SIGN = '1') else '0';
    M_AXIS_DATA <= RD_DATA_FIFO;
    
end RTL;
