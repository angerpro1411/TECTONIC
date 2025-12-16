#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("OUT_VEC_din", 8, hls_out, 2, "ap_fifo", "fifo_port_we", 24),
	Port_Property("OUT_VEC_full_n", 1, hls_in, 2, "ap_fifo", "fifo_status", 24),
	Port_Property("OUT_VEC_write", 1, hls_out, 2, "ap_fifo", "fifo_data", 24),
	Port_Property("IN_VEC_dout", 8, hls_in, 1, "ap_fifo", "fifo_port_we", 12),
	Port_Property("IN_VEC_empty_n", 1, hls_in, 1, "ap_fifo", "fifo_status", 12),
	Port_Property("IN_VEC_read", 1, hls_out, 1, "ap_fifo", "fifo_data", 12),
	Port_Property("val_r", 8, hls_in, 0, "ap_none", "in_data", 1),
};
const char* HLS_Design_Meta::dut_name = "find";
