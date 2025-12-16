set moduleName ContourApproximation_Pipeline_CHECK_DIFFER_LOOP
set isTopModule 0
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
set C_modelName {ContourApproximation_Pipeline_CHECK_DIFFER_LOOP}
set C_modelType { int 1 }
set C_modelArgList {
	{ p int 64 regular {array 250 { 1 1 } 1 1 }  }
	{ sext_ln75 int 17 regular  }
	{ nb_pts_reduce_out int 16 regular {pointer 1}  }
	{ nb_pts_reduce_1_out int 16 regular {pointer 1}  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "p", "interface" : "memory", "bitwidth" : 64, "direction" : "READONLY"} , 
 	{ "Name" : "sext_ln75", "interface" : "wire", "bitwidth" : 17, "direction" : "READONLY"} , 
 	{ "Name" : "nb_pts_reduce_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "nb_pts_reduce_1_out", "interface" : "wire", "bitwidth" : 16, "direction" : "WRITEONLY"} , 
 	{ "Name" : "ap_return", "interface" : "wire", "bitwidth" : 1} ]}
# RTL Port declarations: 
set portNum 28
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ p_address0 sc_out sc_lv 8 signal 0 } 
	{ p_ce0 sc_out sc_logic 1 signal 0 } 
	{ p_q0 sc_in sc_lv 64 signal 0 } 
	{ p_address1 sc_out sc_lv 8 signal 0 } 
	{ p_ce1 sc_out sc_logic 1 signal 0 } 
	{ p_q1 sc_in sc_lv 64 signal 0 } 
	{ sext_ln75 sc_in sc_lv 17 signal 1 } 
	{ nb_pts_reduce_out sc_out sc_lv 16 signal 2 } 
	{ nb_pts_reduce_out_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ nb_pts_reduce_1_out sc_out sc_lv 16 signal 3 } 
	{ nb_pts_reduce_1_out_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ ap_return sc_out sc_lv 1 signal -1 } 
	{ grp_fu_21023_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_21023_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_21023_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_21023_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_21023_p_ce sc_out sc_logic 1 signal -1 } 
	{ grp_fu_42943_p_din0 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_42943_p_din1 sc_out sc_lv 32 signal -1 } 
	{ grp_fu_42943_p_opcode sc_out sc_lv 5 signal -1 } 
	{ grp_fu_42943_p_dout0 sc_in sc_lv 1 signal -1 } 
	{ grp_fu_42943_p_ce sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "p_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p", "role": "address0" }} , 
 	{ "name": "p_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p", "role": "ce0" }} , 
 	{ "name": "p_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p", "role": "q0" }} , 
 	{ "name": "p_address1", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "p", "role": "address1" }} , 
 	{ "name": "p_ce1", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p", "role": "ce1" }} , 
 	{ "name": "p_q1", "direction": "in", "datatype": "sc_lv", "bitwidth":64, "type": "signal", "bundle":{"name": "p", "role": "q1" }} , 
 	{ "name": "sext_ln75", "direction": "in", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "sext_ln75", "role": "default" }} , 
 	{ "name": "nb_pts_reduce_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "nb_pts_reduce_out", "role": "default" }} , 
 	{ "name": "nb_pts_reduce_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "nb_pts_reduce_out", "role": "ap_vld" }} , 
 	{ "name": "nb_pts_reduce_1_out", "direction": "out", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "nb_pts_reduce_1_out", "role": "default" }} , 
 	{ "name": "nb_pts_reduce_1_out_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "nb_pts_reduce_1_out", "role": "ap_vld" }} , 
 	{ "name": "ap_return", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_return", "role": "default" }} , 
 	{ "name": "grp_fu_21023_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_21023_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_21023_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_21023_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_21023_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_21023_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_21023_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_21023_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_21023_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_21023_p_ce", "role": "default" }} , 
 	{ "name": "grp_fu_42943_p_din0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_42943_p_din0", "role": "default" }} , 
 	{ "name": "grp_fu_42943_p_din1", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "grp_fu_42943_p_din1", "role": "default" }} , 
 	{ "name": "grp_fu_42943_p_opcode", "direction": "out", "datatype": "sc_lv", "bitwidth":5, "type": "signal", "bundle":{"name": "grp_fu_42943_p_opcode", "role": "default" }} , 
 	{ "name": "grp_fu_42943_p_dout0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_42943_p_dout0", "role": "default" }} , 
 	{ "name": "grp_fu_42943_p_ce", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "grp_fu_42943_p_ce", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "",
		"CDFG" : "ContourApproximation_Pipeline_CHECK_DIFFER_LOOP",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "4", "EstimateLatencyMax" : "255",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "p", "Type" : "Memory", "Direction" : "I"},
			{"Name" : "sext_ln75", "Type" : "None", "Direction" : "I"},
			{"Name" : "nb_pts_reduce_out", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "nb_pts_reduce_1_out", "Type" : "Vld", "Direction" : "O"}],
		"Loop" : [
			{"Name" : "CHECK_DIFFER_LOOP", "PipelineType" : "pipeline",
				"LoopDec" : {"FSMBitwidth" : "4", "FirstState" : "ap_ST_fsm_pp0_stage0", "FirstStateIter" : "ap_enable_reg_pp0_iter0", "FirstStateBlock" : "ap_block_pp0_stage0_subdone", "LastState" : "ap_ST_fsm_pp0_stage0", "LastStateIter" : "ap_enable_reg_pp0_iter2", "LastStateBlock" : "ap_block_pp0_stage0_subdone", "PreState" : ["ap_ST_fsm_state1"], "QuitState" : "ap_ST_fsm_pp0_stage0", "QuitStateIter" : "ap_enable_reg_pp0_iter2", "QuitStateBlock" : "ap_block_pp0_stage0_subdone", "PostState" : ["ap_ST_fsm_state5", "ap_ST_fsm_state6"]}}]}]}


set ArgLastReadFirstWriteLatency {
	ContourApproximation_Pipeline_CHECK_DIFFER_LOOP {
		p {Type I LastRead 2 FirstWrite -1}
		sext_ln75 {Type I LastRead 0 FirstWrite -1}
		nb_pts_reduce_out {Type O LastRead -1 FirstWrite 2}
		nb_pts_reduce_1_out {Type O LastRead -1 FirstWrite 4}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "4", "Max" : "255"}
	, {"Name" : "Interval", "Min" : "4", "Max" : "255"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	p { ap_memory {  { p_address0 mem_address 1 8 }  { p_ce0 mem_ce 1 1 }  { p_q0 in_data 0 64 }  { p_address1 MemPortADDR2 1 8 }  { p_ce1 MemPortCE2 1 1 }  { p_q1 in_data 0 64 } } }
	sext_ln75 { ap_none {  { sext_ln75 in_data 0 17 } } }
	nb_pts_reduce_out { ap_vld {  { nb_pts_reduce_out out_data 1 16 }  { nb_pts_reduce_out_ap_vld out_vld 1 1 } } }
	nb_pts_reduce_1_out { ap_vld {  { nb_pts_reduce_1_out out_data 1 16 }  { nb_pts_reduce_1_out_ap_vld out_vld 1 1 } } }
}
