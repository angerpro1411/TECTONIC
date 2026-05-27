module top_axi_lite_sv #

(
    parameter DATA_WIDTH    = 32,
    parameter ADDRESS_WIDTH = 4,
    parameter STROBE_WIDTH  = 4
)

(
    input  logic                         clk,
    input  logic                         rst_n,

    //================ WRITE ADDRESS CHANNEL ================
    input  logic [ADDRESS_WIDTH-1:0]     s_axi_awaddr,
    input  logic                         s_axi_awvalid,
    output logic                         s_axi_awready,

    //================ WRITE DATA CHANNEL ===================
    input  logic [DATA_WIDTH-1:0]        s_axi_wdata,
    input  logic [STROBE_WIDTH-1:0]      s_axi_wstrb,
    input  logic                         s_axi_wvalid,
    output logic                         s_axi_wready,

    //================ WRITE RESPONSE CHANNEL ===============
    output logic [1:0]                   s_axi_bresp,
    output logic                         s_axi_bvalid,
    input  logic                         s_axi_bready,

    //================ READ ADDRESS CHANNEL =================
    input  logic [ADDRESS_WIDTH-1:0]     s_axi_araddr,
    input  logic                         s_axi_arvalid,
    output logic                         s_axi_arready,

    //================ READ DATA CHANNEL ====================
    output logic [DATA_WIDTH-1:0]        s_axi_rdata,
    output logic [1:0]                   s_axi_rresp,
    output logic                         s_axi_rvalid,
    input  logic                         s_axi_rready
);

    //=======================================================
    // AXI-LITE SLAVE INSTANCE
    //=======================================================

    AXI_LITE_SLAVE_VHD_OLDVERSION
    #(
        .DATA_WIDTH    (DATA_WIDTH),
        .STROBE_WIDTH  (STROBE_WIDTH),
        .ADDRESS_WIDTH (ADDRESS_WIDTH),
        .ADDRLSB       (2)
    )
    u_axi_lite_slave
    (
        // GLOBAL
        .S_AXI_ACLK    (clk),
        .S_AXI_ARESETN (rst_n),

        // WRITE ADDRESS CHANNEL
        .S_AXI_AWVALID (s_axi_awvalid),
        .S_AXI_AWREADY (s_axi_awready),
        .S_AXI_AWADDR  (s_axi_awaddr),

        // WRITE DATA CHANNEL
        .S_AXI_WDATA   (s_axi_wdata),
        .S_AXI_WSTRB   (s_axi_wstrb),
        .S_AXI_WVALID  (s_axi_wvalid),
        .S_AXI_WREADY  (s_axi_wready),

        // WRITE RESPONSE CHANNEL
        .S_AXI_BREADY  (s_axi_bready),
        .S_AXI_BVALID  (s_axi_bvalid),
        .S_AXI_BRESP   (s_axi_bresp),

        // READ ADDRESS CHANNEL
        .S_AXI_ARADDR  (s_axi_araddr),
        .S_AXI_ARVALID (s_axi_arvalid),
        .S_AXI_ARREADY (s_axi_arready),

        // READ DATA CHANNEL
        .S_AXI_RDATA   (s_axi_rdata),
        .S_AXI_RRESP   (s_axi_rresp),
        .S_AXI_RVALID  (s_axi_rvalid),
        .S_AXI_RREADY  (s_axi_rready)
    );

endmodule