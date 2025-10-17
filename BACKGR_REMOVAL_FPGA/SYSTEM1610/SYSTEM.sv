`timescale 1ns/100ps

module SYSTEM #(parameter DATA_WIDTH = 24)
(
    input logic i_CLK,i_RSTn,
    input logic i_START_STREAM,
    
    //S AXIS
    input logic [DATA_WIDTH-1:0] S_AXIS_DATA,
    input logic S_AXIS_VALID,
    output logic S_AXIS_READY,
    
    //M AXIS
    output logic [DATA_WIDTH-1:0] M_AXIS_DATA,
    output logic M_AXIS_VALID,
    input logic M_AXIS_READY    
);


    //DATA between CHECKCONDITION_COMP and INPUT12RGB
    logic[23:0] checked_data;
    logic checked_data_valid;

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

    //Data from MASK BUFFER to PROCESS 11x11
    logic[10:0]i_11DATA_BUFF0;
    logic[10:0]i_11DATA_BUFF1;
    logic[10:0]i_11DATA_BUFF2;
    logic[10:0]i_11DATA_BUFF3;
    logic[10:0]i_11DATA_BUFF4;
    logic[10:0]i_11DATA_BUFF5;
    logic[10:0]i_11DATA_BUFF6;
    logic[10:0]i_11DATA_BUFF7;
    logic[10:0]i_11DATA_BUFF8;
    logic[10:0]i_11DATA_BUFF9;
    logic[10:0]i_11DATA_BUFF10;
    logic[10:0]i_11DATA_BUFF11;

    
    
    //Control from big state machine
    logic [2:0] STATE_BUS;
    logic DONE_320_STR,DONE_320x12_STR; 


    CHECK_CONDITION_INPUTSTREAM CHECK_CONDI_COMP
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        
        .i_STATE_CONTROL(STATE_BUS),
        .o_DONE_320(DONE_320_STR),
        .o_DONE_320x12(DONE_320x12_STR),

        //--OUTPUT to BUFF12 RGB
        .o_DATA(checked_data),
        .o_VALID(checked_data_valid),

        //--S AXI STREAM INTERFACE
        .S_AXIS_DATA(S_AXIS_DATA),
        .S_AXIS_VALID(S_AXIS_VALID),
        .S_AXIS_READY(S_AXIS_READY)
    );

    INPUT12_BUFF #(.DATA_WIDTH(24)) INPUT12RGB_BUFF(
        
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_DATA(checked_data),
        .i_VALID(checked_data_valid),

        .o_DONE_320(),
        .o_DONE_320x12(),

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

    //Whiten signals
    logic[8:0] WHITEN_ADDR;
    logic WHITEN_CMD;
    logic [11:0]WHITEN_VALID;
    
    //RGB BUFF to S_AXIS_STREAM FIFO
    logic[DATA_WIDTH-1:0] BUFF_2_FI0;
    logic BUFF_2_FI_VALID0;
    logic FI_2_BUFF_RDY0;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI1;
    logic BUFF_2_FI_VALID1;
    logic FI_2_BUFF_RDY1;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI2;
    logic BUFF_2_FI_VALID2;
    logic FI_2_BUFF_RDY2;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI3;
    logic BUFF_2_FI_VALID3;
    logic FI_2_BUFF_RDY3;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI4;
    logic BUFF_2_FI_VALID4;
    logic FI_2_BUFF_RDY4;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI5;
    logic BUFF_2_FI_VALID5;
    logic FI_2_BUFF_RDY5;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI6;
    logic BUFF_2_FI_VALID6;
    logic FI_2_BUFF_RDY6;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI7;
    logic BUFF_2_FI_VALID7;
    logic FI_2_BUFF_RDY7;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI8;
    logic BUFF_2_FI_VALID8;
    logic FI_2_BUFF_RDY8;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI9;
    logic BUFF_2_FI_VALID9;
    logic FI_2_BUFF_RDY9;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI10;
    logic BUFF_2_FI_VALID10;
    logic FI_2_BUFF_RDY10;
    
    logic[DATA_WIDTH-1:0] BUFF_2_FI11;
    logic BUFF_2_FI_VALID11;
    logic FI_2_BUFF_RDY11;
                                                    
    

    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF0 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_RGBBUFF0),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF0),        

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[0]),

        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI0),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID0),
        .i_FIFO_READY(FI_2_BUFF_RDY0),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF1  
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_RGBBUFF1),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF1),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[1]),        

        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI1),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID1),
        .i_FIFO_READY(FI_2_BUFF_RDY1),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF2 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_RGBBUFF2),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF2),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[2]),

        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI2),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID2),
        .i_FIFO_READY(FI_2_BUFF_RDY2),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF3 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_RGBBUFF3),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF3),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[3]),

        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI3),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID3),
        .i_FIFO_READY(FI_2_BUFF_RDY3),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF4
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_RGBBUFF4),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF4),

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[4]),
        
        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI4),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID4),
        .i_FIFO_READY(FI_2_BUFF_RDY4),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF5
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_RGBBUFF5),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF5),
        

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[5]),
        
        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI5),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID5),
        .i_FIFO_READY(FI_2_BUFF_RDY5),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF6
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_RGBBUFF6),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF6),
        

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[6]),
        
        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI6),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID6),
        .i_FIFO_READY(FI_2_BUFF_RDY6),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF7
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_RGBBUFF7),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF7),
        

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[7]),
        
        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI7),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID7),
        .i_FIFO_READY(FI_2_BUFF_RDY7),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF8
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF8),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF8),
        

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[8]),
        
        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI8),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID8),
        .i_FIFO_READY(FI_2_BUFF_RDY8),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF9
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF9),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF9),
        

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[9]),
        
        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI9),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID9),
        .i_FIFO_READY(FI_2_BUFF_RDY9),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF10
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF10),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF10),
        

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[10]),
        
        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI10),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID10),
        .i_FIFO_READY(FI_2_BUFF_RDY10),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );


    LINEBUFFER #(.DATA_WIDTH(24)) RGB_BUFF11
    (
        .i_CLK(clk),
        .i_RSTn(rstn),
        .i_WRITE(DATAVALID_RGBBUFF11),
        .i_READ(),
        
        .i_DATA(DATA2_RGBBUFF11),
        

        .i_WHITEN_CMD (WHITEN_CMD),
        .i_WHITEN_ADDR (WHITEN_ADDR), 
        .i_WHITEN_VALID(WHITEN_VALID[11]),
        
        //--Signals to FIFO
        .o_in_FIFO_DATA(BUFF_2_FI11),
        .o_in_FIFO_DATA_VALID(BUFF_2_FI_VALID11),
        .i_FIFO_READY(FI_2_BUFF_RDY11),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(STATE_BUS),
        
        
        .o_DATA()
        
    );
    
    
    logic SEND_BACK_DONE;
i_12_o_1_AXISTREAM  #(.DATA_WIDTH(24)) i_12_o_1_AXISTREAM_COMP
    (
        .i_CLK       (i_CLK),
        .i_RSTn      (i_RSTn),
        
        //--Send to STATE MACHINE
        .o_SEND_BACK_DONE(SEND_BACK_DONE),

        .S_AXIS_DATA0    (BUFF_2_FI0),
        .S_AXIS_VALID0   (BUFF_2_FI_VALID0),
        .S_AXIS_READY0   (FI_2_BUFF_RDY0),

        .S_AXIS_DATA1    (BUFF_2_FI1),
        .S_AXIS_VALID1   (BUFF_2_FI_VALID1),
        .S_AXIS_READY1   (FI_2_BUFF_RDY1),
        
        .S_AXIS_DATA2    (BUFF_2_FI2),
        .S_AXIS_VALID2   (BUFF_2_FI_VALID2),
        .S_AXIS_READY2   (FI_2_BUFF_RDY2),
        
        .S_AXIS_DATA3    (BUFF_2_FI3),
        .S_AXIS_VALID3   (BUFF_2_FI_VALID3),
        .S_AXIS_READY3   (FI_2_BUFF_RDY3),
        
        .S_AXIS_DATA4    (BUFF_2_FI4),
        .S_AXIS_VALID4   (BUFF_2_FI_VALID4),
        .S_AXIS_READY4   (FI_2_BUFF_RDY4),
        
        .S_AXIS_DATA5    (BUFF_2_FI5),
        .S_AXIS_VALID5   (BUFF_2_FI_VALID5),
        .S_AXIS_READY5   (FI_2_BUFF_RDY5),
        
        .S_AXIS_DATA6    (BUFF_2_FI6),
        .S_AXIS_VALID6   (BUFF_2_FI_VALID6),
        .S_AXIS_READY6   (FI_2_BUFF_RDY6),
        
        .S_AXIS_DATA7    (BUFF_2_FI7),
        .S_AXIS_VALID7   (BUFF_2_FI_VALID7),
        .S_AXIS_READY7   (FI_2_BUFF_RDY7),
        
        .S_AXIS_DATA8    (BUFF_2_FI8),
        .S_AXIS_VALID8   (BUFF_2_FI_VALID8),
        .S_AXIS_READY8   (FI_2_BUFF_RDY8),
        
        .S_AXIS_DATA9    (BUFF_2_FI9),
        .S_AXIS_VALID9   (BUFF_2_FI_VALID9),
        .S_AXIS_READY9   (FI_2_BUFF_RDY9),
        
        .S_AXIS_DATA10    (BUFF_2_FI10),
        .S_AXIS_VALID10   (BUFF_2_FI_VALID10),
        .S_AXIS_READY10   (FI_2_BUFF_RDY10),
        
        .S_AXIS_DATA11    (BUFF_2_FI11),
        .S_AXIS_VALID11   (BUFF_2_FI_VALID11),
        .S_AXIS_READY11   (FI_2_BUFF_RDY11),

        .M_AXIS_DATA      (M_AXIS_DATA),
        .M_AXIS_VALID     (M_AXIS_VALID),
        .M_AXIS_READY     (M_AXIS_READY)
     );

    logic MUL_2_DIST_MASK_BUFF;
    logic MUL_2_DIST_MASK_BUFF_VALID;


    CALCUL_MASK_n_DISTR
    #(.DATA_WIDTH(24))
    CALCUL_MASK_n_DISTR_COMP
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),

        .i_DATA(checked_data),
        .i_DATA_VALID(checked_data_valid),


        .MUL_2_DIST_MASK_BUFF(MUL_2_DIST_MASK_BUFF),
        .MUL_2_DIST_MASK_BUFF_VALID(MUL_2_DIST_MASK_BUFF_VALID)          
    );



    //Adding signals from mask control to STATE MACHINE
    logic DONE_MASK_320,DONE_MASK_320x12;

    INPUT12_BUFF #(.DATA_WIDTH(1)) INPUT12MASK_BUFF(
        
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_DATA(MUL_2_DIST_MASK_BUFF),
        .i_VALID(MUL_2_DIST_MASK_BUFF_VALID),
        
        .o_DONE_320(DONE_MASK_320),
        .o_DONE_320x12(DONE_MASK_320x12),


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
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF0),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF0),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF0)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF1 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF1),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF1),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF1)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF2 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF2),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF2),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF2)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF3 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF3),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF3),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF3)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF4 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF4),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF4),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF4)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF5 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF5),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF5),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF5)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF6 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF6),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF6),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF6)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF7 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF7),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF7),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF7)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF8 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF8),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF8),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF8)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF9 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF9),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF9),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF9)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF10 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF10),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF10),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF10)
        
    );


    LINEBUFFER #(.DATA_WIDTH(1)) MASK_BUFF11 
    (
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_WRITE(DATAVALID_MASKBUFF11),
        .i_READ(READ_CMD),
        
        .i_DATA(DATA2_MASKBUFF11),

        .i_WHITEN_CMD (),
        .i_WHITEN_ADDR (), 
        .i_WHITEN_VALID(),

        //--Signals to FIFO
        .o_in_FIFO_DATA(),
        .o_in_FIFO_DATA_VALID(),
        .i_FIFO_READY(),

        //--Signals to BIG_STATE_MACHINE
        .i_STATE_CONTROL(),
        
        .o_DATA(i_11DATA_BUFF11)
        
    );


    logic FINISH_PROCESS_MASK_ROW,FINISH_CHANGE_1ROW_RGB;
    
    PROCESS_11x11 PROCESSING_COMP  
        (
             .i_CLK(i_CLK),                
             .i_RSTn(i_RSTn),               
             .i_11DATA_BUFF0(i_11DATA_BUFF0),       
             .i_11DATA_BUFF1(i_11DATA_BUFF1),       
             .i_11DATA_BUFF2(i_11DATA_BUFF2),       
             .i_11DATA_BUFF3(i_11DATA_BUFF3),       
             .i_11DATA_BUFF4(i_11DATA_BUFF4),       
             .i_11DATA_BUFF5(i_11DATA_BUFF5),       
             .i_11DATA_BUFF6(i_11DATA_BUFF6),       
             .i_11DATA_BUFF7(i_11DATA_BUFF7),       
             .i_11DATA_BUFF8(i_11DATA_BUFF8),       
             .i_11DATA_BUFF9(i_11DATA_BUFF9),       
             .i_11DATA_BUFF10(i_11DATA_BUFF10),
             .i_11DATA_BUFF11(i_11DATA_BUFF11),      


            //--Signal to interact with BIG STATE MACHINE
            .i_WHICH_STATE(STATE_BUS),
            .o_FINISH_PROCESS_MASK_ROW(FINISH_PROCESS_MASK_ROW),
            .o_FINISH_CHANGE_1ROW_RGB(FINISH_CHANGE_1ROW_RGB),


            //-- Signal to address where the read pointer is from 0 to 319
             .o_ADDR_RD_PTR(),        

             .o_ADDR_PROC_PTR(WHITEN_ADDR),

            //-- Signal to whiten the kernel
             .o_WHITEN_KERNEL(WHITEN_CMD),        
             .o_WHITEN_DATA_VALID(WHITEN_VALID),           

             .o_READ(READ_CMD)              
        );
        
        
    BIG_STATE_MACHINE   BIG_STATE_MACHINE_COMP
    (
        .i_CLK                       (i_CLK),
        .i_RSTn                      (i_RSTn),
        .i_START_STREAM              (i_START_STREAM),
        
        //--Signal from input stream
        .i_DONE_RGB_320                  (DONE_320_STR),
        .i_DONE_RGB_320x12               (DONE_320x12_STR),
        
        //--Signal from processx11
        .i_FINISH_PROCESS_MASK_ROW (FINISH_PROCESS_MASK_ROW),
        .i_FINISH_CHANGE_1ROW_RGB    (FINISH_CHANGE_1ROW_RGB),
        
        //--Signal from mask control
        .i_DONE_MASK_320             (DONE_MASK_320),
        .i_DONE_MASK_320x12          (DONE_MASK_320x12),
        
        
        //--Signal from stream out
        .i_SEND_BACK_DONE            (SEND_BACK_DONE),
    
        .o_WHICH_STATE               (STATE_BUS)
        );    

endmodule