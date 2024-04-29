`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2024 02:22:55 PM
// Design Name: 
// Module Name: FIFO_SIM
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIFO_CONTROL_SIM(
    );
    logic clk,rst;
    logic rd,wr;
    logic full,empty;
    logic [2:0] wr_addr,rd_addr;
    
    localparam [7:0] data [0:7] = '{8'hAF,8'hBA,8'h5A,8'h41,
    								8'h50,8'h12,8'hFC,8'hEE};
           
    FIFO_CONTROLLER uut (
    				.i_CLK(clk),
    				.i_RST_n(rst),
    				.RD(rd),
    				.WR(wr),
    				.FULL(full),
    				.EMPTY(empty),
    				.WR_ADDR(wr_addr),
    				.RD_ADDR(rd_addr)				
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
		rd = 1'b0;
		wr = 1'b0;
		#13;
		rst = 0;
		#7;
		rst = 1;
    end 
    
    //run-time control
    initial begin
        repeat(4000) begin
            @(negedge(clk));
        end
        $stop;
    end
   
    //stimulus
    initial begin
        @(negedge clk);
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;
        
        @(negedge clk);
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;        
      
        @(negedge clk);
        wr = 1'b1;
        @(negedge clk);
        wr = 1'b0;      
    end

endmodule
