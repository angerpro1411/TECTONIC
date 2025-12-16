set moduleName BackGrRemoval_stream_v2
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
set C_modelName {BackGrRemoval_stream_v2}
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
	{ threshold int 8 regular {axi_slave 0}  }
	{ rows int 32 regular {axi_slave 0}  }
	{ cols int 32 regular {axi_slave 0}  }
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
 	{ "Name" : "threshold", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 8, "direction" : "READONLY", "offset" : {"in":16}, "offset_end" : {"in":23}} , 
 	{ "Name" : "rows", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":24}, "offset_end" : {"in":31}} , 
 	{ "Name" : "cols", "interface" : "axi_slave", "bundle":"control","type":"ap_none","bitwidth" : 32, "direction" : "READONLY", "offset" : {"in":32}, "offset_end" : {"in":39}} ]}
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
	{ s_axi_control_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_AWADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_control_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_control_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_ARADDR sc_in sc_lv 6 signal -1 } 
	{ s_axi_control_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_control_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_control_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_control_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_control_BRESP sc_out sc_lv 2 signal -1 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_control_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "AWADDR" },"address":[{"name":"BackGrRemoval_stream_v2","role":"start","value":"0","valid_bit":"0"},{"name":"BackGrRemoval_stream_v2","role":"continue","value":"0","valid_bit":"4"},{"name":"BackGrRemoval_stream_v2","role":"auto_start","value":"0","valid_bit":"7"},{"name":"threshold","role":"data","value":"16"},{"name":"rows","role":"data","value":"24"},{"name":"cols","role":"data","value":"32"}] },
	{ "name": "s_axi_control_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWVALID" } },
	{ "name": "s_axi_control_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "AWREADY" } },
	{ "name": "s_axi_control_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WVALID" } },
	{ "name": "s_axi_control_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "WREADY" } },
	{ "name": "s_axi_control_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "WDATA" } },
	{ "name": "s_axi_control_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "control", "role": "WSTRB" } },
	{ "name": "s_axi_control_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "control", "role": "ARADDR" },"address":[{"name":"BackGrRemoval_stream_v2","role":"start","value":"0","valid_bit":"0"},{"name":"BackGrRemoval_stream_v2","role":"done","value":"0","valid_bit":"1"},{"name":"BackGrRemoval_stream_v2","role":"idle","value":"0","valid_bit":"2"},{"name":"BackGrRemoval_stream_v2","role":"ready","value":"0","valid_bit":"3"},{"name":"BackGrRemoval_stream_v2","role":"auto_start","value":"0","valid_bit":"7"}] },
	{ "name": "s_axi_control_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARVALID" } },
	{ "name": "s_axi_control_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "ARREADY" } },
	{ "name": "s_axi_control_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RVALID" } },
	{ "name": "s_axi_control_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "RREADY" } },
	{ "name": "s_axi_control_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "control", "role": "RDATA" } },
	{ "name": "s_axi_control_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "RRESP" } },
	{ "name": "s_axi_control_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BVALID" } },
	{ "name": "s_axi_control_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "BREADY" } },
	{ "name": "s_axi_control_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "control", "role": "BRESP" } },
	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "control", "role": "interrupt" } }, 
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
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28"],
		"CDFG" : "BackGrRemoval_stream_v2",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "in_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "in_stream_V_data_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "in_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "in_stream_V_keep_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "in_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "in_stream_V_strb_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "in_stream_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "in_stream_V_user_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "in_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "in_stream_V_last_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "in_stream_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "in_stream_V_id_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "in_stream_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "in_stream_V_dest_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "out_stream_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "out_stream_V_data_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "out_stream_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "out_stream_V_keep_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "out_stream_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "out_stream_V_strb_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "out_stream_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "out_stream_V_user_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "out_stream_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "out_stream_V_last_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "out_stream_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "out_stream_V_id_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "out_stream_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "out_stream_V_dest_V", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "threshold", "Type" : "None", "Direction" : "I"},
			{"Name" : "rows", "Type" : "None", "Direction" : "I"},
			{"Name" : "cols", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_109", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_111", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_112", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_113", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_114", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_115", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_116", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_117", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_118", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_110", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_89", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_87", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_86", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_85", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_84", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_83", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_82", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_81", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_80", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_88", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_79", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_77", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_76", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_75", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_74", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_73", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_72", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_71", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_70", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_78", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_69", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_67", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_66", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_65", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_64", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_63", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_62", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_61", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_60", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_68", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_59", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_57", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_56", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_55", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_54", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_53", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_52", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_51", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_50", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_58", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_49", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_47", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_46", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_45", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_44", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_43", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_42", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_41", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_40", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_48", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_39", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_37", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_36", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_35", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_34", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_33", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_32", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_31", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_30", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_38", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_29", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_27", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_26", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_25", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_24", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_23", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_22", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_21", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_20", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_28", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_19", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_17", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_16", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_15", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_14", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_13", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_12", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_11", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_10", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_18", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_9", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_7", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_6", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_5", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_4", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_3", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_8", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_99", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_97", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_96", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_95", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_94", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_93", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_92", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_91", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_90", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_98", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_7", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_7", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_6", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_6", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_5", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_5", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_4", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_4", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_3", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_3", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_2", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_2", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_1", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_1", "Inst_start_state" : "4", "Inst_end_state" : "5"}]},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Port" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf", "Inst_start_state" : "4", "Inst_end_state" : "5"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788", "Parent" : "0", "Child" : ["2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"],
		"CDFG" : "BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "96", "EstimateLatencyMax" : "-1",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_219", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_218", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_217", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_216", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_215", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_214", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_213", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_212", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_211", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_210", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_209", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_208", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_207", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_206", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_205", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_204", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_203", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_202", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_201", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_200", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_199", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_198", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_197", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_196", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_195", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_194", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_193", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_192", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_191", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_190", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_189", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_188", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_187", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_186", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_185", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_184", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_183", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_182", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_181", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_180", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_179", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_178", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_177", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_176", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_175", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_174", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_173", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_172", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_171", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_170", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_169", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_168", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_167", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_166", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_165", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_164", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_163", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_162", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_161", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_160", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_159", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_158", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_157", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_156", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_155", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_154", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_153", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_152", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_151", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_150", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_149", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_148", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_147", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_146", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_145", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_144", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_143", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_142", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_141", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_140", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_139", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_138", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_137", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_136", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_135", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_134", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_133", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_132", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_131", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_130", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_129", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_128", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_127", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_126", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_125", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_124", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_123", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_122", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_121", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_120", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_119", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_118", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_117", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_116", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_115", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_114", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_113", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_112", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_111", "Type" : "None", "Direction" : "I"},
			{"Name" : "p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_110", "Type" : "None", "Direction" : "I"},
			{"Name" : "total", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub81", "Type" : "None", "Direction" : "I"},
			{"Name" : "threshold", "Type" : "None", "Direction" : "I"},
			{"Name" : "sub110", "Type" : "None", "Direction" : "I"},
			{"Name" : "out_stream_V_data_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream",
				"BlockSignal" : [
					{"Name" : "out_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "out_stream_V_keep_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_strb_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_user_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_last_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_id_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "out_stream_V_dest_V", "Type" : "Axis", "Direction" : "O", "BaseName" : "out_stream"},
			{"Name" : "cols", "Type" : "None", "Direction" : "I"},
			{"Name" : "in_stream_V_data_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream",
				"BlockSignal" : [
					{"Name" : "in_stream_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "in_stream_V_keep_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_strb_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_user_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_last_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_id_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "in_stream_V_dest_V", "Type" : "Axis", "Direction" : "I", "BaseName" : "in_stream"},
			{"Name" : "hv_119_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_118_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_117_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_116_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_115_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_114_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_113_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_112_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_111_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_110_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_108_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_107_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_106_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_105_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_104_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_103_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_102_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_101_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_100_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_99_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_97_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_96_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_95_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_94_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_93_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_92_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_91_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_90_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_89_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_88_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_86_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_85_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_84_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_83_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_82_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_81_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_80_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_79_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_78_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_77_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_75_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_74_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_73_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_72_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_71_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_70_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_69_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_68_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_67_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_66_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_64_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_63_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_62_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_61_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_60_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_59_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_58_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_57_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_56_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_55_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_53_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_52_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_51_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_50_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_49_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_48_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_47_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_46_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_45_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_44_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_42_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_41_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_40_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_39_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_38_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_37_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_36_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_35_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_34_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_33_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_31_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_30_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_29_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_28_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_27_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_26_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_25_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_24_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_23_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_22_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_20_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_19_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_18_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_17_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_16_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_15_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_14_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_13_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_12_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_11_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_9_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_8_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_7_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_6_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_5_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_4_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_3_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_1_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "hv_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_7", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_6", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_5", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_4", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_3", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_2", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_1", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_84_1", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "42", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage2", "LastStateIter" : "ap_enable_reg_pp0_iter14", "LastStateBlock" : "ap_block_pp0_stage2_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage2", "QuitStateIter" : "ap_enable_reg_pp0_iter14", "QuitStateBlock" : "ap_block_pp0_stage2_subdone", "PostState" : ["ap_ST_fsm_state61"]}}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_7_U", "Parent" : "1"},
	{"ID" : "3", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_6_U", "Parent" : "1"},
	{"ID" : "4", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_5_U", "Parent" : "1"},
	{"ID" : "5", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_4_U", "Parent" : "1"},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_3_U", "Parent" : "1"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_2_U", "Parent" : "1"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_1_U", "Parent" : "1"},
	{"ID" : "9", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_U", "Parent" : "1"},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.sdiv_16ns_9ns_16_20_1_U1", "Parent" : "1"},
	{"ID" : "11", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.sdiv_16ns_9ns_16_20_1_U2", "Parent" : "1"},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_fu_788.sdiv_16ns_9ns_16_20_1_U3", "Parent" : "1"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.control_s_axi_U", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_32s_32s_32_2_1_U246", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_user_V_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_last_V_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_id_V_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_in_stream_V_dest_V_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_data_V_U", "Parent" : "0"},
	{"ID" : "23", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_keep_V_U", "Parent" : "0"},
	{"ID" : "24", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_strb_V_U", "Parent" : "0"},
	{"ID" : "25", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_user_V_U", "Parent" : "0"},
	{"ID" : "26", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_last_V_U", "Parent" : "0"},
	{"ID" : "27", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_id_V_U", "Parent" : "0"},
	{"ID" : "28", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_out_stream_V_dest_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	BackGrRemoval_stream_v2 {
		in_stream_V_data_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_keep_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_strb_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_user_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_last_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_id_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_dest_V {Type I LastRead 2 FirstWrite -1}
		out_stream_V_data_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_keep_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_strb_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_user_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_last_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_id_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_dest_V {Type O LastRead -1 FirstWrite 59}
		threshold {Type I LastRead 0 FirstWrite -1}
		rows {Type I LastRead 0 FirstWrite -1}
		cols {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_109 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_111 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_112 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_113 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_114 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_115 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_116 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_117 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_118 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_110 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_89 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_87 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_86 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_85 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_84 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_83 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_82 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_81 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_80 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_88 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_79 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_77 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_76 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_75 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_74 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_73 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_72 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_71 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_70 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_78 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_69 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_67 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_66 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_65 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_64 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_63 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_62 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_61 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_60 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_68 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_59 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_57 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_56 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_55 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_54 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_53 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_52 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_51 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_50 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_58 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_49 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_47 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_46 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_45 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_44 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_43 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_42 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_41 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_40 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_48 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_39 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_37 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_36 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_35 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_34 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_33 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_32 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_31 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_30 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_38 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_29 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_27 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_26 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_25 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_24 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_23 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_22 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_21 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_20 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_28 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_19 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_17 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_16 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_15 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_14 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_13 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_12 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_11 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_10 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_18 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_9 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_7 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_6 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_5 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_4 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_3 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_2 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_1 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_8 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_99 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_97 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_96 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_95 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_94 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_93 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_92 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_91 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_90 {Type IO LastRead -1 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_98 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_7 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_6 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_5 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_4 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_3 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_2 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_1 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf {Type IO LastRead -1 FirstWrite -1}}
	BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1 {
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_219 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_218 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_217 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_216 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_215 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_214 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_213 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_212 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_211 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_210 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_209 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_208 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_207 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_206 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_205 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_204 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_203 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_202 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_201 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_200 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_199 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_198 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_197 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_196 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_195 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_194 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_193 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_192 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_191 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_190 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_189 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_188 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_187 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_186 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_185 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_184 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_183 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_182 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_181 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_180 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_179 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_178 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_177 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_176 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_175 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_174 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_173 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_172 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_171 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_170 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_169 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_168 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_167 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_166 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_165 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_164 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_163 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_162 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_161 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_160 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_159 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_158 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_157 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_156 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_155 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_154 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_153 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_152 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_151 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_150 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_149 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_148 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_147 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_146 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_145 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_144 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_143 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_142 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_141 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_140 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_139 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_138 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_137 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_136 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_135 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_134 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_133 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_132 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_131 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_130 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_129 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_128 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_127 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_126 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_125 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_124 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_123 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_122 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_121 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_120 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_119 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_118 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_117 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_116 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_115 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_114 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_113 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_112 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_111 {Type I LastRead 0 FirstWrite -1}
		p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_110 {Type I LastRead 0 FirstWrite -1}
		total {Type I LastRead 0 FirstWrite -1}
		sub {Type I LastRead 0 FirstWrite -1}
		sub81 {Type I LastRead 0 FirstWrite -1}
		threshold {Type I LastRead 0 FirstWrite -1}
		sub110 {Type I LastRead 0 FirstWrite -1}
		out_stream_V_data_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_keep_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_strb_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_user_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_last_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_id_V {Type O LastRead -1 FirstWrite 59}
		out_stream_V_dest_V {Type O LastRead -1 FirstWrite 59}
		cols {Type I LastRead 0 FirstWrite -1}
		in_stream_V_data_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_keep_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_strb_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_user_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_last_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_id_V {Type I LastRead 2 FirstWrite -1}
		in_stream_V_dest_V {Type I LastRead 2 FirstWrite -1}
		hv_119_out {Type O LastRead -1 FirstWrite 24}
		hv_118_out {Type O LastRead -1 FirstWrite 24}
		hv_117_out {Type O LastRead -1 FirstWrite 24}
		hv_116_out {Type O LastRead -1 FirstWrite 24}
		hv_115_out {Type O LastRead -1 FirstWrite 24}
		hv_114_out {Type O LastRead -1 FirstWrite 24}
		hv_113_out {Type O LastRead -1 FirstWrite 24}
		hv_112_out {Type O LastRead -1 FirstWrite 24}
		hv_111_out {Type O LastRead -1 FirstWrite 24}
		hv_110_out {Type O LastRead -1 FirstWrite 60}
		hv_108_out {Type O LastRead -1 FirstWrite 24}
		hv_107_out {Type O LastRead -1 FirstWrite 24}
		hv_106_out {Type O LastRead -1 FirstWrite 24}
		hv_105_out {Type O LastRead -1 FirstWrite 24}
		hv_104_out {Type O LastRead -1 FirstWrite 24}
		hv_103_out {Type O LastRead -1 FirstWrite 24}
		hv_102_out {Type O LastRead -1 FirstWrite 24}
		hv_101_out {Type O LastRead -1 FirstWrite 24}
		hv_100_out {Type O LastRead -1 FirstWrite 24}
		hv_99_out {Type O LastRead -1 FirstWrite 60}
		hv_97_out {Type O LastRead -1 FirstWrite 24}
		hv_96_out {Type O LastRead -1 FirstWrite 24}
		hv_95_out {Type O LastRead -1 FirstWrite 24}
		hv_94_out {Type O LastRead -1 FirstWrite 24}
		hv_93_out {Type O LastRead -1 FirstWrite 24}
		hv_92_out {Type O LastRead -1 FirstWrite 24}
		hv_91_out {Type O LastRead -1 FirstWrite 24}
		hv_90_out {Type O LastRead -1 FirstWrite 24}
		hv_89_out {Type O LastRead -1 FirstWrite 24}
		hv_88_out {Type O LastRead -1 FirstWrite 60}
		hv_86_out {Type O LastRead -1 FirstWrite 24}
		hv_85_out {Type O LastRead -1 FirstWrite 24}
		hv_84_out {Type O LastRead -1 FirstWrite 24}
		hv_83_out {Type O LastRead -1 FirstWrite 24}
		hv_82_out {Type O LastRead -1 FirstWrite 24}
		hv_81_out {Type O LastRead -1 FirstWrite 24}
		hv_80_out {Type O LastRead -1 FirstWrite 24}
		hv_79_out {Type O LastRead -1 FirstWrite 24}
		hv_78_out {Type O LastRead -1 FirstWrite 24}
		hv_77_out {Type O LastRead -1 FirstWrite 60}
		hv_75_out {Type O LastRead -1 FirstWrite 24}
		hv_74_out {Type O LastRead -1 FirstWrite 24}
		hv_73_out {Type O LastRead -1 FirstWrite 24}
		hv_72_out {Type O LastRead -1 FirstWrite 24}
		hv_71_out {Type O LastRead -1 FirstWrite 24}
		hv_70_out {Type O LastRead -1 FirstWrite 24}
		hv_69_out {Type O LastRead -1 FirstWrite 24}
		hv_68_out {Type O LastRead -1 FirstWrite 24}
		hv_67_out {Type O LastRead -1 FirstWrite 24}
		hv_66_out {Type O LastRead -1 FirstWrite 60}
		hv_64_out {Type O LastRead -1 FirstWrite 24}
		hv_63_out {Type O LastRead -1 FirstWrite 24}
		hv_62_out {Type O LastRead -1 FirstWrite 24}
		hv_61_out {Type O LastRead -1 FirstWrite 24}
		hv_60_out {Type O LastRead -1 FirstWrite 24}
		hv_59_out {Type O LastRead -1 FirstWrite 24}
		hv_58_out {Type O LastRead -1 FirstWrite 24}
		hv_57_out {Type O LastRead -1 FirstWrite 24}
		hv_56_out {Type O LastRead -1 FirstWrite 24}
		hv_55_out {Type O LastRead -1 FirstWrite 60}
		hv_53_out {Type O LastRead -1 FirstWrite 24}
		hv_52_out {Type O LastRead -1 FirstWrite 24}
		hv_51_out {Type O LastRead -1 FirstWrite 24}
		hv_50_out {Type O LastRead -1 FirstWrite 24}
		hv_49_out {Type O LastRead -1 FirstWrite 24}
		hv_48_out {Type O LastRead -1 FirstWrite 24}
		hv_47_out {Type O LastRead -1 FirstWrite 24}
		hv_46_out {Type O LastRead -1 FirstWrite 24}
		hv_45_out {Type O LastRead -1 FirstWrite 24}
		hv_44_out {Type O LastRead -1 FirstWrite 60}
		hv_42_out {Type O LastRead -1 FirstWrite 24}
		hv_41_out {Type O LastRead -1 FirstWrite 24}
		hv_40_out {Type O LastRead -1 FirstWrite 24}
		hv_39_out {Type O LastRead -1 FirstWrite 24}
		hv_38_out {Type O LastRead -1 FirstWrite 24}
		hv_37_out {Type O LastRead -1 FirstWrite 24}
		hv_36_out {Type O LastRead -1 FirstWrite 24}
		hv_35_out {Type O LastRead -1 FirstWrite 24}
		hv_34_out {Type O LastRead -1 FirstWrite 24}
		hv_33_out {Type O LastRead -1 FirstWrite 60}
		hv_31_out {Type O LastRead -1 FirstWrite 24}
		hv_30_out {Type O LastRead -1 FirstWrite 24}
		hv_29_out {Type O LastRead -1 FirstWrite 24}
		hv_28_out {Type O LastRead -1 FirstWrite 24}
		hv_27_out {Type O LastRead -1 FirstWrite 24}
		hv_26_out {Type O LastRead -1 FirstWrite 24}
		hv_25_out {Type O LastRead -1 FirstWrite 24}
		hv_24_out {Type O LastRead -1 FirstWrite 24}
		hv_23_out {Type O LastRead -1 FirstWrite 24}
		hv_22_out {Type O LastRead -1 FirstWrite 60}
		hv_20_out {Type O LastRead -1 FirstWrite 24}
		hv_19_out {Type O LastRead -1 FirstWrite 24}
		hv_18_out {Type O LastRead -1 FirstWrite 24}
		hv_17_out {Type O LastRead -1 FirstWrite 24}
		hv_16_out {Type O LastRead -1 FirstWrite 24}
		hv_15_out {Type O LastRead -1 FirstWrite 24}
		hv_14_out {Type O LastRead -1 FirstWrite 24}
		hv_13_out {Type O LastRead -1 FirstWrite 24}
		hv_12_out {Type O LastRead -1 FirstWrite 24}
		hv_11_out {Type O LastRead -1 FirstWrite 60}
		hv_9_out {Type O LastRead -1 FirstWrite 24}
		hv_8_out {Type O LastRead -1 FirstWrite 24}
		hv_7_out {Type O LastRead -1 FirstWrite 24}
		hv_6_out {Type O LastRead -1 FirstWrite 24}
		hv_5_out {Type O LastRead -1 FirstWrite 24}
		hv_4_out {Type O LastRead -1 FirstWrite 24}
		hv_3_out {Type O LastRead -1 FirstWrite 24}
		hv_2_out {Type O LastRead -1 FirstWrite 24}
		hv_1_out {Type O LastRead -1 FirstWrite 24}
		hv_out {Type O LastRead -1 FirstWrite 60}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_7 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_6 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_5 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_4 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_3 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_2 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf_1 {Type IO LastRead -1 FirstWrite -1}
		BackGrRemoval_stream_v2_stream_stream_axis_0_ap_uint_8_int_int_linebuf {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "5", "Max" : "0"}
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
