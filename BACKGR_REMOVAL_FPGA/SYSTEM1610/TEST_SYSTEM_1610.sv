`timescale 1ns/100ps
module TEST_SYSTEM_1610();

    logic clk,rstn;
    logic[23:0]S_AXIS_DATA;
    logic S_AXIS_VALID,S_AXIS_READY;

    logic[23:0]M_AXIS_DATA;
    logic M_AXIS_VALID,M_AXIS_READY;

    logic i_START_STREAM;

    SYSTEM #(.DATA_WIDTH(24)) SYSTEM_COMP
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_START_STREAM(i_START_STREAM),
    
        //S AXIS
        .S_AXIS_DATA(S_AXIS_DATA),
        .S_AXIS_VALID(S_AXIS_VALID),
        .S_AXIS_READY(S_AXIS_READY),
        
        //M AXIS
        .M_AXIS_DATA(M_AXIS_DATA),
        .M_AXIS_VALID(M_AXIS_VALID),
        .M_AXIS_READY(M_AXIS_READY) 
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


    //Stimulus
    //Send 20 rows x 320 24-bit data.
    initial begin
        i_START_STREAM = 1'b0;
        M_AXIS_READY = 1'b0;
        S_AXIS_VALID = 1'b0;
        repeat(2)
            @(posedge clk);

        i_START_STREAM = 1'b1;
        M_AXIS_READY = 1'b1;
        @(posedge clk);
        @(posedge clk);
        repeat(320*20) begin
            @(posedge clk);
            if (S_AXIS_READY == 1'b1) begin
                S_AXIS_DATA = $urandom_range(16777215,0);
                S_AXIS_VALID = 1'b1;
            end
            else begin
                S_AXIS_DATA = S_AXIS_DATA;
                S_AXIS_VALID = 1'b1;
            end
        end

    end 




endmodule