`timescale 1ns/100ps

module tb_MAX_MIN_DIFF();

    logic clk,rstn;
    logic[23:0]data_rgb;
    
    logic[7:0]r;
    logic[7:0]g;
    logic[7:0]b;

    logic data_valid;
    logic MASK;
    parameter [7:0]threshold = 8'd50;

    MAX_MIN_DIFF uut
        ( 
            .i_CLK(clk), 
            .i_RSTn(rstn),      
            .i_DATA_RGB(data_rgb), 
            .i_DATA_VALID(data_valid),
            .i_H_THRESHOLD(threshold),
            .o_MASK(MASK) 
        );

    always begin
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
    end

    initial begin
        rstn = 1'b0;
        #13;
        rstn = 1'b1;
    end

    //stimulus
    initial begin

        //initial value for inputs
        r = 0;
        g = 0;
        b = 0;
        data_rgb = 0;
        data_valid = 0;

        repeat(2) begin
            @(posedge clk);
            data_valid = 1'b0;
        end

        repeat(100) begin
            @(posedge clk);
            r = $urandom_range(255,0);
            g = $urandom_range(255,0);
            b = $urandom_range(255,0);
            data_rgb = {b,g,r};
            data_valid = 1'b1;
        end

        repeat(5) begin
            @(posedge clk);
            data_rgb = data_rgb;
            data_valid = 1'b0;
        end
        
        repeat(100) begin
            @(posedge clk);
            //data_rgb = $urandom_range(16777216,0);
            r = $urandom_range(255,0);
            g = $urandom_range(255,0);
            b = $urandom_range(255,0);
            data_rgb = {b,g,r};
            data_valid = 1'b1;
        end 
        
        repeat(5) begin
            @(posedge clk);
            data_rgb = data_rgb;
            data_valid = 1'b0;
        end

        $finish(2);

    end





endmodule