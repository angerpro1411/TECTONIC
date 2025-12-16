----------------------------------------------------------------------------------
-- Company: ENSTA - Bretagne
-- Engineer: Duy-Manh NGUYEN
-- 
-- Create Date: 03/20/2025 11:38:46 AM
-- Design Name: Color_2_Gray_IP
-- Module Name: Color_2_Gray_IP - RTL
-- Project Name: PS_DMA_VGA
-- Target Devices: Zedboard
-- Tool Versions: 2023.1
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Color_2_Gray_IP is
    GENERIC(
        --COLOR scale either 32b or 24b depends on the image.
        --But this app we focus on the type 24bits
        COLOR_SCALE : integer := 24;
        GRAY_SCALE : integer := 8
    );
    PORT(
        AXI_ACLK     : in std_logic;
        AXI_ARESETN  : in std_logic;

        --Create Master/Slave AXI Stream interface 
        M_AXIS_DATA  : out std_logic_vector(GRAY_SCALE-1 downto 0);
        M_AXIS_READY : in std_logic;
        M_AXIS_VALID : out std_logic;

        S_AXIS_DATA  : in std_logic_vector(COLOR_SCALE-1 downto 0);
        S_AXIS_READY : out std_logic;
        S_AXIS_VALID : in std_logic
    );
end Color_2_Gray_IP;

architecture RTL of Color_2_Gray_IP is
    signal TEMP_R,TEMP_G,TEMP_B : unsigned(GRAY_SCALE-1 downto 0);
    signal M_AXIS_VALID_SIGN : std_logic;
    signal S_AXIS_READY_SIGN : std_logic;
begin

    M_AXIS_VALID <= M_AXIS_VALID_SIGN;
    S_AXIS_READY <= S_AXIS_READY_SIGN;

    --23->16:Blue, 15->8:Green, 7->0:Red 
    TEMP_B <= unsigned(S_AXIS_DATA(COLOR_SCALE-1-0*8 downto COLOR_SCALE-1*8)) ;
    TEMP_G <= unsigned(S_AXIS_DATA(COLOR_SCALE-1-1*8 downto COLOR_SCALE-2*8)) ;
    TEMP_R <= unsigned(S_AXIS_DATA(COLOR_SCALE-1-2*8 downto COLOR_SCALE-3*8)) ;



    -- Gray pixel = 0.3*Red pixel + 0.59*Green pixel + 0.11*Blue pixel
	-- 12 bit value is split into B,G and R components - 4 bit each
	-- and multiplied with their respective weights.
	-- Maximum actually TEMP_B, TEMP_G and TEMP_R are 4 bits MSB each of 8 bits, not normal 4 bits.
	-- Pretend they are actual 8 bit, if we want to get 0.3, 0.59 and 0.11.
	-- For Red, we need actually sum of two shift right 2 and 5. It means we divine by 4 and divine by 32. And 1/4+1/32 = 9/32 ~=0.281.
	-- For Green, sum of two shift right 1 and 4. 1/2+1/16 = 9/16 ~= 0.562.
	-- For Blue, sum of two shift right 4 and 5. 1/16+1/32 = 3/32 ~= 0.093
    GET_SUM : process(AXI_ACLK)
    begin
        if rising_edge(AXI_ACLK) then
            if AXI_ARESETN = '0' then
                M_AXIS_DATA <= (others => '0');
                M_AXIS_VALID_SIGN <= '0';
            elsif (S_AXIS_VALID = '1' and S_AXIS_READY_SIGN = '1') then
                M_AXIS_DATA <= std_logic_vector((shift_right(TEMP_B,4) + shift_right(TEMP_B,5)) + (shift_right(TEMP_G,1) + shift_right(TEMP_G,4)) + (shift_right(TEMP_R,2) + shift_right(TEMP_R,5)) );
                M_AXIS_VALID_SIGN <= '1';
            end if;
        end if;
    end process;

    S_AXIS_READY_SIGN <= M_AXIS_READY;

end RTL;
