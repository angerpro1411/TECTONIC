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
        AXI_WRDATA_COLOR_BRAM : in std_logic_vector(VGA_ZEDBOARD-1 downto 0);

        --AXI_SLAVE_REG0(18)
        EN_WRCOLOR_FR_AXI : in std_logic;

        --output STATE to let processor know the which state are we on
        ON_STATE : out std_logic_vector(1 downto 0);

        --Request
        AXI_WRREQUEST_COLOR_BRAM : in std_logic;
        AXI_ADDR_COLOR_BRAM : in std_logic_vector(16 downto 0); 
        DONE_WRITE_COLOR_BRAM : out std_logic;

        DATA_FR_GRAY_BRAM : out std_logic_vector(GRAY_SCALE-1 downto 0);
        AXI_RDREQUEST_GRAY_BRAM : in std_logic;
        AXI_ADDR_GRAY_BRAM : in std_logic_vector(16 downto 0);
        DONE_READ_GRAY_BRAM : out std_logic;
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
    
            --Done signal from RAM
            DONE_WRITE_COLOR,DONE_WRITE_GRAY : in std_logic;
            
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
    signal COLOR_ADDRESS,GRAY_ADDRESS,RD_ADDRESS_FR_RGB,WR_ADDRESS_FR_RGB: std_logic_vector(16 downto 0);

    signal WR_REQUEST_FR_RGB,RD_REQUEST_FR_RGB: std_logic;

    signal RGB_DATA: std_logic_vector(VGA_ZEDBOARD-1 downto 0);

    signal GRAY_DATA: std_logic_vector(GRAY_SCALE-1 downto 0);


    -- type STATE_t is (IDLE_STATE,AXI_WRITE_COLOR_STATE, RGB_OCCUPIED_STATE,AXI_READ_GRAY_STATE);
    -- signal PRE_STATE,NX_STATE : STATE_t;

    constant IDLE_STATE : unsigned(1 downto 0) := "00";
    constant AXI_WRITE_COLOR_STATE : unsigned(1 downto 0) := "01";
    constant RGB_OCCUPIED_STATE : unsigned(1 downto 0) := "10";
    constant AXI_READ_GRAY_STATE : unsigned(1 downto 0) := "11";
    signal PRE_STATE,NX_STATE: unsigned(1 downto 0);

    signal CNT_GRAY_READ : integer range 0 to 76800;
    signal DONE_READ_GRAY_REG: std_logic;

begin

    ON_STATE <= std_logic_vector(PRE_STATE);
    DONE_WRITE_COLOR_BRAM <= DONE_WRITE_COLOR_BRAM_SIGN;
    DONE_WRITE_GRAY_BRAM <= DONE_WRITE_GRAY_BRAM_SIGN;

    --Component instantiation
    BRAM_COLOR: BRAM_2CONTROL 
    port map(
        i_CLK => i_CLK,
        i_RSTn => i_RSTn,
        i_DATA => AXI_WRDATA_COLOR_BRAM,
        ADDRESS => COLOR_ADDRESS,
        i_WRITE => AXI_WRREQUEST_COLOR_BRAM,
        i_READ => RD_REQUEST_FR_RGB,
        DONE_WRITE => DONE_WRITE_COLOR_BRAM_SIGN,
        o_DATA => RGB_DATA

    );

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
        DONE_WRITE_COLOR => DONE_WRITE_COLOR_BRAM_SIGN,
        DONE_WRITE_GRAY => DONE_WRITE_GRAY_BRAM_SIGN,
        
        RD_ADDRESS => RD_ADDRESS_FR_RGB,
        WR_ADDRESS => WR_ADDRESS_FR_RGB,
        i_READ => RD_REQUEST_FR_RGB,
        
        o_DATA_fr_RAM => RGB_DATA,

        o_GRAY_OUT8 => GRAY_DATA,
        o_GRAY_OUT_VALID => WR_REQUEST_FR_RGB

        --GRAY_MATRIX9_OUT
    );


    --Two state machine to choose the moment either AXI controls block ram or RGB component controls it.

    --First state machine use for COLOR BRAM
    COLOR_REGIS: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                PRE_STATE <= IDLE_STATE;
            else
                PRE_STATE <= NX_STATE;
            end if;
        end if;
    end process;

    COLOR_NEXT_STATE: process(AXI_ADDR_COLOR_BRAM,AXI_ADDR_GRAY_BRAM,
        PRE_STATE,DONE_WRITE_COLOR_BRAM_SIGN,DONE_READ_GRAY_REG,
        DONE_WRITE_GRAY_BRAM_SIGN,EN_WRCOLOR_FR_AXI,
        RD_ADDRESS_FR_RGB,WR_ADDRESS_FR_RGB)
    begin
        COLOR_ADDRESS <= AXI_ADDR_COLOR_BRAM;
        GRAY_ADDRESS <= AXI_ADDR_GRAY_BRAM;
        NX_STATE <= PRE_STATE;
        case PRE_STATE is
            when IDLE_STATE =>
                if (EN_WRCOLOR_FR_AXI = '1') then
                    NX_STATE <= AXI_WRITE_COLOR_STATE;
                end if;
            when AXI_WRITE_COLOR_STATE =>
                COLOR_ADDRESS <= AXI_ADDR_COLOR_BRAM;
                GRAY_ADDRESS <= AXI_ADDR_GRAY_BRAM;
                if (DONE_WRITE_COLOR_BRAM_SIGN = '1') then
                    NX_STATE <= RGB_OCCUPIED_STATE;
                end if;
            when RGB_OCCUPIED_STATE =>
                COLOR_ADDRESS <= RD_ADDRESS_FR_RGB;
                GRAY_ADDRESS <= WR_ADDRESS_FR_RGB;
                if DONE_WRITE_GRAY_BRAM_SIGN = '1' then
                    NX_STATE <= AXI_READ_GRAY_STATE;
                end if;
            when AXI_READ_GRAY_STATE =>
                COLOR_ADDRESS <= AXI_ADDR_COLOR_BRAM;
                GRAY_ADDRESS <= AXI_ADDR_GRAY_BRAM;
                if (DONE_READ_GRAY_REG = '1') then
                    NX_STATE <= IDLE_STATE;
                end if;
            when others =>
                NX_STATE <= PRE_STATE;
        end case;
    end process;

    DONE_READ_GRAY_CONTROL: process(i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then
                CNT_GRAY_READ <= 0;
                DONE_READ_GRAY_REG <= '0';
            elsif (AXI_RDREQUEST_GRAY_BRAM = '1') then
                CNT_GRAY_READ <= CNT_GRAY_READ + 1;
                DONE_READ_GRAY_REG <= '0';
                if (CNT_GRAY_READ = 76799) then
                    CNT_GRAY_READ <= 0;
                    DONE_READ_GRAY_REG <= '1';
                end if;
            else
                DONE_READ_GRAY_REG <= '0';
            end if;
        end if;
    end process;

    DONE_READ_GRAY_BRAM <= DONE_READ_GRAY_REG;


end STRUCTURE;