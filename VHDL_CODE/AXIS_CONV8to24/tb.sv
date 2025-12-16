// `timescale 1ns/100ps

// module tb();
//     logic clk;
//     logic rstn;
 
//     logic M_AXIS_VALID ;
//     logic M_AXIS_READY ;
//     logic[23:0] M_AXIS_DATA;    

//     logic[7:0] S_AXIS_DATA  ;   
//     logic S_AXIS_VALID    ;
//     logic S_AXIS_READY     ;

// AXIS_CONV8to24 uut
//     (
//         .i_CLK       (clk),
//         .i_RSTn      (rstn),
        
//         .M_AXIS_VALID (M_AXIS_VALID),
//         .M_AXIS_READY (M_AXIS_READY),
//         .M_AXIS_DATA  (M_AXIS_DATA),
        

//         .S_AXIS_DATA     (S_AXIS_DATA),
//         .S_AXIS_VALID    (S_AXIS_VALID),
//         .S_AXIS_READY    (S_AXIS_READY)
//     );




//     always begin
//         clk = 1'b1;
//         #5;
//         clk = 1'b0;
//         #5;
//     end

//     initial begin
//         rstn = 1'b0;
//         #13;
//         rstn = 1'b1;
//     end

//     initial begin
//         M_AXIS_READY = 1'b1;
//         repeat(2)
//             @(posedge clk);

//         repeat(10) begin   
//             @(posedge clk); 
//             M_AXIS_READY = 1'b1;
//             S_AXIS_DATA  = $urandom_range(255,0) ;   
//             S_AXIS_VALID = 1'b1  ;
//         end

//         repeat(30) begin
//             @(posedge clk); 
//             M_AXIS_READY = $urandom_range(1,0)  ;
//             S_AXIS_DATA  = $urandom_range(255,0) ;   
//             S_AXIS_VALID = $urandom_range(1,0)  ;
//         end

//         // repeat(10) begin
//         //     @(posedge clk); 
//         //     M_AXIS_READY = 1'b0;
//         //     S_AXIS_DATA  = $urandom_range(255,0) ;   
//         //     S_AXIS_VALID = $urandom_range(1,0)  ;
//         // end        
//     end 

// endmodule



`timescale 1ns/100ps

module tb();
    logic clk;
    logic rstn;
 
    logic M_AXIS_VALID ;
    logic M_AXIS_READY ;
    logic[7:0] M_AXIS_DATA;    

    logic[23:0] S_AXIS_DATA  ;   
    logic S_AXIS_VALID    ;
    logic S_AXIS_READY     ;

AXIS_SLICE24to8 uut
    (
        .i_CLK       (clk),
        .i_RSTn      (rstn),
        
        .M_AXIS_VALID (M_AXIS_VALID),
        .M_AXIS_READY (M_AXIS_READY),
        .M_AXIS_DATA  (M_AXIS_DATA),
        

        .S_AXIS_DATA     (S_AXIS_DATA),
        .S_AXIS_VALID    (S_AXIS_VALID),
        .S_AXIS_READY    (S_AXIS_READY)
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

    initial begin
        M_AXIS_READY = 1'b1;
        repeat(2)
            @(posedge clk);

        repeat(10) begin   
            @(posedge clk); 
            M_AXIS_READY = 1'b1;
            S_AXIS_DATA  = $urandom_range(16777215,0) ;   
            S_AXIS_VALID = 1'b1  ;
        end

        repeat(30) begin
            @(posedge clk); 
            M_AXIS_READY = $urandom_range(1,0)  ;
            S_AXIS_DATA  = $urandom_range(16777215,0) ;   
            S_AXIS_VALID = $urandom_range(1,0)  ;
        end

        repeat(20) begin
            @(posedge clk);
            M_AXIS_READY = 1'b1  ;
            S_AXIS_VALID = 1'b0  ;
        end 

        repeat(2) begin   
            @(posedge clk); 
            M_AXIS_READY = 1'b1;
            S_AXIS_DATA  = $urandom_range(16777215,0) ;   
            S_AXIS_VALID = 1'b1  ;
        end

        @(posedge clk);
        M_AXIS_READY = 1'b1  ;
        S_AXIS_VALID = 1'b0  ;

        // repeat(10) begin
        //     @(posedge clk); 
        //     M_AXIS_READY = 1'b0;
        //     S_AXIS_DATA  = $urandom_range(255,0) ;   
        //     S_AXIS_VALID = $urandom_range(1,0)  ;
        // end        
    end 

endmodule