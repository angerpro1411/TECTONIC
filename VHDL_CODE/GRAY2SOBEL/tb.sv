`timescale 1ns/100ps

module tb();
    logic rst_n,clk;
    logic[7:0] i_data;
    logic wr,rd;
    logic [16:0] wr_addr,addr,rd_addr;
    logic [7:0]data_out_fr_graybram;
    logic START_RDGRAYBRAM,DONE_CAL;
    logic rd_wr_addr_control;

    logic[16:0]o_ADDRESS_2SOBELBRAM;
    logic o_WRITE_SOBELBRAM;
    logic [7:0]o_DATA_2SOBELBRAM;


BRAM_2CONTROL
    #(.VGA_ZEDBOARD(8)) graybram
    (
.i_CLK(clk),
.i_RSTn(rst_n),	
.i_DATA(i_data),	
.i_WRITE(wr),
.i_READ(rd),
.ADDRESS(addr),
.o_DATA(data_out_fr_graybram)	
);

GRAY2SOBEL kernel_arrangement (
.i_CLK(clk),
.i_RSTn(rst_n),
        .START_RDGRAYBRAM(START_RDGRAYBRAM),
        .DONE_CAL(DONE_CAL),

        .i_DATA_FR_GRAYBRAM(data_out_fr_graybram),
        .o_ADDRESS_2GRAYBRAM(rd_addr),
        .o_READ_GRAYBRAM(rd),
        
        //These signels use to write data into sobel bram.
        .o_ADDRESS_2SOBELBRAM(o_ADDRESS_2SOBELBRAM),
        .o_WRITE_SOBELBRAM(o_WRITE_SOBELBRAM),
        .o_DATA_2SOBELBRAM(o_DATA_2SOBELBRAM)        

);

BRAM_2CONTROL
    #(.VGA_ZEDBOARD(8)) sobelbram
    (
.i_CLK(clk),
.i_RSTn(rst_n),	
.i_DATA(o_DATA_2SOBELBRAM),	
.i_WRITE(o_WRITE_SOBELBRAM),
.ADDRESS(o_ADDRESS_2SOBELBRAM)	
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

//control address
always_comb begin
    if (rd_wr_addr_control == 1'b1)
        addr <= wr_addr;
    else
        addr <= rd_addr;
end

//run time control
initial begin

    repeat(3)
        @(negedge clk);

    //write total oneline
    rd_wr_addr_control = 1'b1;
    DONE_CAL = 1'b0;
    for(int i=0;i<76800;i++) begin  
        @(posedge clk);
        wr = 1'b1;
        wr_addr = i;
        i_data = ($urandom(i)+8)%255;
    end
   
    @(posedge clk);
    rd_wr_addr_control = 1'b0;
    wr = 1'b0;
    START_RDGRAYBRAM = 1'b1;
/*   
    repeat(20)
        @(posedge clk);    
    DONE_CAL = 1'b1;
   
    @(posedge clk);
    DONE_CAL = 1'b0;
    */
end

endmodule
