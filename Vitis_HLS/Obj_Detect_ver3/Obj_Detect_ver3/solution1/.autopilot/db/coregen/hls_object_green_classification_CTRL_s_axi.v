// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
// Tool Version Limit: 2023.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
`timescale 1ns/1ps
module hls_object_green_classification_CTRL_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 8,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    input  wire [15:0]                   object_count,
    input  wire                          object_count_ap_vld,
    input  wire [4:0]                    obj_is_green_address0,
    input  wire                          obj_is_green_ce0,
    input  wire                          obj_is_green_we0,
    input  wire [0:0]                    obj_is_green_d0,
    input  wire [4:0]                    obj_x_address0,
    input  wire                          obj_x_ce0,
    input  wire                          obj_x_we0,
    input  wire [15:0]                   obj_x_d0,
    input  wire [4:0]                    obj_y_address0,
    input  wire                          obj_y_ce0,
    input  wire                          obj_y_we0,
    input  wire [15:0]                   obj_y_d0
);
//------------------------Address Info-------------------
// 0x00 : reserved
// 0x04 : reserved
// 0x08 : reserved
// 0x0c : reserved
// 0x10 : Data signal of object_count
//        bit 15~0 - object_count[15:0] (Read)
//        others   - reserved
// 0x14 : Control signal of object_count
//        bit 0  - object_count_ap_vld (Read/COR)
//        others - reserved
// 0x20 ~
// 0x3f : Memory 'obj_is_green' (32 * 1b)
//        Word n : bit [ 0: 0] - obj_is_green[4n]
//                 bit [ 8: 8] - obj_is_green[4n+1]
//                 bit [16:16] - obj_is_green[4n+2]
//                 bit [24:24] - obj_is_green[4n+3]
//                 others      - reserved
// 0x40 ~
// 0x7f : Memory 'obj_x' (32 * 16b)
//        Word n : bit [15: 0] - obj_x[2n]
//                 bit [31:16] - obj_x[2n+1]
// 0x80 ~
// 0xbf : Memory 'obj_y' (32 * 16b)
//        Word n : bit [15: 0] - obj_y[2n]
//                 bit [31:16] - obj_y[2n+1]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_OBJECT_COUNT_DATA_0 = 8'h10,
    ADDR_OBJECT_COUNT_CTRL   = 8'h14,
    ADDR_OBJ_IS_GREEN_BASE   = 8'h20,
    ADDR_OBJ_IS_GREEN_HIGH   = 8'h3f,
    ADDR_OBJ_X_BASE          = 8'h40,
    ADDR_OBJ_X_HIGH          = 8'h7f,
    ADDR_OBJ_Y_BASE          = 8'h80,
    ADDR_OBJ_Y_HIGH          = 8'hbf,
    WRIDLE                   = 2'd0,
    WRDATA                   = 2'd1,
    WRRESP                   = 2'd2,
    WRRESET                  = 2'd3,
    RDIDLE                   = 2'd0,
    RDDATA                   = 2'd1,
    RDRESET                  = 2'd2,
    ADDR_BITS                = 8;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_object_count_ap_vld;
    reg  [15:0]                   int_object_count = 'b0;
    // memory signals
    wire [2:0]                    int_obj_is_green_address0;
    wire                          int_obj_is_green_ce0;
    wire [3:0]                    int_obj_is_green_be0;
    wire [31:0]                   int_obj_is_green_d0;
    wire [2:0]                    int_obj_is_green_address1;
    wire                          int_obj_is_green_ce1;
    wire [31:0]                   int_obj_is_green_q1;
    reg                           int_obj_is_green_read;
    reg                           int_obj_is_green_write;
    reg  [1:0]                    int_obj_is_green_shift0;
    wire [3:0]                    int_obj_x_address0;
    wire                          int_obj_x_ce0;
    wire [3:0]                    int_obj_x_be0;
    wire [31:0]                   int_obj_x_d0;
    wire [3:0]                    int_obj_x_address1;
    wire                          int_obj_x_ce1;
    wire [31:0]                   int_obj_x_q1;
    reg                           int_obj_x_read;
    reg                           int_obj_x_write;
    reg  [0:0]                    int_obj_x_shift0;
    wire [3:0]                    int_obj_y_address0;
    wire                          int_obj_y_ce0;
    wire [3:0]                    int_obj_y_be0;
    wire [31:0]                   int_obj_y_d0;
    wire [3:0]                    int_obj_y_address1;
    wire                          int_obj_y_ce1;
    wire [31:0]                   int_obj_y_q1;
    reg                           int_obj_y_read;
    reg                           int_obj_y_write;
    reg  [0:0]                    int_obj_y_shift0;

//------------------------Instantiation------------------
// int_obj_is_green
hls_object_green_classification_CTRL_s_axi_ram #(
    .MEM_STYLE ( "auto" ),
    .MEM_TYPE  ( "S2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 8 )
) int_obj_is_green (
    .clk0      ( ACLK ),
    .address0  ( int_obj_is_green_address0 ),
    .ce0       ( int_obj_is_green_ce0 ),
    .we0       ( int_obj_is_green_be0 ),
    .d0        ( int_obj_is_green_d0 ),
    .q0        (  ),
    .clk1      ( ACLK ),
    .address1  ( int_obj_is_green_address1 ),
    .ce1       ( int_obj_is_green_ce1 ),
    .we1       ( {4{1'b0}} ),
    .d1        ( {1{1'b0}} ),
    .q1        ( int_obj_is_green_q1 )
);
// int_obj_x
hls_object_green_classification_CTRL_s_axi_ram #(
    .MEM_STYLE ( "auto" ),
    .MEM_TYPE  ( "S2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 16 )
) int_obj_x (
    .clk0      ( ACLK ),
    .address0  ( int_obj_x_address0 ),
    .ce0       ( int_obj_x_ce0 ),
    .we0       ( int_obj_x_be0 ),
    .d0        ( int_obj_x_d0 ),
    .q0        (  ),
    .clk1      ( ACLK ),
    .address1  ( int_obj_x_address1 ),
    .ce1       ( int_obj_x_ce1 ),
    .we1       ( {4{1'b0}} ),
    .d1        ( {16{1'b0}} ),
    .q1        ( int_obj_x_q1 )
);
// int_obj_y
hls_object_green_classification_CTRL_s_axi_ram #(
    .MEM_STYLE ( "auto" ),
    .MEM_TYPE  ( "S2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 16 )
) int_obj_y (
    .clk0      ( ACLK ),
    .address0  ( int_obj_y_address0 ),
    .ce0       ( int_obj_y_ce0 ),
    .we0       ( int_obj_y_be0 ),
    .d0        ( int_obj_y_d0 ),
    .q0        (  ),
    .clk1      ( ACLK ),
    .address1  ( int_obj_y_address1 ),
    .ce1       ( int_obj_y_ce1 ),
    .we1       ( {4{1'b0}} ),
    .d1        ( {16{1'b0}} ),
    .q1        ( int_obj_y_q1 )
);


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA) && (!ar_hs);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (w_hs)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA) & !int_obj_is_green_read & !int_obj_x_read & !int_obj_y_read;
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_OBJECT_COUNT_DATA_0: begin
                    rdata <= int_object_count[15:0];
                end
                ADDR_OBJECT_COUNT_CTRL: begin
                    rdata[0] <= int_object_count_ap_vld;
                end
            endcase
        end
        else if (int_obj_is_green_read) begin
            rdata <= int_obj_is_green_q1;
        end
        else if (int_obj_x_read) begin
            rdata <= int_obj_x_q1;
        end
        else if (int_obj_y_read) begin
            rdata <= int_obj_y_q1;
        end
    end
end


//------------------------Register logic-----------------
// int_object_count
always @(posedge ACLK) begin
    if (ARESET)
        int_object_count <= 0;
    else if (ACLK_EN) begin
        if (object_count_ap_vld)
            int_object_count <= object_count;
    end
end

// int_object_count_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_object_count_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (object_count_ap_vld)
            int_object_count_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_OBJECT_COUNT_CTRL)
            int_object_count_ap_vld <= 1'b0; // clear on read
    end
end


//------------------------Memory logic-------------------
// obj_is_green
assign int_obj_is_green_address0 = obj_is_green_address0 >> 2;
assign int_obj_is_green_ce0      = obj_is_green_ce0;
assign int_obj_is_green_be0      = obj_is_green_we0 << obj_is_green_address0[1:0];
assign int_obj_is_green_d0       = {4{7'd0, obj_is_green_d0}};
assign int_obj_is_green_address1 = ar_hs? raddr[4:2] : waddr[4:2];
assign int_obj_is_green_ce1      = ar_hs | (int_obj_is_green_write & WVALID);
// obj_x
assign int_obj_x_address0        = obj_x_address0 >> 1;
assign int_obj_x_ce0             = obj_x_ce0;
assign int_obj_x_be0             = {2{obj_x_we0}} << (obj_x_address0[0] * 2);
assign int_obj_x_d0              = {2{obj_x_d0}};
assign int_obj_x_address1        = ar_hs? raddr[5:2] : waddr[5:2];
assign int_obj_x_ce1             = ar_hs | (int_obj_x_write & WVALID);
// obj_y
assign int_obj_y_address0        = obj_y_address0 >> 1;
assign int_obj_y_ce0             = obj_y_ce0;
assign int_obj_y_be0             = {2{obj_y_we0}} << (obj_y_address0[0] * 2);
assign int_obj_y_d0              = {2{obj_y_d0}};
assign int_obj_y_address1        = ar_hs? raddr[5:2] : waddr[5:2];
assign int_obj_y_ce1             = ar_hs | (int_obj_y_write & WVALID);
// int_obj_is_green_read
always @(posedge ACLK) begin
    if (ARESET)
        int_obj_is_green_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_OBJ_IS_GREEN_BASE && raddr <= ADDR_OBJ_IS_GREEN_HIGH)
            int_obj_is_green_read <= 1'b1;
        else
            int_obj_is_green_read <= 1'b0;
    end
end

// int_obj_is_green_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_obj_is_green_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (obj_is_green_ce0)
            int_obj_is_green_shift0 <= obj_is_green_address0[1:0];
    end
end

// int_obj_x_read
always @(posedge ACLK) begin
    if (ARESET)
        int_obj_x_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_OBJ_X_BASE && raddr <= ADDR_OBJ_X_HIGH)
            int_obj_x_read <= 1'b1;
        else
            int_obj_x_read <= 1'b0;
    end
end

// int_obj_x_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_obj_x_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (obj_x_ce0)
            int_obj_x_shift0 <= obj_x_address0[0];
    end
end

// int_obj_y_read
always @(posedge ACLK) begin
    if (ARESET)
        int_obj_y_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_OBJ_Y_BASE && raddr <= ADDR_OBJ_Y_HIGH)
            int_obj_y_read <= 1'b1;
        else
            int_obj_y_read <= 1'b0;
    end
end

// int_obj_y_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_obj_y_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (obj_y_ce0)
            int_obj_y_shift0 <= obj_y_address0[0];
    end
end


endmodule


`timescale 1ns/1ps

module hls_object_green_classification_CTRL_s_axi_ram
#(parameter
    MEM_STYLE = "auto",
    MEM_TYPE  = "S2P",
    BYTES  = 4,
    DEPTH  = 256,
    AWIDTH = log2(DEPTH)
) (
    input  wire               clk0,
    input  wire [AWIDTH-1:0]  address0,
    input  wire               ce0,
    input  wire [BYTES-1:0]   we0,
    input  wire [BYTES*8-1:0] d0,
    output reg  [BYTES*8-1:0] q0,
    input  wire               clk1,
    input  wire [AWIDTH-1:0]  address1,
    input  wire               ce1,
    input  wire [BYTES-1:0]   we1,
    input  wire [BYTES*8-1:0] d1,
    output reg  [BYTES*8-1:0] q1
);
//------------------------ Parameters -------------------
localparam
    BYTE_WIDTH = 8,
    PORT0 = (MEM_TYPE == "S2P") ? "WO" : ((MEM_TYPE == "2P") ? "RO" : "RW"),
    PORT1 = (MEM_TYPE == "S2P") ? "RO" : "RW";
//------------------------Local signal-------------------
(* ram_style = MEM_STYLE*)
reg  [BYTES*8-1:0] mem[0:DEPTH-1];
wire re0, re1;
//------------------------Task and function--------------
function integer log2;
    input integer x;
    integer n, m;
begin
    n = 1;
    m = 2;
    while (m < x) begin
        n = n + 1;
        m = m * 2;
    end
    log2 = n;
end
endfunction
//------------------------Body---------------------------
generate
    if (MEM_STYLE == "hls_ultra" && PORT0 == "RW") begin
        assign re0 = ce0 & ~|we0;
    end else begin
        assign re0 = ce0;
    end
endgenerate

generate
    if (MEM_STYLE == "hls_ultra" && PORT1 == "RW") begin
        assign re1 = ce1 & ~|we1;
    end else begin
        assign re1 = ce1;
    end
endgenerate

// read port 0
generate if (PORT0 != "WO") begin
    always @(posedge clk0) begin
        if (re0) q0 <= mem[address0];
    end
end
endgenerate

// read port 1
generate if (PORT1 != "WO") begin
    always @(posedge clk1) begin
        if (re1) q1 <= mem[address1];
    end
end
endgenerate

integer i;
// write port 0
generate if (PORT0 != "RO") begin
    always @(posedge clk0) begin
        if (ce0)
        for (i = 0; i < BYTES; i = i + 1)
            if (we0[i])
                mem[address0][i*BYTE_WIDTH +: BYTE_WIDTH] <= d0[i*BYTE_WIDTH +: BYTE_WIDTH];
    end
end
endgenerate

// write port 1
generate if (PORT1 != "RO") begin
    always @(posedge clk1) begin
        if (ce1)
        for (i = 0; i < BYTES; i = i + 1)
            if (we1[i])
                mem[address1][i*BYTE_WIDTH +: BYTE_WIDTH] <= d1[i*BYTE_WIDTH +: BYTE_WIDTH];
    end
end
endgenerate

endmodule

