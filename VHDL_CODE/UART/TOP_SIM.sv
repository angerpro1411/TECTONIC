`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2024 10:05:43 AM
// Design Name: 
// Module Name: TOP_SIM
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


module TOP_SIM(
);
	logic clk,rst_n;
	
	logic tx_start;
	logic [7:0]din_tx;
    logic [31:0] tx_value = 32'hABF7963D; // 10_10101111_1/10_11110010_1/10_0011_1101
    logic tx_done,tx;
    localparam [31:0] rx_value = 32'hABF7963D; // 10_10101111_1/10_11110010_1/10_0011_1101
    logic rx_done,rx;
    logic[7:0]dout_rx;

	Top_Design uut (		 
						 .i_CLK(clk),
						 .i_RST_n(rst_n),
						 .DVSR(6'b110101),
						 .RX(rx),
					.DIN_TX(din_tx),
					.TX_START(tx_start),
					.DOUT_RX(dout_rx),
					.RX_DONE(rx_done),	 
						 .TX(tx),   
					.TX_DONE(tx_done)
	);

    //clk control 100Mhz
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
		rst_n = 1;
		#13;
		rst_n = 0;
		#7;
		rst_n = 1;
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
		din_tx = tx_value[31:24];
		@(negedge (tx_done));
		tx_value = {tx_value[23:0],8'h00};				    
	end 
   
    //rx
    initial begin
        rx = 1;
        repeat(3)
            @(negedge clk);
        rx = 0;
        repeat(16) begin//(16 ticks)
            repeat(53)//53 cycles one tick
                @(negedge clk);
        end
        for(int i=31;i>=0;--i) begin
            rx = rx_value[i];
            repeat(16) begin
                repeat(53)
                    @(negedge clk);
            end
        end      
    end
   
/*   
    //control timing simulation
    initial begin
        repeat(4000) begin
            @(negedge(clk));
        end
        $stop;
    end
*/    
    
endmodule