`timescale 1ns/100ps

`define headerSize 0x8A


module TEST_TOP_RGB_2_GRAY();

    logic clk,rst_n;
    logic[11:0] AXI_WRDATA_COLOR_BRAM,AXI_RD_DATA;
    logic AXI_WRREQUEST_COLOR_BRAM,AXI_RDREQUEST_GRAY_BRAM,AXI_RD_REQUEST;
    logic[16:0] AXI_ADDRESS_CTRL_COLOR,AXI_ADDRESS_CTRL_GRAY;
    logic[7:0] DATA_FR_GRAY_BRAM;
    logic DONE_WRITE_COLOR_BRAM,DONE_WRITE_GRAY_BRAM,DONE_READ_GRAY_BRAM,STATE_SELECT,AXI_START_PROCESSING;


    TOP_RGB_2_GRAY 
        uut1 (
            .i_CLK(clk),
            .i_RSTn(rst_n),

            .AXI_WRDATA_COLOR_BRAM(AXI_WRDATA_COLOR_BRAM),
            .AXI_WRREQUEST_COLOR_BRAM(AXI_WRREQUEST_COLOR_BRAM),
            .AXI_ADDRESS_CTRL_COLOR(AXI_ADDRESS_CTRL_COLOR),
            .AXI_RD_REQUEST(AXI_RD_REQUEST),
            .AXI_RD_DATA(AXI_RD_DATA),
            .DONE_WRITE_COLOR_BRAM(DONE_WRITE_COLOR_BRAM),

            .STATE_SELECT(STATE_SELECT),
            .AXI_START_PROCESSING(AXI_START_PROCESSING),
    
            .DATA_FR_GRAY_BRAM (DATA_FR_GRAY_BRAM),
            .AXI_ADDRESS_CTRL_GRAY(AXI_ADDRESS_CTRL_GRAY),
            .AXI_RDREQUEST_GRAY_BRAM(AXI_RDREQUEST_GRAY_BRAM),
            .DONE_WRITE_GRAY_BRAM(DONE_WRITE_GRAY_BRAM)
        );

    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end

        //control reset
    initial begin
        rst_n = 1'b1;
        #13
        rst_n = 1'b0;
        #15
        rst_n = 1'b1;
    end

    initial begin
        repeat(3)
            @(negedge clk);

        STATE_SELECT = 1'b1;
        for(int i=0;i<76800;i++) begin
            @(posedge clk)
            AXI_WRDATA_COLOR_BRAM = 12'h111+8*i;
            AXI_ADDRESS_CTRL_COLOR = i;
            AXI_WRREQUEST_COLOR_BRAM = 1'b1;     
        end

        @(negedge DONE_WRITE_COLOR_BRAM)
        STATE_SELECT = 1'b0;
        AXI_WRREQUEST_COLOR_BRAM = 1'b0;
        AXI_START_PROCESSING = 1'b1;

        @(posedge clk)
        AXI_START_PROCESSING = 1'b0;

        @(negedge DONE_WRITE_GRAY_BRAM)
        STATE_SELECT = 1'b1;
        for(int i=0;i<76800;i++) begin
            @(posedge clk)
            AXI_ADDRESS_CTRL_GRAY = i;
            AXI_RDREQUEST_GRAY_BRAM = 1'b1;     
        end 
        @(posedge clk)       
        AXI_RDREQUEST_GRAY_BRAM = 1'b0;


/*
        @(ON_STATE == 2'b10)
        for(int i=0;i<76800;i++) begin
            @(posedge clk)
            AXI_ADDR_GRAY_BRAM = i;
            AXI_RDREQUEST_GRAY_BRAM = 1'b1;     
        end        
        
        @(DONE_READ_GRAY_BRAM == 1)
        AXI_RDREQUEST_GRAY_BRAM = 1'b0;*/
    end



endmodule