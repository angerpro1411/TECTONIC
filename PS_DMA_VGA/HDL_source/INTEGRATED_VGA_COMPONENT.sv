`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2025 01:58:43 PM
// Design Name: 
// Module Name: INTEGRATED_VGA_COMPONENT
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


module INTEGRATED_VGA_COMPONENT #
  (parameter ALMOST_FULL_LEFT_SLOTS = 4,
   parameter ALMOST_EMPTY_AVAI_SLOTS = 4)
(
    input logic i_CLK,
    input logic i_RSTn,


    //Axistream interface
    input logic S_AXIS_VALID,
    output logic S_AXIS_READY,
    input logic[7:0] S_AXIS_DATA,

    output logic HSYNC,
    output logic VSYNC,
    output logic[11:0]OUT_VGA
    );

    //Signal declarations
    logic tick_25;
    logic[10:0] HC,VC;
    logic[11:0]D_2_VGA;
    logic FULL_FIFO;
    logic WR_FIFO;
    logic[11:0] D_2_FIFO;
    logic[11:0] D_OUT_FIFO;
    logic RD_FIFO;
    logic EMPTY;
    logic ALMOST_FULL_FLAG,ALMOST_EMPTY_FLAG;


    FIFO_TOP #(
            .ALMOST_FULL_LEFT_SLOTS(ALMOST_FULL_LEFT_SLOTS),     
            .ALMOST_EMPTY_AVAI_SLOTS(ALMOST_EMPTY_AVAI_SLOTS),	    
			.DATA_WIDTH(12),
			.ADDR_WIDTH(10)
	) FIFO_COMP
    (
		.i_CLK(i_CLK),
        .i_RST_n(i_RSTn),
		.WR_DATA(D_2_FIFO),
		.WR(WR_FIFO),
        .RD(RD_FIFO),
        .ALMOST_FULL_FLAG(ALMOST_FULL_FLAG),
        .ALMOST_EMPTY_FLAG(ALMOST_EMPTY_FLAG),
		.RD_DATA(D_OUT_FIFO),
		.FULL(FULL_FIFO),
        .EMPTY(EMPTY)		
	);

    PIXEL_DATA_CONTROLLER #(
        .VGA_SCALE(12),
        .DATA_WIDTH(8)
    ) CONTROLLER_COMP
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .D_2_FIFO(D_2_FIFO),
        .WR_FIFO(WR_FIFO),
        .FULL_FIFO(FULL_FIFO), 
        
        //Slave AXI Stream interface
        .S_AXIS_DATA(S_AXIS_DATA),
        .S_AXIS_VALID(S_AXIS_VALID),
        .S_AXIS_READY(S_AXIS_READY)
    );

    POSITION_CONTROLLER #(
        .FIFO_DATA_SCALE(12)
    ) POSITION_CONTROLLER_COMP
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .TICK_25(tick_25),

        //These ports to connect to VGA COMPONENT
        .HC(HC),
        .VC(VC),
        .D_2_VGA(D_2_VGA),

        //These ports to connect to FIFO
        .D_FROM_FIFO(D_OUT_FIFO),
        .FIFO_EMPTY(EMPTY),
        .RD_FIFO(RD_FIFO)
    );

    VGA_TOP_DESIGN #(
        .VGA_ZEDBOARD_RESOLUTION(12) 
    ) VGA_COMP
    (
        .i_CLK(i_CLK),
        .i_RST_n(i_RSTn),
        .SYNC_CLR(1'b0),
        .o_TICK_25(tick_25),
        .HSYNC(HSYNC),
        .VSYNC(VSYNC),
        .HC(HC),
        .VC(VC),
        
        .i_RGB_DATA(D_2_VGA),
        .o_RGB_DATA(OUT_VGA)
    );



endmodule
