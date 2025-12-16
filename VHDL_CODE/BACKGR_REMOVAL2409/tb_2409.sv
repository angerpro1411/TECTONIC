`timescale 1ns/100ps

module tb_2409();

    logic clk,rstn;
    logic [23:0] S_AXIS_DATA;
    logic S_AXIS_VALID,S_AXIS_READY;

    logic[7:0]r;
    logic[7:0]g;
    logic[7:0]b;

    logic [23:0]o_DATA0,o_DATA1,o_DATA2,o_DATA3;
    logic o_VALID0,o_VALID1,o_VALID2,o_VALID3;

    logic i_VALID0,i_VALID1,i_VALID2,i_VALID3;
    logic i_MASK0,i_MASK1,i_MASK2,i_MASK3;

    logic o_VALID;
    logic o_DATA;

    //DATA between CHECKCONDITION_COMP and INPUT12RGB
    logic[23:0] checked_data;
    logic checked_data_valid;
    logic rgb_buff_full;

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


    CHECK_CONDITION_INPUTSTREAM CHECK_CONDI_COMP
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_RGB_BUFF_FULL(rgb_buff_full),
        .i_FINISH_PROCESS_1_ROW(one_row_finished),

        //--OUTPUT to BUFF12 RGB
        .o_DATA(checked_data),
        .o_VALID(checked_data_valid),

        //--S AXI STREAM INTERFACE
        .S_AXIS_DATA(S_AXIS_DATA),
        .S_AXIS_VALID(S_AXIS_VALID),
        .S_AXIS_READY(S_AXIS_READY)
    );

    INPUT12_BUFF #(.DATA_WIDTH(24)) INPUT12RGB_BUFF(
        
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_DATA(checked_data),
        .i_VALID(checked_data_valid),

        .o_FULL12_ROW(rgb_buff_full),

        .o_DATA0(DATA2_RGBBUFF0),
        .o_VALID0(DATAVALID_RGBBUFF0),

        .o_DATA1(DATA2_RGBBUFF1),
        .o_VALID1(DATAVALID_RGBBUFF1),

        .o_DATA2(DATA2_RGBBUFF2),
        .o_VALID2(DATAVALID_RGBBUFF2),
        
        .o_DATA3(DATA2_RGBBUFF3),
        .o_VALID3(DATAVALID_RGBBUFF3),

        .o_DATA4(DATA2_RGBBUFF4),
        .o_VALID4(DATAVALID_RGBBUFF4),
        
        .o_DATA5(DATA2_RGBBUFF5),
        .o_VALID5(DATAVALID_RGBBUFF5),
        
        .o_DATA6(DATA2_RGBBUFF6),
        .o_VALID6(DATAVALID_RGBBUFF6),
        
        .o_DATA7(DATA2_RGBBUFF7),
        .o_VALID7(DATAVALID_RGBBUFF7),
        
        .o_DATA8(DATA2_RGBBUFF8),
        .o_VALID8(DATAVALID_RGBBUFF8),
        
        .o_DATA9(DATA2_RGBBUFF9),
        .o_VALID9(DATAVALID_RGBBUFF9),
        
        .o_DATA10(DATA2_RGBBUFF10),
        .o_VALID10(DATAVALID_RGBBUFF10),
        
        .o_DATA11(DATA2_RGBBUFF11),
        .o_VALID11(DATAVALID_RGBBUFF11)        
    ); 

    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF0 
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF0),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF0),
        .o_INTR(),
        
        
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
        
        
        .o_DATA()
        
    );


    INPUT4MASK_CALCUL INPUT4MASK_CALCUL_COMP
        (
            .i_CLK(clk),
            .i_RSTn(rstn),
            .i_VALID(checked_data_valid),
            .i_DATA(checked_data),

            .o_DATA0(o_DATA0),
            .o_VALID0(o_VALID0),
            .o_DATA1(o_DATA1),
            .o_VALID1(o_VALID1),
            .o_DATA2(o_DATA2),
            .o_VALID2(o_VALID2),
            .o_DATA3(o_DATA3),
            .o_VALID3(o_VALID3)                        
        );




    MASK_CALCUL MASK_CALCUL0
    ( 
        .i_CLK(clk),       
        .i_RSTn(rstn),
        .i_DATA_RGB(o_DATA0),
        .i_DATA_VALID(o_VALID0),
        
        .i_H_THRESHOLD(8'd50),
        .o_MASK_VALID(i_VALID0),
        .o_MASK(i_MASK0)
    );

    MASK_CALCUL MASK_CALCUL1
    ( 
        .i_CLK(clk),       
        .i_RSTn(rstn),
        .i_DATA_RGB(o_DATA1),
        .i_DATA_VALID(o_VALID1),
        
        .i_H_THRESHOLD(8'd50),
        .o_MASK_VALID(i_VALID1),
        .o_MASK(i_MASK1)
    );

    MASK_CALCUL MASK_CALCUL2
    ( 
        .i_CLK(clk),       
        .i_RSTn(rstn),
        .i_DATA_RGB(o_DATA2),
        .i_DATA_VALID(o_VALID2),
        
        .i_H_THRESHOLD(8'd50),
        .o_MASK_VALID(i_VALID2),
        .o_MASK(i_MASK2)
    );

    MASK_CALCUL MASK_CALCUL3
    ( 
        .i_CLK(clk),       
        .i_RSTn(rstn),
        .i_DATA_RGB(o_DATA3),
        .i_DATA_VALID(o_VALID3),
        
        .i_H_THRESHOLD(8'd50),
        .o_MASK_VALID(i_VALID3),
        .o_MASK(i_MASK3)
    );

    MULTIPLEXER OUTPUT_MASK_DISTRIBUTION(
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_VALID0(i_VALID0),
        .i_VALID1(i_VALID1),
        .i_VALID2(i_VALID2),
        .i_VALID3(i_VALID3),
        .i_MASK0(i_MASK0),
        .i_MASK1(i_MASK1),
        .i_MASK2(i_MASK2),
        .i_MASK3(i_MASK3),

        .o_DATA(o_DATA),
        .o_VALID(o_VALID)
    );

    INPUT12_BUFF #(.DATA_WIDTH(1)) INPUT12MASK_BUFF(
        
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_DATA(o_DATA),
        .i_VALID(o_VALID),

        .o_FULL12_ROW(),

        .o_DATA0(DATA2_MASKBUFF0),
        .o_VALID0(DATAVALID_MASKBUFF0),

        .o_DATA1(DATA2_MASKBUFF1),
        .o_VALID1(DATAVALID_MASKBUFF1),

        .o_DATA2(DATA2_MASKBUFF2),
        .o_VALID2(DATAVALID_MASKBUFF2),
        
        .o_DATA3(DATA2_MASKBUFF3),
        .o_VALID3(DATAVALID_MASKBUFF3),

        .o_DATA4(DATA2_MASKBUFF4),
        .o_VALID4(DATAVALID_MASKBUFF4),
        
        .o_DATA5(DATA2_MASKBUFF5),
        .o_VALID5(DATAVALID_MASKBUFF5),
        
        .o_DATA6(DATA2_MASKBUFF6),
        .o_VALID6(DATAVALID_MASKBUFF6),
        
        .o_DATA7(DATA2_MASKBUFF7),
        .o_VALID7(DATAVALID_MASKBUFF7),
        
        .o_DATA8(DATA2_MASKBUFF8),
        .o_VALID8(DATAVALID_MASKBUFF8),
        
        .o_DATA9(DATA2_MASKBUFF9),
        .o_VALID9(DATAVALID_MASKBUFF9),
        
        .o_DATA10(DATA2_MASKBUFF10),
        .o_VALID10(DATAVALID_MASKBUFF10),
        
        .o_DATA11(DATA2_MASKBUFF11),
        .o_VALID11(DATAVALID_MASKBUFF11)   
    );     

    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF0 
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_MASKBUFF0),
        .i_READ(),
        
        .i_DATA(DATA2_MASKBUFF0),
        .o_INTR(),
        
        
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

        //initial value for inputs
        r = 0;
        g = 0;
        b = 0;
        S_AXIS_DATA = 0;
        S_AXIS_VALID = 0;

        repeat(2) begin
            @(posedge clk);
            S_AXIS_VALID = 1'b0;
        end

        repeat(320*3) begin
            @(posedge clk);
            r = $urandom_range(255,0);
            g = $urandom_range(255,0);
            b = $urandom_range(255,0);
            S_AXIS_DATA = {b,g,r};
            S_AXIS_VALID = 1'b1;
        end

        repeat(5) begin
            @(posedge clk);
            S_AXIS_DATA = S_AXIS_DATA;
            S_AXIS_VALID = 1'b0;
        end
        
        repeat(320*9) begin
            @(posedge clk);
            //data_rgb = $urandom_range(16777216,0);
            r = $urandom_range(255,0);
            g = $urandom_range(255,0);
            b = $urandom_range(255,0);
            S_AXIS_DATA = {b,g,r};
            S_AXIS_VALID = 1'b1;
        end 
        
        repeat(8) begin
            @(posedge clk);
            S_AXIS_DATA = S_AXIS_DATA;
            S_AXIS_VALID = 1'b0;
        end


        repeat(320) begin
            @(posedge clk);
            r = $urandom_range(255,0);
            g = $urandom_range(255,0);
            b = $urandom_range(255,0);
            S_AXIS_DATA = {b,g,r};
            S_AXIS_VALID = 1'b1;
        end

        $finish(2);

    end
    




endmodule