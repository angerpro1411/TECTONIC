`timescale 1ns/100ps

module BaudRate_Gen_Sim();

	logic clk,rst;
	logic [5:0] dvsr;
	logic tick;
	
	BaudRate_Gen uut (	.i_CLK(clk),
						.i_RST_n(rst),
						.DVSR(dvsr),
						.TICK(tick)
	);

    //reset control
    initial begin
    rst = 1;
    #13;
    rst = 0;
    #7;
    rst = 1;
    end	
   
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
    
    initial begin
    	dvsr = 6'b110101;
    end


endmodule