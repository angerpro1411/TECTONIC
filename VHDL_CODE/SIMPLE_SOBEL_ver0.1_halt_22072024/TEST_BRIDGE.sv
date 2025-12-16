`timescale 1ns/100ps

module TEST_BRIDGE();


    //driven signal.
    logic clk, rst_n;
    logic WR_TO_SLAVE_REG_EN;
    logic [31:0] AXI_SLAVE_R0,AXI_SLAVE_R1,AXI_SLAVE_R3;

    //wire connection.
    logic i_WRITE_AXI,i_READ_COLOR,i_READ_AXI;
    logic [11:0] i_DATA_AXI, o_DATA_COLOR;
    logic [16:0] ADDRESS_COLOR,rd_color_addr,wr_gray_addr,ADDRESS_AXI,GRAY_RDADDRESS_AXI,gray_addr;
    logic done_write_color,done_write_gray,rd_color_request;
    logic [7:0] o_GRAY_OUT8,i_gray_data;
    logic o_GRAY_OUT_VALID,gray_read;

    logic [16:0] cnt_gray_read;
    logic done_read_gray;

    BRAM_2CONTROL BRAM_COLOR
            (
            .i_CLK(clk),
            .i_RSTn(rst_n),	
            
            .i_DATA(i_DATA_AXI), 		
            .i_WRITE(i_WRITE_AXI), 
            .i_READ(i_READ_COLOR), 
            .DONE_WRITE(done_write_color),
            
            .ADDRESS(ADDRESS_COLOR), 
            .o_DATA(o_DATA_COLOR) 
        );


    AXI_BRIDGE_BRAM bridge (     

            .S_AXI_ACLK(clk),
            .S_AXI_ARESETN(rst_n), 
            .AXI_SLAVE_R0(AXI_SLAVE_R0),
            .AXI_SLAVE_R1(AXI_SLAVE_R1),
            .AXI_SLAVE_R3(AXI_SLAVE_R3),
            .WR_TO_SLAVE_REG_EN(WR_TO_SLAVE_REG_EN),	
            
            .GRAY_RDADDRESS(GRAY_RDADDRESS_AXI),
            .GRAY_READ(gray_read),
            .i_GRAY_DATA(i_gray_data),            

            
            .i_DATA(i_DATA_AXI), 		
            .i_WRITE(i_WRITE_AXI), 
            .i_READ(i_READ_AXI), 
            .o_DATA(),
            .ADDRESS(ADDRESS_AXI)
            );

    RGB_2_GRAY transform(
		    .i_CLK(clk),
		    .i_RSTn(rst_n),
            .DONE_WRITE_COLOR(done_write_color),
            .DONE_WRITE_GRAY(done_write_gray),
		    .RD_ADDRESS(rd_color_addr),
            .i_READ(rd_color_request),
            .WR_ADDRESS(wr_gray_addr),
		
		    .o_DATA_fr_RAM(o_DATA_COLOR),
            .GRAY_MATRIX9_OUT(),
            .o_GRAY_OUT8(o_GRAY_OUT8),
            .o_GRAY_OUT_VALID(o_GRAY_OUT_VALID)
    );
    BRAM_2CONTROL #(.VGA_ZEDBOARD(8)) BRAM_GRAY
    (
            .i_CLK(clk),
            .i_RSTn(rst_n),	
            
            .i_DATA(o_GRAY_OUT8), 		
            .i_WRITE(o_GRAY_OUT_VALID), 
            .i_READ(gray_read), 
            .DONE_WRITE(done_write_gray),
            
            .ADDRESS(gray_addr), 
            .o_DATA(i_gray_data)         
    );

/*
    typedef enum {AXI_read,RGB_write} gray_state_t;
    gray_state_t gray_state_reg,gray_state_next;

    always_ff @(posedge clk)
    begin
        if (!rst_n)
            gray_state_reg <= AXI_read;
        else
            gray_state_reg <= gray_state_next;
    end

    always_comb 
    begin
        gray_state_next <= gray_state_reg;
        case (gray_state_reg)
            AXI_read :
            begin
                gray_addr <= GRAY_RDADDRESS_AXI;
                if (done_write_color)
                    gray_state_next <= RGB_write;
                    
            end
            RGB_write :
            begin
                gray_addr <= wr_gray_addr;
                if (done_write_gray)
                    gray_state_next <= AXI_read;
            end
        endcase
    end


    typedef enum {AXI_write,RGB_read} state_t;
    state_t state_reg,state_next;

    always_ff @(posedge clk)
    begin
        if (!rst_n)
            state_reg <= AXI_write;
        else
            state_reg <= state_next;
    end

    always_comb 
    begin
        state_next <= state_reg;
        case (state_reg)
            AXI_write :
            begin
                i_READ_COLOR <= i_READ_AXI;
                ADDRESS_COLOR <= ADDRESS_AXI;
                if (done_write_color)
                    state_next <= RGB_read;
                    
            end
            RGB_read :
            begin
                i_READ_COLOR <= rd_color_request;
                ADDRESS_COLOR <= rd_color_addr;
                if (done_write_gray)
                    state_next <= AXI_write;
            end
        endcase
    end
*/
    typedef enum {IDLE,AXI_write,RGB_occupied,AXI_read} state_t;
    state_t state_reg,state_next;

    always_ff @(posedge clk)
    begin
        if (!rst_n)
            state_reg <= IDLE;
        else
            state_reg <= state_next;
    end

    always_comb 
    begin
        state_next = state_reg;
        i_READ_COLOR = i_READ_AXI;
        ADDRESS_COLOR = ADDRESS_AXI;
        gray_addr = GRAY_RDADDRESS_AXI;
        case (state_reg)
            IDLE:
            begin
                if(AXI_SLAVE_R0[18] == 1'b1)
                    state_next = AXI_write;                
            end
            AXI_write :
            begin
                i_READ_COLOR = i_READ_AXI;
                ADDRESS_COLOR = ADDRESS_AXI;
                gray_addr = GRAY_RDADDRESS_AXI;
                if (done_write_color)
                    state_next = RGB_occupied;
                    
            end
            RGB_occupied :
            begin
                i_READ_COLOR = rd_color_request;
                ADDRESS_COLOR = rd_color_addr;
                gray_addr = wr_gray_addr;
                if (done_write_gray)
                    state_next = AXI_read;
            end
            AXI_read :
            begin
                i_READ_COLOR = i_READ_AXI;
                ADDRESS_COLOR = ADDRESS_AXI;
                gray_addr = GRAY_RDADDRESS_AXI;
                if (done_read_gray) 
                    state_next = IDLE ;
            end
        endcase
    end

    always_ff @(posedge clk)
    begin
        if (!rst_n) begin
            cnt_gray_read <= 0;
            done_read_gray <= 0;
        end
        else if (gray_read) begin
            cnt_gray_read <= cnt_gray_read + 1;
            done_read_gray <= 0;
            if (cnt_gray_read == 76799) begin
                cnt_gray_read <= 0;
                done_read_gray <= 1;
            end 
        else
            done_read_gray <= 0;
        end
    end

    //control clock
    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
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
    //Address 17b is inside R0 from[16:0].
    // ADDRESS will work as we divide to 240 lines, and 320 rows.
    // So line 0 is from 0 to 319.
    // Line 1 is from 320 to 639....
    // till Line 239 from 320x239=76480 to 320x239+319=76799.
    //So Line_Number = ADDRESS/320 and ROW_NUMBER = ADDRESS%320
    initial begin
        repeat(3)
            @(negedge clk);

        //write command to full
        for (int i=0; i<76800;i++) 
        begin
            @(posedge clk);
            WR_TO_SLAVE_REG_EN = 1'b1;

            @(posedge clk);
            WR_TO_SLAVE_REG_EN = 1'b0;
            AXI_SLAVE_R1 = 32'h00101010+i*8'hAA;
            AXI_SLAVE_R0 = 32'h00060000+i;
        end
        @(done_write_color)
        AXI_SLAVE_R0[18] = 0;
        
        @(done_write_gray);
        for (int i=0; i<76800;i++) 
        begin
            @(posedge clk);
            WR_TO_SLAVE_REG_EN = 1'b1;

            @(posedge clk);
            WR_TO_SLAVE_REG_EN = 1'b0;
            AXI_SLAVE_R3 = 32'h80000000+(i<<8);
        end
    end


    task WRITE(int line, int row, logic[23:0] data);
            @(posedge clk);
            WR_TO_SLAVE_REG_EN = 1'b1;

            @(posedge clk);
            WR_TO_SLAVE_REG_EN = 1'b0;
            AXI_SLAVE_R1 = 32'h00000000+data;
            AXI_SLAVE_R0 = 32'h00060000+(line*320+row);
    endtask













/*
    //run time control
    //Address 17b is inside R0 from[16:0].
    // ADDRESS will work as we divide to 240 lines, and 320 rows.
    // So line 0 is from 0 to 319.
    // Line 1 is from 320 to 639....
    // till Line 239 from 320x239=76480 to 320x239+319=76799.
    //So Line_Number = ADDRESS/320 and ROW_NUMBER = ADDRESS%320
    initial begin
        repeat(3)
            @(negedge clk);

        //write command to full
        for (int i=0; i<76800;i++) 
        begin
            @(posedge clk);
            WR_TO_SLAVE_REG_EN = 1'b1;

            @(posedge clk);
            WR_TO_SLAVE_REG_EN = 1'b0;
            AXI_SLAVE_R1 = 32'h00101010+i*8'hAA;
            AXI_SLAVE_R0 = 32'h00060000+i;
        end

        //write command, line0, row1            
        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b1;

        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b0;                AXI_SLAVE_R0[18] = 1'b0;

        //write command, line1, row0
        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b1;

        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b0;
        AXI_SLAVE_R1 = 32'h00AAAAAA;
        AXI_SLAVE_R0 = 32'h00060200;  

        //write command, line0, row2
        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b1;

        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b0;
        AXI_SLAVE_R1 = 32'h00DDDDDD;
        AXI_SLAVE_R0 = 32'h00060002;

        //Read command, line0, row0
        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b1;

        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b0;
        AXI_SLAVE_R1 = 32'h00DDDDDD;
        AXI_SLAVE_R0 = 32'h00040000;

                //Read command, line0, row0
        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b1;

        @(posedge clk);
        WR_TO_SLAVE_REG_EN = 1'b0;
        AXI_SLAVE_R1 = 32'h00DDDDDD;
        AXI_SLAVE_R0 = 32'h00040001;


    end
*/





endmodule