set moduleName hls_object_green_classification_Pipeline_pass5_out_pass5_in
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
set C_modelName {hls_object_green_classification_Pipeline_pass5_out_pass5_in}
set C_modelType { void 0 }
set C_modelArgList {
	{ out_stream_V_data_V int 24 regular {axi_s 1 volatile  { out_stream Data } }  }
	{ out_stream_V_keep_V int 3 regular {axi_s 1 volatile  { out_stream Keep } }  }
	{ out_stream_V_strb_V int 3 regular {axi_s 1 volatile  { out_stream Strb } }  }
	{ out_stream_V_user_V int 1 regular {axi_s 1 volatile  { out_stream User } }  }
	{ out_stream_V_last_V int 1 regular {axi_s 1 volatile  { out_stream Last } }  }
	{ out_stream_V_id_V int 1 regular {axi_s 1 volatile  { out_stream ID } }  }
	{ out_stream_V_dest_V int 1 regular {axi_s 1 volatile  { out_stream Dest } }  }
	{ imgR int 8 regular {array 76800 { 1 3 } 1 1 } {global 0}  }
	{ imgG int 8 regular {array 76800 { 1 3 } 1 1 } {global 0}  }
	{ imgB int 8 regular {array 76800 { 1 3 } 1 1 } {global 0}  }
	{ label_map int 16 regular {array 76800 { 1 3 } 1 1 } {global 0}  }
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8 int 1 regular {array 8560 { 1 3 } 1 1 } {global 0}  }
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7 int 1 regular {array 8560 { 1 3 } 1 1 } {global 0}  }
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6 int 1 regular {array 8560 { 1 3 } 1 1 } {global 0}  }
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5 int 1 regular {array 8560 { 1 3 } 1 1 } {global 0}  }
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4 int 1 regular {array 8560 { 1 3 } 1 1 } {global 0}  }
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3 int 1 regular {array 8560 { 1 3 } 1 1 } {global 0}  }
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2 int 1 regular {array 8560 { 1 3 } 1 1 } {global 0}  }
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1 int 1 regular {array 8560 { 1 3 } 1 1 } {global 0}  }
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm int 1 regular {array 8560 { 1 3 } 1 1 } {global 0}  }
	{ pixel_count int 16 regular {array 512 { 1 3 } 1 1 } {global 0}  }
	{ center_is_green int 1 regular {array 512 { 1 3 } 1 1 } {global 0}  }
}
set hasAXIMCache 0
set C_modelArgMapList {[ 
	{ "Name" : "out_stream_V_data_V", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_keep_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_strb_V", "interface" : "axis", "bitwidth" : 3, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_id_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "out_stream_V_dest_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "imgR", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "imgG", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "imgB", "interface" : "memory", "bitwidth" : 8, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "label_map", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "pixel_count", "interface" : "memory", "bitwidth" : 16, "direction" : "READONLY", "extern" : 0} , 
 	{ "Name" : "center_is_green", "interface" : "memory", "bitwidth" : 1, "direction" : "READONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 60
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ out_stream_TREADY sc_in sc_logic 1 outacc 0 } 
	{ out_stream_TDATA sc_out sc_lv 24 signal 0 } 
	{ out_stream_TVALID sc_out sc_logic 1 outvld 6 } 
	{ out_stream_TKEEP sc_out sc_lv 3 signal 1 } 
	{ out_stream_TSTRB sc_out sc_lv 3 signal 2 } 
	{ out_stream_TUSER sc_out sc_lv 1 signal 3 } 
	{ out_stream_TLAST sc_out sc_lv 1 signal 4 } 
	{ out_stream_TID sc_out sc_lv 1 signal 5 } 
	{ out_stream_TDEST sc_out sc_lv 1 signal 6 } 
	{ imgR_address0 sc_out sc_lv 17 signal 7 } 
	{ imgR_ce0 sc_out sc_logic 1 signal 7 } 
	{ imgR_q0 sc_in sc_lv 8 signal 7 } 
	{ imgG_address0 sc_out sc_lv 17 signal 8 } 
	{ imgG_ce0 sc_out sc_logic 1 signal 8 } 
	{ imgG_q0 sc_in sc_lv 8 signal 8 } 
	{ imgB_address0 sc_out sc_lv 17 signal 9 } 
	{ imgB_ce0 sc_out sc_logic 1 signal 9 } 
	{ imgB_q0 sc_in sc_lv 8 signal 9 } 
	{ label_map_address0 sc_out sc_lv 17 signal 10 } 
	{ label_map_ce0 sc_out sc_logic 1 signal 10 } 
	{ label_map_q0 sc_in sc_lv 16 signal 10 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_address0 sc_out sc_lv 14 signal 11 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_ce0 sc_out sc_logic 1 signal 11 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_q0 sc_in sc_lv 1 signal 11 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_address0 sc_out sc_lv 14 signal 12 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_ce0 sc_out sc_logic 1 signal 12 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_q0 sc_in sc_lv 1 signal 12 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_address0 sc_out sc_lv 14 signal 13 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_ce0 sc_out sc_logic 1 signal 13 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_q0 sc_in sc_lv 1 signal 13 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_address0 sc_out sc_lv 14 signal 14 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_ce0 sc_out sc_logic 1 signal 14 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_q0 sc_in sc_lv 1 signal 14 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_address0 sc_out sc_lv 14 signal 15 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_ce0 sc_out sc_logic 1 signal 15 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_q0 sc_in sc_lv 1 signal 15 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_address0 sc_out sc_lv 14 signal 16 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_ce0 sc_out sc_logic 1 signal 16 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_q0 sc_in sc_lv 1 signal 16 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_address0 sc_out sc_lv 14 signal 17 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_ce0 sc_out sc_logic 1 signal 17 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_q0 sc_in sc_lv 1 signal 17 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_address0 sc_out sc_lv 14 signal 18 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_ce0 sc_out sc_logic 1 signal 18 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_q0 sc_in sc_lv 1 signal 18 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_address0 sc_out sc_lv 14 signal 19 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_ce0 sc_out sc_logic 1 signal 19 } 
	{ p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_q0 sc_in sc_lv 1 signal 19 } 
	{ pixel_count_address0 sc_out sc_lv 9 signal 20 } 
	{ pixel_count_ce0 sc_out sc_logic 1 signal 20 } 
	{ pixel_count_q0 sc_in sc_lv 16 signal 20 } 
	{ center_is_green_address0 sc_out sc_lv 9 signal 21 } 
	{ center_is_green_ce0 sc_out sc_logic 1 signal 21 } 
	{ center_is_green_q0 sc_in sc_lv 1 signal 21 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "out_stream_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "out_stream_V_data_V", "role": "default" }} , 
 	{ "name": "out_stream_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "out_stream_V_data_V", "role": "default" }} , 
 	{ "name": "out_stream_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "out_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "out_stream_TKEEP", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_stream_V_keep_V", "role": "default" }} , 
 	{ "name": "out_stream_TSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "out_stream_V_strb_V", "role": "default" }} , 
 	{ "name": "out_stream_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_user_V", "role": "default" }} , 
 	{ "name": "out_stream_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_last_V", "role": "default" }} , 
 	{ "name": "out_stream_TID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_id_V", "role": "default" }} , 
 	{ "name": "out_stream_TDEST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "out_stream_V_dest_V", "role": "default" }} , 
 	{ "name": "imgR_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "imgR", "role": "address0" }} , 
 	{ "name": "imgR_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgR", "role": "ce0" }} , 
 	{ "name": "imgR_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "imgR", "role": "q0" }} , 
 	{ "name": "imgG_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "imgG", "role": "address0" }} , 
 	{ "name": "imgG_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgG", "role": "ce0" }} , 
 	{ "name": "imgG_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "imgG", "role": "q0" }} , 
 	{ "name": "imgB_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "imgB", "role": "address0" }} , 
 	{ "name": "imgB_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "imgB", "role": "ce0" }} , 
 	{ "name": "imgB_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "imgB", "role": "q0" }} , 
 	{ "name": "label_map_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":17, "type": "signal", "bundle":{"name": "label_map", "role": "address0" }} , 
 	{ "name": "label_map_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "label_map", "role": "ce0" }} , 
 	{ "name": "label_map_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "label_map", "role": "q0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8", "role": "address0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8", "role": "ce0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8", "role": "q0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7", "role": "address0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7", "role": "ce0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7", "role": "q0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6", "role": "address0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6", "role": "ce0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6", "role": "q0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5", "role": "address0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5", "role": "ce0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5", "role": "q0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4", "role": "address0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4", "role": "ce0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4", "role": "q0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3", "role": "address0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3", "role": "ce0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3", "role": "q0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2", "role": "address0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2", "role": "ce0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2", "role": "q0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1", "role": "address0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1", "role": "ce0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1", "role": "q0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":14, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm", "role": "address0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm", "role": "ce0" }} , 
 	{ "name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm", "role": "q0" }} , 
 	{ "name": "pixel_count_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "pixel_count", "role": "address0" }} , 
 	{ "name": "pixel_count_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "pixel_count", "role": "ce0" }} , 
 	{ "name": "pixel_count_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":16, "type": "signal", "bundle":{"name": "pixel_count", "role": "q0" }} , 
 	{ "name": "center_is_green_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":9, "type": "signal", "bundle":{"name": "center_is_green", "role": "address0" }} , 
 	{ "name": "center_is_green_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "center_is_green", "role": "ce0" }} , 
 	{ "name": "center_is_green_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "center_is_green", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_9ns_3ns_2_13_1_U126", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.urem_8ns_3ns_2_12_1_U127", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_8ns_10ns_17_1_1_U128", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mul_9ns_11ns_19_1_1_U129", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_1_1_1_U130", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_1_1_1_U131", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_1_1_1_U132", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mux_3_2_1_1_1_U133", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.mac_muladd_7ns_7ns_8ns_14_4_1_U134", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.flow_control_loop_pipe_sequential_init_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
		center_is_green {Type I LastRead 13 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "76814", "Max" : "76814"}
	, {"Name" : "Interval", "Min" : "76814", "Max" : "76814"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	out_stream_V_data_V { axis {  { out_stream_TREADY out_acc 0 1 }  { out_stream_TDATA out_data 1 24 } } }
	out_stream_V_keep_V { axis {  { out_stream_TKEEP out_data 1 3 } } }
	out_stream_V_strb_V { axis {  { out_stream_TSTRB out_data 1 3 } } }
	out_stream_V_user_V { axis {  { out_stream_TUSER out_data 1 1 } } }
	out_stream_V_last_V { axis {  { out_stream_TLAST out_data 1 1 } } }
	out_stream_V_id_V { axis {  { out_stream_TID out_data 1 1 } } }
	out_stream_V_dest_V { axis {  { out_stream_TVALID out_vld 1 1 }  { out_stream_TDEST out_data 1 1 } } }
	imgR { ap_memory {  { imgR_address0 mem_address 1 17 }  { imgR_ce0 mem_ce 1 1 }  { imgR_q0 in_data 0 8 } } }
	imgG { ap_memory {  { imgG_address0 mem_address 1 17 }  { imgG_ce0 mem_ce 1 1 }  { imgG_q0 in_data 0 8 } } }
	imgB { ap_memory {  { imgB_address0 mem_address 1 17 }  { imgB_ce0 mem_ce 1 1 }  { imgB_q0 in_data 0 8 } } }
	label_map { ap_memory {  { label_map_address0 mem_address 1 17 }  { label_map_ce0 mem_ce 1 1 }  { label_map_q0 in_data 0 16 } } }
	p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8 { ap_memory {  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_address0 mem_address 1 14 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_ce0 mem_ce 1 1 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_q0 in_data 0 1 } } }
	p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7 { ap_memory {  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_address0 mem_address 1 14 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_ce0 mem_ce 1 1 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_q0 in_data 0 1 } } }
	p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6 { ap_memory {  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_address0 mem_address 1 14 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_ce0 mem_ce 1 1 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_q0 in_data 0 1 } } }
	p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5 { ap_memory {  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_address0 mem_address 1 14 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_ce0 mem_ce 1 1 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_q0 in_data 0 1 } } }
	p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4 { ap_memory {  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_address0 mem_address 1 14 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_ce0 mem_ce 1 1 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_q0 in_data 0 1 } } }
	p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3 { ap_memory {  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_address0 mem_address 1 14 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_ce0 mem_ce 1 1 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_q0 in_data 0 1 } } }
	p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2 { ap_memory {  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_address0 mem_address 1 14 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_ce0 mem_ce 1 1 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_q0 in_data 0 1 } } }
	p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1 { ap_memory {  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_address0 mem_address 1 14 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_ce0 mem_ce 1 1 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_q0 in_data 0 1 } } }
	p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm { ap_memory {  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_address0 mem_address 1 14 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_ce0 mem_ce 1 1 }  { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_q0 in_data 0 1 } } }
	pixel_count { ap_memory {  { pixel_count_address0 mem_address 1 9 }  { pixel_count_ce0 mem_ce 1 1 }  { pixel_count_q0 in_data 0 16 } } }
	center_is_green { ap_memory {  { center_is_green_address0 mem_address 1 9 }  { center_is_green_ce0 mem_ce 1 1 }  { center_is_green_q0 in_data 0 1 } } }
}
