`timescale 1ns/100ps

module INTEGRATED_AXI_FIFO_SIM();

	logic clk,rst;
	logic [31:0]AXI_SLAVE_R0;
	logic WR_TO_SLAVE_REG_EN;
	
	logic[7:0]AXI_OUT_FIFO_IN,AXI_IN_FIFO_OUT;
	logic rd,wr,full,empty;	
	
	TOP_DESIGN fifo_uut(
		.i_CLK(clk),
		.i_RST_n(rst),
		.WR_DATA(AXI_OUT_FIFO_IN),
		.WR(wr),
		.RD(rd),
		.RD_DATA(AXI_IN_FIFO_OUT),
		.FULL(full),
		.EMPTY(empty)	  	
	
	);
	

	
	AXI_BRIDGE_FIFO axi_bridge_fifo_uut(
		.S_AXI_ACLK(clk),
		.S_AXI_ARESETN(rst),
		.AXI_SLAVE_R0(AXI_SLAVE_R0),
		.WR_TO_SLAVE_REG_EN(WR_TO_SLAVE_REG_EN),
        .AXI_OUT_FIFO_IN(AXI_OUT_FIFO_IN),
        .AXI_IN_FIFO_OUT(AXI_IN_FIFO_OUT),
        .WR_FIFO(wr),
        .RD_FIFO(rd),
        .FIFO_FULL(full),
        .EMPTY_FIFO(empty)	
	);
	
    //clk control
    always begin
        begin
            clk = 1;
            #5;
            clk = 0;
            #5;
        end  
    end    
    
    //reset control
    initial begin
		rst = 1;
		#13;
		rst = 0;
		AXI_SLAVE_R0 = 0;
		WR_TO_SLAVE_REG_EN = 0;
		#20;
		rst = 1;
    end 

    //run-time control
    initial begin
        repeat(50) begin
            @(negedge(clk));
        end
        $stop;
    end

	//stimulus
	initial begin
		repeat(10) begin
			@(negedge clk);
		end
		
		//write1
		@(posedge clk);
			WR_TO_SLAVE_REG_EN = 1'b1;
		@(posedge clk);
			AXI_SLAVE_R0 = 32'h5AA;
			WR_TO_SLAVE_REG_EN = 1'b0;
		
		//write	2
		@(posedge clk);
		@(posedge clk);
			WR_TO_SLAVE_REG_EN = 1'b1;
		@(posedge clk);
			AXI_SLAVE_R0 = 32'h5FF;
			WR_TO_SLAVE_REG_EN = 1'b0;
			
		//write	3
		@(posedge clk);
		@(posedge clk);
			WR_TO_SLAVE_REG_EN = 1'b1;
		@(posedge clk);
			AXI_SLAVE_R0 = 32'h5FF;
			WR_TO_SLAVE_REG_EN = 1'b0;

		//write	4
		@(posedge clk);
		@(posedge clk);
			WR_TO_SLAVE_REG_EN = 1'b1;
		@(posedge clk);
			AXI_SLAVE_R0 = 32'h5FF;
			WR_TO_SLAVE_REG_EN = 1'b0;						

		//write	5
		@(posedge clk);
		@(posedge clk);
			WR_TO_SLAVE_REG_EN = 1'b1;
		@(posedge clk);
			AXI_SLAVE_R0 = 32'h5FF;
			WR_TO_SLAVE_REG_EN = 1'b0;		

		//write	6
		@(posedge clk);
		@(posedge clk);
			WR_TO_SLAVE_REG_EN = 1'b1;
		@(posedge clk);
			AXI_SLAVE_R0 = 32'h5FF;
			WR_TO_SLAVE_REG_EN = 1'b0;
			
		//write	7
		@(posedge clk);
		@(posedge clk);
			WR_TO_SLAVE_REG_EN = 1'b1;
		@(posedge clk);
			AXI_SLAVE_R0 = 32'h5FF;
			WR_TO_SLAVE_REG_EN = 1'b0;

		//write 8	
		@(posedge clk);
		@(posedge clk);
			WR_TO_SLAVE_REG_EN = 1'b1;
		@(posedge clk);
			AXI_SLAVE_R0 = 32'h5FF;
			WR_TO_SLAVE_REG_EN = 1'b0;			
						
		//read
		@(posedge clk);		
		@(posedge clk);
			WR_TO_SLAVE_REG_EN = 1'b1;
		@(posedge clk);
			AXI_SLAVE_R0 = 32'h601;
			WR_TO_SLAVE_REG_EN = 1'b0;			
					
	end




endmodule
