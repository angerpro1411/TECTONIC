----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/17/2025 05:49:11 PM
-- Design Name: 
-- Module Name: INTEGRATED_VGA_COMP_WRAP - STRUCTURE
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

entity INTEGRATED_VGA_COMP_WRAP is
  Port (
    AXI_ACLK    : in std_logic;
    AXI_ARESETN : in std_logic;
    o_RD_BRAM_AXI_REQ   : in std_logic; 
    o_WR_BRAM_AXI_REQ : in std_logic;
    BRAM_ADDR_FR_AXI : in std_logic_vector(16 downto 0);
    WDATA_BRAM_FR_AXI : in std_logic_vector(7 downto 0);
    CHIP_SELECT         : in std_logic;
    
    RD_DATA_FR_BRAM : out std_logic_vector(7 downto 0);
    
    -- //interface with VGA
    -- //VGA component
    HSYNC               : out std_logic;
    VSYNC               : out std_logic;
    o_RGB_DATA          : out std_logic_vector(11 downto 0)
   );
end INTEGRATED_VGA_COMP_WRAP;

architecture STRUCTURE of INTEGRATED_VGA_COMP_WRAP is

    component INTEGRATED_VGA_COMP  
        Port (
        AXI_ACLK    : in std_logic;
        AXI_ARESETN : in std_logic;
        o_RD_BRAM_AXI_REQ   : in std_logic; 
        o_WR_BRAM_AXI_REQ : in std_logic;
        BRAM_ADDR_FR_AXI : in std_logic_vector(16 downto 0);
        WDATA_BRAM_FR_AXI : in std_logic_vector(7 downto 0);
        CHIP_SELECT         : in std_logic;
        
        RD_DATA_FR_BRAM : out std_logic_vector(7 downto 0);
        
        -- //interface with VGA
        -- //VGA component
        HSYNC               : out std_logic;
        VSYNC               : out std_logic;
        o_RGB_DATA          : out std_logic_vector(11 downto 0)
       );
    end component;
begin
    VGA_COMP_SV_2_VHDL: INTEGRATED_VGA_COMP
    port map
    (
        AXI_ACLK    => AXI_ACLK,
        AXI_ARESETN => AXI_ARESETN,
        o_RD_BRAM_AXI_REQ   => o_RD_BRAM_AXI_REQ,
        o_WR_BRAM_AXI_REQ  => o_WR_BRAM_AXI_REQ,
        BRAM_ADDR_FR_AXI => BRAM_ADDR_FR_AXI,
        WDATA_BRAM_FR_AXI => WDATA_BRAM_FR_AXI,
        CHIP_SELECT => CHIP_SELECT,
        
        RD_DATA_FR_BRAM => RD_DATA_FR_BRAM,
        
        -- //interface with VGA
        -- //VGA component
        HSYNC => HSYNC,
        VSYNC => VSYNC,
        o_RGB_DATA => o_RGB_DATA       
    );


end STRUCTURE;
