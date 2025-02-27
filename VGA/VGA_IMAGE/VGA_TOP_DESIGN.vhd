----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2024 03:38:30 PM
-- Design Name: 
-- Module Name: TOP_DESIGN - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA_TOP_DESIGN is
    generic(
        VGA_ZEDBOARD_RESOLUTION : integer := 12 
    );
    port(
        i_CLK,i_RST_n : in std_logic;
        SYNC_CLR : in std_logic;
        HSYNC   : out std_logic;
        VSYNC   : out std_logic;
        HC      : out std_logic_vector(10 downto 0);
        VC      :out std_logic_vector(10 downto 0);
        
        i_RGB_DATA: in std_logic_vector(VGA_ZEDBOARD_RESOLUTION-1 downto 0);
        o_RGB_DATA: out std_logic_vector(VGA_ZEDBOARD_RESOLUTION-1 downto 0)
    );
end VGA_TOP_DESIGN;

architecture STRUCTURE of VGA_TOP_DESIGN is

    component VGA_SYNC is
        generic(
                HD : integer := 640; --Horizontal display area.
                HF : integer := 16;  --H.front porch.
                HB : integer := 48;  --H.back porch.
                HR : integer := 96;  --H.retrace.
                
                VD : integer := 480; --Vertical display area.
                VF : integer := 10;  --V.front porch.
                VB : integer := 33;  --V.back porch.
                VR : integer := 2   --V.retrace         
        );
        port(
            i_CLK : in std_logic;
            HC : in	std_logic_vector(10 downto 0);
            VC : in std_logic_vector(10 downto 0);
            HSYNC : out std_logic;
            VSYNC : out std_logic;
            VIDEO_ON : out std_logic
        );
    end component;
    
    component FRAME_COUNTER is
        generic(
                SYS_CLK : integer := 100; --100MHz
                COUNT_MAX : integer := 3;
                HMAX : integer := 640;
                VMAX : integer := 480
                 );
        port(
             i_CLK   : in std_logic;
             i_RST_n : in std_logic;
             SYNC_CLR: in std_logic;
             HC      : out std_logic_vector(10 downto 0);
             VC      : out std_logic_vector(10 downto 0);
             FRAME_START : out std_logic;
             FRAME_END   : out std_logic             
    );
    end component;
    
    --Signal Declarations
    signal HC_SIGN,VC_SIGN : std_logic_vector(10 downto 0);
    signal VIDEO_ON : std_logic;
    
begin
    VGA_SYNC_COMPONENT : VGA_SYNC port map (
            i_CLK => i_CLK,
            HC => HC_SIGN,
            VC => VC_SIGN,
            HSYNC => HSYNC,
            VSYNC => VSYNC,
            VIDEO_ON => VIDEO_ON
        );
        
    FRAME_COUNTER_COMPONENT : FRAME_COUNTER 
    generic map(
        HMAX => 800,
        VMAX => 525
    )
    port map(
             i_CLK   => i_CLK,
             i_RST_n => i_RST_n,
             SYNC_CLR => SYNC_CLR,
             HC      => HC_SIGN,
             VC      => VC_SIGN
--             FRAME_START 
--             FRAME_END              
    );    

    HC <= HC_SIGN;
    VC <= VC_SIGN;

    
    SYNC_RGB_DATA : process(i_CLK) 
    begin
        if rising_edge(i_CLK) then
            if (VIDEO_ON = '1') then
                o_RGB_DATA <= i_RGB_DATA;
            else
                o_RGB_DATA <= (others => '0');
            end if;
        end if;
    end process;


end STRUCTURE;
