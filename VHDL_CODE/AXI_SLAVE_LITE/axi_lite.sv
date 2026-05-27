module AXI_LITE_SLAVE_SV #(
    parameter int DATA_WIDTH    = 32,
    parameter int ADDR_WIDTH   = 4,
    parameter int ADDR_LSB     = 2,
    parameter int STRB_WIDTH   = DATA_WIDTH/8
)(
    input  logic S_AXI_ACLK,
    input  logic S_AXI_ARESETN,

    // ---------------- Write Address ----------------
    input  logic [ADDR_WIDTH-1:0] S_AXI_AWADDR,
    input  logic                  S_AXI_AWVALID,
    output logic                  S_AXI_AWREADY,

    // ---------------- Write Data ----------------
    input  logic [DATA_WIDTH-1:0] S_AXI_WDATA,
    input  logic [STRB_WIDTH-1:0] S_AXI_WSTRB,
    input  logic                  S_AXI_WVALID,
    output logic                  S_AXI_WREADY,

    // ---------------- Write Response ----------------
    input  logic                  S_AXI_BREADY,
    output logic                  S_AXI_BVALID,
    output logic [1:0]           S_AXI_BRESP,

    // ---------------- Read Address ----------------
    input  logic [ADDR_WIDTH-1:0] S_AXI_ARADDR,
    input  logic                  S_AXI_ARVALID,
    output logic                  S_AXI_ARREADY,

    // ---------------- Read Data ----------------
    output logic [DATA_WIDTH-1:0] S_AXI_RDATA,
    output logic [1:0]           S_AXI_RRESP,
    output logic                  S_AXI_RVALID,
    input  logic                  S_AXI_RREADY
);

    // =========================================================
    // Register Bank
    // =========================================================
    logic [DATA_WIDTH-1:0] regfile [0:3];

    // =========================================================
    // Address latching (IMPORTANT for VHDL equivalence)
    // =========================================================
    logic [ADDR_WIDTH-1:0] awaddr_reg, araddr_reg;

    // =========================================================
    // Handshake signals
    // =========================================================
    logic aw_hs, w_hs, ar_hs, b_hs, r_hs;

    assign aw_hs = S_AXI_AWVALID && S_AXI_AWREADY;
    assign w_hs  = S_AXI_WVALID  && S_AXI_WREADY;
    assign ar_hs = S_AXI_ARVALID && S_AXI_ARREADY;
    assign b_hs  = S_AXI_BVALID  && S_AXI_BREADY;
    assign r_hs  = S_AXI_RVALID  && S_AXI_RREADY;

    // =========================================================
    // WRITE ADDRESS + DATA READY LOGIC (VHDL-like 1-cycle pulse)
    // =========================================================
    logic aw_en;

    always_ff @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            S_AXI_AWREADY <= 0;
            S_AXI_WREADY  <= 0;
            aw_en         <= 1;
        end else begin

            if (!S_AXI_AWREADY && S_AXI_AWVALID && S_AXI_WVALID && aw_en) begin
                S_AXI_AWREADY <= 1;
                S_AXI_WREADY  <= 1;
                aw_en         <= 0;

                awaddr_reg <= S_AXI_AWADDR;
            end
            else if (b_hs) begin
                S_AXI_AWREADY <= 0;
                S_AXI_WREADY  <= 0;
                aw_en         <= 1;
            end
            else begin
                S_AXI_AWREADY <= 0;
                S_AXI_WREADY  <= 0;
            end
        end
    end

    // =========================================================
    // WRITE TO REGFILE
    // =========================================================
    function automatic logic [DATA_WIDTH-1:0] apply_wstrb(
        input logic [DATA_WIDTH-1:0] old,
        input logic [DATA_WIDTH-1:0] data,
        input logic [STRB_WIDTH-1:0] strb
    );
        logic [DATA_WIDTH-1:0] tmp;
        int i;
        begin
            tmp = old;
            for (i = 0; i < STRB_WIDTH; i++) begin
                if (strb[i])
                    tmp[i*8 +: 8] = data[i*8 +: 8];
            end
            return tmp;
        end
    endfunction

    logic [1:0] aw_index;

    always_ff @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            regfile[0] <= 0;
            regfile[1] <= 0;
            regfile[2] <= 0;
            regfile[3] <= 0;
        end else begin
            if (aw_hs && w_hs) begin
                aw_index = awaddr_reg[ADDR_WIDTH-1:ADDR_LSB];

                case (aw_index)
                    0: regfile[0] <= apply_wstrb(regfile[0], S_AXI_WDATA, S_AXI_WSTRB);
                    1: regfile[1] <= apply_wstrb(regfile[1], S_AXI_WDATA, S_AXI_WSTRB);
                    2: regfile[2] <= apply_wstrb(regfile[2], S_AXI_WDATA, S_AXI_WSTRB);
                    3: regfile[3] <= apply_wstrb(regfile[3], S_AXI_WDATA, S_AXI_WSTRB);
                endcase
            end
        end
    end

    // =========================================================
    // WRITE RESPONSE CHANNEL
    // =========================================================
    always_ff @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            S_AXI_BVALID <= 0;
        end else begin
            if (aw_hs && w_hs) begin
                S_AXI_BVALID <= 1;
            end else if (b_hs) begin
                S_AXI_BVALID <= 0;
            end
        end
    end

    assign S_AXI_BRESP = 2'b00;

    // =========================================================
    // READ ADDRESS CHANNEL
    // =========================================================
    always_ff @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            S_AXI_ARREADY <= 0;
            araddr_reg    <= 0;
        end else begin
            if (!S_AXI_ARREADY && S_AXI_ARVALID) begin
                S_AXI_ARREADY <= 1;
                araddr_reg    <= S_AXI_ARADDR;
            end else begin
                S_AXI_ARREADY <= 0;
            end
        end
    end

    // =========================================================
    // READ DATA CHANNEL
    // =========================================================
    logic [1:0] ar_index;

    always_ff @(posedge S_AXI_ACLK) begin
        if (!S_AXI_ARESETN) begin
            S_AXI_RVALID <= 0;
            S_AXI_RDATA  <= 0;
        end else begin

            if (ar_hs) begin
                ar_index = araddr_reg[ADDR_WIDTH-1:ADDR_LSB];

                S_AXI_RDATA <= regfile[ar_index];
                S_AXI_RVALID <= 1;
            end
            else if (r_hs) begin
                S_AXI_RVALID <= 0;
            end
        end
    end

    assign S_AXI_RRESP = 2'b00;

endmodule