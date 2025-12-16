`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2024 03:45:21 PM
// Design Name: 
// Module Name: UART_TX_SIM
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
module UART_TX_SIM(

    );
    logic clk,rst;
    logic [7:0] data;
    logic tx,s_tick,tx_done;
    logic tx_start;
    logic [31:0] tx_value = 32'hABF7963D; // 10_10101111_1/10_11110010_1/10_0011_1101
   
    Uart_TX uut (.i_CLK(clk),
                 .i_RST_n(rst),
                 .TX(tx),
                 .TX_START(tx_start),
                 .S_TICK(s_tick),
                 .TX_DONE(tx_done),
                 .DIN(data));
   
    //clk control
    always begin
            //clk
            begin
                clk = 1;
                #5;
                clk = 0;
                #5;
            end  
    end
   
    always begin
        s_tick = 0;
        repeat(2) begin
            @(posedge(clk));
        end
        s_tick = 1;
        @(posedge(clk));
    end
   
    //reset control
    initial begin
    rst = 1;
    #13;
    rst = 0;
    #7;
    rst = 1;
    end
   
    //enable COUNTER
    initial begin
        repeat(4000) begin
            @(negedge(clk));
        end
        $stop;
    end
   
    //tx start
    initial begin	
		repeat(3)
			@(negedge(clk));
		tx_start = 1; 	
    end
   
	always
		//control data
		begin
			data = tx_value[31:24];
			@(posedge (tx_done));
			tx_value = {tx_value[23:0],8'h00};				    
		end 	
	   
endmodule    

