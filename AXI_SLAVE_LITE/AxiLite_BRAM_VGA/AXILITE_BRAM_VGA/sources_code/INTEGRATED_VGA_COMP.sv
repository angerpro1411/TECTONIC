`timescale 1ns / 100ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/17/2025 04:58:06 PM
// Design Name: 
// Module Name: INTEGRATED_VGA_COMP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module INTEGRATED_VGA_COMP(
    
    //Interface with AXI
    input logic AXI_ACLK,
    input logic AXI_ARESETN,
    input logic o_RD_BRAM_AXI_REQ,
    input logic o_WR_BRAM_AXI_REQ,
    input logic[16:0]BRAM_ADDR_FR_AXI,
    input logic[7:0]WDATA_BRAM_FR_AXI,
    input logic CHIP_SELECT,
    
    output logic[7:0]RD_DATA_FR_BRAM,
    
    //interface with VGA
    //VGA component
    output logic HSYNC,VSYNC,
    output logic[11:0]o_RGB_DATA
    
);
    

    
    
     

    //BRAM component
    logic DONE_WR;
    logic i_READ_BRAM;
    logic[16:0] i_ADDR_BRAM;
    logic[7:0] o_DATA_FROM_BRAM;

    //Pixel CTRLLER component
    logic tick_25;
    logic[10:0] HC,VC;
    logic[11:0] D_2_VGA;
    logic[7:0] D_FROM_BRAM;
    logic[16:0] RD_ADDR2BRAM_FR_VGA;
    logic RD_BRAM_FR_VGA;





    //Acces control to BRAM
    always_comb begin
        //AXI accesses
        if (CHIP_SELECT == 1'b0) begin
            i_READ_BRAM = o_RD_BRAM_AXI_REQ;
            i_ADDR_BRAM = BRAM_ADDR_FR_AXI;
            RD_DATA_FR_BRAM = o_DATA_FROM_BRAM;
            D_FROM_BRAM = 8'h00;
        end
        //VGA accesses
        else if (CHIP_SELECT == 1'b1) begin
            i_READ_BRAM = RD_BRAM_FR_VGA;
            i_ADDR_BRAM = RD_ADDR2BRAM_FR_VGA;
            RD_DATA_FR_BRAM = 8'h00;
            D_FROM_BRAM = o_DATA_FROM_BRAM;            
        end
    end 

    BRAM_2CONTROL #(.VGA_ZEDBOARD(8)) BRAM
	(
		.i_CLK(AXI_ACLK),
		.i_RSTn(AXI_ARESETN),	
		.i_DATA(WDATA_BRAM_FR_AXI),	
		.i_WRITE(o_WR_BRAM_AXI_REQ),
		
		.DONE_WRITE(DONE_WR),
        .i_READ(i_READ_BRAM),
		.ADDRESS(i_ADDR_BRAM),
		.o_DATA(o_DATA_FROM_BRAM)
		);        

    PIXEL_DATA_CONTROLLER PIXEL_CTRLLER(
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


endmodule
