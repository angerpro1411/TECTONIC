`timescale 1ns/100ps

module tb_top(
);
    logic clk, rst_n;
    logic[17:0] THRESHOLD_TOP;
    logic[1:0] ACCESS_CONTROL;
    logic[11:0] AXI_WRDATA_COLOR_BRAM;
    logic AXI_WRREQUEST_COLOR_BRAM,DONE_WRITE_COLOR_BRAM_SIGN;
    logic[16:0]AXI_WRADDR_2COLORBRAM;
    logic AXI_RDREQUEST_COLORBRAM;
    logic [11:0] AXI_RECV_DATA_FR_COLORBRAM;
    logic AXI_START_RGB2GRAY,DONE_WRITE_GRAY_BRAM_SIGN;

    logic [16:0] AXI_RDADDR_2GRAYBRAM;
    logic AXI_RDREQUEST_GRAYBRAM;
    logic [7:0] AXI_RECV_DATA_FR_GRAYBRAM;

    logic AXI_START_GRAY2SOBEL,DONE_PROCESSING_SOBEL;
    logic RD_REQUEST_FR_AXI;
    logic [7:0] SOBEL_DATA_2AXI;
    logic [16:0] AXI_RDADDR_2SOBELBRAM;


    TOP_RGB_GRAY_SOBEL uut (
        .i_CLK(clk),
        .i_RSTn(rst_n),

        // --AXI controls threshold
        .THRESHOLD_TOP(THRESHOLD_TOP),

        // --AXI controls all access
        .ACCESS_CONTROL(ACCESS_CONTROL),

        .AXI_WRDATA_COLOR_BRAM(AXI_WRDATA_COLOR_BRAM),
        .AXI_WRREQUEST_COLOR_BRAM(AXI_WRREQUEST_COLOR_BRAM),
        .DONE_WRITE_COLOR_BRAM_SIGN(DONE_WRITE_COLOR_BRAM_SIGN),

        .AXI_WRADDR_2COLORBRAM(AXI_WRADDR_2COLORBRAM),
        .AXI_RDREQUEST_COLORBRAM(AXI_RDREQUEST_COLORBRAM),
        .AXI_RECV_DATA_FR_COLORBRAM(AXI_RECV_DATA_FR_COLORBRAM),
        // -------------------------------------------------------

        // ----------AXI controls RGB to GRAY process---------
        .AXI_START_RGB2GRAY(AXI_START_RGB2GRAY),
        // ----------------------------------

        // ----------AXI connects to GRAY_BRAM-----------------
        .DONE_WRITE_GRAY_BRAM_SIGN(DONE_WRITE_GRAY_BRAM_SIGN),

        .AXI_RDADDR_2GRAYBRAM(AXI_RDADDR_2GRAYBRAM),
        .AXI_RDREQUEST_GRAYBRAM(AXI_RDREQUEST_GRAYBRAM),
        .AXI_RECV_DATA_FR_GRAYBRAM(AXI_RECV_DATA_FR_GRAYBRAM),
        // ---------------------------------------------------

        // ------AXI controls GRAY to SOBEL process------------
        .AXI_START_GRAY2SOBEL(AXI_START_GRAY2SOBEL),
        .DONE_PROCESSING_SOBEL(DONE_PROCESSING_SOBEL),
        // ----------------------------------------------------

        // --------------------AXI connects Sobel Bram--------------
        .RD_REQUEST_FR_AXI(RD_REQUEST_FR_AXI),
        .SOBEL_DATA_2AXI(SOBEL_DATA_2AXI),

        .AXI_RDADDR_2SOBELBRAM(AXI_RDADDR_2SOBELBRAM)
        // --------------------------------------------------------        
    );


//control clock
always begin
    clk = 1;
    #5;
    clk = 0;
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

//run time control
initial begin

    repeat(3)
        @(negedge clk);

    THRESHOLD_TOP = 100000;
    ACCESS_CONTROL = 2'b00;

    for(int i=0;i<76800;i++) begin
        @(posedge clk);
        AXI_WRDATA_COLOR_BRAM = $urandom_range(0,4095);
        AXI_WRREQUEST_COLOR_BRAM = 1'b1;
        AXI_WRADDR_2COLORBRAM = i;
    end

    fork
        begin
            @(posedge clk);
            AXI_WRREQUEST_COLOR_BRAM = 1'b0;
        end

        begin
            @(DONE_WRITE_COLOR_BRAM_SIGN == 1'b1);
            ACCESS_CONTROL = 2'b01;
            AXI_START_RGB2GRAY = 1'b1;
            @(posedge clk);
            AXI_START_RGB2GRAY = 1'b0;
        end
    join

    @(DONE_WRITE_GRAY_BRAM_SIGN ==1'b1);
    AXI_START_GRAY2SOBEL = 1'b1;
    ACCESS_CONTROL = 2'b10;
    @(posedge clk);
    AXI_START_GRAY2SOBEL = 1'b0;

    @(DONE_PROCESSING_SOBEL == 1'b1);
    ACCESS_CONTROL = 2'b00;
    for(int i=0;i<76159;i++) begin
        @(posedge clk);
        AXI_RDADDR_2SOBELBRAM = i;
        RD_REQUEST_FR_AXI = 1'b1;
    end    

    @(posedge clk);
    RD_REQUEST_FR_AXI = 1'b0;

end


endmodule