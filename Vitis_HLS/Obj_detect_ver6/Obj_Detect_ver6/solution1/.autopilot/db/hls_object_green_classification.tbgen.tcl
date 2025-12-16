set moduleName hls_object_green_classification
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {hls_object_green_classification}
set C_modelType { void 0 }
set C_modelArgList {
	{ in_stream_V_data_V int 24 regular {axi_s 0 volatile  { in_stream Data } }  }
	{ in_stream_V_keep_V int 3 regular {axi_s 0 volatile  { in_stream Keep } }  }
	{ in_stream_V_strb_V int 3 regular {axi_s 0 volatile  { in_stream Strb } }  }
	{ in_stream_V_user_V int 1 regular {axi_s 0 volatile  { in_stream User } }  }
	{ in_stream_V_last_V int 1 regular {axi_s 0 volatile  { in_stream Last } }  }
	{ in_stream_V_id_V int 1 regular {axi_s 0 volatile  { in_stream ID } }  }
	{ in_stream_V_dest_V int 1 regular {axi_s 0 volatile  { in_stream Dest } }  }
	{ out_stream_V_data_V int 24 regular {axi_s 1 volatile  { out_stream Data } }  }
	{ out_stream_V_keep_V int 3 regular {axi_s 1 volatile  { out_stream Keep } }  }
	{ out_stream_V_strb_V int 3 regular {axi_s 1 volatile  { out_stream Strb } }  }
	{ out_stream_V_user_V int 1 regular {axi_s 1 volatile  { out_stream User } }  }
	{ out_stream_V_last_V int 1 regular {axi_s 1 volatile  { out_stream Last } }  }
	{ out_stream_V_id_V int 1 regular {axi_s 1 volatile  { out_stream ID } }  }
	{ out_stream_V_dest_V int 1 regular {axi_s 1 volatile  { out_stream Dest } }  }
	{ obj_x int 16 regular {axi_slave 2}  }
	{ obj_y int 16 regular {axi_slave 2}  }
	{ obj_is_green int 1 regular {axi_slave 2}  }
	{ object_count int 16 regular {axi_slave 1}  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "in_stream_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "in_stream_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "out_stream_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "obj_x", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_memory","bitwidth" : 16, "direction" : "READWRITE", "offset" : {"in":64, "out":64}, "offset_end" : {"in":127, "out":127}} , 
 	{ "Name" : "obj_y", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_memory","bitwidth" : 16, "direction" : "READWRITE", "offset" : {"in":128, "out":128}, "offset_end" : {"in":191, "out":191}} , 
 	{ "Name" : "obj_is_green", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_memory","bitwidth" : 1, "direction" : "READWRITE", "offset" : {"in":32, "out":32}, "offset_end" : {"in":63, "out":63}} , 
 	{ "Name" : "object_count", "interface" : "axi_slave", "bundle":"CTRL","type":"ap_vld","bitwidth" : 16, "direction" : "WRITEONLY", "offset" : {"out":16}, "offset_end" : {"out":23}} ]}
# RTL Port declarations: 
set portNum 38
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ in_stream_TDATA sc_in sc_lv 24 signal 0 } 
	{ in_stream_TVALID sc_in sc_logic 1 invld 6 } 
	{ in_stream_TREADY sc_out sc_logic 1 inacc 6 } 
	{ in_stream_TKEEP sc_in sc_lv 3 signal 1 } 
	{ in_stream_TSTRB sc_in sc_lv 3 signal 2 } 
	{ in_stream_TUSER sc_in sc_lv 1 signal 3 } 
	{ in_stream_TLAST sc_in sc_lv 1 signal 4 } 
	{ in_stream_TID sc_in sc_lv 1 signal 5 } 
	{ in_stream_TDEST sc_in sc_lv 1 signal 6 } 
	{ out_stream_TDATA sc_out sc_lv 24 signal 7 } 
	{ out_stream_TVALID sc_out sc_logic 1 outvld 13 } 
	{ out_stream_TREADY sc_in sc_logic 1 outacc 13 } 
	{ out_stream_TKEEP sc_out sc_lv 3 signal 8 } 
	{ out_stream_TSTRB sc_out sc_lv 3 signal 9 } 
	{ out_stream_TUSER sc_out sc_lv 1 signal 10 } 
	{ out_stream_TLAST sc_out sc_lv 1 signal 11 } 
	{ out_stream_TID sc_out sc_lv 1 signal 12 } 
	{ out_stream_TDEST sc_out sc_lv 1 signal 13 } 
	{ s_axi_CTRL_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_AWADDR sc_in sc_lv 8 signal -1 } 
	{ s_axi_CTRL_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_CTRL_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_CTRL_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_ARADDR sc_in sc_lv 8 signal -1 } 
	{ s_axi_CTRL_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_CTRL_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_CTRL_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_CTRL_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_CTRL_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "CTRL", "role": "AWADDR" },"address":[{"name":"hls_object_green_classification","role":"start","value":"0","valid_bit":"0"},{"name":"hls_object_green_classification","role":"continue","value":"0","valid_bit":"4"},{"name":"hls_object_green_classification","role":"auto_start","value":"0","valid_bit":"7"},{"name":"obj_is_green","role":"data","value":"32"},{"name":"obj_x","role":"data","value":"64"},{"name":"obj_y","role":"data","value":"128"}] },
	{ "name": "s_axi_CTRL_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "AWVALID" } },
	{ "name": "s_axi_CTRL_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "AWREADY" } },
	{ "name": "s_axi_CTRL_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "WVALID" } },
	{ "name": "s_axi_CTRL_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "WREADY" } },
	{ "name": "s_axi_CTRL_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL", "role": "WDATA" } },
	{ "name": "s_axi_CTRL_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "CTRL", "role": "WSTRB" } },
	{ "name": "s_axi_CTRL_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "CTRL", "role": "ARADDR" },"address":[{"name":"hls_object_green_classification","role":"start","value":"0","valid_bit":"0"},{"name":"hls_object_green_classification","role":"done","value":"0","valid_bit":"1"},{"name":"hls_object_green_classification","role":"idle","value":"0","valid_bit":"2"},{"name":"hls_object_green_classification","role":"ready","value":"0","valid_bit":"3"},{"name":"hls_object_green_classification","role":"auto_start","value":"0","valid_bit":"7"},{"name":"object_count","role":"data","value":"16"}, {"name":"object_count","role":"valid","value":"20","valid_bit":"0"},{"name":"obj_is_green","role":"data","value":"32"},{"name":"obj_x","role":"data","value":"64"},{"name":"obj_y","role":"data","value":"128"}] },
	{ "name": "s_axi_CTRL_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "ARVALID" } },
	{ "name": "s_axi_CTRL_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "ARREADY" } },
	{ "name": "s_axi_CTRL_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "RVALID" } },
	{ "name": "s_axi_CTRL_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "RREADY" } },
	{ "name": "s_axi_CTRL_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "CTRL", "role": "RDATA" } },
	{ "name": "s_axi_CTRL_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL", "role": "RRESP" } },
	{ "name": "s_axi_CTRL_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "BVALID" } },
	{ "name": "s_axi_CTRL_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "BREADY" } },
	{ "name": "s_axi_CTRL_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "CTRL", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "CTRL", "role": "interrupt" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "in_stream_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "in_stream_V_data_V", "role": "default" }} , 
 	{ "name": "in_stream_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "in_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "in_stream_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "in_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "in_stream_TKEEP", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "in_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "in_stream_TSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "in_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "in_stream_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_stream_V_user_V", "role": "default" }} , 
 	{ "name": "in_stream_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_stream_V_last_V", "role": "default" }} , 
 	{ "name": "in_stream_TID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_stream_V_id_V", "role": "default" }} , 
 	{ "name": "in_stream_TDEST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "in_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "out_stream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "out_stream_V_data_V", "role": "default" }} , 
 	{ "name": "out_stream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "out_stream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "out_stream_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "out_stream_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "out_stream_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_user_V", "role": "default" }} , 
 	{ "name": "out_stream_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_last_V", "role": "default" }} , 
 	{ "name": "out_stream_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_id_V", "role": "default" }} , 
 	{ "name": "out_stream_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_dest_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "29", "31", "33", "35", "37", "75", "77", "79", "81", "83", "85", "87", "89", "91", "102", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137"],
		"CDFG" : "hls_object_green_classification",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"BlockSignal" : [
					{"Name" : "in_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "out_stream_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "out_stream_V_data_V", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "out_stream_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "out_stream_V_keep_V", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "out_stream_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "out_stream_V_strb_V", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "out_stream_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "out_stream_V_user_V", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "out_stream_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "out_stream_V_last_V", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "out_stream_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "out_stream_V_id_V", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "out_stream_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "out_stream_V_dest_V", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "obj_x", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "obj_x", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "89", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_276_5_fu_976", "Port" : "obj_x", "Inst_start_state" : "87", "Inst_end_state" : "88"},
					{"ID" : "102", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_311_6_fu_1041", "Port" : "obj_x", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "obj_y", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "obj_y", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "89", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_276_5_fu_976", "Port" : "obj_y", "Inst_start_state" : "87", "Inst_end_state" : "88"},
					{"ID" : "102", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_311_6_fu_1041", "Port" : "obj_y", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "obj_is_green", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "obj_is_green", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "89", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_276_5_fu_976", "Port" : "obj_is_green", "Inst_start_state" : "87", "Inst_end_state" : "88"},
					{"ID" : "102", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_311_6_fu_1041", "Port" : "obj_is_green", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "object_count", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "29", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_1_fu_811", "Port" : "parent", "Inst_start_state" : "47", "Inst_end_state" : "48"},
					{"ID" : "27", "SubInstance" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_793", "Port" : "parent", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "31", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_2_fu_819", "Port" : "parent", "Inst_start_state" : "49", "Inst_end_state" : "50"},
					{"ID" : "33", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_11_fu_827", "Port" : "parent", "Inst_start_state" : "51", "Inst_end_state" : "52"},
					{"ID" : "35", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_22_fu_836", "Port" : "parent", "Inst_start_state" : "53", "Inst_end_state" : "54"},
					{"ID" : "75", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_206_1_VITIS_LOOP_207_2_fu_871", "Port" : "parent", "Inst_start_state" : "70", "Inst_end_state" : "77"},
					{"ID" : "77", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_13_fu_879", "Port" : "parent", "Inst_start_state" : "72", "Inst_end_state" : "73"},
					{"ID" : "79", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_24_fu_887", "Port" : "parent", "Inst_start_state" : "74", "Inst_end_state" : "75"},
					{"ID" : "83", "SubInstance" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_1_fu_911", "Port" : "parent", "Inst_start_state" : "79", "Inst_end_state" : "80"},
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "parent", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "87", "SubInstance" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_954", "Port" : "parent", "Inst_start_state" : "84", "Inst_end_state" : "85"}]},
			{"Name" : "min_x", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_793", "Port" : "min_x", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "81", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4_fu_895", "Port" : "min_x", "Inst_start_state" : "78", "Inst_end_state" : "79"},
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "min_x", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "87", "SubInstance" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_954", "Port" : "min_x", "Inst_start_state" : "84", "Inst_end_state" : "85"}]},
			{"Name" : "max_x", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_793", "Port" : "max_x", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "81", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4_fu_895", "Port" : "max_x", "Inst_start_state" : "78", "Inst_end_state" : "79"},
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "max_x", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "87", "SubInstance" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_954", "Port" : "max_x", "Inst_start_state" : "84", "Inst_end_state" : "85"}]},
			{"Name" : "min_y", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_793", "Port" : "min_y", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "81", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4_fu_895", "Port" : "min_y", "Inst_start_state" : "78", "Inst_end_state" : "79"},
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "min_y", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "87", "SubInstance" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_954", "Port" : "min_y", "Inst_start_state" : "84", "Inst_end_state" : "85"}]},
			{"Name" : "max_y", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_793", "Port" : "max_y", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "81", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4_fu_895", "Port" : "max_y", "Inst_start_state" : "78", "Inst_end_state" : "79"},
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "max_y", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "87", "SubInstance" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_954", "Port" : "max_y", "Inst_start_state" : "84", "Inst_end_state" : "85"}]},
			{"Name" : "center_is_green", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_793", "Port" : "center_is_green", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "center_is_green", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "center_is_green", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "pixel_count", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "27", "SubInstance" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_793", "Port" : "pixel_count", "Inst_start_state" : "1", "Inst_end_state" : "2"},
					{"ID" : "81", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4_fu_895", "Port" : "pixel_count", "Inst_start_state" : "78", "Inst_end_state" : "79"},
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "pixel_count", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "pixel_count", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "imgR", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "imgR", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "imgR", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "imgG", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "imgG", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "imgG", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "imgB", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "imgB", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "imgB", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "hls_object_green_classification_stream_stream_short_short_ap_uint_ap_uint_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "hls_mulmulmulobject_green_classification_stream_stream_short_short_ap_uint_ap_uint", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8", "Inst_start_state" : "68", "Inst_end_state" : "69"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7", "Inst_start_state" : "68", "Inst_end_state" : "69"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6", "Inst_start_state" : "68", "Inst_end_state" : "69"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5", "Inst_start_state" : "68", "Inst_end_state" : "69"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4", "Inst_start_state" : "68", "Inst_end_state" : "69"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3", "Inst_start_state" : "68", "Inst_end_state" : "69"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2", "Inst_start_state" : "68", "Inst_end_state" : "69"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1", "Inst_start_state" : "68", "Inst_end_state" : "69"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "37", "SubInstance" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm", "Inst_start_state" : "68", "Inst_end_state" : "69"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "label_map", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "75", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_206_1_VITIS_LOOP_207_2_fu_871", "Port" : "label_map", "Inst_start_state" : "70", "Inst_end_state" : "77"},
					{"ID" : "81", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4_fu_895", "Port" : "label_map", "Inst_start_state" : "78", "Inst_end_state" : "79"},
					{"ID" : "91", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Port" : "label_map", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "is_external", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "83", "SubInstance" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_1_fu_911", "Port" : "is_external", "Inst_start_state" : "79", "Inst_end_state" : "80"},
					{"ID" : "85", "SubInstance" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Port" : "is_external", "Inst_start_state" : "81", "Inst_end_state" : "86"},
					{"ID" : "87", "SubInstance" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_954", "Port" : "is_external", "Inst_start_state" : "84", "Inst_end_state" : "85"}]},
			{"Name" : "obj_x_buf", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "89", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_276_5_fu_976", "Port" : "obj_x_buf", "Inst_start_state" : "87", "Inst_end_state" : "88"},
					{"ID" : "102", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_311_6_fu_1041", "Port" : "obj_x_buf", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "obj_y_buf", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "89", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_276_5_fu_976", "Port" : "obj_y_buf", "Inst_start_state" : "87", "Inst_end_state" : "88"},
					{"ID" : "102", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_311_6_fu_1041", "Port" : "obj_y_buf", "Inst_start_state" : "89", "Inst_end_state" : "90"}]},
			{"Name" : "obj_is_green_buf", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "89", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_276_5_fu_976", "Port" : "obj_is_green_buf", "Inst_start_state" : "87", "Inst_end_state" : "88"},
					{"ID" : "102", "SubInstance" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_311_6_fu_1041", "Port" : "obj_is_green_buf", "Inst_start_state" : "89", "Inst_end_state" : "90"}]}],
		"Loop" : [
			{"Name" : "PASS_1", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "91", "FirstState" : "ap_ST_fsm_state3", "LastState" : ["ap_ST_fsm_state56"], "QuitState" : ["ap_ST_fsm_state3"], "PreState" : ["ap_ST_fsm_state2"], "PostState" : ["ap_ST_fsm_state57"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "PASS1_5_Outer", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "91", "FirstState" : "ap_ST_fsm_state57", "LastState" : ["ap_ST_fsm_state69"], "QuitState" : ["ap_ST_fsm_state57"], "PreState" : ["ap_ST_fsm_state3"], "PostState" : ["ap_ST_fsm_state70"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "PASS2", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "91", "FirstState" : "ap_ST_fsm_state70", "LastState" : ["ap_ST_fsm_state76"], "QuitState" : ["ap_ST_fsm_state70"], "PreState" : ["ap_ST_fsm_state57"], "PostState" : ["ap_ST_fsm_state77"], "OneDepthLoop" : "0", "OneStateBlock": ""}},
			{"Name" : "PASS_3_5_2_out", "PipelineType" : "no",
				"LoopDec" : {"FSMBitwidth" : "91", "FirstState" : "ap_ST_fsm_state81", "LastState" : ["ap_ST_fsm_state85"], "QuitState" : ["ap_ST_fsm_state81"], "PreState" : ["ap_ST_fsm_state79", "ap_ST_fsm_state80"], "PostState" : ["ap_ST_fsm_state86"], "OneDepthLoop" : "0", "OneStateBlock": ""}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.parent_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.min_x_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.max_x_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.min_y_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.max_y_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.center_is_green_U", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_count_U", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.imgR_U", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.imgG_U", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.imgB_U", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hls_object_green_classification_stream_stream_short_short_ap_uint_ap_uint_1_U", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.hls_mulmulmulobject_green_classification_stream_stream_short_short_ap_uint_ap_uint_U", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_U", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.label_map_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.is_external_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.obj_x_buf_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.obj_y_buf_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.obj_is_green_buf_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_InitLoop_fu_793", "Parent" : "0", "Child" : ["28"],
		"CDFG" : "hls_object_green_classification_Pipeline_InitLoop",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "514", "EstimateLatencyMax" : "514",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "parent", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "min_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "min_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "max_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "center_is_green", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "pixel_count", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "InitLoop", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state1", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state1_blk", "QuitState" : "ap_ST_fsm_state1", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state1_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "28", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_InitLoop_fu_793.flow_control_loop_pipe_sequential_init_U", "Parent" : "27"},
	{"ID" : "29", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_1_fu_811", "Parent" : "0", "Child" : ["30"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_26_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "cur_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "ra_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_26_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "30", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_1_fu_811.flow_control_loop_pipe_sequential_init_U", "Parent" : "29"},
	{"ID" : "31", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_2_fu_819", "Parent" : "0", "Child" : ["32"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_28_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "cur_9", "Type" : "None", "Direction" : "I"},
			{"Name" : "ra_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_28_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "32", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_2_fu_819.flow_control_loop_pipe_sequential_init_U", "Parent" : "31"},
	{"ID" : "33", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_11_fu_827", "Parent" : "0", "Child" : ["34"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_26_11",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "cur_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "rb_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "zext_ln26_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_26_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "34", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_11_fu_827.flow_control_loop_pipe_sequential_init_U", "Parent" : "33"},
	{"ID" : "35", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_22_fu_836", "Parent" : "0", "Child" : ["36"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_28_22",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "cur_10", "Type" : "None", "Direction" : "I"},
			{"Name" : "rb_1_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_28_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "36", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_22_fu_836.flow_control_loop_pipe_sequential_init_U", "Parent" : "35"},
	{"ID" : "37", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844", "Parent" : "0", "Child" : ["38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74"],
		"CDFG" : "hls_object_green_classification_Pipeline_Pass1_5_inner0",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "334", "EstimateLatencyMax" : "334",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "tmp", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln190", "Type" : "None", "Direction" : "I"},
			{"Name" : "empty", "Type" : "None", "Direction" : "I"},
			{"Name" : "mul_ln190_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "trunc_ln3", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "Pass1_5_inner0", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter15", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter15", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "38", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.urem_9ns_3ns_2_13_1_U21", "Parent" : "37"},
	{"ID" : "39", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mul_9ns_11ns_19_1_1_U22", "Parent" : "37"},
	{"ID" : "40", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mul_9ns_11ns_19_1_1_U23", "Parent" : "37"},
	{"ID" : "41", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mul_9ns_11ns_19_1_1_U24", "Parent" : "37"},
	{"ID" : "42", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U25", "Parent" : "37"},
	{"ID" : "43", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U26", "Parent" : "37"},
	{"ID" : "44", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U27", "Parent" : "37"},
	{"ID" : "45", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U28", "Parent" : "37"},
	{"ID" : "46", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U29", "Parent" : "37"},
	{"ID" : "47", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U30", "Parent" : "37"},
	{"ID" : "48", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U31", "Parent" : "37"},
	{"ID" : "49", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U32", "Parent" : "37"},
	{"ID" : "50", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U33", "Parent" : "37"},
	{"ID" : "51", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U34", "Parent" : "37"},
	{"ID" : "52", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U35", "Parent" : "37"},
	{"ID" : "53", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U36", "Parent" : "37"},
	{"ID" : "54", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U37", "Parent" : "37"},
	{"ID" : "55", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U38", "Parent" : "37"},
	{"ID" : "56", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U39", "Parent" : "37"},
	{"ID" : "57", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U40", "Parent" : "37"},
	{"ID" : "58", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U41", "Parent" : "37"},
	{"ID" : "59", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U42", "Parent" : "37"},
	{"ID" : "60", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U43", "Parent" : "37"},
	{"ID" : "61", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U44", "Parent" : "37"},
	{"ID" : "62", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U45", "Parent" : "37"},
	{"ID" : "63", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U46", "Parent" : "37"},
	{"ID" : "64", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U47", "Parent" : "37"},
	{"ID" : "65", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U48", "Parent" : "37"},
	{"ID" : "66", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U49", "Parent" : "37"},
	{"ID" : "67", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U50", "Parent" : "37"},
	{"ID" : "68", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U51", "Parent" : "37"},
	{"ID" : "69", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U52", "Parent" : "37"},
	{"ID" : "70", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U53", "Parent" : "37"},
	{"ID" : "71", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U54", "Parent" : "37"},
	{"ID" : "72", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U55", "Parent" : "37"},
	{"ID" : "73", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.mux_3_2_1_1_1_U56", "Parent" : "37"},
	{"ID" : "74", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844.flow_control_loop_pipe_sequential_init_U", "Parent" : "37"},
	{"ID" : "75", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_206_1_VITIS_LOOP_207_2_fu_871", "Parent" : "0", "Child" : ["76"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_206_1_VITIS_LOOP_207_2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "230402", "EstimateLatencyMax" : "230402",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "label_map", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_206_1_VITIS_LOOP_207_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "76", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_206_1_VITIS_LOOP_207_2_fu_871.flow_control_loop_pipe_sequential_init_U", "Parent" : "75"},
	{"ID" : "77", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_13_fu_879", "Parent" : "0", "Child" : ["78"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_26_13",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "root_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "root_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_26_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "78", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_13_fu_879.flow_control_loop_pipe_sequential_init_U", "Parent" : "77"},
	{"ID" : "79", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_24_fu_887", "Parent" : "0", "Child" : ["80"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_28_24",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "root_12", "Type" : "None", "Direction" : "I"},
			{"Name" : "root_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_28_2", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter0", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "80", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_24_fu_887.flow_control_loop_pipe_sequential_init_U", "Parent" : "79"},
	{"ID" : "81", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4_fu_895", "Parent" : "0", "Child" : ["82"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "230403", "EstimateLatencyMax" : "230403",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "label_map", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pixel_count", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "max_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "min_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "max_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "min_x", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_218_3_VITIS_LOOP_219_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "82", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4_fu_895.flow_control_loop_pipe_sequential_init_U", "Parent" : "81"},
	{"ID" : "83", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_PASS_3_5_1_fu_911", "Parent" : "0", "Child" : ["84"],
		"CDFG" : "hls_object_green_classification_Pipeline_PASS_3_5_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "65537",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "next_label_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "is_external", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "PASS_3_5_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "84", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_PASS_3_5_1_fu_911.flow_control_loop_pipe_sequential_init_U", "Parent" : "83"},
	{"ID" : "85", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass_4_fu_920", "Parent" : "0", "Child" : ["86"],
		"CDFG" : "hls_object_green_classification_Pipeline_pass_4",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "-1", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "next_label_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "obj_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "obj_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "obj_is_green", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "count_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "is_external", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pixel_count", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "min_x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "min_y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "imgR", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "imgG", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "imgB", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "center_is_green", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "pass_4", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "3", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "86", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass_4_fu_920.flow_control_loop_pipe_sequential_init_U", "Parent" : "85"},
	{"ID" : "87", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_954", "Parent" : "0", "Child" : ["88"],
		"CDFG" : "hls_object_green_classification_Pipeline_PASS_3_5_2_in",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "8", "EstimateLatencyMax" : "65541",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "next_label_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "i_5", "Type" : "None", "Direction" : "I"},
			{"Name" : "min_x_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "max_x_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "min_y_load_1", "Type" : "None", "Direction" : "I"},
			{"Name" : "max_y_load", "Type" : "None", "Direction" : "I"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "min_x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "min_y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "max_y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "is_external", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "PASS_3_5_2_in", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter6", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter6", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "88", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_954.flow_control_loop_pipe_sequential_init_U", "Parent" : "87"},
	{"ID" : "89", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_276_5_fu_976", "Parent" : "0", "Child" : ["90"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_276_5",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "65537",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "count_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "obj_x", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "obj_y", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "obj_is_green", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "obj_x_buf", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "obj_y_buf", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "obj_is_green_buf", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_276_5", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "90", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_276_5_fu_976.flow_control_loop_pipe_sequential_init_U", "Parent" : "89"},
	{"ID" : "91", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993", "Parent" : "0", "Child" : ["92", "93", "94", "95", "96", "97", "98", "99", "100", "101"],
		"CDFG" : "hls_object_green_classification_Pipeline_pass5_out_pass5_in",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "76814", "EstimateLatencyMax" : "76814",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "out_stream_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"BlockSignal" : [
					{"Name" : "out_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_stream_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "imgR", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "imgG", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "imgB", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "label_map", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "pixel_count", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "center_is_green", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "pass5_out_pass5_in", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter1", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter14", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter14", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "92", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993.urem_9ns_3ns_2_13_1_U126", "Parent" : "91"},
	{"ID" : "93", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993.urem_8ns_3ns_2_12_1_U127", "Parent" : "91"},
	{"ID" : "94", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993.mul_8ns_10ns_17_1_1_U128", "Parent" : "91"},
	{"ID" : "95", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993.mul_9ns_11ns_19_1_1_U129", "Parent" : "91"},
	{"ID" : "96", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993.mux_3_2_1_1_1_U130", "Parent" : "91"},
	{"ID" : "97", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993.mux_3_2_1_1_1_U131", "Parent" : "91"},
	{"ID" : "98", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993.mux_3_2_1_1_1_U132", "Parent" : "91"},
	{"ID" : "99", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993.mux_3_2_1_1_1_U133", "Parent" : "91"},
	{"ID" : "100", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993.mac_muladd_7ns_7ns_8ns_14_4_1_U134", "Parent" : "91"},
	{"ID" : "101", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993.flow_control_loop_pipe_sequential_init_U", "Parent" : "91"},
	{"ID" : "102", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_311_6_fu_1041", "Parent" : "0", "Child" : ["103"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_311_6",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2", "EstimateLatencyMax" : "65",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "count_reload", "Type" : "None", "Direction" : "I"},
			{"Name" : "obj_x", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "obj_y", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "obj_is_green", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "obj_x_buf", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "obj_y_buf", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "obj_is_green_buf", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_311_6", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "103", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_hls_object_green_classification_Pipeline_VITIS_LOOP_311_6_fu_1041.flow_control_loop_pipe_sequential_init_U", "Parent" : "102"},
	{"ID" : "104", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.CTRL_s_axi_U", "Parent" : "0"},
	{"ID" : "105", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32ns_34ns_65_2_1_U167", "Parent" : "0"},
	{"ID" : "106", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_41ns_43ns_56_3_1_U168", "Parent" : "0"},
	{"ID" : "107", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_32ns_3ns_2_36_seq_1_U169", "Parent" : "0"},
	{"ID" : "108", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_32ns_3ns_2_36_seq_1_U170", "Parent" : "0"},
	{"ID" : "109", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_2_1_8_1_1_U171", "Parent" : "0"},
	{"ID" : "110", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_2_1_8_1_1_U172", "Parent" : "0"},
	{"ID" : "111", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_11s_11s_21_1_1_U173", "Parent" : "0"},
	{"ID" : "112", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_8ns_3ns_2_12_seq_1_U174", "Parent" : "0"},
	{"ID" : "113", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U175", "Parent" : "0"},
	{"ID" : "114", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_7ns_8ns_14_1_1_U176", "Parent" : "0"},
	{"ID" : "115", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U177", "Parent" : "0"},
	{"ID" : "116", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U178", "Parent" : "0"},
	{"ID" : "117", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_7ns_8ns_14_1_1_U179", "Parent" : "0"},
	{"ID" : "118", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_7ns_8ns_14_1_1_U180", "Parent" : "0"},
	{"ID" : "119", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_1_1_1_U181", "Parent" : "0"},
	{"ID" : "120", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8ns_6ns_40ns_41_4_1_U182", "Parent" : "0"},
	{"ID" : "121", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_8ns_4ns_41ns_41_4_1_U183", "Parent" : "0"},
	{"ID" : "122", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_14s_7ns_14ns_14_4_1_U184", "Parent" : "0"},
	{"ID" : "123", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_11s_11s_21s_21_4_1_U185", "Parent" : "0"},
	{"ID" : "124", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "125", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "126", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "127", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_user_V_U", "Parent" : "0"},
	{"ID" : "128", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_last_V_U", "Parent" : "0"},
	{"ID" : "129", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_id_V_U", "Parent" : "0"},
	{"ID" : "130", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_dest_V_U", "Parent" : "0"},
	{"ID" : "131", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "132", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "133", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "134", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_user_V_U", "Parent" : "0"},
	{"ID" : "135", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_last_V_U", "Parent" : "0"},
	{"ID" : "136", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_id_V_U", "Parent" : "0"},
	{"ID" : "137", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	hls_object_green_classification {
		in_stream_V_data_V {Type I LastRead 29 FirstWrite -1}
		in_stream_V_keep_V {Type I LastRead 29 FirstWrite -1}
		in_stream_V_strb_V {Type I LastRead 29 FirstWrite -1}
		in_stream_V_user_V {Type I LastRead 29 FirstWrite -1}
		in_stream_V_last_V {Type I LastRead 29 FirstWrite -1}
		in_stream_V_id_V {Type I LastRead 29 FirstWrite -1}
		in_stream_V_dest_V {Type I LastRead 29 FirstWrite -1}
		out_stream_V_data_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_keep_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_strb_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_user_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_last_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_id_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_dest_V {Type O LastRead -1 FirstWrite 14}
		obj_x {Type IO LastRead 0 FirstWrite -1}
		obj_y {Type IO LastRead 0 FirstWrite -1}
		obj_is_green {Type IO LastRead 0 FirstWrite -1}
		object_count {Type O LastRead -1 FirstWrite 13}
		parent {Type IO LastRead -1 FirstWrite -1}
		min_x {Type IO LastRead -1 FirstWrite -1}
		max_x {Type IO LastRead -1 FirstWrite -1}
		min_y {Type IO LastRead -1 FirstWrite -1}
		max_y {Type IO LastRead -1 FirstWrite -1}
		center_is_green {Type IO LastRead -1 FirstWrite -1}
		pixel_count {Type IO LastRead -1 FirstWrite -1}
		imgR {Type IO LastRead -1 FirstWrite -1}
		imgG {Type IO LastRead -1 FirstWrite -1}
		imgB {Type IO LastRead -1 FirstWrite -1}
		hls_object_green_classification_stream_stream_short_short_ap_uint_ap_uint_1 {Type IO LastRead -1 FirstWrite -1}
		hls_mulmulmulobject_green_classification_stream_stream_short_short_ap_uint_ap_uint {Type IO LastRead -1 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm {Type IO LastRead -1 FirstWrite -1}
		label_map {Type IO LastRead -1 FirstWrite -1}
		is_external {Type IO LastRead -1 FirstWrite -1}
		obj_x_buf {Type IO LastRead -1 FirstWrite -1}
		obj_y_buf {Type IO LastRead -1 FirstWrite -1}
		obj_is_green_buf {Type IO LastRead -1 FirstWrite -1}}
	hls_object_green_classification_Pipeline_InitLoop {
		parent {Type O LastRead -1 FirstWrite 0}
		min_x {Type O LastRead -1 FirstWrite 0}
		max_x {Type O LastRead -1 FirstWrite 0}
		min_y {Type O LastRead -1 FirstWrite 0}
		max_y {Type O LastRead -1 FirstWrite 0}
		center_is_green {Type O LastRead -1 FirstWrite 0}
		pixel_count {Type O LastRead -1 FirstWrite 0}}
	hls_object_green_classification_Pipeline_VITIS_LOOP_26_1 {
		cur_9 {Type I LastRead 0 FirstWrite -1}
		ra_1_out {Type O LastRead -1 FirstWrite 1}
		parent {Type I LastRead 0 FirstWrite -1}}
	hls_object_green_classification_Pipeline_VITIS_LOOP_28_2 {
		cur_9 {Type I LastRead 0 FirstWrite -1}
		ra_1_reload {Type I LastRead 0 FirstWrite -1}
		parent {Type IO LastRead 0 FirstWrite 2}}
	hls_object_green_classification_Pipeline_VITIS_LOOP_26_11 {
		cur_10 {Type I LastRead 0 FirstWrite -1}
		rb_1_out {Type O LastRead -1 FirstWrite 1}
		zext_ln26_2_out {Type O LastRead -1 FirstWrite 1}
		parent {Type I LastRead 0 FirstWrite -1}}
	hls_object_green_classification_Pipeline_VITIS_LOOP_28_22 {
		cur_10 {Type I LastRead 0 FirstWrite -1}
		rb_1_reload {Type I LastRead 0 FirstWrite -1}
		parent {Type IO LastRead 0 FirstWrite 2}}
	hls_object_green_classification_Pipeline_Pass1_5_inner0 {
		tmp {Type I LastRead 0 FirstWrite -1}
		mul_ln190 {Type I LastRead 0 FirstWrite -1}
		empty {Type I LastRead 0 FirstWrite -1}
		mul_ln190_1 {Type I LastRead 0 FirstWrite -1}
		trunc_ln3 {Type I LastRead 0 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8 {Type IO LastRead 14 FirstWrite 15}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7 {Type IO LastRead 14 FirstWrite 15}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6 {Type IO LastRead 14 FirstWrite 15}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5 {Type IO LastRead 14 FirstWrite 15}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4 {Type IO LastRead 14 FirstWrite 15}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3 {Type IO LastRead 14 FirstWrite 15}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2 {Type IO LastRead 14 FirstWrite 15}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1 {Type IO LastRead 14 FirstWrite 15}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm {Type IO LastRead 14 FirstWrite 15}}
	hls_object_green_classification_Pipeline_VITIS_LOOP_206_1_VITIS_LOOP_207_2 {
		label_map {Type IO LastRead 2 FirstWrite 4}
		parent {Type I LastRead 3 FirstWrite -1}}
	hls_object_green_classification_Pipeline_VITIS_LOOP_26_13 {
		root_12 {Type I LastRead 0 FirstWrite -1}
		root_out {Type O LastRead -1 FirstWrite 1}
		parent {Type I LastRead 0 FirstWrite -1}}
	hls_object_green_classification_Pipeline_VITIS_LOOP_28_24 {
		root_12 {Type I LastRead 0 FirstWrite -1}
		root_reload {Type I LastRead 0 FirstWrite -1}
		parent {Type IO LastRead 0 FirstWrite 2}}
	hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4 {
		label_map {Type I LastRead 2 FirstWrite -1}
		pixel_count {Type IO LastRead 3 FirstWrite 4}
		max_y {Type IO LastRead 3 FirstWrite 5}
		min_y {Type IO LastRead 3 FirstWrite 5}
		max_x {Type IO LastRead 3 FirstWrite 5}
		min_x {Type IO LastRead 3 FirstWrite 5}}
	hls_object_green_classification_Pipeline_PASS_3_5_1 {
		next_label_5 {Type I LastRead 0 FirstWrite -1}
		parent {Type I LastRead 0 FirstWrite -1}
		is_external {Type O LastRead -1 FirstWrite 2}}
	hls_object_green_classification_Pipeline_pass_4 {
		next_label_5 {Type I LastRead 0 FirstWrite -1}
		obj_x {Type O LastRead -1 FirstWrite 5}
		obj_y {Type O LastRead -1 FirstWrite 5}
		obj_is_green {Type O LastRead -1 FirstWrite 7}
		count_out {Type O LastRead -1 FirstWrite 4}
		parent {Type I LastRead 0 FirstWrite -1}
		is_external {Type I LastRead 1 FirstWrite -1}
		pixel_count {Type I LastRead 2 FirstWrite -1}
		min_x {Type I LastRead 3 FirstWrite -1}
		max_x {Type I LastRead 3 FirstWrite -1}
		min_y {Type I LastRead 3 FirstWrite -1}
		max_y {Type I LastRead 3 FirstWrite -1}
		imgR {Type I LastRead 5 FirstWrite -1}
		imgG {Type I LastRead 5 FirstWrite -1}
		imgB {Type I LastRead 5 FirstWrite -1}
		center_is_green {Type O LastRead -1 FirstWrite 7}}
	hls_object_green_classification_Pipeline_PASS_3_5_2_in {
		next_label_5 {Type I LastRead 0 FirstWrite -1}
		i_5 {Type I LastRead 0 FirstWrite -1}
		min_x_load_1 {Type I LastRead 0 FirstWrite -1}
		max_x_load_1 {Type I LastRead 0 FirstWrite -1}
		min_y_load_1 {Type I LastRead 0 FirstWrite -1}
		max_y_load {Type I LastRead 0 FirstWrite -1}
		parent {Type I LastRead 0 FirstWrite -1}
		min_x {Type I LastRead 1 FirstWrite -1}
		max_x {Type I LastRead 2 FirstWrite -1}
		min_y {Type I LastRead 3 FirstWrite -1}
		max_y {Type I LastRead 4 FirstWrite -1}
		is_external {Type O LastRead -1 FirstWrite 6}}
	hls_object_green_classification_Pipeline_VITIS_LOOP_276_5 {
		count_reload {Type I LastRead 0 FirstWrite -1}
		obj_x {Type I LastRead 0 FirstWrite -1}
		obj_y {Type I LastRead 0 FirstWrite -1}
		obj_is_green {Type I LastRead 0 FirstWrite -1}
		obj_x_buf {Type O LastRead -1 FirstWrite 1}
		obj_y_buf {Type O LastRead -1 FirstWrite 1}
		obj_is_green_buf {Type O LastRead -1 FirstWrite 1}}
	hls_object_green_classification_Pipeline_pass5_out_pass5_in {
		out_stream_V_data_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_keep_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_strb_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_user_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_last_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_id_V {Type O LastRead -1 FirstWrite 14}
		out_stream_V_dest_V {Type O LastRead -1 FirstWrite 14}
		imgR {Type I LastRead 13 FirstWrite -1}
		imgG {Type I LastRead 13 FirstWrite -1}
		imgB {Type I LastRead 13 FirstWrite -1}
		label_map {Type I LastRead 12 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8 {Type I LastRead 12 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7 {Type I LastRead 12 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6 {Type I LastRead 12 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5 {Type I LastRead 12 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4 {Type I LastRead 12 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3 {Type I LastRead 12 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2 {Type I LastRead 12 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1 {Type I LastRead 12 FirstWrite -1}
		p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm {Type I LastRead 12 FirstWrite -1}
		pixel_count {Type I LastRead 13 FirstWrite -1}
		center_is_green {Type I LastRead 13 FirstWrite -1}}
	hls_object_green_classification_Pipeline_VITIS_LOOP_311_6 {
		count_reload {Type I LastRead 0 FirstWrite -1}
		obj_x {Type O LastRead -1 FirstWrite 1}
		obj_y {Type O LastRead -1 FirstWrite 1}
		obj_is_green {Type O LastRead -1 FirstWrite 1}
		obj_x_buf {Type I LastRead 0 FirstWrite -1}
		obj_y_buf {Type I LastRead 0 FirstWrite -1}
		obj_is_green_buf {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	in_stream_V_data_V { axis {  { in_stream_TDATA in_data 0 24 } } }
	in_stream_V_keep_V { axis {  { in_stream_TKEEP in_data 0 3 } } }
	in_stream_V_strb_V { axis {  { in_stream_TSTRB in_data 0 3 } } }
	in_stream_V_user_V { axis {  { in_stream_TUSER in_data 0 1 } } }
	in_stream_V_last_V { axis {  { in_stream_TLAST in_data 0 1 } } }
	in_stream_V_id_V { axis {  { in_stream_TID in_data 0 1 } } }
	in_stream_V_dest_V { axis {  { in_stream_TVALID in_vld 0 1 }  { in_stream_TREADY in_acc 1 1 }  { in_stream_TDEST in_data 0 1 } } }
	out_stream_V_data_V { axis {  { out_stream_TDATA out_data 1 24 } } }
	out_stream_V_keep_V { axis {  { out_stream_TKEEP out_data 1 3 } } }
	out_stream_V_strb_V { axis {  { out_stream_TSTRB out_data 1 3 } } }
	out_stream_V_user_V { axis {  { out_stream_TUSER out_data 1 1 } } }
	out_stream_V_last_V { axis {  { out_stream_TLAST out_data 1 1 } } }
	out_stream_V_id_V { axis {  { out_stream_TID out_data 1 1 } } }
	out_stream_V_dest_V { axis {  { out_stream_TVALID out_vld 1 1 }  { out_stream_TREADY out_acc 0 1 }  { out_stream_TDEST out_data 1 1 } } }
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
