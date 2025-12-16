`timescale 1ns/100ps

`define headerSize 0x8A


module TEST_TOP_RGB_2_GRAY();

    logic clk,rst_n;
    logic[11:0] AXI_WRDATA_COLOR_BRAM;
    logic EN_WRCOLOR_FR_AXI,AXI_WRREQUEST_COLOR_BRAM,AXI_RDREQUEST_GRAY_BRAM;
    logic [1:0] ON_STATE;
    logic[16:0] AXI_ADDR_COLOR_BRAM,AXI_ADDR_GRAY_BRAM;
    logic[7:0] DATA_FR_GRAY_BRAM;
    logic DONE_WRITE_COLOR_BRAM,DONE_WRITE_GRAY_BRAM,DONE_READ_GRAY_BRAM;


    TOP_RGB_2_GRAY 
        uut1 (
            .i_CLK(clk),
            .i_RSTn(rst_n),
            .AXI_WRDATA_COLOR_BRAM(AXI_WRDATA_COLOR_BRAM),
            // --AXI_SLAVE_REG0(18)
            .EN_WRCOLOR_FR_AXI(EN_WRCOLOR_FR_AXI),

            // --output STATE to let processor know the which state are we on
            .ON_STATE(ON_STATE),

            // --Request
            .AXI_WRREQUEST_COLOR_BRAM(AXI_WRREQUEST_COLOR_BRAM),
            .AXI_ADDR_COLOR_BRAM(AXI_ADDR_COLOR_BRAM),
            .DONE_WRITE_COLOR_BRAM(DONE_WRITE_COLOR_BRAM),

            .DATA_FR_GRAY_BRAM(DATA_FR_GRAY_BRAM),
            .AXI_RDREQUEST_GRAY_BRAM(AXI_RDREQUEST_GRAY_BRAM),
            .AXI_ADDR_GRAY_BRAM(AXI_ADDR_GRAY_BRAM),
            .DONE_READ_GRAY_BRAM(DONE_READ_GRAY_BRAM),
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

        EN_WRCOLOR_FR_AXI = 1'b1;
        for(int i=0;i<76800;i++) begin
            @(posedge clk)
            AXI_WRDATA_COLOR_BRAM = 12'h111+8*i;
            AXI_ADDR_COLOR_BRAM = i;
            AXI_WRREQUEST_COLOR_BRAM = 1'b1;     
        end

        @(posedge clk)
        AXI_WRREQUEST_COLOR_BRAM = 1'b0;

        @(ON_STATE == 2'b01)
        EN_WRCOLOR_FR_AXI = 1'b0;
        
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