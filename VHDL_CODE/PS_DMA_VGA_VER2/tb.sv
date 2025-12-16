`timescale 1ns/100ps

module tb();
    logic rst,clk;

    //Axistream interface
    logic S_AXIS_VALID,AXIS_VALID_NEXT;
    logic S_AXIS_READY;
    logic[7:0] S_AXIS_DATA,AXIS_DATA_NEXT;

    logic HSYNC,VSYNC;
    logic[11:0]OUT_VGA;

    INTEGRATED_VGA_COMPONENT wrap_comp (
        .i_CLK(clk),
        .i_RSTn(rst),

        .S_AXIS_VALID(S_AXIS_VALID),
        .S_AXIS_READY(S_AXIS_READY),
        .S_AXIS_DATA(S_AXIS_DATA),
    
        .HSYNC(HSYNC),
        .VSYNC(VSYNC),
        .OUT_VGA(OUT_VGA)

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

    always_ff @(posedge clk) begin
        if (rst == 1'b0) begin
            S_AXIS_DATA <= 1'b0;
            S_AXIS_VALID <= 1'b0;
        end
        else begin
            S_AXIS_DATA <= AXIS_DATA_NEXT;
            S_AXIS_VALID <= AXIS_VALID_NEXT;
        end
    end

    //stimulus
    initial begin

        AXIS_VALID_NEXT = 1'b0;
        AXIS_DATA_NEXT = 8'h00;

        repeat(2) begin
            @(posedge clk);
        end


        repeat(10000) begin
                
            @(posedge clk);
            if ((S_AXIS_READY == 1'b0) || (S_AXIS_VALID == 1'b0)) begin
                AXIS_VALID_NEXT = $urandom_range(0,1);
                AXIS_DATA_NEXT = S_AXIS_DATA;
            end
            else begin 
                AXIS_VALID_NEXT = $urandom_range(0,1);
                AXIS_DATA_NEXT = $urandom_range(0,255);
            end
        end
    end
endmodule