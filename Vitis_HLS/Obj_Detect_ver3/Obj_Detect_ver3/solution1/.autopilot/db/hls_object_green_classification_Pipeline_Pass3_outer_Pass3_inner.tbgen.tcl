set moduleName hls_object_green_classification_Pipeline_Pass3_outer_Pass3_inner
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
set C_modelName {hls_object_green_classification_Pipeline_Pass3_outer_Pass3_inner}
set C_modelType { void 0 }
set C_modelArgList {
	{ label_map int 16 regular {array 76800 { 1 0 } 1 1 } {global 2}  }
	{ max_y int 8 regular {array 512 { 1 0 } 1 1 } {global 2}  }
	{ min_y int 8 regular {array 512 { 1 0 } 1 1 } {global 2}  }
	{ max_x int 9 regular {array 512 { 1 0 } 1 1 } {global 2}  }
	{ parent int 16 regular {array 512 { 1 3 } 1 1 } {global 0}  }
	{ min_x int 9 regular {array 512 { 1 0 } 1 1 } {global 2}  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "label_map", "interface" : "memory", "bitwidth" : 16, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "max_y", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "min_y", "interface" : "memory", "bitwidth" : 8, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "max_x", "interface" : "memory", "bitwidth" : 9, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "parent", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "min_x", "interface" : "memory", "bitwidth" : 9, "direction" : "READWRITE", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 44
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ label_map_address0 sc_out sc_lv 17 signal 0 } 
	{ label_map_ce0 sc_out sc_logic 1 signal 0 } 
	{ label_map_q0 sc_in sc_lv 16 signal 0 } 
	{ label_map_address1 sc_out sc_lv 17 signal 0 } 
	{ label_map_ce1 sc_out sc_logic 1 signal 0 } 
	{ label_map_we1 sc_out sc_logic 1 signal 0 } 
	{ label_map_d1 sc_out sc_lv 16 signal 0 } 
	{ max_y_address0 sc_out sc_lv 9 signal 1 } 
	{ max_y_ce0 sc_out sc_logic 1 signal 1 } 
	{ max_y_q0 sc_in sc_lv 8 signal 1 } 
	{ max_y_address1 sc_out sc_lv 9 signal 1 } 
	{ max_y_ce1 sc_out sc_logic 1 signal 1 } 
	{ max_y_we1 sc_out sc_logic 1 signal 1 } 
	{ max_y_d1 sc_out sc_lv 8 signal 1 } 
	{ min_y_address0 sc_out sc_lv 9 signal 2 } 
	{ min_y_ce0 sc_out sc_logic 1 signal 2 } 
	{ min_y_q0 sc_in sc_lv 8 signal 2 } 
	{ min_y_address1 sc_out sc_lv 9 signal 2 } 
	{ min_y_ce1 sc_out sc_logic 1 signal 2 } 
	{ min_y_we1 sc_out sc_logic 1 signal 2 } 
	{ min_y_d1 sc_out sc_lv 8 signal 2 } 
	{ max_x_address0 sc_out sc_lv 9 signal 3 } 
	{ max_x_ce0 sc_out sc_logic 1 signal 3 } 
	{ max_x_q0 sc_in sc_lv 9 signal 3 } 
	{ max_x_address1 sc_out sc_lv 9 signal 3 } 
	{ max_x_ce1 sc_out sc_logic 1 signal 3 } 
	{ max_x_we1 sc_out sc_logic 1 signal 3 } 
	{ max_x_d1 sc_out sc_lv 9 signal 3 } 
	{ parent_address0 sc_out sc_lv 9 signal 4 } 
	{ parent_ce0 sc_out sc_logic 1 signal 4 } 
	{ parent_q0 sc_in sc_lv 16 signal 4 } 
	{ min_x_address0 sc_out sc_lv 9 signal 5 } 
	{ min_x_ce0 sc_out sc_logic 1 signal 5 } 
	{ min_x_q0 sc_in sc_lv 9 signal 5 } 
	{ min_x_address1 sc_out sc_lv 9 signal 5 } 
	{ min_x_ce1 sc_out sc_logic 1 signal 5 } 
	{ min_x_we1 sc_out sc_logic 1 signal 5 } 
	{ min_x_d1 sc_out sc_lv 9 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "label_map_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "label_map", "role": "address0" }} , 
 	{ "name": "label_map_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "label_map", "role": "ce0" }} , 
 	{ "name": "label_map_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "label_map", "role": "q0" }} , 
 	{ "name": "label_map_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "label_map", "role": "address1" }} , 
 	{ "name": "label_map_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "label_map", "role": "ce1" }} , 
 	{ "name": "label_map_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "label_map", "role": "we1" }} , 
 	{ "name": "label_map_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "label_map", "role": "d1" }} , 
 	{ "name": "max_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_y", "role": "address0" }} , 
 	{ "name": "max_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y", "role": "ce0" }} , 
 	{ "name": "max_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y", "role": "q0" }} , 
 	{ "name": "max_y_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_y", "role": "address1" }} , 
 	{ "name": "max_y_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y", "role": "ce1" }} , 
 	{ "name": "max_y_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y", "role": "we1" }} , 
 	{ "name": "max_y_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y", "role": "d1" }} , 
 	{ "name": "min_y_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_y", "role": "address0" }} , 
 	{ "name": "min_y_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y", "role": "ce0" }} , 
 	{ "name": "min_y_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y", "role": "q0" }} , 
 	{ "name": "min_y_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_y", "role": "address1" }} , 
 	{ "name": "min_y_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y", "role": "ce1" }} , 
 	{ "name": "min_y_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y", "role": "we1" }} , 
 	{ "name": "min_y_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y", "role": "d1" }} , 
 	{ "name": "max_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_x", "role": "address0" }} , 
 	{ "name": "max_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x", "role": "ce0" }} , 
 	{ "name": "max_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_x", "role": "q0" }} , 
 	{ "name": "max_x_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_x", "role": "address1" }} , 
 	{ "name": "max_x_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x", "role": "ce1" }} , 
 	{ "name": "max_x_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x", "role": "we1" }} , 
 	{ "name": "max_x_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_x", "role": "d1" }} , 
 	{ "name": "parent_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "parent", "role": "address0" }} , 
 	{ "name": "parent_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "parent", "role": "ce0" }} , 
 	{ "name": "parent_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "parent", "role": "q0" }} , 
 	{ "name": "min_x_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_x", "role": "address0" }} , 
 	{ "name": "min_x_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x", "role": "ce0" }} , 
 	{ "name": "min_x_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_x", "role": "q0" }} , 
 	{ "name": "min_x_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_x", "role": "address1" }} , 
 	{ "name": "min_x_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x", "role": "ce1" }} , 
 	{ "name": "min_x_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x", "role": "we1" }} , 
 	{ "name": "min_x_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_x", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "hls_object_green_classification_Pipeline_Pass3_outer_Pass3_inner",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "153604", "EstimateLatencyMax" : "153604",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "label_map", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "max_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "min_y", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "max_x", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "min_x", "Type" : "Memory", "Direction" : "IO"}],
		"Loop" : [
			{"Name" : "Pass3_outer_Pass3_inner", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_pp0_stage1", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage1_subdone", "LastState" : "ap_ST_fsm_pp0_stage1", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage1_subdone", "QuitState" : "ap_ST_fsm_pp0_stage1", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage1_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	hls_object_green_classification_Pipeline_Pass3_outer_Pass3_inner {
		label_map {Type IO LastRead 2 FirstWrite 4}
		max_y {Type IO LastRead 4 FirstWrite 5}
		min_y {Type IO LastRead 4 FirstWrite 5}
		max_x {Type IO LastRead 4 FirstWrite 5}
		parent {Type I LastRead 3 FirstWrite -1}
		min_x {Type IO LastRead 4 FirstWrite 5}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "153604", "Max" : "153604"}
	, {"Name" : "Interval", "Min" : "153604", "Max" : "153604"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	label_map { ap_memory {  { label_map_address0 mem_address 1 17 }  { label_map_ce0 mem_ce 1 1 }  { label_map_q0 in_data 0 16 }  { label_map_address1 MemPortADDR2 1 17 }  { label_map_ce1 MemPortCE2 1 1 }  { label_map_we1 MemPortWE2 1 1 }  { label_map_d1 MemPortDIN2 1 16 } } }
	max_y { ap_memory {  { max_y_address0 mem_address 1 9 }  { max_y_ce0 mem_ce 1 1 }  { max_y_q0 in_data 0 8 }  { max_y_address1 MemPortADDR2 1 9 }  { max_y_ce1 MemPortCE2 1 1 }  { max_y_we1 MemPortWE2 1 1 }  { max_y_d1 MemPortDIN2 1 8 } } }
	min_y { ap_memory {  { min_y_address0 mem_address 1 9 }  { min_y_ce0 mem_ce 1 1 }  { min_y_q0 in_data 0 8 }  { min_y_address1 MemPortADDR2 1 9 }  { min_y_ce1 MemPortCE2 1 1 }  { min_y_we1 MemPortWE2 1 1 }  { min_y_d1 MemPortDIN2 1 8 } } }
	max_x { ap_memory {  { max_x_address0 mem_address 1 9 }  { max_x_ce0 mem_ce 1 1 }  { max_x_q0 in_data 0 9 }  { max_x_address1 MemPortADDR2 1 9 }  { max_x_ce1 MemPortCE2 1 1 }  { max_x_we1 MemPortWE2 1 1 }  { max_x_d1 MemPortDIN2 1 9 } } }
	parent { ap_memory {  { parent_address0 mem_address 1 9 }  { parent_ce0 mem_ce 1 1 }  { parent_q0 in_data 0 16 } } }
	min_x { ap_memory {  { min_x_address0 mem_address 1 9 }  { min_x_ce0 mem_ce 1 1 }  { min_x_q0 in_data 0 9 }  { min_x_address1 MemPortADDR2 1 9 }  { min_x_ce1 MemPortCE2 1 1 }  { min_x_we1 MemPortWE2 1 1 }  { min_x_d1 MemPortDIN2 1 9 } } }
}
