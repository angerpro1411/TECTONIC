set moduleName hls_object_green_classification_Pipeline_InitLoop
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
set C_modelName {hls_object_green_classification_Pipeline_InitLoop}
set C_modelType { void 0 }
set C_modelArgList {
	{ parent int 16 regular {array 512 { 3 0 } 0 1 } {global 1}  }
	{ min_x int 9 regular {array 512 { 3 0 } 0 1 } {global 1}  }
	{ max_x int 9 regular {array 512 { 3 0 } 0 1 } {global 1}  }
	{ min_y int 8 regular {array 512 { 3 0 } 0 1 } {global 1}  }
	{ max_y int 8 regular {array 512 { 3 0 } 0 1 } {global 1}  }
	{ center_is_green int 1 regular {array 512 { 0 3 } 0 1 } {global 1}  }
	{ pixel_count int 16 regular {array 512 { 3 0 } 0 1 } {global 1}  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "parent", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "min_x", "interface" : "memory", "bitwidth" : 9, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "max_x", "interface" : "memory", "bitwidth" : 9, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "min_y", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "max_y", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "center_is_green", "interface" : "memory", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "pixel_count", "interface" : "memory", "bitwidth" : 16, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 34
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ parent_address1 sc_out sc_lv 9 signal 0 } 
	{ parent_ce1 sc_out sc_logic 1 signal 0 } 
	{ parent_we1 sc_out sc_logic 1 signal 0 } 
	{ parent_d1 sc_out sc_lv 16 signal 0 } 
	{ min_x_address1 sc_out sc_lv 9 signal 1 } 
	{ min_x_ce1 sc_out sc_logic 1 signal 1 } 
	{ min_x_we1 sc_out sc_logic 1 signal 1 } 
	{ min_x_d1 sc_out sc_lv 9 signal 1 } 
	{ max_x_address1 sc_out sc_lv 9 signal 2 } 
	{ max_x_ce1 sc_out sc_logic 1 signal 2 } 
	{ max_x_we1 sc_out sc_logic 1 signal 2 } 
	{ max_x_d1 sc_out sc_lv 9 signal 2 } 
	{ min_y_address1 sc_out sc_lv 9 signal 3 } 
	{ min_y_ce1 sc_out sc_logic 1 signal 3 } 
	{ min_y_we1 sc_out sc_logic 1 signal 3 } 
	{ min_y_d1 sc_out sc_lv 8 signal 3 } 
	{ max_y_address1 sc_out sc_lv 9 signal 4 } 
	{ max_y_ce1 sc_out sc_logic 1 signal 4 } 
	{ max_y_we1 sc_out sc_logic 1 signal 4 } 
	{ max_y_d1 sc_out sc_lv 8 signal 4 } 
	{ center_is_green_address0 sc_out sc_lv 9 signal 5 } 
	{ center_is_green_ce0 sc_out sc_logic 1 signal 5 } 
	{ center_is_green_we0 sc_out sc_logic 1 signal 5 } 
	{ center_is_green_d0 sc_out sc_lv 1 signal 5 } 
	{ pixel_count_address1 sc_out sc_lv 9 signal 6 } 
	{ pixel_count_ce1 sc_out sc_logic 1 signal 6 } 
	{ pixel_count_we1 sc_out sc_logic 1 signal 6 } 
	{ pixel_count_d1 sc_out sc_lv 16 signal 6 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "parent_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "parent", "role": "address1" }} , 
 	{ "name": "parent_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "parent", "role": "ce1" }} , 
 	{ "name": "parent_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "parent", "role": "we1" }} , 
 	{ "name": "parent_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "parent", "role": "d1" }} , 
 	{ "name": "min_x_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_x", "role": "address1" }} , 
 	{ "name": "min_x_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x", "role": "ce1" }} , 
 	{ "name": "min_x_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_x", "role": "we1" }} , 
 	{ "name": "min_x_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_x", "role": "d1" }} , 
 	{ "name": "max_x_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_x", "role": "address1" }} , 
 	{ "name": "max_x_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x", "role": "ce1" }} , 
 	{ "name": "max_x_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_x", "role": "we1" }} , 
 	{ "name": "max_x_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_x", "role": "d1" }} , 
 	{ "name": "min_y_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "min_y", "role": "address1" }} , 
 	{ "name": "min_y_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y", "role": "ce1" }} , 
 	{ "name": "min_y_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "min_y", "role": "we1" }} , 
 	{ "name": "min_y_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "min_y", "role": "d1" }} , 
 	{ "name": "max_y_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "max_y", "role": "address1" }} , 
 	{ "name": "max_y_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y", "role": "ce1" }} , 
 	{ "name": "max_y_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "max_y", "role": "we1" }} , 
 	{ "name": "max_y_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "max_y", "role": "d1" }} , 
 	{ "name": "center_is_green_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "center_is_green", "role": "address0" }} , 
 	{ "name": "center_is_green_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "center_is_green", "role": "ce0" }} , 
 	{ "name": "center_is_green_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "center_is_green", "role": "we0" }} , 
 	{ "name": "center_is_green_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "center_is_green", "role": "d0" }} , 
 	{ "name": "pixel_count_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "pixel_count", "role": "address1" }} , 
 	{ "name": "pixel_count_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pixel_count", "role": "ce1" }} , 
 	{ "name": "pixel_count_we1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pixel_count", "role": "we1" }} , 
 	{ "name": "pixel_count_d1", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pixel_count", "role": "d1" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	hls_object_green_classification_Pipeline_InitLoop {
		parent {Type O LastRead -1 FirstWrite 0}
		min_x {Type O LastRead -1 FirstWrite 0}
		max_x {Type O LastRead -1 FirstWrite 0}
		min_y {Type O LastRead -1 FirstWrite 0}
		max_y {Type O LastRead -1 FirstWrite 0}
		center_is_green {Type O LastRead -1 FirstWrite 0}
		pixel_count {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "514", "Max" : "514"}
	, {"Name" : "Interval", "Min" : "514", "Max" : "514"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	parent { ap_memory {  { parent_address1 MemPortADDR2 1 9 }  { parent_ce1 MemPortCE2 1 1 }  { parent_we1 MemPortWE2 1 1 }  { parent_d1 MemPortDIN2 1 16 } } }
	min_x { ap_memory {  { min_x_address1 MemPortADDR2 1 9 }  { min_x_ce1 MemPortCE2 1 1 }  { min_x_we1 MemPortWE2 1 1 }  { min_x_d1 MemPortDIN2 1 9 } } }
	max_x { ap_memory {  { max_x_address1 MemPortADDR2 1 9 }  { max_x_ce1 MemPortCE2 1 1 }  { max_x_we1 MemPortWE2 1 1 }  { max_x_d1 MemPortDIN2 1 9 } } }
	min_y { ap_memory {  { min_y_address1 MemPortADDR2 1 9 }  { min_y_ce1 MemPortCE2 1 1 }  { min_y_we1 MemPortWE2 1 1 }  { min_y_d1 MemPortDIN2 1 8 } } }
	max_y { ap_memory {  { max_y_address1 MemPortADDR2 1 9 }  { max_y_ce1 MemPortCE2 1 1 }  { max_y_we1 MemPortWE2 1 1 }  { max_y_d1 MemPortDIN2 1 8 } } }
	center_is_green { ap_memory {  { center_is_green_address0 mem_address 1 9 }  { center_is_green_ce0 mem_ce 1 1 }  { center_is_green_we0 mem_we 1 1 }  { center_is_green_d0 mem_din 1 1 } } }
	pixel_count { ap_memory {  { pixel_count_address1 MemPortADDR2 1 9 }  { pixel_count_ce1 MemPortCE2 1 1 }  { pixel_count_we1 MemPortWE2 1 1 }  { pixel_count_d1 MemPortDIN2 1 16 } } }
}
