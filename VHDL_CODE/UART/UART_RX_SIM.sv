`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2024 03:45:21 PM
// Design Name: 
// Module Name: UART_RX_SIM
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
module UART_RX_SIM(

    );
logic clk,rst;
    logic [7:0] q_out;
    logic rx,s_tick,rx_done;
    localparam [31:0] rx_value = 32'hABF7963D; // 10_10101111_1/10_11110010_1/10_0011_1101
   
    Uart_RX uut (.i_CLK(clk),
                 .i_RST_n(rst),
                 .Rx(rx),
                 .S_TICK(s_tick),
                 .RX_DONE(rx_done),
                 .DOUT(q_out));
   
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
   
    //rx
    initial begin
        for(int i=31;i>=0;--i) begin
            rx = rx_value[i];
            repeat(16) begin
                @(negedge(s_tick));
            end
        end      
       
    end
   
endmodule    

