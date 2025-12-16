set ModuleHierarchy {[{
"Name" : "hls_object_green_classification","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_789","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "InitLoop","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_525_1_VITIS_LOOP_526_2_fu_865","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_525_1_VITIS_LOOP_526_2","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_537_3_VITIS_LOOP_538_4_fu_889","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_537_3_VITIS_LOOP_538_4","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_1_fu_903","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "PASS_3_5_1","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_912","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "pass_4","ID" : "10","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_592_5_fu_966","ID" : "11","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_592_5","ID" : "12","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_983","ID" : "13","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "pass5_out_pass5_in","ID" : "14","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_626_6_fu_1029","ID" : "15","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_626_6","ID" : "16","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "PASS_1","ID" : "17","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_349_1_fu_805","ID" : "18","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_349_1","ID" : "19","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_351_2_fu_813","ID" : "20","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_351_2","ID" : "21","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_349_11_fu_821","ID" : "22","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_349_1","ID" : "23","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_351_22_fu_830","ID" : "24","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_351_2","ID" : "25","Type" : "pipeline"},]},]},
	{"Name" : "PASS1_5_Outer","ID" : "26","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_838","ID" : "27","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Pass1_5_inner0","ID" : "28","Type" : "pipeline"},]},]},
	{"Name" : "PASS2","ID" : "29","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_349_13_fu_873","ID" : "30","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_349_1","ID" : "31","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_351_24_fu_881","ID" : "32","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_351_2","ID" : "33","Type" : "pipeline"},]},]},
	{"Name" : "PASS_3_5_2_out","ID" : "34","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_944","ID" : "35","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "PASS_3_5_2_in","ID" : "36","Type" : "pipeline"},]},]},]
}]}