`timescale 1ns/100ps

module TEST_ADDRESSING_PIXEL();
    logic rst_n,clk;
    logic[11:0] i_data;
    logic wr,rd;
    logic [16:0] addr;
    logic[11:0] data_out;


ADDRESSING_PIXEL uut (
		.i_CLK(clk),
		.i_RSTn(rst_n),	
		.i_DATA(i_data),			
		.i_WRITE(wr),
		.i_READ(rd),
		.ADDRESS(addr),
		.o_DATA(data_out)	
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

    //write total oneline 
    for(int i=0;i<320;i++) begin   
        @(posedge clk);
        wr = 1'b1;
        rd = 1'b0;
        i_data = i;
        addr[16:9] = 0;
        addr[8:0] = i; 
    end

    //write totall oneline 
    for(int i=0;i<320;i++) begin   
        @(posedge clk);
        wr = 1'b1;
        rd = 1'b0;
        i_data = i*2;
        addr[16:9] = 1;
        addr[8:0] = i; 
    end

    //repeat(2)
        @(posedge clk);
    wr = 1'b0;
    rd = 1'b1;
    addr[16:9] = 0;
    addr[8:0] = 10; 

    @(posedge clk);
    wr = 1'b0;
    rd = 1'b0;

    //repeat(2)
        @(posedge clk);
    wr = 1'b0;
    rd = 1'b1;
    addr[16:9] = 1;
    addr[8:0] = 10;

        @(posedge clk);
    wr = 1'b0;
    rd = 1'b0;
    
    //repeat(2)
        @(posedge clk);
    wr = 1'b0;
    rd = 1'b1;
    addr[16:9] = 0;
    addr[8:0] = 50;

    @(posedge clk);
    wr = 1'b0;
    rd = 1'b0;

    //repeat(2)
        @(posedge clk);
    wr = 1'b0;
    rd = 1'b1;
    addr[16:9] = 1;
    addr[8:0] = 50;    

    @(posedge clk);
    wr = 1'b0;
    rd = 1'b0;

end

endmodule