`timescale 1ns/100ps

module tb_withAXI();

    //control signals
    logic clk,rst_n;
    logic[31:0]REG00,REG01,REG02,REG03;
    logic[1:0] REG_ADDR;
    logic COMMANDER;

    //wires for connection.
    logic[17:0]THRESHOLD_TOP;
    logic[1:0]ACCESS_CONTROL;
    logic[11:0]AXI_WRDATA_COLOR_BRAM;
    logic AXI_WRREQUEST_COLOR_BRAM,DONE_WRITE_COLOR_BRAM_SIGN;

    logic[16:0]AXI_WRADDR_2COLORBRAM;
    logic AXI_RDREQUEST_COLORBRAM;
    logic[11:0]AXI_RECV_DATA_FR_COLORBRAM;

    logic AXI_START_RGB2GRAY, DONE_WRITE_GRAY_BRAM_SIGN;

    logic[16:0]AXI_RDADDR_2GRAYBRAM;
    logic AXI_RDREQUEST_GRAYBRAM;
    logic[7:0] AXI_RECV_DATA_FR_GRAYBRAM;

    logic AXI_START_GRAY2SOBEL,DONE_PROCESSING_SOBEL,RD_REQUEST_FR_AXI;

    logic[7:0] SOBEL_DATA_2AXI;
    logic[16:0]AXI_RDADDR_2SOBELBRAM;


AXI_LITE_SLAVE axi_slave(
        .S_AXI_ACLK(clk),
        .S_AXI_ARESETN(rst_n), 

        .REG00(REG00),
        .REG01(REG01),
        .REG02(REG02),
        .REG03(REG03),
        .REG_ADDR(REG_ADDR),
        .COMMANDER(COMMANDER),

		.THRESHOLD_TOP(THRESHOLD_TOP),
		
        //--AXI controls all access
        .ACCESS_CONTROL(ACCESS_CONTROL),

        //------------AXI connects to COLOR_BRAM------------------
        .AXI_WRDATA_COLOR_BRAM(AXI_WRDATA_COLOR_BRAM),
        .AXI_WRREQUEST_COLOR_BRAM(AXI_WRREQUEST_COLOR_BRAM),
        .DONE_WRITE_COLOR_BRAM_SIGN(DONE_WRITE_COLOR_BRAM_SIGN),

        .AXI_WRADDR_2COLORBRAM(AXI_WRADDR_2COLORBRAM),
        .AXI_RDREQUEST_COLORBRAM(AXI_RDREQUEST_COLORBRAM),
        .AXI_RECV_DATA_FR_COLORBRAM(AXI_RECV_DATA_FR_COLORBRAM),
        //-------------------------------------------------------

        //----------AXI controls RGB to GRAY process---------
        .AXI_START_RGB2GRAY(AXI_START_RGB2GRAY),
        //----------------------------------

        //----------AXI connects to GRAY_BRAM-----------------
        .DONE_WRITE_GRAY_BRAM_SIGN(DONE_WRITE_GRAY_BRAM_SIGN),

        .AXI_RDADDR_2GRAYBRAM(AXI_RDADDR_2GRAYBRAM),
        .AXI_RDREQUEST_GRAYBRAM(AXI_RDREQUEST_GRAYBRAM),
        .AXI_RECV_DATA_FR_GRAYBRAM(AXI_RECV_DATA_FR_GRAYBRAM),
        //---------------------------------------------------

        //------AXI controls GRAY to SOBEL process------------
        .AXI_START_GRAY2SOBEL(AXI_START_GRAY2SOBEL),
        .DONE_PROCESSING_SOBEL(DONE_PROCESSING_SOBEL),
        //----------------------------------------------------

        //--------------------AXI connects Sobel Bram--------------
        .RD_REQUEST_FR_AXI(RD_REQUEST_FR_AXI),
        .SOBEL_DATA_2AXI(SOBEL_DATA_2AXI),

        .AXI_RDADDR_2SOBELBRAM(AXI_RDADDR_2SOBELBRAM)
        //-------------------------------------------------------
	);

TOP_RGB_GRAY_SOBEL rgb2sobel(
            .i_CLK(clk),
            .i_RSTn(rst_n),
    
            .THRESHOLD_TOP(THRESHOLD_TOP),
		
            //--AXI controls all access
            .ACCESS_CONTROL(ACCESS_CONTROL),
    
            //------------AXI connects to COLOR_BRAM------------------
            .AXI_WRDATA_COLOR_BRAM(AXI_WRDATA_COLOR_BRAM),
            .AXI_WRREQUEST_COLOR_BRAM(AXI_WRREQUEST_COLOR_BRAM),
            .DONE_WRITE_COLOR_BRAM_SIGN(DONE_WRITE_COLOR_BRAM_SIGN),
    
            .AXI_WRADDR_2COLORBRAM(AXI_WRADDR_2COLORBRAM),
            .AXI_RDREQUEST_COLORBRAM(AXI_RDREQUEST_COLORBRAM),
            .AXI_RECV_DATA_FR_COLORBRAM(AXI_RECV_DATA_FR_COLORBRAM),
            //-------------------------------------------------------
    
            //----------AXI controls RGB to GRAY process---------
            .AXI_START_RGB2GRAY(AXI_START_RGB2GRAY),
            //----------------------------------
    
            //----------AXI connects to GRAY_BRAM-----------------
            .DONE_WRITE_GRAY_BRAM_SIGN(DONE_WRITE_GRAY_BRAM_SIGN),
    
            .AXI_RDADDR_2GRAYBRAM(AXI_RDADDR_2GRAYBRAM),
            .AXI_RDREQUEST_GRAYBRAM(AXI_RDREQUEST_GRAYBRAM),
            .AXI_RECV_DATA_FR_GRAYBRAM(AXI_RECV_DATA_FR_GRAYBRAM),
            //---------------------------------------------------
    
            //------AXI controls GRAY to SOBEL process------------
            .AXI_START_GRAY2SOBEL(AXI_START_GRAY2SOBEL),
            .DONE_PROCESSING_SOBEL(DONE_PROCESSING_SOBEL),
            //----------------------------------------------------
    
            //--------------------AXI connects Sobel Bram--------------
            .RD_REQUEST_FR_AXI(RD_REQUEST_FR_AXI),
            .SOBEL_DATA_2AXI(SOBEL_DATA_2AXI),
    
            .AXI_RDADDR_2SOBELBRAM(AXI_RDADDR_2SOBELBRAM)
            //-------------------------------------------------------
         );

task SET_DATA(input logic[31:0]DATA,input logic[1:0]addr);
    @(posedge clk);
    REG_ADDR = addr;
    case (addr) 
        2'b00 :
            REG00 = DATA;
        2'b01 :
            REG01 = DATA;
        2'b10 :
            REG02 = DATA;
        2'b11 :
            REG03 = DATA;
    endcase
    COMMANDER = 1'b1;
    @(posedge clk);
    COMMANDER = 1'b0;
endtask

task COMMANDER_REG00();
    REG_ADDR = 2'b00;
    COMMANDER = 1'b1;
    @(posedge clk);
    COMMANDER = 1'b0;
endtask

task COMMANDER_REG01();
    REG_ADDR = 2'b01;
    COMMANDER = 1'b1;
    @(posedge clk);
    COMMANDER = 1'b0;
endtask

task COMMANDER_REG02();
    REG_ADDR = 2'b10;
    COMMANDER = 1'b1;
    @(posedge clk);
    COMMANDER = 1'b0;
endtask

task COMMANDER_REG03();
    REG_ADDR = 2'b11;
    COMMANDER = 1'b1;
    @(posedge clk);
    COMMANDER = 1'b0;
endtask
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
            REG00 = 0;
            REG01 = 0;
            REG02 = 0;
            REG03 = 0;

            //set threshold to reg02
            SET_DATA(32'hC350,2);

            //Axi gets control
            @(posedge clk);
            REG02[31:30] = 2'b00;
            COMMANDER_REG02();

            //sending 24b pixel to color bram
            for(int i=0; i<76800;i++) begin
                @(posedge clk);
                REG01[23:0] = $urandom(i);
                COMMANDER_REG01();

                @(posedge clk);
                REG00[18] = 1'b1;
                REG00[17] = 1'b1;
                REG00[16:0]=i;
                COMMANDER_REG00();
            end


        end


endmodule