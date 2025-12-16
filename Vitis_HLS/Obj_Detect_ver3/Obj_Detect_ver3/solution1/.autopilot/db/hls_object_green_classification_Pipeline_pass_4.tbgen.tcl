set moduleName hls_object_green_classification_Pipeline_pass_4
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 1
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set hasInterrupt 0
set DLRegFirstOffset 0
set DLRegItemOffset 0
set C_modelName {hls_object_green_classification_Pipeline_pass_4}
set C_modelType { void 0 }
set C_modelArgList {
	{ next_label_5 int 16 regular  }
	{ obj_x int 16 regular {array 32 { 0 } 0 1 }  }
	{ obj_y int 16 regular {array 32 { 0 } 0 1 }  }
	{ obj_is_green int 1 regular {array 32 { 0 } 0 1 }  }
	{ count_out int 16 regular {pointer 1}  }
	{ parent int 16 regular {array 512 { 1 3 } 1 1 } {global 0}  }
	{ is_external int 1 regular {array 512 { 1 3 } 1 1 } {global 0}  }
	{ min_x int 9 regular {array 512 { 1 3 } 1 1 } {global 0}  }
	{ max_x int 9 regular {array 512 { 1 3 } 1 1 } {global 0}  }
	{ min_y int 8 regular {array 512 { 1 3 } 1 1 } {global 0}  }
	{ max_y int 8 regular {array 512 { 1 3 } 1 1 } {global 0}  }
	{ imgR int 8 regular {array 76800 { 1 3 } 1 1 } {global 0}  }
	{ imgG int 8 regular {array 76800 { 1 3 } 1 1 } {global 0}  }
	{ imgB int 8 regular {array 76800 { 1 3 } 1 1 } {global 0}  }
	{ center_is_green int 1 regular {array 512 { 3 0 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "next_label_5", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "obj_x", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "obj_y", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "obj_is_green", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "count_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "parent", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "is_external", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "min_x", "interface" : "memory", "bitwidth" : 9, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "max_x", "interface" : "memory", "bitwidth" : 9, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "min_y", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "max_y", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "imgR", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "imgG", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "imgB", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "center_is_green", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 52
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ next_label_5 sc_in sc_lv 16 signal 0 } 
	{ obj_x_address0 sc_out sc_lv 5 signal 1 } 
	{ obj_x_ce0 sc_out sc_logic 1 signal 1 } 
	{ obj_x_we0 sc_out sc_logic 1 signal 1 } 
	{ obj_x_d0 sc_out sc_lv 16 signal 1 } 
	{ obj_y_address0 sc_out sc_lv 5 signal 2 } 
	{ obj_y_ce0 sc_out sc_logic 1 signal 2 } 
	{ obj_y_we0 sc_out sc_logic 1 signal 2 } 
	{ obj_y_d0 sc_out sc_lv 16 signal 2 } 
	{ obj_is_green_address0 sc_out sc_lv 5 signal 3 } 
	{ obj_is_green_ce0 sc_out sc_logic 1 signal 3 } 
	{ obj_is_green_we0 sc_out sc_logic 1 signal 3 } 
	{ obj_is_green_d0 sc_out sc_lv 1 signal 3 } 
	{ count_out sc_out sc_lv 16 signal 4 } 
	{ count_out_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ parent_address0 sc_out sc_lv 9 signal 5 } 
	{ parent_ce0 sc_out sc_logic 1 signal 5 } 
	{ parent_q0 sc_in sc_lv 16 signal 5 } 
	{ is_external_address0 sc_out sc_lv 9 signal 6 } 
	{ is_external_ce0 sc_out sc_logic 1 signal 6 } 
	{ is_external_q0 sc_in sc_lv 1 signal 6 } 
	{ min_x_address0 sc_out sc_lv 9 signal 7 } 
	{ min_x_ce0 sc_out sc_logic 1 signal 7 } 
	{ min_x_q0 sc_in sc_lv 9 signal 7 } 
	{ max_x_address0 sc_out sc_lv 9 signal 8 } 
	{ max_x_ce0 sc_out sc_logic 1 signal 8 } 
	{ max_x_q0 sc_in sc_lv 9 signal 8 } 
	{ min_y_address0 sc_out sc_lv 9 signal 9 } 
	{ min_y_ce0 sc_out sc_logic 1 signal 9 } 
	{ min_y_q0 sc_in sc_lv 8 signal 9 } 
	{ max_y_address0 sc_out sc_lv 9 signal 10 } 
	{ max_y_ce0 sc_out sc_logic 1 signal 10 } 
	{ max_y_q0 sc_in sc_lv 8 signal 10 } 
	{ imgR_address0 sc_out sc_lv 17 signal 11 } 
	{ imgR_ce0 sc_out sc_logic 1 signal 11 } 
	{ imgR_q0 sc_in sc_lv 8 signal 11 } 
	{ imgG_address0 sc_out sc_lv 17 signal 12 } 
	{ imgG_ce0 sc_out sc_logic 1 signal 12 } 
	{ imgG_q0 sc_in sc_lv 8 signal 12 } 
	{ imgB_address0 sc_out sc_lv 17 signal 13 } 
	{ imgB_ce0 sc_out sc_logic 1 signal 13 } 
	{ imgB_q0 sc_in sc_lv 8 signal 13 } 
	{ center_is_green_address1 sc_out sc_lv 9 signal 14 } 
	{ center_is_green_ce1 sc_out sc_logic 1 signal 14 } 
	{ center_is_green_we1 sc_out sc_logic 1 signal 14 } 
	{ center_is_green_d1 sc_out sc_lv 1 signal 14 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "next_label_5", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "next_label_5", "role": "default" }} , 
 	{ "name": "obj_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "obj_x", "role": "address0" }} , 
 	{ "name": "obj_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obj_x", "role": "ce0" }} , 
 	{ "name": "obj_x_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obj_x", "role": "we0" }} , 
 	{ "name": "obj_x_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "obj_x", "role": "d0" }} , 
 	{ "name": "obj_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "obj_y", "role": "address0" }} , 
 	{ "name": "obj_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obj_y", "role": "ce0" }} , 
 	{ "name": "obj_y_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obj_y", "role": "we0" }} , 
 	{ "name": "obj_y_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "obj_y", "role": "d0" }} , 
 	{ "name": "obj_is_green_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "obj_is_green", "role": "address0" }} , 
 	{ "name": "obj_is_green_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obj_is_green", "role": "ce0" }} , 
 	{ "name": "obj_is_green_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "obj_is_green", "role": "we0" }} , 
 	{ "name": "obj_is_green_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "obj_is_green", "role": "d0" }} , 
 	{ "name": "count_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "count_out", "role": "default" }} , 
 	{ "name": "count_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "count_out", "role": "ap_vld" }} , 
 	{ "name": "parent_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "parent", "role": "address0" }} , 
 	{ "name": "parent_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "parent", "role": "ce0" }} , 
 	{ "name": "parent_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "parent", "role": "q0" }} , 
 	{ "name": "is_external_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "is_external", "role": "address0" }} , 
 	{ "name": "is_external_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "is_external", "role": "ce0" }} , 
 	{ "name": "is_external_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "is_external", "role": "q0" }} , 
 	{ "name": "min_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_x", "role": "address0" }} , 
 	{ "name": "min_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x", "role": "ce0" }} , 
 	{ "name": "min_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_x", "role": "q0" }} , 
 	{ "name": "max_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_x", "role": "address0" }} , 
 	{ "name": "max_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x", "role": "ce0" }} , 
 	{ "name": "max_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_x", "role": "q0" }} , 
 	{ "name": "min_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_y", "role": "address0" }} , 
 	{ "name": "min_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y", "role": "ce0" }} , 
 	{ "name": "min_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y", "role": "q0" }} , 
 	{ "name": "max_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_y", "role": "address0" }} , 
 	{ "name": "max_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y", "role": "ce0" }} , 
 	{ "name": "max_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y", "role": "q0" }} , 
 	{ "name": "imgR_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "imgR", "role": "address0" }} , 
 	{ "name": "imgR_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgR", "role": "ce0" }} , 
 	{ "name": "imgR_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "imgR", "role": "q0" }} , 
 	{ "name": "imgG_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "imgG", "role": "address0" }} , 
 	{ "name": "imgG_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgG", "role": "ce0" }} , 
 	{ "name": "imgG_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "imgG", "role": "q0" }} , 
 	{ "name": "imgB_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "imgB", "role": "address0" }} , 
 	{ "name": "imgB_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgB", "role": "ce0" }} , 
 	{ "name": "imgB_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "imgB", "role": "q0" }} , 
 	{ "name": "center_is_green_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "center_is_green", "role": "address1" }} , 
 	{ "name": "center_is_green_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "center_is_green", "role": "ce1" }} , 
 	{ "name": "center_is_green_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "center_is_green", "role": "we1" }} , 
 	{ "name": "center_is_green_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "center_is_green", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter3", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter3", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	hls_object_green_classification_Pipeline_pass_4 {
		next_label_5 {Type I LastRead 0 FirstWrite -1}
		obj_x {Type O LastRead -1 FirstWrite 4}
		obj_y {Type O LastRead -1 FirstWrite 4}
		obj_is_green {Type O LastRead -1 FirstWrite 6}
		count_out {Type O LastRead -1 FirstWrite 4}
		parent {Type I LastRead 0 FirstWrite -1}
		is_external {Type I LastRead 1 FirstWrite -1}
		min_x {Type I LastRead 2 FirstWrite -1}
		max_x {Type I LastRead 2 FirstWrite -1}
		min_y {Type I LastRead 2 FirstWrite -1}
		max_y {Type I LastRead 2 FirstWrite -1}
		imgR {Type I LastRead 4 FirstWrite -1}
		imgG {Type I LastRead 4 FirstWrite -1}
		imgB {Type I LastRead 4 FirstWrite -1}
		center_is_green {Type O LastRead -1 FirstWrite 6}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	next_label_5 { ap_none {  { next_label_5 in_data 0 16 } } }
	obj_x { ap_memory {  { obj_x_address0 mem_address 1 5 }  { obj_x_ce0 mem_ce 1 1 }  { obj_x_we0 mem_we 1 1 }  { obj_x_d0 mem_din 1 16 } } }
	obj_y { ap_memory {  { obj_y_address0 mem_address 1 5 }  { obj_y_ce0 mem_ce 1 1 }  { obj_y_we0 mem_we 1 1 }  { obj_y_d0 mem_din 1 16 } } }
	obj_is_green { ap_memory {  { obj_is_green_address0 mem_address 1 5 }  { obj_is_green_ce0 mem_ce 1 1 }  { obj_is_green_we0 mem_we 1 1 }  { obj_is_green_d0 mem_din 1 1 } } }
	count_out { ap_vld {  { count_out out_data 1 16 }  { count_out_ap_vld out_vld 1 1 } } }
	parent { ap_memory {  { parent_address0 mem_address 1 9 }  { parent_ce0 mem_ce 1 1 }  { parent_q0 in_data 0 16 } } }
	is_external { ap_memory {  { is_external_address0 mem_address 1 9 }  { is_external_ce0 mem_ce 1 1 }  { is_external_q0 in_data 0 1 } } }
	min_x { ap_memory {  { min_x_address0 mem_address 1 9 }  { min_x_ce0 mem_ce 1 1 }  { min_x_q0 in_data 0 9 } } }
	max_x { ap_memory {  { max_x_address0 mem_address 1 9 }  { max_x_ce0 mem_ce 1 1 }  { max_x_q0 in_data 0 9 } } }
	min_y { ap_memory {  { min_y_address0 mem_address 1 9 }  { min_y_ce0 mem_ce 1 1 }  { min_y_q0 in_data 0 8 } } }
	max_y { ap_memory {  { max_y_address0 mem_address 1 9 }  { max_y_ce0 mem_ce 1 1 }  { max_y_q0 in_data 0 8 } } }
	imgR { ap_memory {  { imgR_address0 mem_address 1 17 }  { imgR_ce0 mem_ce 1 1 }  { imgR_q0 in_data 0 8 } } }
	imgG { ap_memory {  { imgG_address0 mem_address 1 17 }  { imgG_ce0 mem_ce 1 1 }  { imgG_q0 in_data 0 8 } } }
	imgB { ap_memory {  { imgB_address0 mem_address 1 17 }  { imgB_ce0 mem_ce 1 1 }  { imgB_q0 in_data 0 8 } } }
	center_is_green { ap_memory {  { center_is_green_address1 MemPortADDR2 1 9 }  { center_is_green_ce1 MemPortCE2 1 1 }  { center_is_green_we1 MemPortWE2 1 1 }  { center_is_green_d1 MemPortDIN2 1 1 } } }
}
