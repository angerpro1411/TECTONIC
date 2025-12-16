`timescale 1ns/100ps

module LUT8BITs_tb();
    logic clk,rstn;
    logic [7:0] dividend;
    logic [7:0] divisor;
    logic [13:0] quotient;
    logic start;

    LUT_DIV_8BITS uut(
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_START(start),
        .i_DIVIDEND(dividend),
        .i_DIVISOR(divisor),
        .o_QUOTIENT(quotient)        
    );

    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end

    initial begin
        rstn = 1'b0;
        #13;
        rstn = 1'b1;
    end

    //stimulus
    initial begin
        repeat(2)
            @(posedge clk);
        
        start = 1'b1;
        dividend = 50;
        for(int i=0;i<256;i++) begin
            divisor = i;
            @(posedge clk);
        end

        dividend = 255;
        for(int i=0;i<256;i++) begin
            divisor = i;
            @(posedge clk);
        end

    end


endmodule