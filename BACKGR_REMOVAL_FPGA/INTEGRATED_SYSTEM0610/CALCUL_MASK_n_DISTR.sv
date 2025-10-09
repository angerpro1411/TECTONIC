

module CALCUL_MASK_n_DISTR
    #(
        parameter DATA_WIDTH = 24;
    )
    (
        input logic i_CLK,
        input logic i_RSTn,

        input logic[DATA_WIDTH-1:0] i_DATA,
        input logic i_DATA_VALID,

        output logic o_FULL12_ROW,

        output logic[DATA_WIDTH-1:0]o_DATA0,     
        output logic o_VALID0,   

        output logic[DATA_WIDTH-1:0]o_DATA1,     
        output logic o_VALID1,    

        output logic[DATA_WIDTH-1:0]o_DATA2,     
        output logic o_VALID2,    
        
        output logic[DATA_WIDTH-1:0]o_DATA3,     
        output logic o_VALID3,    
        
        output logic[DATA_WIDTH-1:0]o_DATA4,     
        output logic o_VALID4,    
        
        output logic[DATA_WIDTH-1:0]o_DATA5,     
        output logic o_VALID5,    
        
        output logic[DATA_WIDTH-1:0]o_DATA6,     
        output logic o_VALID6,    
        
        output logic[DATA_WIDTH-1:0]o_DATA7,     
        output logic o_VALID7,    
        
        output logic[DATA_WIDTH-1:0]o_DATA8,     
        output logic o_VALID8,    
        
        output logic[DATA_WIDTH-1:0]o_DATA9,     
        output logic o_VALID9,    
        
        output logic[DATA_WIDTH-1:0]o_DATA10,     
        output logic o_VALID10,    
        
        output logic[DATA_WIDTH-1:0]o_DATA11,     
        output logic o_VALID11             
    );

    defparam THRESHOLD = 8'd50;

    logic[DATA_WIDTH-1:0] IN_2_CALCULMASK0;
    logic[DATA_WIDTH-1:0] IN_2_CALCULMASK1;
    logic[DATA_WIDTH-1:0] IN_2_CALCULMASK2;
    logic[DATA_WIDTH-1:0] IN_2_CALCULMASK3;
    logic IN_2_CALCULMASK_VALID0;
    logic IN_2_CALCULMASK_VALID1;
    logic IN_2_CALCULMASK_VALID2;
    logic IN_2_CALCULMASK_VALID3;

    logic CALCMASK_2_MUL0;
    logic CALCMASK_2_MUL1;
    logic CALCMASK_2_MUL2;
    logic CALCMASK_2_MUL3;
    logic CALCMASK_2_MUL_VALID0;
    logic CALCMASK_2_MUL_VALID1;
    logic CALCMASK_2_MUL_VALID2;
    logic CALCMASK_2_MUL_VALID3;

    INPUT4MASK_CALCUL #(.DATA_WIDTH(DATA_WIDTH)) INPUT4MASK_CALCUL_COMP 
        (
            .i_CLK   (i_CLK), 
            .i_RSTn  (i_RSTn), 
            .i_VALID (i_DATA_VALID), 
            .i_DATA  (i_DATA), 

            .o_DATA0   (IN_2_CALCULMASK0), 
            .o_VALID0  (IN_2_CALCULMASK_VALID0), 
            .o_DATA1   (IN_2_CALCULMASK1), 
            .o_VALID1  (IN_2_CALCULMASK_VALID1), 
            .o_DATA2   (IN_2_CALCULMASK2), 
            .o_VALID2  (IN_2_CALCULMASK_VALID2), 
            .o_DATA3   (IN_2_CALCULMASK3), 
            .o_VALID3 (IN_2_CALCULMASK_VALID3)                       
        );
        
    MASK_CALCUL MASK_CALCUL0
    ( 
        .i_CLK(i_CLK),       
        .i_RSTn(i_RSTn),
        .i_DATA_RGB(IN_2_CALCULMASK0),
        .i_DATA_VALID(IN_2_CALCULMASK_VALID0),
        
        .i_H_THRESHOLD(THRESHOLD),
        .o_MASK_VALID(CALCMASK_2_MUL_VALID0),
        .o_MASK(CALCMASK_2_MUL0)
    );

    MASK_CALCUL MASK_CALCUL1
    ( 
        .i_CLK(i_CLK),       
        .i_RSTn(i_RSTn),
        .i_DATA_RGB(IN_2_CALCULMASK1),
        .i_DATA_VALID(IN_2_CALCULMASK_VALID1),
        
        .i_H_THRESHOLD(THRESHOLD),
        .o_MASK_VALID(CALCMASK_2_MUL_VALID1),
        .o_MASK(CALCMASK_2_MUL1)
    ); 

    MASK_CALCUL MASK_CALCUL2
    ( 
        .i_CLK(i_CLK),       
        .i_RSTn(i_RSTn),
        .i_DATA_RGB(IN_2_CALCULMASK2),
        .i_DATA_VALID(IN_2_CALCULMASK_VALID2),
        
        .i_H_THRESHOLD(THRESHOLD),
        .o_MASK_VALID(CALCMASK_2_MUL_VALID2),
        .o_MASK(CALCMASK_2_MUL2)
    ); 

    MASK_CALCUL MASK_CALCUL3
    ( 
        .i_CLK(i_CLK),       
        .i_RSTn(i_RSTn),
        .i_DATA_RGB(IN_2_CALCULMASK3),
        .i_DATA_VALID(IN_2_CALCULMASK_VALID3),
        
        .i_H_THRESHOLD(THRESHOLD),
        .o_MASK_VALID(CALCMASK_2_MUL_VALID3),
        .o_MASK(CALCMASK_2_MUL3)
    );

    logic MUL_2_DIST_MASK_BUFF;
    logic MUL_2_DIST_MASK_BUFF_VALID;

    MULTIPLEXER OUTPUT_MASK_DISTRIBUTION(
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_VALID0(CALCMASK_2_MUL_VALID0),
        .i_VALID1(CALCMASK_2_MUL_VALID1),
        .i_VALID2(CALCMASK_2_MUL_VALID2),
        .i_VALID3(CALCMASK_2_MUL_VALID3),
        .i_MASK0(CALCMASK_2_MUL0),
        .i_MASK1(CALCMASK_2_MUL1),
        .i_MASK2(CALCMASK_2_MUL2),
        .i_MASK3(CALCMASK_2_MUL3),

        .o_DATA(MUL_2_DIST_MASK_BUFF),
        .o_VALID(MUL_2_DIST_MASK_BUFF_VALID)
    );

    INPUT12_BUFF #(.DATA_WIDTH(1)) INPUT12MASK_BUFF(
        
        .i_CLK(i_CLK),
        .i_RSTn(i_RSTn),
        .i_DATA(MUL_2_DIST_MASK_BUFF),
        .i_VALID(MUL_2_DIST_MASK_BUFF_VALID),

        .o_FULL12_ROW(),

        .o_DATA0(o_DATA0),
        .o_VALID0(o_VALID0),

        .o_DATA1(o_DATA1),
        .o_VALID1(o_VALID1),

        .o_DATA2(o_DATA2),
        .o_VALID2(o_VALID2),
        
        .o_DATA3(o_DATA3),
        .o_VALID3(o_VALID3),

        .o_DATA4(o_DATA4),
        .o_VALID4(o_VALID4),
        
        .o_DATA5(o_DATA5),
        .o_VALID5(o_VALID5),
        
        .o_DATA6(o_DATA6),
        .o_VALID6(o_VALID6),
        
        .o_DATA7(o_DATA7),
        .o_VALID7(o_VALID7),
        
        .o_DATA8(o_DATA8),
        .o_VALID8(o_VALID8),
        
        .o_DATA9(o_DATA9),
        .o_VALID9(o_VALID9),
        
        .o_DATA10(o_DATA10),
        .o_VALID10(o_VALID10),
        
        .o_DATA11(o_DATA11),
        .o_VALID11(o_VALID11)   
    );
endmodule