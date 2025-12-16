`timescale 1ns/100ps

module top_tb();

    logic clk,rstn;
    logic [23:0] i_data_rgb;
    logic i_data_valid;

    logic[7:0]r;
    logic[7:0]g;
    logic[7:0]b;

    logic [23:0]o_DATA0,o_DATA1,o_DATA2,o_DATA3;
    logic o_VALID0,o_VALID1,o_VALID2,o_VALID3;

    logic i_VALID0,i_VALID1,i_VALID2,i_VALID3;
    logic i_MASK0,i_MASK1,i_MASK2,i_MASK3;

    logic o_VALID;
    logic o_DATA;


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF 
        
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(i_data_valid),
        .i_READ(),
        
        .i_DATA(i_data_rgb),
        .o_INTR(),
        
        
        .o_DATA()
        
    );


    INPUT4MASK_CALCUL INPUT4MASK_CALCUL_COMP
        (
            .i_CLK(clk),
            .i_RSTn(rstn),
            .i_VALID(i_data_valid),
            .i_DATA(i_data_rgb),

            .o_DATA0(o_DATA0),
            .o_VALID0(o_VALID0),
            .o_DATA1(o_DATA1),
            .o_VALID1(o_VALID1),
            .o_DATA2(o_DATA2),
            .o_VALID2(o_VALID2),
            .o_DATA3(o_DATA3),
            .o_VALID3(o_VALID3)                        
        );

    MULTIPLEXER OUTPUT_MASK_DISTRIBUTION(
        .i_VALID0(i_VALID0),
        .i_VALID1(i_VALID1),
        .i_VALID2(i_VALID2),
        .i_VALID3(i_VALID3),
        .i_MASK0(i_MASK0),
        .i_MASK1(i_MASK1),
        .i_MASK2(i_MASK2),
        .i_MASK3(i_MASK3),

        .o_DATA(o_DATA),
        .o_VALID(o_VALID)
    );


    MASK_CALCUL MASK_CALCUL0
    ( 
        .i_CLK(clk),       
        .i_RSTn(rstn),
        .i_DATA_RGB(o_DATA0),
        .i_DATA_VALID(o_VALID0),
        
        .i_H_THRESHOLD(8'd50),
        .o_MASK_VALID(i_VALID0),
        .o_MASK(i_MASK0)
    );

    MASK_CALCUL MASK_CALCUL1
    ( 
        .i_CLK(clk),       
        .i_RSTn(rstn),
        .i_DATA_RGB(o_DATA1),
        .i_DATA_VALID(o_VALID1),
        
        .i_H_THRESHOLD(8'd50),
        .o_MASK_VALID(i_VALID1),
        .o_MASK(i_MASK1)
    );

    MASK_CALCUL MASK_CALCUL2
    ( 
        .i_CLK(clk),       
        .i_RSTn(rstn),
        .i_DATA_RGB(o_DATA2),
        .i_DATA_VALID(o_VALID2),
        
        .i_H_THRESHOLD(8'd50),
        .o_MASK_VALID(i_VALID2),
        .o_MASK(i_MASK2)
    );

    MASK_CALCUL MASK_CALCUL3
    ( 
        .i_CLK(clk),       
        .i_RSTn(rstn),
        .i_DATA_RGB(o_DATA3),
        .i_DATA_VALID(o_VALID3),
        
        .i_H_THRESHOLD(8'd50),
        .o_MASK_VALID(i_VALID3),
        .o_MASK(i_MASK3)
    );

    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF 
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(o_VALID),
        .i_READ(),
        
        .i_DATA(o_DATA),
        .o_INTR(),
        
        
        .o_DATA()
        
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

        //initial value for inputs
        r = 0;
        g = 0;
        b = 0;
        i_data_rgb = 0;
        i_data_valid = 0;

        repeat(2) begin
            @(posedge clk);
            i_data_valid = 1'b0;
        end

        repeat(4) begin
            @(posedge clk);
            r = $urandom_range(255,0);
            g = $urandom_range(255,0);
            b = $urandom_range(255,0);
            i_data_rgb = {b,g,r};
            i_data_valid = 1'b1;
        end

        repeat(5) begin
            @(posedge clk);
            i_data_rgb = i_data_rgb;
            i_data_valid = 1'b0;
        end
        
        repeat(100) begin
            @(posedge clk);
            //data_rgb = $urandom_range(16777216,0);
            r = $urandom_range(255,0);
            g = $urandom_range(255,0);
            b = $urandom_range(255,0);
            i_data_rgb = {b,g,r};
            i_data_valid = 1'b1;
        end 
        
        repeat(5) begin
            @(posedge clk);
            i_data_rgb = i_data_rgb;
            i_data_valid = 1'b0;
        end

        $finish(2);

    end
    



endmodule