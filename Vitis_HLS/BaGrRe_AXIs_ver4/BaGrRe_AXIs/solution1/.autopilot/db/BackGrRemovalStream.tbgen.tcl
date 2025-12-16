set moduleName BackGrRemovalStream
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type dataflow
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {BackGrRemovalStream}
set C_modelType { void 0 }
set C_modelArgList {
	{ input_stream_V_data_V int 24 regular {axi_s 0 volatile  { input_stream Data } }  }
	{ input_stream_V_keep_V int 3 regular {axi_s 0 volatile  { input_stream Keep } }  }
	{ input_stream_V_strb_V int 3 regular {axi_s 0 volatile  { input_stream Strb } }  }
	{ input_stream_V_user_V int 1 regular {axi_s 0 volatile  { input_stream User } }  }
	{ input_stream_V_last_V int 1 regular {axi_s 0 volatile  { input_stream Last } }  }
	{ input_stream_V_id_V int 1 regular {axi_s 0 volatile  { input_stream ID } }  }
	{ input_stream_V_dest_V int 1 regular {axi_s 0 volatile  { input_stream Dest } }  }
	{ output_stream_V_data_V int 24 regular {axi_s 1 volatile  { output_stream Data } }  }
	{ output_stream_V_keep_V int 3 regular {axi_s 1 volatile  { output_stream Keep } }  }
	{ output_stream_V_strb_V int 3 regular {axi_s 1 volatile  { output_stream Strb } }  }
	{ output_stream_V_user_V int 1 regular {axi_s 1 volatile  { output_stream User } }  }
	{ output_stream_V_last_V int 1 regular {axi_s 1 volatile  { output_stream Last } }  }
	{ output_stream_V_id_V int 1 regular {axi_s 1 volatile  { output_stream ID } }  }
	{ output_stream_V_dest_V int 1 regular {axi_s 1 volatile  { output_stream Dest } }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "input_stream_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "input_stream_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "input_stream_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "input_stream_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "input_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "input_stream_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "input_stream_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "output_stream_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_stream_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_stream_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_stream_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_stream_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "output_stream_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ input_stream_TDATA sc_in sc_lv 24 signal 0 } 
	{ input_stream_TKEEP sc_in sc_lv 3 signal 1 } 
	{ input_stream_TSTRB sc_in sc_lv 3 signal 2 } 
	{ input_stream_TUSER sc_in sc_lv 1 signal 3 } 
	{ input_stream_TLAST sc_in sc_lv 1 signal 4 } 
	{ input_stream_TID sc_in sc_lv 1 signal 5 } 
	{ input_stream_TDEST sc_in sc_lv 1 signal 6 } 
	{ output_stream_TDATA sc_out sc_lv 24 signal 7 } 
	{ output_stream_TKEEP sc_out sc_lv 3 signal 8 } 
	{ output_stream_TSTRB sc_out sc_lv 3 signal 9 } 
	{ output_stream_TUSER sc_out sc_lv 1 signal 10 } 
	{ output_stream_TLAST sc_out sc_lv 1 signal 11 } 
	{ output_stream_TID sc_out sc_lv 1 signal 12 } 
	{ output_stream_TDEST sc_out sc_lv 1 signal 13 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ output_stream_TVALID sc_out sc_logic 1 outvld 13 } 
	{ output_stream_TREADY sc_in sc_logic 1 outacc 13 } 
	{ input_stream_TVALID sc_in sc_logic 1 invld 6 } 
	{ input_stream_TREADY sc_out sc_logic 1 inacc 6 } 
}
set NewPortList {[ 
	{ "name": "input_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "input_stream_V_data_V", "role": "default" }} , 
 	{ "name": "input_stream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "input_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "input_stream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "input_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "input_stream_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "input_stream_V_user_V", "role": "default" }} , 
 	{ "name": "input_stream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "input_stream_V_last_V", "role": "default" }} , 
 	{ "name": "input_stream_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "input_stream_V_id_V", "role": "default" }} , 
 	{ "name": "input_stream_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "input_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "output_stream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "output_stream_V_data_V", "role": "default" }} , 
 	{ "name": "output_stream_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "output_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "output_stream_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "output_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "output_stream_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "output_stream_V_user_V", "role": "default" }} , 
 	{ "name": "output_stream_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "output_stream_V_last_V", "role": "default" }} , 
 	{ "name": "output_stream_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "output_stream_V_id_V", "role": "default" }} , 
 	{ "name": "output_stream_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "output_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "output_stream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "output_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "output_stream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "output_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "input_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "input_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "input_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "input_stream_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "BackGrRemovalStream",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0", "real_start" : "0",
		"Pipeline" : "Dataflow", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "1",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "76825", "EstimateLatencyMax" : "76825",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "1",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"InputProcess" : [
			{"ID" : "1", "Name" : "Loop_row_loop_proc1_U0"}],
		"OutputProcess" : [
			{"ID" : "1", "Name" : "Loop_row_loop_proc1_U0"}],
		"Port" : [
			{"Name" : "input_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "input_stream_V_data_V"}]},
			{"Name" : "input_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "input_stream_V_keep_V"}]},
			{"Name" : "input_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "input_stream_V_strb_V"}]},
			{"Name" : "input_stream_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "input_stream_V_user_V"}]},
			{"Name" : "input_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "input_stream_V_last_V"}]},
			{"Name" : "input_stream_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "input_stream_V_id_V"}]},
			{"Name" : "input_stream_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "input_stream_V_dest_V"}]},
			{"Name" : "output_stream_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "output_stream_V_data_V"}]},
			{"Name" : "output_stream_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "output_stream_V_keep_V"}]},
			{"Name" : "output_stream_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "output_stream_V_strb_V"}]},
			{"Name" : "output_stream_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "output_stream_V_user_V"}]},
			{"Name" : "output_stream_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "output_stream_V_last_V"}]},
			{"Name" : "output_stream_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "output_stream_V_id_V"}]},
			{"Name" : "output_stream_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "output_stream_V_dest_V"}]},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_8"}]},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_7"}]},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_6"}]},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_5"}]},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_4"}]},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_3"}]},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_2"}]},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_1"}]},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line"}]},
			{"Name" : "p_ZZ19BackGrRemovalStreamRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEELi0E", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "Loop_row_loop_proc1_U0", "Port" : "p_ZZ19BackGrRemovalStreamRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEELi0E"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29"],
		"CDFG" : "Loop_row_loop_proc1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "1", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "76825", "EstimateLatencyMax" : "76825",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "1",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "output_stream_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream",
				"BlockSignal" : [
					{"Name" : "output_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "output_stream_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream"},
			{"Name" : "output_stream_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream"},
			{"Name" : "output_stream_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream"},
			{"Name" : "output_stream_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream"},
			{"Name" : "output_stream_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream"},
			{"Name" : "output_stream_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "output_stream"},
			{"Name" : "input_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream",
				"BlockSignal" : [
					{"Name" : "input_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "input_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream"},
			{"Name" : "input_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream"},
			{"Name" : "input_stream_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream"},
			{"Name" : "input_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream"},
			{"Name" : "input_stream_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream"},
			{"Name" : "input_stream_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "input_stream"},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ19BackGrRemovalStreamRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEELi0E", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "row_loop_col_loop", "PipelineType" : "NotSupport"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_8_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_7_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_6_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_5_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_4_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_3_U", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_2_U", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_1_U", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_U", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.p_ZZ19BackGrRemovalStreamRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEELi0E_U", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.sdiv_16ns_9ns_16_20_1_U1", "Parent" : "1"},
	{"ID" : "13", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.sdiv_16ns_9ns_16_20_1_U2", "Parent" : "1"},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.sdiv_16ns_9ns_16_20_1_U3", "Parent" : "1"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.flow_control_loop_pipe_U", "Parent" : "1"},
	{"ID" : "16", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_output_stream_V_data_V_U", "Parent" : "1"},
	{"ID" : "17", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_output_stream_V_keep_V_U", "Parent" : "1"},
	{"ID" : "18", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_output_stream_V_strb_V_U", "Parent" : "1"},
	{"ID" : "19", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_output_stream_V_user_V_U", "Parent" : "1"},
	{"ID" : "20", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_output_stream_V_last_V_U", "Parent" : "1"},
	{"ID" : "21", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_output_stream_V_id_V_U", "Parent" : "1"},
	{"ID" : "22", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_output_stream_V_dest_V_U", "Parent" : "1"},
	{"ID" : "23", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_input_stream_V_data_V_U", "Parent" : "1"},
	{"ID" : "24", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_input_stream_V_keep_V_U", "Parent" : "1"},
	{"ID" : "25", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_input_stream_V_strb_V_U", "Parent" : "1"},
	{"ID" : "26", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_input_stream_V_user_V_U", "Parent" : "1"},
	{"ID" : "27", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_input_stream_V_last_V_U", "Parent" : "1"},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_input_stream_V_id_V_U", "Parent" : "1"},
	{"ID" : "29", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.Loop_row_loop_proc1_U0.regslice_both_input_stream_V_dest_V_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	BackGrRemovalStream {
		input_stream_V_data_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_user_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_last_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_id_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_dest_V {Type I LastRead 0 FirstWrite -1}
		output_stream_V_data_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_keep_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_strb_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_user_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_last_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_id_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_dest_V {Type O LastRead -1 FirstWrite 23}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_8 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_7 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_6 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_5 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_4 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_3 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_2 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_1 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line {Type IO LastRead -1 FirstWrite -1}
		p_ZZ19BackGrRemovalStreamRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEELi0E {Type IO LastRead -1 FirstWrite -1}}
	Loop_row_loop_proc1 {
		output_stream_V_data_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_keep_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_strb_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_user_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_last_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_id_V {Type O LastRead -1 FirstWrite 23}
		output_stream_V_dest_V {Type O LastRead -1 FirstWrite 23}
		input_stream_V_data_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_keep_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_strb_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_user_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_last_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_id_V {Type I LastRead 0 FirstWrite -1}
		input_stream_V_dest_V {Type I LastRead 0 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_8 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_7 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_6 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_5 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_4 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_3 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_2 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line_1 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemovalStream_stream_stream_axis_ap_uint_24_1ul_1ul_1ul_0_h_line {Type IO LastRead -1 FirstWrite -1}
		p_ZZ19BackGrRemovalStreamRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEELi0E {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "76825", "Max" : "76825"}
	, {"Name" : "Interval", "Min" : "76826", "Max" : "76826"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	input_stream_V_data_V { axis {  { input_stream_TDATA in_data 0 24 } } }
	input_stream_V_keep_V { axis {  { input_stream_TKEEP in_data 0 3 } } }
	input_stream_V_strb_V { axis {  { input_stream_TSTRB in_data 0 3 } } }
	input_stream_V_user_V { axis {  { input_stream_TUSER in_data 0 1 } } }
	input_stream_V_last_V { axis {  { input_stream_TLAST in_data 0 1 } } }
	input_stream_V_id_V { axis {  { input_stream_TID in_data 0 1 } } }
	input_stream_V_dest_V { axis {  { input_stream_TDEST in_data 0 1 }  { input_stream_TVALID in_vld 0 1 }  { input_stream_TREADY in_acc 1 1 } } }
	output_stream_V_data_V { axis {  { output_stream_TDATA out_data 1 24 } } }
	output_stream_V_keep_V { axis {  { output_stream_TKEEP out_data 1 3 } } }
	output_stream_V_strb_V { axis {  { output_stream_TSTRB out_data 1 3 } } }
	output_stream_V_user_V { axis {  { output_stream_TUSER out_data 1 1 } } }
	output_stream_V_last_V { axis {  { output_stream_TLAST out_data 1 1 } } }
	output_stream_V_id_V { axis {  { output_stream_TID out_data 1 1 } } }
	output_stream_V_dest_V { axis {  { output_stream_TDEST out_data 1 1 }  { output_stream_TVALID out_vld 1 1 }  { output_stream_TREADY out_acc 0 1 } } }
}

set maxi_interface_dict [dict create]

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
