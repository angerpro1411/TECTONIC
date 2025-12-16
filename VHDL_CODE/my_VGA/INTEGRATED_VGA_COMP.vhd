library ieee;
use ieee.std_logic_1164.all;

entity INTEGRATED_VGA_COMP
    PORT(
    
    --Interface with AXI
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
    

architecture STRUCTURE of INTEGRATED_VGA_COMP is    

    -- //BRAM component
    signal DONE_WR : std_logic;
    signal i_READ_BRAM : std_logic;
    signal i_ADDR_BRAM : std_logic_vector(16 downto 0);
    signal o_DATA_FROM_BRAM : std_logic_vector(7 downto 0);

    -- //Pixel CTRLLER component
    signal tick_25;
    signal HC,VC : std_logic_vector(10 downto 0);
    signal D_2_VGA : std_logic_vector(11 downto 0);
    signal D_FROM_BRAM : std_logic_vector(7 downto 0);
    signal RD_ADDR2BRAM_FR_VGA std_logic_vector(16 downto 0);
    signal RD_BRAM_FR_VGA : std_logic;

    component BRAM_2CONTROL is
        generic(
            --Image resolution = 1/4 vga = 320x240 = 76_800 => need 17 bits for address -> take 19 bits for full VGA.
            --so full VGA is 2^19 = 524_288
            --Full VGA is fail because of size of FPGA, that cost 320 Block Ram, but we only have 280.
            --Finally come back with 1/4 VGA => 17 bit
            IMAGE_WIDTH : integer := 320;
            IMAGE_HEIGHT : integer := 240;
            
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


    component PIXEL_DATA_CONTROLLER is
        generic(
            SYS_CLK         : integer := 100; --100MHz system clock.
            BRAM_DATA_SCALE : integer := 8;
            VGA_SCALE       : integer := 12;

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
            D_2_VGA     : out std_logic_vector(VGA_SCALE-1 downto 0);

            --These ports to connect to Block RAM
            D_FROM_BRAM     : in std_logic_vector(BRAM_DATA_SCALE-1 downto 0);
            RD_ADDR2BRAM    : out std_logic_vector(16 downto 0);
            RD_BRAM         : out std_logic
        );
    end component;

    component VGA_TOP_DESIGN is
        generic(
            VGA_ZEDBOARD_RESOLUTION : integer := 12 
        );
        port(
            i_CLK,i_RST_n : in std_logic;
            SYNC_CLR : in std_logic;
            o_TICK_25 : out std_logic;
            HSYNC   : out std_logic;
            VSYNC   : out std_logic;
            HC      : out std_logic_vector(10 downto 0);
            VC      :out std_logic_vector(10 downto 0);
            
            i_RGB_DATA: in std_logic_vector(VGA_ZEDBOARD_RESOLUTION-1 downto 0);
            o_RGB_DATA: out std_logic_vector(VGA_ZEDBOARD_RESOLUTION-1 downto 0)
        );
    end component;


begin

    --Component instantiation
    BRAM : BRAM_2CONTROL 
    GENERIC MAP(VGA_ZEDBOARD => 8) 
	PORT MAP(
		i_CLK => AXI_ACLK,
		i_RSTn => AXI_ARESETN,	
		i_DATA => WDATA_BRAM_FR_AXI,	
		i_WRITE => o_WR_BRAM_AXI_REQ,
		
		DONE_WRITE => DONE_WR,
        i_READ => i_READ_BRAM,
		ADDRESS => i_ADDR_BRAM,
		o_DATA => o_DATA_FROM_BRAM
		);        

    PIXEL_CTRLLER : PIXEL_DATA_CONTROLLER (
		.i_CLK(AXI_ACLK),
		.i_RSTn(AXI_ARESETN),	
        .TICK_25(tick_25),

        //These ports to connect to VGA COMPONENT
        .HC(HC),
        .VC(VC),
        .D_2_VGA(D_2_VGA),

        // --These ports to connect to Block RAM
        .D_FROM_BRAM(D_FROM_BRAM),
        .RD_ADDR2BRAM(RD_ADDR2BRAM_FR_VGA),
        .RD_BRAM(RD_BRAM_FR_VGA)
    );

    VGA_TOP_DESIGN VGA_COMP(
		.i_CLK(AXI_ACLK),
		.i_RST_n(AXI_ARESETN),
        .SYNC_CLR(1'b0),
        .o_TICK_25(tick_25),
        .HSYNC(HSYNC),
        .VSYNC(VSYNC),
        .HC(HC),
        .VC(VC),
        
        .i_RGB_DATA(D_2_VGA),
        .o_RGB_DATA(o_RGB_DATA)
    );

    -- //Acces control to BRAM
    always_comb begin
        //AXI accesses
        if (CHIP_SELECT == 1'b0) begin
            i_READ_BRAM = o_RD_BRAM_AXI_REQ;
            i_ADDR_BRAM = BRAM_ADDR_FR_AXI;
            RD_DATA_FR_BRAM = o_DATA_FROM_BRAM;
            D_FROM_BRAM = 8'h00;
        end
        -- //VGA accesses
        else if (CHIP_SELECT == 1'b1) begin
            i_READ_BRAM = RD_BRAM_FR_VGA;
            i_ADDR_BRAM = RD_ADDR2BRAM_FR_VGA;
            RD_DATA_FR_BRAM = 8'h00;
            D_FROM_BRAM = o_DATA_FROM_BRAM;            
        end
    end 
end architecture;
