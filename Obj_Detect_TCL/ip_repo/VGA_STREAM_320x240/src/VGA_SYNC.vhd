----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/06/2024 03:17:48 PM
-- Design Name: 
-- Module Name: VGA_SYNC - Behavioral
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


--Hsync is signal to scan the screen, it isn't on only at retrace time, the same with Vsync.
--video_on is signal to display color 
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity VGA_SYNC is
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
end entity;

architecture RTL of VGA_SYNC is
	signal HSYNC_BUFF,VSYNC_BUFF,VIDEO_ON_BUFF : std_logic;
	signal HC_UNSIGNED,VC_UNSIGNED : unsigned(10 downto 0);
	constant HT :integer := HD+HF+HB+HR; --H.total
	constant VT : integer := VD+VF+VB+VR;--V.total
begin

	HC_UNSIGNED <= unsigned(HC);
	VC_UNSIGNED <= unsigned(VC);
	
	HSYNC_BUFF <= '0' when HC_UNSIGNED >= HD+HF+HB and HC_UNSIGNED <= HT-1 else '1';
	VSYNC_BUFF <= '0' when VC_UNSIGNED >= VD+VF+VB and VC_UNSIGNED <= VT-1 else '1';
	
	VIDEO_ON_BUFF <= '1' when HC_UNSIGNED >= HB and HC_UNSIGNED <= HB+HD-1
								and VC_UNSIGNED >= VB and VC_UNSIGNED <= VB+VD-1 else '0';
								
	--synchronize all buffers to avoid glitches
	SYNC_BUFFERS : process(i_CLK)
	begin
		if rising_edge(i_CLK) then
			HSYNC <= HSYNC_BUFF;
			VSYNC <= VSYNC_BUFF;
			VIDEO_ON <= VIDEO_ON_BUFF;
		end if;
	end process;
	 	
end architecture;