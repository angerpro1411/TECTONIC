set ModuleHierarchy {[{
"Name" : "hls_object_green_classification","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_793","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "InitLoop","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_206_1_VITIS_LOOP_207_2_fu_871","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_206_1_VITIS_LOOP_207_2","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_218_3_VITIS_LOOP_219_4_fu_895","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_218_3_VITIS_LOOP_219_4","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_1_fu_911","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "PASS_3_5_1","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_920","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "pass_4","ID" : "10","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_276_5_fu_976","ID" : "11","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_276_5","ID" : "12","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_993","ID" : "13","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "pass5_out_pass5_in","ID" : "14","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_311_6_fu_1041","ID" : "15","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_311_6","ID" : "16","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "PASS_1","ID" : "17","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_1_fu_811","ID" : "18","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_26_1","ID" : "19","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_2_fu_819","ID" : "20","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_28_2","ID" : "21","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_11_fu_827","ID" : "22","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_26_1","ID" : "23","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_22_fu_836","ID" : "24","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_28_2","ID" : "25","Type" : "pipeline"},]},]},
	{"Name" : "PASS1_5_Outer","ID" : "26","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_844","ID" : "27","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Pass1_5_inner0","ID" : "28","Type" : "pipeline"},]},]},
	{"Name" : "PASS2","ID" : "29","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_26_13_fu_879","ID" : "30","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_26_1","ID" : "31","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_28_24_fu_887","ID" : "32","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_28_2","ID" : "33","Type" : "pipeline"},]},]},
	{"Name" : "PASS_3_5_2_out","ID" : "34","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_954","ID" : "35","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "PASS_3_5_2_in","ID" : "36","Type" : "pipeline"},]},]},]
}]}