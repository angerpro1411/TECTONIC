`timescale 1ns/100ps

module tb();

    logic clk;
    logic i_wr;

    TEST_FUNCTION uut (
        .i_CLK(clk),
        .i_WR(i_wr)
    );

    always begin
        clk = 0;
        #5;
        clk = 1;
        #5;
    end

    initial begin
        @(posedge clk);
        @(posedge clk);
        i_wr = 1'b1;
        @(posedge clk);
        i_wr = 1'b0;

        @(posedge clk);
        i_wr = 1'b1;
        @(posedge clk);
        i_wr = 1'b0;

        @(posedge clk);
        i_wr = 1'b1;
        @(posedge clk);
        i_wr = 1'b1;
        @(posedge clk);
        i_wr = 1'b1;
        @(posedge clk);
        i_wr = 1'b0;
    end
endmodule