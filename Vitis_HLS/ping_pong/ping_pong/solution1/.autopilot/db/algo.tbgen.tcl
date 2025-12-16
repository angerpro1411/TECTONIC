set moduleName algo
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
set C_modelName {algo}
set C_modelType { void 0 }
set C_modelArgList {
	{ vecIn_0 int 8 regular {array 50 { 1 3 } 1 1 }  }
	{ vecIn_1 int 8 regular {array 50 { 1 3 } 1 1 }  }
	{ vecOut_0 int 8 regular {array 50 { 0 3 } 0 1 }  }
	{ vecOut_1 int 8 regular {array 50 { 0 3 } 0 1 }  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "vecIn_0", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "vecIn_1", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY"} , 
 	{ "Name" : "vecOut_0", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} , 
 	{ "Name" : "vecOut_1", "interface" : "memory", "bitwidth" : 8, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ vecIn_0_address0 sc_out sc_lv 6 signal 0 } 
	{ vecIn_0_ce0 sc_out sc_logic 1 signal 0 } 
	{ vecIn_0_q0 sc_in sc_lv 8 signal 0 } 
	{ vecIn_1_address0 sc_out sc_lv 6 signal 1 } 
	{ vecIn_1_ce0 sc_out sc_logic 1 signal 1 } 
	{ vecIn_1_q0 sc_in sc_lv 8 signal 1 } 
	{ vecOut_0_address0 sc_out sc_lv 6 signal 2 } 
	{ vecOut_0_ce0 sc_out sc_logic 1 signal 2 } 
	{ vecOut_0_we0 sc_out sc_logic 1 signal 2 } 
	{ vecOut_0_d0 sc_out sc_lv 8 signal 2 } 
	{ vecOut_1_address0 sc_out sc_lv 6 signal 3 } 
	{ vecOut_1_ce0 sc_out sc_logic 1 signal 3 } 
	{ vecOut_1_we0 sc_out sc_logic 1 signal 3 } 
	{ vecOut_1_d0 sc_out sc_lv 8 signal 3 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "vecIn_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "vecIn_0", "role": "address0" }} , 
 	{ "name": "vecIn_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vecIn_0", "role": "ce0" }} , 
 	{ "name": "vecIn_0_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vecIn_0", "role": "q0" }} , 
 	{ "name": "vecIn_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "vecIn_1", "role": "address0" }} , 
 	{ "name": "vecIn_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vecIn_1", "role": "ce0" }} , 
 	{ "name": "vecIn_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vecIn_1", "role": "q0" }} , 
 	{ "name": "vecOut_0_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "vecOut_0", "role": "address0" }} , 
 	{ "name": "vecOut_0_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vecOut_0", "role": "ce0" }} , 
 	{ "name": "vecOut_0_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vecOut_0", "role": "we0" }} , 
 	{ "name": "vecOut_0_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vecOut_0", "role": "d0" }} , 
 	{ "name": "vecOut_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":6, "type": "signal", "bundle":{"name": "vecOut_1", "role": "address0" }} , 
 	{ "name": "vecOut_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vecOut_1", "role": "ce0" }} , 
 	{ "name": "vecOut_1_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "vecOut_1", "role": "we0" }} , 
 	{ "name": "vecOut_1_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "vecOut_1", "role": "d0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "9", "11", "13"],
		"CDFG" : "algo",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "331", "EstimateLatencyMax" : "331",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "vecIn_0", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_algo_Pipeline_REMAINDER_LOOP_fu_50", "Port" : "vecIn_0", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "vecIn_1", "Type" : "Memory", "Direction" : "I",
				"SubConnect" : [
					{"ID" : "5", "SubInstance" : "grp_algo_Pipeline_REMAINDER_LOOP_fu_50", "Port" : "vecIn_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "vecOut_0", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_algo_Pipeline_DIVISION_LOOP_fu_74", "Port" : "vecOut_0", "Inst_start_state" : "5", "Inst_end_state" : "6"}]},
			{"Name" : "vecOut_1", "Type" : "Memory", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "13", "SubInstance" : "grp_algo_Pipeline_DIVISION_LOOP_fu_74", "Port" : "vecOut_1", "Inst_start_state" : "5", "Inst_end_state" : "6"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.a_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.b_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.c_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.d_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_REMAINDER_LOOP_fu_50", "Parent" : "0", "Child" : ["6", "7", "8"],
		"CDFG" : "algo_Pipeline_REMAINDER_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "114", "EstimateLatencyMax" : "114",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "vecIn_0", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vecIn_1", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "a", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "b", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "REMAINDER_LOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter13", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter13", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "6", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_REMAINDER_LOOP_fu_50.mux_2_1_8_1_1_U1", "Parent" : "5"},
	{"ID" : "7", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_REMAINDER_LOOP_fu_50.urem_8ns_5ns_4_12_1_U2", "Parent" : "5"},
	{"ID" : "8", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_REMAINDER_LOOP_fu_50.flow_control_loop_pipe_sequential_init_U", "Parent" : "5"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_ADD_LOOP_fu_62", "Parent" : "0", "Child" : ["10"],
		"CDFG" : "algo_Pipeline_ADD_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "102", "EstimateLatencyMax" : "102",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "a", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "c", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "ADD_LOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "10", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_ADD_LOOP_fu_62.flow_control_loop_pipe_sequential_init_U", "Parent" : "9"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_MUL2ADD1_LOOP_fu_68", "Parent" : "0", "Child" : ["12"],
		"CDFG" : "algo_Pipeline_MUL2ADD1_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "102", "EstimateLatencyMax" : "102",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "b", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "d", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "MUL2ADD1_LOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter1", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter1", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "12", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_MUL2ADD1_LOOP_fu_68.flow_control_loop_pipe_sequential_init_U", "Parent" : "11"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_DIVISION_LOOP_fu_74", "Parent" : "0", "Child" : ["14", "15"],
		"CDFG" : "algo_Pipeline_DIVISION_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "110", "EstimateLatencyMax" : "110",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "vecOut_0", "Type" : "Memory", "Direction" : "O"},
			{"Name" : "d", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "c", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "vecOut_1", "Type" : "Memory", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "DIVISION_LOOP", "PipelineType" : "UPC",
				"LoopDec" : {"FSMBitwidth" : "1", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter9", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter9", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "OneDepthLoop" : "0", "has_ap_ctrl" : "1", "has_continue" : "0"}}]},
	{"ID" : "14", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_DIVISION_LOOP_fu_74.udiv_5ns_3ns_5_9_1_U13", "Parent" : "13"},
	{"ID" : "15", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_algo_Pipeline_DIVISION_LOOP_fu_74.flow_control_loop_pipe_sequential_init_U", "Parent" : "13"}]}


set ArgLastReadFirstWriteLatency {
	algo {
		vecIn_0 {Type I LastRead 0 FirstWrite -1}
		vecIn_1 {Type I LastRead 0 FirstWrite -1}
		vecOut_0 {Type O LastRead -1 FirstWrite 9}
		vecOut_1 {Type O LastRead -1 FirstWrite 9}}
	algo_Pipeline_REMAINDER_LOOP {
		vecIn_0 {Type I LastRead 0 FirstWrite -1}
		vecIn_1 {Type I LastRead 0 FirstWrite -1}
		a {Type O LastRead -1 FirstWrite 1}
		b {Type O LastRead -1 FirstWrite 13}}
	algo_Pipeline_ADD_LOOP {
		a {Type I LastRead 0 FirstWrite -1}
		c {Type O LastRead -1 FirstWrite 1}}
	algo_Pipeline_MUL2ADD1_LOOP {
		b {Type I LastRead 0 FirstWrite -1}
		d {Type O LastRead -1 FirstWrite 1}}
	algo_Pipeline_DIVISION_LOOP {
		vecOut_0 {Type O LastRead -1 FirstWrite 9}
		d {Type I LastRead 0 FirstWrite -1}
		c {Type I LastRead 0 FirstWrite -1}
		vecOut_1 {Type O LastRead -1 FirstWrite 9}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "331", "Max" : "331"}
	, {"Name" : "Interval", "Min" : "332", "Max" : "332"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	vecIn_0 { ap_memory {  { vecIn_0_address0 mem_address 1 6 }  { vecIn_0_ce0 mem_ce 1 1 }  { vecIn_0_q0 mem_dout 0 8 } } }
	vecIn_1 { ap_memory {  { vecIn_1_address0 mem_address 1 6 }  { vecIn_1_ce0 mem_ce 1 1 }  { vecIn_1_q0 mem_dout 0 8 } } }
	vecOut_0 { ap_memory {  { vecOut_0_address0 mem_address 1 6 }  { vecOut_0_ce0 mem_ce 1 1 }  { vecOut_0_we0 mem_we 1 1 }  { vecOut_0_d0 mem_din 1 8 } } }
	vecOut_1 { ap_memory {  { vecOut_1_address0 mem_address 1 6 }  { vecOut_1_ce0 mem_ce 1 1 }  { vecOut_1_we0 mem_we 1 1 }  { vecOut_1_d0 mem_din 1 8 } } }
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
