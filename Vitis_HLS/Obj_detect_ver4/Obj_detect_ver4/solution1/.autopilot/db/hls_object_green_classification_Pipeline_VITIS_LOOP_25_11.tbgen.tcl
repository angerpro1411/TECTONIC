set moduleName hls_object_green_classification_Pipeline_VITIS_LOOP_25_11
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
set C_modelName {hls_object_green_classification_Pipeline_VITIS_LOOP_25_11}
set C_modelType { void 0 }
set C_modelArgList {
	{ cur_10 int 16 regular  }
	{ rb_1_out int 16 regular {pointer 1}  }
	{ zext_ln25_2_out int 9 regular {pointer 1}  }
	{ parent int 16 regular {array 512 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "cur_10", "interface" : "wire", "bitwidth" : 16, "direction" : "READONLY"} , 
 	{ "Name" : "rb_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "zext_ln25_2_out", "interface" : "wire", "bitwidth" : 9, "direction" : "WRITEONLY"} , 
 	{ "Name" : "parent", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ cur_10 sc_in sc_lv 16 signal 0 } 
	{ rb_1_out sc_out sc_lv 16 signal 1 } 
	{ rb_1_out_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ zext_ln25_2_out sc_out sc_lv 9 signal 2 } 
	{ zext_ln25_2_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ parent_address0 sc_out sc_lv 9 signal 3 } 
	{ parent_ce0 sc_out sc_logic 1 signal 3 } 
	{ parent_q0 sc_in sc_lv 16 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "cur_10", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "cur_10", "role": "default" }} , 
 	{ "name": "rb_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "rb_1_out", "role": "default" }} , 
 	{ "name": "rb_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "rb_1_out", "role": "ap_vld" }} , 
 	{ "name": "zext_ln25_2_out", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "zext_ln25_2_out", "role": "default" }} , 
 	{ "name": "zext_ln25_2_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "zext_ln25_2_out", "role": "ap_vld" }} , 
 	{ "name": "parent_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "parent", "role": "address0" }} , 
 	{ "name": "parent_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "parent", "role": "ce0" }} , 
 	{ "name": "parent_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "parent", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "hls_object_green_classification_Pipeline_VITIS_LOOP_25_11",
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
			{"Name" : "zext_ln25_2_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "parent", "Type" : "Memory", "Direction" : "I"}],
		"Loop" : [
			{"Name" : "VITIS_LOOP_25_1", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "2", "FirstState" : "ap_ST_fsm_state1", "FirstStateIter" : "", "FirstStateBlock" : "ap_ST_fsm_state1_blk", "LastState" : "ap_ST_fsm_state2", "LastStateIter" : "", "LastStateBlock" : "ap_ST_fsm_state2_blk", "QuitState" : "ap_ST_fsm_state2", "QuitStateIter" : "", "QuitStateBlock" : "ap_ST_fsm_state2_blk", "OneDepthLoop" : "1", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	hls_object_green_classification_Pipeline_VITIS_LOOP_25_11 {
		cur_10 {Type I LastRead 0 FirstWrite -1}
		rb_1_out {Type O LastRead -1 FirstWrite 1}
		zext_ln25_2_out {Type O LastRead -1 FirstWrite 1}
		parent {Type I LastRead 0 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "-1", "Max" : "-1"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	cur_10 { ap_none {  { cur_10 in_data 0 16 } } }
	rb_1_out { ap_vld {  { rb_1_out out_data 1 16 }  { rb_1_out_ap_vld out_vld 1 1 } } }
	zext_ln25_2_out { ap_vld {  { zext_ln25_2_out out_data 1 9 }  { zext_ln25_2_out_ap_vld out_vld 1 1 } } }
	parent { ap_memory {  { parent_address0 mem_address 1 9 }  { parent_ce0 mem_ce 1 1 }  { parent_q0 in_data 0 16 } } }
}
