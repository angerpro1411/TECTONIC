`timescale 1 ns / 1 ps

module AESL_deadlock_kernel_monitor_top ( 
    input wire kernel_monitor_clock,
    input wire kernel_monitor_reset
);
wire [1:0] axis_block_sigs;
wire [2:0] inst_idle_sigs;
wire [0:0] inst_block_sigs;
wire kernel_block;

assign axis_block_sigs[0] = ~AESL_inst_BackGrRemovalStream.Loop_row_loop_proc1_U0.output_stream_TDATA_blk_n;
assign axis_block_sigs[1] = ~AESL_inst_BackGrRemovalStream.Loop_row_loop_proc1_U0.input_stream_TDATA_blk_n;

assign inst_idle_sigs[0] = AESL_inst_BackGrRemovalStream.Loop_row_loop_proc1_U0.ap_idle;
assign inst_block_sigs[0] = (AESL_inst_BackGrRemovalStream.Loop_row_loop_proc1_U0.ap_done & ~AESL_inst_BackGrRemovalStream.Loop_row_loop_proc1_U0.ap_continue);

assign inst_idle_sigs[1] = 1'b0;
assign inst_idle_sigs[2] = AESL_inst_BackGrRemovalStream.Loop_row_loop_proc1_U0.ap_idle;

AESL_deadlock_idx0_monitor AESL_deadlock_idx0_monitor_U (
    .clock(kernel_monitor_clock),
    .reset(kernel_monitor_reset),
    .axis_block_sigs(axis_block_sigs),
    .inst_idle_sigs(inst_idle_sigs),
    .inst_block_sigs(inst_block_sigs),
    .block(kernel_block)
);

// synthesis translate_off
// logic for axis port block diagnosis

// synthesis translate_on

wire [1:0] proc0_is_blocked_by;
wire [1:0] proc0_blocks;
wire proc0_idle;

assign proc0_is_blocked_by = 2'h0;
assign proc0_blocks = 2'h0;
assign proc0_idle = 1'b1;

reg [1:0] rpt_source_cnt;
initial begin : rpt_block_cnt
    rpt_source_cnt = 2'h0;
    wait(kernel_monitor_reset == 1'b1);
    repeat(10)
        @(posedge kernel_monitor_clock);
    while(!kernel_block || rpt_source_cnt != 2'h2)
    begin
        @(posedge kernel_monitor_clock);
        if (kernel_block)
            rpt_source_cnt = rpt_source_cnt + 2'h1;
    end
end

parameter RPT_IDLE = 5'b00001;
parameter RPT_PICK_PROC = 5'b00010;
parameter RPT_PROC_DST = 5'b00100;
parameter RPT_PROC_SRC = 5'b01000;
parameter RPT_DONE = 5'b10000;

reg [4:0] rpt_cur_st;
reg [4:0] rpt_next_st;
reg rpt_enable;
reg [0:0] rpt_proc_cnt;

always @(posedge kernel_monitor_clock) begin
    if (kernel_monitor_reset == 1'b1)
        rpt_enable <= 1'b1;
    else if (rpt_cur_st == RPT_IDLE && rpt_source_cnt == 2'h2)
        rpt_enable <= 1'b0;
    else ;
end

always @(posedge kernel_monitor_clock) begin
    if (kernel_monitor_reset == 1'b1)
        rpt_proc_cnt <= 1'd0;
    else if (rpt_cur_st == RPT_PROC_SRC)
        rpt_proc_cnt <= rpt_proc_cnt + 1'd1;
    else ;
end

always @(posedge kernel_monitor_clock) begin
    if (kernel_monitor_reset == 1'b1)
        rpt_cur_st <= RPT_IDLE;
    else
        rpt_cur_st <= rpt_next_st;
end

always @(*) begin
    case(rpt_cur_st)
        RPT_IDLE: begin
            if (kernel_block == 1'b1 && rpt_enable == 1'b1)
                rpt_next_st = RPT_PICK_PROC;
            else
                rpt_next_st = RPT_IDLE;
        end
        RPT_PICK_PROC: begin
            if (rpt_proc_cnt == 1)
                rpt_next_st = RPT_DONE;
            else
                rpt_next_st = RPT_PROC_DST;
        end
        RPT_PROC_DST: rpt_next_st = RPT_PROC_SRC;
        RPT_PROC_SRC: rpt_next_st = RPT_PICK_PROC;
        RPT_DONE: rpt_next_st = RPT_IDLE;
        default: rpt_next_st = RPT_IDLE;
    endcase
end

reg [2:0] rpt_P0_block_info_dst;
reg [2:0] rpt_P0_block_info_src;

always @(posedge kernel_monitor_clock) begin
    if (kernel_monitor_reset == 1'b1)
        rpt_P0_block_info_dst <= 3'h0;
    else if (rpt_cur_st == RPT_PROC_DST && rpt_proc_cnt == 1'h0)
        rpt_P0_block_info_dst <= {1'b0,proc0_blocks};
end

always @(posedge kernel_monitor_clock) begin
    if (kernel_monitor_reset == 1'b1)
        rpt_P0_block_info_src <= 3'h0;
    else if (rpt_cur_st == RPT_PROC_SRC && rpt_proc_cnt == 1'h0)
        rpt_P0_block_info_src <= {proc0_idle,proc0_is_blocked_by};
end



// synthesis translate_off

initial begin : axis_deadlock_report
integer axis_port_scan_flag;
integer fp;
integer cnt;
integer path_cnt;
    cnt = 0;
    path_cnt = 1;
    fp = $fopen("kernel_deadlock_diagnosis.rpt","a");
    $fdisplay(fp,"//// start to dump deadlock path for kernel '%m' ////");
    wait(kernel_monitor_reset == 1'b1);
        axis_port_scan_flag = 0;
    while(!kernel_block || cnt != 2)
    begin
        @(posedge kernel_monitor_clock);
        if (kernel_block)
            cnt = cnt + 1;
    end

    $display("\n//////////////////////////////////////////////////////////////////////////////");
    $fdisplay(fp,"\n//////////////////////////////////////////////////////////////////////////////");
    // find all axis ports which have no outer block
    while (axis_port_scan_flag < 2) begin
        case(axis_port_scan_flag)
            0,1:
            begin
                if (axis_block_sigs[0] == 1'b0 || axis_block_sigs[1] == 1'b0) begin
                    $display("//****************************************************************************");
                    $display("// Block PATH %d",path_cnt);
                    $display("//****************************************************************************");
                    $display("// Following axis port can not access by process 'BackGrRemovalStream.Loop_row_loop_proc1_U0' :");
                    $fdisplay(fp,"//****************************************************************************");
                    $fdisplay(fp,"// Block PATH %d",path_cnt);
                    $fdisplay(fp,"//****************************************************************************");
                    $fdisplay(fp,"// Following axis port can not access by process 'BackGrRemovalStream.Loop_row_loop_proc1_U0' :");
                    if (axis_block_sigs[0] == 1'b0) begin
                        $display("//    Port 'output_stream' can not be written");
                        $fdisplay(fp,"//    Port 'output_stream' can not be written");
                    end
                    else if (axis_block_sigs[1] == 1'b0) begin
                        $display("//    Port 'input_stream' can not be read");
                        $fdisplay(fp,"//    Port 'input_stream' can not be read");
                    end
                    report_block_path_in_Loop_row_loop_proc1_U0(fp);
                    $display("//****************************************************************************");
                    $fdisplay(fp,"//****************************************************************************");
                    path_cnt = path_cnt + 1;
                end
            end
        endcase
        axis_port_scan_flag = axis_port_scan_flag + 1;
    end
    $display("//////////////////////////////////////////////////////////////////////////////\n");
    $fdisplay(fp,"//////////////////////////////////////////////////////////////////////////////\n");
    $fdisplay(fp,"//// finish dumping deadlock path for kernel '%m' ////\n");
    $fclose(fp);
end

task report_block_path_in_Loop_row_loop_proc1_U0(input integer fp);
begin
end
endtask
// synthesis translate_on

initial begin : trigger_axis_deadlock
reg block_delay;
    block_delay = 0;
    while(1) begin
        @(posedge kernel_monitor_clock);
    if (kernel_block == 1'b1 && block_delay == 1'b0)
        block_delay = kernel_block;
    end
end

endmodule
