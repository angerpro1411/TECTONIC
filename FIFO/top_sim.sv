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


module FIFO_SIM(
    );
    logic clk,rst;
    logic rd,wr;
    logic full,empty;
    logic [7:0] wr_data,rd_data;
    
    localparam [7:0] data [0:7] = '{8'hAF,8'hBA,8'h5A,8'h41,
    								8'h50,8'h12,8'hFC,8'hEE};
           
    Top_Design uut (
    				.i_CLK(clk),
    				.i_RST_n(rst),
    				.RD(rd),
    				.WR(wr),
    				.FULL(full),
    				.EMPTY(empty),
    				.WR_DATA(wr_data),
    				.RD_DATA(rd_data)				
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
        repeat(2)
            @(negedge clk);
            
            //Write till full
            @(negedge clk);
            wr_data = data[0];
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;

            @(negedge clk);
            wr_data = data[1];
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;
            
            @(negedge clk);
            wr_data = data[2];
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;                    

            @(negedge clk);
            wr_data = data[3];
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;
            
            @(negedge clk);
            wr_data = data[4];
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;
            
            @(negedge clk);
            wr_data = data[5];
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;           

            @(negedge clk);
            rd = 1'b1;
            @(negedge clk);
            rd = 1'b0;
            
            //Read-Write same time
            @(negedge clk);
            wr_data = 0;
            wr = 1'b1;
            rd = 1'b1;
            @(negedge clk);
            rd = 1'b0;
            wr = 1'b0;            
            
            @(negedge clk);
            wr_data = data[6];
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;
              
            @(negedge clk);
            wr_data = data[7];
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;  

            @(negedge clk);
            wr_data = data[0];
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;
            // full 
            
            //Continue to write but the wr_addr won't change
            @(negedge clk);
            wr_data = 0;
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;
            
            @(negedge clk);
            wr_data = 0;
            wr = 1'b1;
            @(negedge clk);
            wr = 1'b0;                      
            
            //Write and read at the same time at Full state, no operation performs 
            @(negedge clk);
            wr_data = 0;
            wr = 1'b1;
            rd = 1'b1;
            @(negedge clk);
            rd = 1'b0;
            wr = 1'b0;  
            
            @(negedge clk);
            wr_data = 0;
            wr = 1'b1;
            rd = 1'b1;
            @(negedge clk);
            rd = 1'b0;
            wr = 1'b0;
            
            //Read till Empty
            repeat(8) 
            begin
                @(negedge clk);
                rd = 1'b1;
                @(negedge clk);
                rd = 1'b0;
            end              
            //Empty
              
            //Continue Read but the rd_addr won't change
            @(negedge clk);
            rd = 1'b1;
            @(negedge clk);
            rd = 1'b0;
            
            @(negedge clk);
            rd = 1'b1;
            @(negedge clk);
            rd = 1'b0;
            
            //continue Read-Write at the Empty state, no performs
            @(negedge clk);
            wr_data = 0;
            wr = 1'b1;
            rd = 1'b1;
            @(negedge clk);
            rd = 1'b0;
            wr = 1'b0;  
            
            @(negedge clk);
            wr_data = 0;
            wr = 1'b1;
            rd = 1'b1;
            @(negedge clk);
            rd = 1'b0;
            wr = 1'b0;            
                                                                                                                   
    end

endmodule
