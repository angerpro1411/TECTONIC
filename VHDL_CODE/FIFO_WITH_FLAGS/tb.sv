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
    logic ALMOST_FULL_FLAG,ALMOST_EMPTY_FLAG;
           
    FIFO_TOP 
    #(
        .ALMOST_FULL_LEFT_SLOTS(4),
        .ALMOST_EMPTY_AVAI_SLOTS(4),
        .DATA_WIDTH(8),
        .ADDR_WIDTH(4)
    )

    uut (
    				.i_CLK(clk),
    				.i_RST_n(rst),
    				.RD(rd),
    				.WR(wr),
                    .ALMOST_FULL_FLAG(ALMOST_FULL_FLAG),
                    .ALMOST_EMPTY_FLAG(ALMOST_EMPTY_FLAG),
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
		rd = 1'b0;
		wr = 1'b0;        
        rst = 0;
		#13;
		rst = 1;
    end 
    
    //run-time control
    initial begin
        repeat(4000) begin
            @(posedge(clk));
        end
        $stop;
    end
   
    //stimulus
    initial begin
        repeat(2)
            @(posedge clk);
            
            //Write till full
            repeat(17) begin
                @(posedge clk);
                wr_data = $urandom_range(0,255);
                wr = 1'b1;
                @(posedge clk);
                wr = 1'b0;
            end

            
            //Read-Write same time when full
            repeat(2) begin
                @(posedge clk);
                wr_data = 0;
                wr = 1'b1;
                rd = 1'b1;
                @(posedge clk);
                rd = 1'b0;
                wr = 1'b0;            
            end

            @(posedge clk);
            wr_data = $urandom_range(0,255);
            wr = 1'b1;
            @(posedge clk);
            wr = 1'b0;
              
            @(posedge clk);
            wr_data = $urandom_range(0,255);
            wr = 1'b1;
            @(posedge clk);
            wr = 1'b0;  

            @(posedge clk);
            wr_data = $urandom_range(0,255);
            wr = 1'b1;
            @(posedge clk);
            wr = 1'b0;
            // full 
            
            //Continue to write but the wr_addr won't change
            @(posedge clk);
            wr_data = 0;
            wr = 1'b1;
            @(posedge clk);
            wr = 1'b0;
            
            @(posedge clk);
            wr_data = 0;
            wr = 1'b1;
            @(posedge clk);
            wr = 1'b0;                      
            
            //Write and read at the same time at Full state, no operation performs 
            @(posedge clk);
            wr_data = 0;
            wr = 1'b1;
            rd = 1'b1;
            @(posedge clk);
            rd = 1'b0;
            wr = 1'b0;  
            
            @(posedge clk);
            wr_data = 0;
            wr = 1'b1;
            rd = 1'b1;
            @(posedge clk);
            rd = 1'b0;
            wr = 1'b0;
            
            //Read till Empty
            repeat(14) 
            begin
                @(posedge clk);
                rd = 1'b1;
                @(posedge clk);
                rd = 1'b0;
            end              
            //Empty
              
            //Continue Read but the rd_addr won't change
            @(posedge clk);
            rd = 1'b1;
            @(posedge clk);
            rd = 1'b0;
            
            @(posedge clk);
            rd = 1'b1;
            @(posedge clk);
            rd = 1'b0;
            
            //continue Read-Write at the Empty state, no performs
            @(posedge clk);
            wr_data = 0;
            wr = 1'b1;
            rd = 1'b1;
            @(posedge clk);
            rd = 1'b0;
            wr = 1'b0;  
            
            @(posedge clk);
            wr_data = 0;
            wr = 1'b1;
            rd = 1'b1;
            @(posedge clk);
            rd = 1'b0;
            wr = 1'b0;            
                                                                                                                   
    end

endmodule