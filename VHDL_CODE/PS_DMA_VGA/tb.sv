`timescale 1ns/100ps

module tb();
    logic rst,clk;

    logic FULL_FIFO;
    logic WR_FIFO;
    logic[11:0] D_2_FIFO;
    logic[11:0] D_OUT_FIFO;
    logic RD_FIFO;
    logic EMPTY;

    //Axistream interface
    logic S_AXIS_VALID;
    logic S_AXIS_READY;
    logic[7:0] S_AXIS_DATA;

    logic tick_25;
    logic[11:0]D_2_VGA;

    logic[10:0] HC,VC;
    logic HSYNC,VSYNC;
    logic[11:0]OUT_VGA;

    FIFO_TOP #(
			.DATA_WIDTH(12),
			.ADDR_WIDTH(10)
	) FIFO_COMP
    (
		.i_CLK(clk),
        .i_RST_n(rst),
		.WR_DATA(D_2_FIFO),
		.WR(WR_FIFO),
        .RD(RD_FIFO),
		.RD_DATA(D_OUT_FIFO),
		.FULL(FULL_FIFO),
        .EMPTY(EMPTY)		
	);

    PIXEL_DATA_CONTROLLER #(
        .VGA_SCALE(12),
        .DATA_WIDTH(8)
    ) CONTROLLER_COMP
    (
        .i_CLK(clk),
        .i_RSTn(rst),
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
        .i_CLK(clk),
        .i_RSTn(rst),
        .TICK_25(tick_25),

        //These ports to connect to VGA COMPONENT
        .HC(HC),
        .VC(VC),
        .D_2_VGA(D_2_VGA),

        //These ports to connect to FIFO
        .D_FROM_FIFO(D_OUT_FIFO),
        .RD_FIFO(RD_FIFO)
    );

    VGA_TOP_DESIGN #(
        .VGA_ZEDBOARD_RESOLUTION(12) 
    ) VGA_COMP
    (
        .i_CLK(clk),
        .i_RST_n(rst),
        .SYNC_CLR(1'b0),
        .o_TICK_25(tick_25),
        .HSYNC(HSYNC),
        .VSYNC(VSYNC),
        .HC(HC),
        .VC(VC),
        
        .i_RGB_DATA(D_2_VGA),
        .o_RGB_DATA(OUT_VGA)
    );

    //Clock control
    always begin
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
    end

    //reset control
    initial begin
        rst = 1'b0;
        #14;
        rst = 1'b1;
    end

    //stimulus
    initial begin

        S_AXIS_VALID = 1'b0;
        S_AXIS_DATA = 0;

        repeat(2) begin
            @(posedge clk);
        end

        repeat(1000) begin
            S_AXIS_VALID = 1'b1;
            S_AXIS_DATA = $urandom_range(0,255);    
            if (S_AXIS_READY == 0) begin
                @(posedge clk)
                S_AXIS_VALID = 1'b1;
                S_AXIS_DATA = S_AXIS_DATA;
            end
            else begin 
                @(posedge clk)
                S_AXIS_VALID = 1'b1;
                S_AXIS_DATA = $urandom_range(0,255);
            end
        end
    end
endmodule