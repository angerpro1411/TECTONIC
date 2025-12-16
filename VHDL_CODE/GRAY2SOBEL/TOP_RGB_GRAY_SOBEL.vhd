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


entity TOP_RGB_GRAY_SOBEL is
    generic(
        THRESHOLD_TOP : integer := 110000;
        VGA_ZEDBOARD : integer := 12;
        GRAY_SCALE : integer := 8
    );

    port (
        i_CLK : in std_logic;
        i_RSTn : in std_logic;

        --AXI controls all access
        ACCESS_CONTROL : in std_logic_vector(1 downto 0);

        ------------AXI connects to COLOR_BRAM------------------
        AXI_WRDATA_COLOR_BRAM : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);
        AXI_WRREQUEST_COLOR_BRAM : in std_logic;
        DONE_WRITE_COLOR_BRAM_SIGN : out std_logic;

        AXI_WRADDR_2COLORBRAM : in std_logic_vector(16 downto 0);
        AXI_RDREQUEST_COLORBRAM : in std_logic;
        AXI_RECV_DATA_FR_COLORBRAM : out std_logic_vector(VGA_ZEDBOARD-1 downto 0);
        -------------------------------------------------------

        ----------AXI controls RGB to GRAY process---------
        AXI_START_RGB2GRAY : in std_logic;
        ----------------------------------

        ----------AXI connects to GRAY_BRAM-----------------
        DONE_WRITE_GRAY_BRAM_SIGN : out std_logic;

        AXI_RDADDR_2GRAYBRAM : in std_logic_vector(16 downto 0);
        AXI_RDREQUEST_GRAYBRAM : in std_logic;
        AXI_RECV_DATA_FR_GRAYBRAM : out std_logic_vector(GRAY_SCALE-1 downto 0);
        ---------------------------------------------------

        ------AXI controls GRAY to SOBEL process------------
        AXI_START_GRAY2SOBEL : in std_logic;
        DONE_PROCESSING_SOBEL : out std_logic;
        ----------------------------------------------------

        --------------------AXI connects Sobel Bram--------------
        RD_REQUEST_FR_AXI : in std_logic;
        SOBEL_DATA_2AXI : out std_logic_vector(7 downto 0);

        AXI_RDADDR_2SOBELBRAM : in std_logic_vector(16 downto 0)
        --------------------------------------------------------
     );
end TOP_RGB_GRAY_SOBEL;

architecture STRUCTURE of TOP_RGB_GRAY_SOBEL is

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
            o_GRAY_OUT_VALID : out std_logic
            );
    end component;

    component GRAY2SOBEL is
        generic(
            THRESHOLD : integer := 100000
        );
        port(
            i_CLK,i_RSTn : in std_logic;
    
            --Control signal from processor
            START_RDGRAYBRAM : in std_logic;
    
            --Read data from Gray BRAM
            i_DATA_FR_GRAYBRAM : in std_logic_vector(7 downto 0);
            o_ADDRESS_2GRAYBRAM : out std_logic_vector(16 downto 0);
            o_READ_GRAYBRAM : out std_logic;
    
            --These signels use to write data into sobel bram.
            o_ADDRESS_2SOBELBRAM : out std_logic_vector(16 downto 0);
            o_WRITE_SOBELBRAM : out std_logic;
            o_DATA_2SOBELBRAM : out std_logic_vector(7 downto 0);
    
            --This signal informs to processor that sobel operation is done
            DONE_PROCESSING_SOBEL : out std_logic
        );
    end component;
    ---------------------------

    ---------------------------Signal declarations----------------------------

    --COLOR BRAM
    signal COLOR_ADDRESS : std_logic_vector(16 downto 0);
    signal RD_REQUEST : std_logic;
    signal o_COLOR_DATA : std_logic_vector(11 downto 0);

    --RGB 2 GRAY
    signal RGB_ADDRESS_2COLOR_BRAM,WR_ADDRESS_FR_RGB : std_logic_vector(16 downto 0);
    signal RBG_RD_REQUEST,WR_REQUEST_FR_RGB : std_logic;
    signal GRAY_DATA : std_logic_vector(7 downto 0);
    signal RGB_RECV_DATA_FR_COLORBRAM : std_logic_vector(11 downto 0);

    --GRAY BRAM
    signal GRAY_ADDRESS : std_logic_vector(16 downto 0);
    signal RDREQUEST_GRAY_BRAM : std_logic;
    signal DATA_FR_GRAY_BRAM : std_logic_vector(7 downto 0);

    --GRAY 2 SOBEL
    signal i_DATA_FR_GRAYBRAM,o_DATA_2SOBELBRAM : std_logic_vector(7 downto 0);
    signal o_ADDRESS_2GRAYBRAM,o_ADDRESS_2SOBELBRAM : std_logic_vector(16 downto 0);
    signal o_READ_GRAYBRAM,o_WRITE_SOBELBRAM : std_logic;

    --SOBEL BRAM
    signal SOBELBRAM_ADDRESS : std_logic_vector(16 downto 0);

begin

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
        o_DATA => o_COLOR_DATA

    );

    RGB2GRAY_COMP: RGB_2_GRAY
    port map(
        i_CLK => i_CLK,
        i_RSTn => i_RSTn,
        START_PROCESSING => AXI_START_RGB2GRAY,
        
        --Signal from BRAM_COLOR
        RD_ADDRESS => RGB_ADDRESS_2COLOR_BRAM,
        i_READ => RBG_RD_REQUEST,
        o_DATA_fr_RAM => RGB_RECV_DATA_FR_COLORBRAM,
        
        --Signals from RGB to BRAM_GRAY
        WR_ADDRESS => WR_ADDRESS_FR_RGB,        
        o_GRAY_OUT8 => GRAY_DATA,
        o_GRAY_OUT_VALID => WR_REQUEST_FR_RGB
    );

    BRAM_GRAY: BRAM_2CONTROL 
    generic map(VGA_ZEDBOARD => GRAY_SCALE)
    port map(
        i_CLK => i_CLK,
        i_RSTn => i_RSTn,
        i_DATA => GRAY_DATA,
        ADDRESS => GRAY_ADDRESS,
        i_WRITE => WR_REQUEST_FR_RGB,
        i_READ => RDREQUEST_GRAY_BRAM,
        DONE_WRITE => DONE_WRITE_GRAY_BRAM_SIGN,
        o_DATA => DATA_FR_GRAY_BRAM
    
    );

    GRAY2SOBEL_COMP: GRAY2SOBEL
        generic map(THRESHOLD => THRESHOLD_TOP)
        port map(
            i_CLK => i_CLK,
            i_RSTn => i_RSTn,
    
            --Control signal from processor
            START_RDGRAYBRAM => AXI_START_GRAY2SOBEL,
    
            --Read data from Gray BRAM
            i_DATA_FR_GRAYBRAM => i_DATA_FR_GRAYBRAM,
            o_ADDRESS_2GRAYBRAM => o_ADDRESS_2GRAYBRAM,
            o_READ_GRAYBRAM => o_READ_GRAYBRAM,
    
            --These signels use to write data into sobel bram.
            o_ADDRESS_2SOBELBRAM => o_ADDRESS_2SOBELBRAM,
            o_WRITE_SOBELBRAM => o_WRITE_SOBELBRAM,
            o_DATA_2SOBELBRAM => o_DATA_2SOBELBRAM,
    
            --This signal informs to processor that sobel operation is done
            DONE_PROCESSING_SOBEL => DONE_PROCESSING_SOBEL
        );

        BRAM_SOBEL: BRAM_2CONTROL
        generic map(VGA_ZEDBOARD => GRAY_SCALE) 
        port map(
            i_CLK => i_CLK,
            i_RSTn => i_RSTn,
            
            i_DATA => o_DATA_2SOBELBRAM,
            i_WRITE => o_WRITE_SOBELBRAM,
            
            --Connect to a multiplexer
            ADDRESS => SOBELBRAM_ADDRESS,
            i_READ => RD_REQUEST_FR_AXI,
            o_DATA => SOBEL_DATA_2AXI
    
        );

    

    
    ACCESS_CONTROL_PROC:process(ACCESS_CONTROL, AXI_WRADDR_2COLORBRAM, AXI_RDREQUEST_COLORBRAM,
                                o_COLOR_DATA, AXI_RDADDR_2GRAYBRAM, AXI_RDREQUEST_GRAYBRAM, DATA_FR_GRAY_BRAM,
                                AXI_RDADDR_2SOBELBRAM, RGB_ADDRESS_2COLOR_BRAM, RBG_RD_REQUEST,
                                o_ADDRESS_2GRAYBRAM, o_READ_GRAYBRAM, o_ADDRESS_2SOBELBRAM)
    begin
        --ALL component get control by AXI by default

        --Color bram
        COLOR_ADDRESS <= AXI_WRADDR_2COLORBRAM;
        RD_REQUEST <= AXI_RDREQUEST_COLORBRAM;
        AXI_RECV_DATA_FR_COLORBRAM <= o_COLOR_DATA;
        -------------

        --Gray bram
        GRAY_ADDRESS <= AXI_RDADDR_2GRAYBRAM;
        RDREQUEST_GRAY_BRAM <= AXI_RDREQUEST_GRAYBRAM;
        AXI_RECV_DATA_FR_GRAYBRAM <= DATA_FR_GRAY_BRAM;
        -----------

        --Sobel bram
        SOBELBRAM_ADDRESS <= AXI_RDADDR_2SOBELBRAM;
        ----------------------------------------------

        if (ACCESS_CONTROL = "00") then
            --keep all default
            --Color bram
            COLOR_ADDRESS <= AXI_WRADDR_2COLORBRAM;
            RD_REQUEST <= AXI_RDREQUEST_COLORBRAM;
            AXI_RECV_DATA_FR_COLORBRAM <= o_COLOR_DATA;
            -------------

            --Gray bram
            GRAY_ADDRESS <= AXI_RDADDR_2GRAYBRAM;
            RDREQUEST_GRAY_BRAM <= AXI_RDREQUEST_GRAYBRAM;
            AXI_RECV_DATA_FR_GRAYBRAM <= DATA_FR_GRAY_BRAM;
            -----------

            --Sobel bram
            SOBELBRAM_ADDRESS <= AXI_RDADDR_2SOBELBRAM;
            ----------------------------------------------
        elsif (ACCESS_CONTROL = "01") then
            --switch control to RGB

            --Color bram
            COLOR_ADDRESS <= RGB_ADDRESS_2COLOR_BRAM;
            RD_REQUEST <= RBG_RD_REQUEST;
            RGB_RECV_DATA_FR_COLORBRAM <= o_COLOR_DATA;
            -------------         
            
            --Gray bram
            GRAY_ADDRESS <= WR_ADDRESS_FR_RGB;
            -----------

        elsif (ACCESS_CONTROL = "10") then
            --switch control to SOBEL

            --Gray bram
            GRAY_ADDRESS <= o_ADDRESS_2GRAYBRAM;
            RDREQUEST_GRAY_BRAM <= o_READ_GRAYBRAM;
            i_DATA_FR_GRAYBRAM <= DATA_FR_GRAY_BRAM;
            -----------
            
            --Sobel bram
            SOBELBRAM_ADDRESS <= o_ADDRESS_2SOBELBRAM;
            ----------------------------------------------
        end if;
    end process;

end STRUCTURE;