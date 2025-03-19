`timescale 1ns/100ps

module tb_TOP();
    
    logic clk,rstn;

    //AXI component
    logic[1:0]ADDR_REG;
    logic[31:0]BRAM_REG;
    logic WR_TO_SLAVE_REG_EN;

    logic o_RD_BRAM_AXI_REQ;
    logic o_WR_BRAM_AXI_REQ;
    logic[16:0]BRAM_ADDR_FR_AXI;
    logic[7:0]WDATA_BRAM_FR_AXI;
    logic[7:0]RD_DATA_FR_BRAM; 

    //BRAM component
    logic DONE_WR;
    logic i_READ_BRAM;
    logic[16:0] i_ADDR_BRAM;
    logic[7:0] o_DATA_FROM_BRAM;

    //Pixel CTRLLER component
    logic tick_25;
    logic[10:0] HC,VC;
    logic[11:0] D_2_VGA;
    logic[7:0] D_FROM_BRAM;
    logic[16:0] RD_ADDR2BRAM_FR_VGA;
    logic RD_BRAM_FR_VGA;

    //VGA component
    logic HSYNC,VSYNC;
    logic[11:0]o_RGB_DATA;

    task CMD_RAND_DATA(logic EN = 1'b1, logic WorR = 1'b1,logic[16:0]addr, logic dir=1'b0);
        automatic bit[7:0] data = $urandom_range(0,255);
        if ((WorR == 1'b1) && (EN == 1'b1)) begin
            BRAM_REG = {1'b0,dir,3'b000,data,EN,WorR,addr};
        end
        else if((WorR == 1'b0) && (EN == 1'b1)) begin
            BRAM_REG = {1'b0,dir,3'b000,8'h00,EN,WorR,addr};
        end
    endtask


    //Acces control to BRAM
    always_comb begin
        //AXI accesses
        if (BRAM_REG[30] == 1'b0) begin
            i_READ_BRAM = o_RD_BRAM_AXI_REQ;
            i_ADDR_BRAM = BRAM_ADDR_FR_AXI;
            RD_DATA_FR_BRAM = o_DATA_FROM_BRAM;
            D_FROM_BRAM = 8'h00;
        end
        //VGA accesses
        else if (BRAM_REG[30] == 1'b1) begin
            i_READ_BRAM = RD_BRAM_FR_VGA;
            i_ADDR_BRAM = RD_ADDR2BRAM_FR_VGA;
            RD_DATA_FR_BRAM = 8'h00;
            D_FROM_BRAM = o_DATA_FROM_BRAM;            
        end
    end 

    A_PART_OF_AXI AXI_MASTER_CTRL (
        // --Input axi
        .ADDR_REG(ADDR_REG),
        .S_AXI_ACLK(clk),
        .S_AXI_ARESETN(rstn),
        .WR_TO_SLAVE_REG_EN(WR_TO_SLAVE_REG_EN),
        .BRAM_REG(BRAM_REG),
        .RD_DATA_FR_BRAM(RD_DATA_FR_BRAM),

        // --Output axi
        .o_RD_BRAM(o_RD_BRAM_AXI_REQ),
        .o_WR_BRAM(o_WR_BRAM_AXI_REQ),
        .BRAM_ADDR(BRAM_ADDR_FR_AXI),
        .WDATA_BRAM(WDATA_BRAM_FR_AXI)    
    );

    BRAM_2CONTROL #(.VGA_ZEDBOARD(8)) BRAM
	(
		.i_CLK(clk),
		.i_RSTn(rstn),	
		.i_DATA(WDATA_BRAM_FR_AXI),	
		.i_WRITE(o_WR_BRAM_AXI_REQ),
		
		.DONE_WRITE(DONE_WR),
        .i_READ(i_READ_BRAM),
		.ADDRESS(i_ADDR_BRAM),
		.o_DATA(o_DATA_FROM_BRAM)
		);        

    PIXEL_DATA_CONTROLLER PIXEL_CTRLLER(
		.i_CLK(clk),
		.i_RSTn(rstn),	
        .TICK_25(tick_25),

        //These ports to connect to VGA COMPONENT
        .HC(HC),
        .VC(VC),
        .D_2_VGA(D_2_VGA),

        // --These ports to connect to Block RAM
        .D_FROM_BRAM(D_FROM_BRAM),
        .RD_ADDR2BRAM(RD_ADDR2BRAM_FR_VGA),
        .RD_BRAM(RD_BRAM_FR_VGA)
    );

    VGA_TOP_DESIGN VGA_COMP(
		.i_CLK(clk),
		.i_RST_n(rstn),
        .SYNC_CLR(1'b0),
        .o_TICK_25(tick_25),
        .HSYNC(HSYNC),
        .VSYNC(VSYNC),
        .HC(HC),
        .VC(VC),
        
        .i_RGB_DATA(D_2_VGA),
        .o_RGB_DATA(o_RGB_DATA)
    );

    //clk control
    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end

    //reset control
    initial begin
        rstn = 1'b0;
        #13;
        rstn = 1'b1;
    end

    //stimulus
    initial begin
        repeat(2)
            @(negedge clk);
        
        for(int i=0;i<76800;i++) begin
            @(posedge clk);    
            WR_TO_SLAVE_REG_EN = 1'b1;
            ADDR_REG = 2'b00;
            
            @(posedge clk);
            WR_TO_SLAVE_REG_EN = 1'b0;
            CMD_RAND_DATA(,,i,);
        end

        //Change direction to VGA
        @(posedge clk);
        @(posedge clk);
        BRAM_REG[30] = 1'b1;

    end


    
endmodule