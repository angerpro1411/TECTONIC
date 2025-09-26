`timescale 1ns/100ps
module TEST_SUPPRESS_DATA2609();

    logic clk,rstn;

    //Data from INPUT12RGBBUFF to 12 RGB BUFFERS
    logic[23:0]DATA2_RGBBUFF0;
    logic DATAVALID_RGBBUFF0;
    logic[23:0]DATA2_RGBBUFF1;
    logic DATAVALID_RGBBUFF1;
    logic[23:0]DATA2_RGBBUFF2;
    logic DATAVALID_RGBBUFF2;
    logic[23:0]DATA2_RGBBUFF3;
    logic DATAVALID_RGBBUFF3;
    logic[23:0]DATA2_RGBBUFF4;
    logic DATAVALID_RGBBUFF4;
    logic[23:0]DATA2_RGBBUFF5;
    logic DATAVALID_RGBBUFF5;
    logic[23:0]DATA2_RGBBUFF6;
    logic DATAVALID_RGBBUFF6;
    logic[23:0]DATA2_RGBBUFF7;
    logic DATAVALID_RGBBUFF7;
    logic[23:0]DATA2_RGBBUFF8;
    logic DATAVALID_RGBBUFF8;
    logic[23:0]DATA2_RGBBUFF9;
    logic DATAVALID_RGBBUFF9;
    logic[23:0]DATA2_RGBBUFF10;
    logic DATAVALID_RGBBUFF10;
    logic[23:0]DATA2_RGBBUFF11;
    logic DATAVALID_RGBBUFF11;

    //DATA from INPUT2MASKBUFF to 12 MASK BUFFERs
    logic[0:0]DATA2_MASKBUFF0;
    logic DATAVALID_MASKBUFF0;
    logic[0:0]DATA2_MASKBUFF1;
    logic DATAVALID_MASKBUFF1;
    logic[0:0]DATA2_MASKBUFF2;
    logic DATAVALID_MASKBUFF2;
    logic[0:0]DATA2_MASKBUFF3;
    logic DATAVALID_MASKBUFF3;
    logic[0:0]DATA2_MASKBUFF4;
    logic DATAVALID_MASKBUFF4;
    logic[0:0]DATA2_MASKBUFF5;
    logic DATAVALID_MASKBUFF5;
    logic[0:0]DATA2_MASKBUFF6;
    logic DATAVALID_MASKBUFF6;
    logic[0:0]DATA2_MASKBUFF7;
    logic DATAVALID_MASKBUFF7;
    logic[0:0]DATA2_MASKBUFF8;
    logic DATAVALID_MASKBUFF8;
    logic[0:0]DATA2_MASKBUFF9;
    logic DATAVALID_MASKBUFF9;
    logic[0:0]DATA2_MASKBUFF10;
    logic DATAVALID_MASKBUFF10;
    logic[0:0]DATA2_MASKBUFF11;
    logic DATAVALID_MASKBUFF11;



    //Whiten signals
    logic[8:0] WHITEN_ADDR;
    logic WHITEN_CMD,WHITEN_VALID;
    

    //DATA from MASK BUFFER to PROCESS COMPONENT
    logic 11DATA_BUFF0;       
    logic 11DATA_BUFF1;      
    logic 11DATA_BUFF2;       
    logic 11DATA_BUFF3;       
    logic 11DATA_BUFF4;       
    logic 11DATA_BUFF5;       
    logic 11DATA_BUFF6;       
    logic 11DATA_BUFF7;       
    logic 11DATA_BUFF8;       
    logic 11DATA_BUFF9;       
    logic 11DATA_BUFF10;

    


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF0 
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF0),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF0),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF1  
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF1),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF1),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF2 
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF2),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF2),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF3 
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF3),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF3),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF4
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF4),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF4),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF5
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF5),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF5),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF6
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF6),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF6),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF7
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF7),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF7),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF8
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF8),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF8),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF9
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF9),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF9),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF10
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF10),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF10),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF11
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF11),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF11),
        .o_INTR(),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID),
        
        
        .o_DATA()
        
    );







    PROCESS_11x11 PROCESSING_COMP  
        (
             .i_CLK(clk),                
             .i_RSTn(rstn),               
             .i_11DATA_BUFF0       
             .i_11DATA_BUFF1       
             .i_11DATA_BUFF2       
             .i_11DATA_BUFF3       
             .i_11DATA_BUFF4       
             .i_11DATA_BUFF5       
             .i_11DATA_BUFF6       
             .i_11DATA_BUFF7       
             .i_11DATA_BUFF8       
             .i_11DATA_BUFF9       
             .i_11DATA_BUFF10      

            //-- Signal to address where the read pointer is from 0 to 319
             .o_ADDR_RD_PTR(WHITEN_ADDR),        

            //-- Signal to whiten the kernel
             .o_WHITEN_KERNEL(WHITEN_CMD),        
             .o_VALID_DATA(WHITEN_VALID),           

             .o_READ              
        );




    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF0 
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF0),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF0),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF1  
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF1),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF1),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF2 
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF2),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF2),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF3 
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF3),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF3),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF4
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF4),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF4),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF5
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF5),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF5),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF6
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF6),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF6),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF7
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF7),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF7),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF8
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF8),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF8),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF9
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF9),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF9),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF10
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF10),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF10),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF11
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF11),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF11),
        .o_INTR(),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),
        
        
        .o_DATA()
        
    );

    always begin
        clk = 1'b1;
        #5;
        clk = 1'b0;
        #5;
    end

    initial begin
        rstn = 1'b0;
        #13;
        rstn = 1'b1;
    end


    //stimulus
    initial begin
        //Initiate data for 12 RGB BUFFER and 12 MASK BUFFERs
        fork
            for(int i=0;i<320;i++) begin
                @(posedge clk);

                begin
                DATA2_RGBBUFF0 = $random_range(16777215,0);
                DATAVALID_RGBBUFF0 = 1'b1;
                end

                begin
                DATA2_RGBBUFF1 = $random_range(16777215,0);
                DATAVALID_RGBBUFF1 = 1'b1;
                end

                begin
                DATA2_RGBBUFF2 = $random_range(16777215,0);
                DATAVALID_RGBBUFF2 = 1'b1;
                end

                begin
                DATA2_RGBBUFF3 = $random_range(16777215,0);
                DATAVALID_RGBBUFF3 = 1'b1;
                end

                begin
                DATA2_RGBBUFF4 = $random_range(16777215,0);
                DATAVALID_RGBBUFF4 = 1'b1;
                end

                begin
                DATA2_RGBBUFF5 = $random_range(16777215,0);
                DATAVALID_RGBBUFF5 = 1'b1;
                end

                begin
                DATA2_RGBBUFF6 = $random_range(16777215,0);
                DATAVALID_RGBBUFF6 = 1'b1;
                end

                begin
                DATA2_RGBBUFF7 = $random_range(16777215,0);
                DATAVALID_RGBBUFF7 = 1'b1;
                end

                begin
                DATA2_RGBBUFF8 = $random_range(16777215,0);
                DATAVALID_RGBBUFF8 = 1'b1;
                end

                begin
                DATA2_RGBBUFF9 = $random_range(16777215,0);
                DATAVALID_RGBBUFF9 = 1'b1;
                end

                begin
                DATA2_RGBBUFF10 = $random_range(16777215,0);
                DATAVALID_RGBBUFF10 = 1'b1;
                end

                begin
                DATA2_RGBBUFF11 = $random_range(16777215,0);
                DATAVALID_RGBBUFF11 = 1'b1;
                end
            end
        join
        @(posedge clk);
        DATAVALID_RGBBUFF0 = 1'b0;
        DATAVALID_RGBBUFF1 = 1'b0;
        DATAVALID_RGBBUFF2 = 1'b0;
        DATAVALID_RGBBUFF3 = 1'b0;
        DATAVALID_RGBBUFF4 = 1'b0;
        DATAVALID_RGBBUFF5 = 1'b0;
        DATAVALID_RGBBUFF6 = 1'b0;
        DATAVALID_RGBBUFF7 = 1'b0;
        DATAVALID_RGBBUFF8 = 1'b0;
        DATAVALID_RGBBUFF9 = 1'b0;
        DATAVALID_RGBBUFF10 = 1'b0;
        DATAVALID_RGBBUFF11 = 1'b0;
    end

    //stimulus
    initial begin
        //Initiate data for 12 MASK BUFFER and 12 MASK BUFFERs
        fork
            for(int i=0;i<320;i++) begin
                @(posedge clk);

                begin
                DATA2_MASKBUFF0 = $random_range(16777215,0);
                DATAVALID_MASKBUFF0 = 1'b1;
                end

                begin
                DATA2_MASKBUFF1 = $random_range(16777215,0);
                DATAVALID_MASKBUFF1 = 1'b1;
                end

                begin
                DATA2_MASKBUFF2 = $random_range(16777215,0);
                DATAVALID_MASKBUFF2 = 1'b1;
                end

                begin
                DATA2_MASKBUFF3 = $random_range(16777215,0);
                DATAVALID_MASKBUFF3 = 1'b1;
                end

                begin
                DATA2_MASKBUFF4 = $random_range(16777215,0);
                DATAVALID_MASKBUFF4 = 1'b1;
                end

                begin
                DATA2_MASKBUFF5 = $random_range(16777215,0);
                DATAVALID_MASKBUFF5 = 1'b1;
                end

                begin
                DATA2_MASKBUFF6 = $random_range(16777215,0);
                DATAVALID_MASKBUFF6 = 1'b1;
                end

                begin
                DATA2_MASKBUFF7 = $random_range(16777215,0);
                DATAVALID_MASKBUFF7 = 1'b1;
                end

                begin
                DATA2_MASKBUFF8 = $random_range(16777215,0);
                DATAVALID_MASKBUFF8 = 1'b1;
                end

                begin
                DATA2_MASKBUFF9 = $random_range(16777215,0);
                DATAVALID_MASKBUFF9 = 1'b1;
                end

                begin
                DATA2_MASKBUFF10 = $random_range(16777215,0);
                DATAVALID_MASKBUFF10 = 1'b1;
                end

                begin
                DATA2_MASKBUFF11 = $random_range(16777215,0);
                DATAVALID_MASKBUFF11 = 1'b1;
                end
            end
        join
        @(posedge clk);
        DATAVALID_MASKBUFF0 = 1'b0;
        DATAVALID_MASKBUFF1 = 1'b0;
        DATAVALID_MASKBUFF2 = 1'b0;
        DATAVALID_MASKBUFF3 = 1'b0;
        DATAVALID_MASKBUFF4 = 1'b0;
        DATAVALID_MASKBUFF5 = 1'b0;
        DATAVALID_MASKBUFF6 = 1'b0;
        DATAVALID_MASKBUFF7 = 1'b0;
        DATAVALID_MASKBUFF8 = 1'b0;
        DATAVALID_MASKBUFF9 = 1'b0;
        DATAVALID_MASKBUFF10 = 1'b0;
        DATAVALID_MASKBUFF11 = 1'b0;
    end









endmodule