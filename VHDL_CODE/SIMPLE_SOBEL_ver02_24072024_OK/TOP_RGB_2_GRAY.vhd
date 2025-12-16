----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/16/2024 03:49:05 PM
-- Design Name: 
-- Module Name: TOP_RGB_2_GRAY - STRUCTURE
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TOP_RGB_2_GRAY is
    generic(
        VGA_ZEDBOARD : integer := 12;
        GRAY_SCALE : integer := 8
    );

    port (
        i_CLK : in std_logic;
        i_RSTn : in std_logic;
        
        --Color part
        AXI_WRDATA_COLOR_BRAM : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);
        AXI_WRREQUEST_COLOR_BRAM : in std_logic;
        AXI_ADDRESS_CTRL_COLOR : in std_logic_vector(16 downto 0);
        AXI_RD_REQUEST : in std_logic;
        AXI_RD_DATA : out std_logic_vector(VGA_ZEDBOARD-1 downto 0);
        DONE_WRITE_COLOR_BRAM : out std_logic;
        
        
        --AXI control part
        STATE_SELECT : in std_logic;
        AXI_ADDRESS_CTRL_GRAY : in std_logic_vector(16 downto 0);
        AXI_START_PROCESSING : in std_logic;
        

        DATA_FR_GRAY_BRAM : out std_logic_vector(GRAY_SCALE-1 downto 0);
        AXI_RDREQUEST_GRAY_BRAM : in std_logic;
        DONE_WRITE_GRAY_BRAM : out std_logic
     );
end TOP_RGB_2_GRAY;

architecture STRUCTURE of TOP_RGB_2_GRAY is

    --Component declarations--
    component BRAM_2CONTROL is
        generic(     
            --VGA bit number of each pixel
            VGA_ZEDBOARD : integer := 12
        );
        port(
            i_CLK : in std_logic;
            i_RSTn : in std_logic;
            
            --one compressed pixel with R-G-B 4x3 = 12bits.
            i_DATA : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);
            
            --ADDRESS PIXEL is 19 bits wide.
            ADDRESS : in std_logic_vector(16 downto 0);
            
            i_WRITE : in std_logic;
            i_READ : in std_logic;
    
            DONE_WRITE : out std_logic;
            
            --Data is comprised of 3 pixel.
            o_DATA : out std_logic_vector(VGA_ZEDBOARD-1 downto 0)
            );
    end component;
    
    component RGB_2_GRAY is
        generic(
            --Gray bit number of each pixel
            GRAY_SCALE : integer := 8;
    
            --VGA bit number of each pixel
            VGA_ZEDBOARD : integer := 12
        );
        port(
            i_CLK : in std_logic;
            i_RSTn : in std_logic;
    
            --START signal
            START_PROCESSING : in std_logic;
            
            --ADDRESS PIXEL is 16 bits wide.
            --We have two ADDRESS, RD_ADDRESS to read address from color block ram, WR_ADDR to write address to gray block ram.
            RD_ADDRESS,WR_ADDRESS : out std_logic_vector(16 downto 0);
            i_READ : out std_logic;
            
            --Data is comprised of 3 pixel.
            o_DATA_fr_RAM : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);
    
            o_GRAY_OUT8 : out std_logic_vector(GRAY_SCALE-1 downto 0);
            o_GRAY_OUT_VALID : out std_logic;
    
            GRAY_MATRIX9_OUT : out std_logic_vector(GRAY_SCALE*9-1 downto 0)
    
            );
    end component;
    ---------------------------

    signal DONE_WRITE_COLOR_BRAM_SIGN,DONE_WRITE_GRAY_BRAM_SIGN:std_logic;
    signal COLOR_ADDRESS,GRAY_ADDRESS,WR_ADDRESS_FR_RGB: std_logic_vector(16 downto 0);

    signal WR_REQUEST_FR_RGB,RD_REQUEST: std_logic;

    signal RGB_DATA: std_logic_vector(VGA_ZEDBOARD-1 downto 0);

    signal GRAY_DATA: std_logic_vector(GRAY_SCALE-1 downto 0);



    signal CNT_GRAY_READ : integer range 0 to 76800;
    signal DONE_READ_GRAY: std_logic;

    --Signal from RGB to BRAM_COLOR
    signal RGB_ADDRESS_CTRL_COLOR : std_logic_vector(16 downto 0);
    signal RBG_RD_REQUEST : std_logic;
    signal RGB_RD_DATA : std_logic_vector(VGA_ZEDBOARD-1 downto 0);

begin
    DONE_WRITE_COLOR_BRAM <= DONE_WRITE_COLOR_BRAM_SIGN;
    DONE_WRITE_GRAY_BRAM <= DONE_WRITE_GRAY_BRAM_SIGN;

    --Component instantiation
    BRAM_COLOR: BRAM_2CONTROL 
    port map(
        i_CLK => i_CLK,
        i_RSTn => i_RSTn,
        
        --Pure connect to AXI
        i_DATA => AXI_WRDATA_COLOR_BRAM,
        DONE_WRITE => DONE_WRITE_COLOR_BRAM_SIGN,
        i_WRITE => AXI_WRREQUEST_COLOR_BRAM,
        
        --Connect to a multiplexer
        ADDRESS => COLOR_ADDRESS,
        i_READ => RD_REQUEST,
        o_DATA => RGB_DATA

    );
    
    COLOR_BRAM_SIGNALSxSTATE:process(STATE_SELECT,AXI_ADDRESS_CTRL_COLOR,AXI_RD_REQUEST,RGB_DATA,
                                AXI_ADDRESS_CTRL_GRAY,RGB_ADDRESS_CTRL_COLOR,RBG_RD_REQUEST,
                                WR_ADDRESS_FR_RGB)
    begin
        --Color part
        COLOR_ADDRESS <= AXI_ADDRESS_CTRL_COLOR;
        RD_REQUEST <= AXI_RD_REQUEST;
        AXI_RD_DATA <= RGB_DATA;
            
        --Gray part
        GRAY_ADDRESS <= AXI_ADDRESS_CTRL_GRAY;
            
        if STATE_SELECT = '1' then
            --Color part
            COLOR_ADDRESS <= RGB_ADDRESS_CTRL_COLOR;
            RD_REQUEST <= RBG_RD_REQUEST;
            RGB_RD_DATA <= RGB_DATA;
            
            --Gray part
            GRAY_ADDRESS <= WR_ADDRESS_FR_RGB;             
        end if;
    end process;

    BRAM_GRAY: BRAM_2CONTROL 
    generic map(VGA_ZEDBOARD => GRAY_SCALE)
    port map(
        i_CLK => i_CLK,
        i_RSTn => i_RSTn,
        i_DATA => GRAY_DATA,
        ADDRESS => GRAY_ADDRESS,
        i_WRITE => WR_REQUEST_FR_RGB,
        i_READ => AXI_RDREQUEST_GRAY_BRAM,
        DONE_WRITE => DONE_WRITE_GRAY_BRAM_SIGN,
        o_DATA => DATA_FR_GRAY_BRAM
    
    );
    
    RGB2GRAY_COMP: RGB_2_GRAY
    port map(
        i_CLK => i_CLK,
        i_RSTn => i_RSTn,
        START_PROCESSING => AXI_START_PROCESSING,
        
        --Signal from BRAM_COLOR
        RD_ADDRESS => RGB_ADDRESS_CTRL_COLOR,
        i_READ => RBG_RD_REQUEST,
        o_DATA_fr_RAM => RGB_RD_DATA,
        
        --Signals from RGB to BRAM_GRAY
        WR_ADDRESS => WR_ADDRESS_FR_RGB,        
        o_GRAY_OUT8 => GRAY_DATA,
        o_GRAY_OUT_VALID => WR_REQUEST_FR_RGB

        --GRAY_MATRIX9_OUT
    );



    DONE_READ_GRAY_CONTROL: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                CNT_GRAY_READ <= 0;
                DONE_READ_GRAY <= '0';
            elsif (AXI_RDREQUEST_GRAY_BRAM = '1') then
                CNT_GRAY_READ <= CNT_GRAY_READ + 1;
                DONE_READ_GRAY <= '0';
                if (CNT_GRAY_READ = 76799) then
                    CNT_GRAY_READ <= 0;
                    DONE_READ_GRAY <= '1';
                end if;
            else
                DONE_READ_GRAY <= '0';
            end if;
        end if;
    end process;


end STRUCTURE;