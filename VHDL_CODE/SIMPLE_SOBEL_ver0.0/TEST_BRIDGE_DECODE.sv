`timescale 1ns/100ps

module TEST_BRIDGE_DECODE();


    //driven signal.
    logic clk, rst_n;
    logic WR_TO_SLAVE_REG_EN;
    logic [31:0] AXI_SLAVE_R0,AXI_SLAVE_R1;

    //wire connection.
    logic i_WRITE,i_READ,READ_EN, VALID_RD_DATA,DONE_WRITE;
    logic [11:0] i_DATA, o_DATA;
    logic [16:0] ADDRESS;


    ADDRESSING_PIXEL addr_pixel
            (
            .i_CLK(clk),
            .i_RSTn(rst_n),	
            
            .i_DATA(i_DATA), 		
            .i_WRITE(i_WRITE), 
            .i_READ(i_READ), 
            
            .ADDRESS(ADDRESS), 
            
            .READ_EN(READ_EN), 
            .o_DATA(o_DATA), 
            .VALID_RD_DATA(VALID_RD_DATA), 
            .DONE_WRITE(DONE_WRITE)
        );


    AXI_BRIDGE_DECODE bridge (     

            .S_AXI_ACLK(clk),
            .S_AXI_ARESETN(rst_n), 
            .AXI_SLAVE_R0(AXI_SLAVE_R0),
            .AXI_SLAVE_R1(AXI_SLAVE_R1),
            .WR_TO_SLAVE_REG_EN(WR_TO_SLAVE_REG_EN),	
            
            
            .i_DATA(i_DATA), 		
            .i_WRITE(i_WRITE), 
            .i_READ(i_READ), 
            
            .ADDRESS(ADDRESS), 
            
            .READ_EN(READ_EN), 
            .o_DATA(o_DATA), 
            .VALID_RD_DATA(VALID_RD_DATA), 
            .DONE_WRITE(DONE_WRITE)
            );


    //control clock
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

    //run time control
    initial begin
        repeat(3)
            @(negedge clk);

        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b1;

        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b0;
        AXI_SLAVE_R1 = 32'h00FFFFFF;
        AXI_SLAVE_R0 = 32'h00060000;
            
        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b1;

        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b0;
        AXI_SLAVE_R1 = 32'h00EEEEEE;
        AXI_SLAVE_R0 = 32'h00060001;

        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b1;

        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b0;
        AXI_SLAVE_R1 = 32'h00DDDDDD;
        AXI_SLAVE_R0 = 32'h00060002;


        // @(posedge clk);
        // WR_TO_SLAVE_REG_EN = 1'b1;

        // @(posedge clk);
        // WR_TO_SLAVE_REG_EN = 1'b0;
        // AXI_SLAVE_R1 = 32'h00AAAAAA;
        // AXI_SLAVE_R0 = 32'h00060200;    
    end






endmodule