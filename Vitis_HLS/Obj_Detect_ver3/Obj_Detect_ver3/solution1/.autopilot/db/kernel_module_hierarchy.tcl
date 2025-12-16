set ModuleHierarchy {[{
"Name" : "hls_object_green_classification","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_947","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "InitLoop","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_Pass3_outer_Pass3_inner_fu_990","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "Pass3_outer_Pass3_inner","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_1_fu_1006","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "PASS_3_5_1","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_1015","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "pass_4","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_1069","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "pass5_out_pass5_in","ID" : "10","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "PASS_1","ID" : "11","Type" : "no",
	"SubLoops" : [
	{"Name" : "VITIS_LOOP_24_1","ID" : "12","Type" : "no"},
	{"Name" : "VITIS_LOOP_26_2","ID" : "13","Type" : "no"},
	{"Name" : "VITIS_LOOP_24_1","ID" : "14","Type" : "no"},
	{"Name" : "VITIS_LOOP_26_2","ID" : "15","Type" : "no"},]},
	{"Name" : "PASS1_5_Outer","ID" : "16","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_963","ID" : "17","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Pass1_5_inner0","ID" : "18","Type" : "pipeline"},]},]},
	{"Name" : "PASS2","ID" : "19","Type" : "no",
	"SubLoops" : [
	{"Name" : "VITIS_LOOP_24_1","ID" : "20","Type" : "no"},
	{"Name" : "VITIS_LOOP_26_2","ID" : "21","Type" : "no"},]},
	{"Name" : "PASS_3_5_2_out","ID" : "22","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_1047","ID" : "23","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "PASS_3_5_2_in","ID" : "24","Type" : "pipeline"},]},]},]
}]}