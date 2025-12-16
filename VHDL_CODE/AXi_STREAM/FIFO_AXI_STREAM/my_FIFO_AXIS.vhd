----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/04/2025 04:08:03 PM
-- Design Name: 
-- Module Name: my_FIFO_AXIS - RTL
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

entity my_FIFO_AXIS is
	GENERIC(
        DATA_WIDTH : integer := 32;
        ADDR_WIDTH : integer := 3
	);
	PORT(
	    AXI_CLK : in std_logic;
	    AXI_RSTN: in std_logic;
	    
	    -- AXI4-S slave i/f
	    S_AXIS_VALID : in std_logic;
	    S_AXIS_READY : out std_logic;
	    S_AXIS_TLAST : in std_logic;
	    S_AXIS_DATA  : in std_logic_vector(DATA_WIDTH-1 downto 0);
	    
	    -- AXI4-M master i/f
	    M_AXIS_VALID : out std_logic;
	    M_AXIS_READY : in std_logic;
	    M_AXIS_TLAST : out std_logic;
	    M_AXIS_DATA  : out std_logic_vector(DATA_WIDTH-1 downto 0)
	    		
	);
end my_FIFO_AXIS;

architecture RTL of my_FIFO_AXIS is

---------------------------COMPONENT DECLARATION :: BEGIN-----------------------------------    
    component Top_Design is
        GENERIC(
			DATA_WIDTH : integer := 32;
			ADDR_WIDTH : integer := 3
        );
        PORT(
            i_CLK,i_RST_n : in std_logic;
            WR_DATA		  : in std_logic_vector(DATA_WIDTH-1 downto 0);
            WR,RD 		  : in std_logic;
            RD_DATA 	  : out std_logic_vector(DATA_WIDTH-1 downto 0);
            FULL,EMPTY	  : out std_logic		
        );
    end component Top_Design;
    
    component my_S_AXIS is
    GENERIC(
            DATA_WIDTH          : integer := 32
    );

    Port (
    
            --Fifo signals
            WR_DATA_FIFO        : out std_logic_vector(DATA_WIDTH-1 downto 0);
            WR_FIFO             : out std_logic;
            FIFO_FULL           : in std_logic;
    
            --S AXIS STREAM signals
            S_AXIS_ACLK         : in std_logic;
            S_AXIS_ARESETN      : in std_logic;
            S_AXIS_DATA         : in std_logic_vector(DATA_WIDTH-1 downto 0);
            S_AXIS_VALID        : in std_logic;
            S_AXIS_TLAST        : in std_logic;
            S_AXIS_READY        : out std_logic
       );
    end component my_S_AXIS;
    
    component my_M_AXIS is
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
    end component my_M_AXIS;
    
---------------------------COMPONENT DECLARATION :: END-------------------------------------

---------------------------SIGNAL DECLARATION :: BEGIN-----------------------------------
    
    signal D_IN_FIFO         :  std_logic_vector(DATA_WIDTH-1 downto 0);
    signal D_OUT_FIFO        :  std_logic_vector(DATA_WIDTH-1 downto 0);
    signal WR_FIFO           :  std_logic;
    signal RD_FIFO           :  std_logic;
    signal FULL_SIGN         :  std_logic;
    signal EMPTY_SIGN        :  std_logic;
---------------------------SIGNAL DECLARATION :: END-----------------------------------      
begin
     
    -----------------------INSTANTIATION PART :: BEGIN ---------------------------------------    
    FIFO: TOP_DESIGN 
    GENERIC MAP(
        DATA_WIDTH => DATA_WIDTH,
        ADDR_WIDTH => ADDR_WIDTH
        )
    PORT MAP(
        i_CLK => AXI_CLK,
        i_RST_n => AXI_RSTN,
        WR_DATA	=> D_IN_FIFO,
        WR      => WR_FIFO,
        RD      => RD_FIFO,
        RD_DATA => D_OUT_FIFO,
        FULL    => FULL_SIGN,
        EMPTY	=> EMPTY_SIGN    
    );
    
    S_AXIS: my_S_AXIS
    GENERIC MAP(
            DATA_WIDTH => DATA_WIDTH
    )
    PORT MAP(
            --Fifo signals
            WR_DATA_FIFO  => D_IN_FIFO,
            WR_FIFO  => WR_FIFO,
            FIFO_FULL => FULL_SIGN,
    
            --S AXIS STREAM signals
            S_AXIS_ACLK         => AXI_CLK,
            S_AXIS_ARESETN      => AXI_RSTN,
            S_AXIS_DATA         => S_AXIS_DATA,
            S_AXIS_VALID        => S_AXIS_VALID,
            S_AXIS_TLAST        => S_AXIS_TLAST,
            S_AXIS_READY        => S_AXIS_READY
       ); 
    
    M_AXIS: my_M_AXIS
    GENERIC MAP(
            DATA_WIDTH          => DATA_WIDTH
    )
    PORT MAP (
            --Fifo signals
            RD_DATA_FIFO        => D_OUT_FIFO,
            RD_FIFO             => RD_FIFO,
            FIFO_EMPTY          => EMPTY_SIGN,
    
            --M AXIS STREAM signals
            M_AXIS_ACLK         => AXI_CLK,
            M_AXIS_ARESETN      => AXI_RSTN,
            M_AXIS_DATA         => M_AXIS_DATA,
            M_AXIS_VALID        => M_AXIS_VALID,
            M_AXIS_TLAST        => M_AXIS_TLAST,
            M_AXIS_READY        => M_AXIS_READY
       );      
    ---------------------INSTANTIATION PART :: END ---------------------------------------  
    
    -----------------------ASSIGN PART :: BEGIN ---------------------------------------

    -----------------------ASSIGN PART :: END ---------------------------------------    



end RTL;
