library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PIXEL_DATA_CONTROLLER is
    generic(
        SYS_CLK         : integer := 100; --100MHz system clock.
        BRAM_DATA_SCALE : integer := 8;

        --Image resolution
        WIDTH_RESO      : integer := 320;
        HEIGHT_RESO     : integer := 240
    );
    port(
        i_CLK       : in std_logic;
        i_RSTn      : in std_logic;
        TICK_25     : in std_logic;

        --These ports to connect to VGA COMPONENT
        HC          : in std_logic_vector(10 downto 0);
        VC          : in std_logic_vector(10 downto 0);
        D_2_VGA     : out std_logic_vector(BRAM_DATA_SCALE-1 downto 0);

        --These ports to connect to Block RAM
        D_FROM_BRAM     : in std_logic_vector(BRAM_DATA_SCALE-1 downto 0);
        RD_ADDR2BRAM    : out std_logic_vector(16 downto 0);
        RD_BRAM         : out std_logic
    );
end entity;

architecture RTL of PIXEL_DATA_CONTROLLER is
    
    signal HC_UNSIGNED, VC_UNSIGNED : unsigned(10 downto 0);
    signal INSIDE_IMAGE : std_logic;
    signal RD_ADDR2BRAM_UNSIGNED : unsigned(16 downto 0);

    constant HD : integer := 640; --Horizontal display area.
    constant HF : integer := 16;  --H.front porch.
    constant HB : integer := 48;  --H.back porch.
    constant HR : integer := 96;  --H.retrace.
    
    constant VD : integer := 480; --Vertical display area.
    constant VF : integer := 10;  --V.front porch.
    constant VB : integer := 33;  --V.back porch.
    constant VR : integer := 2;   --V.retrace  

    --From all constant calculates the image position that we want to put.
    --Put image in the center of sceen.
    constant START_PT : integer := HB + HD/4;
    constant END1_LINE : integer := START_PT+WIDTH_RESO;
    constant START_LINE : integer := VB + VD/4;
    constant LAST_LINE : integer := START_LINE+HEIGHT_RESO; 

begin
    HC_UNSIGNED <= unsigned(HC);
    VC_UNSIGNED <= unsigned(VC);
    RD_ADDR2BRAM<= std_logic_vector(RD_ADDR2BRAM_UNSIGNED);

    INSIDE_IMAGE <= '1' when HC_UNSIGNED >= START_PT and HC_UNSIGNED <= END1_LINE-1
                            and VC_UNSIGNED >= START_LINE and VC_UNSIGNED <= LAST_LINE-1 else '0';
    D_2_VGA <= D_FROM_BRAM when INSIDE_IMAGE = '1' else (others => '0');

    RD_BRAM_CTRL: process (i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then 
                RD_BRAM <= '0';
            else
                if INSIDE_IMAGE = '1' and TICK_25 = '1' then
                    RD_BRAM <= '1';
                else
                    RD_BRAM <= '0';
                end if;
            end if;
        end if;     
    end process;

    RD_ADDR_CTRL: process (i_CLK)
    begin
        if rising_edge(i_CLK) then
            if i_RSTn = '0' then 
                RD_ADDR2BRAM_UNSIGNED <= (others => '0');
            else
                if RD_ADDR2BRAM_UNSIGNED = 76800 then
                    RD_ADDR2BRAM_UNSIGNED <= (others => '0');
                elsif INSIDE_IMAGE = '1' and TICK_25 = '1' then
                    RD_ADDR2BRAM_UNSIGNED <= RD_ADDR2BRAM_UNSIGNED + 1;                
                end if;
            end if;
        end if;     
    end process;


end architecture RTL;