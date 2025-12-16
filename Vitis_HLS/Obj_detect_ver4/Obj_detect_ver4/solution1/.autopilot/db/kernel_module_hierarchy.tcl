set ModuleHierarchy {[{
"Name" : "hls_object_green_classification","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_InitLoop_fu_781","ID" : "1","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "InitLoop","ID" : "2","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_223_1_VITIS_LOOP_224_2_fu_857","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_223_1_VITIS_LOOP_224_2","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_235_3_VITIS_LOOP_236_4_fu_881","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "VITIS_LOOP_235_3_VITIS_LOOP_236_4","ID" : "6","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_1_fu_895","ID" : "7","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "PASS_3_5_1","ID" : "8","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_pass_4_fu_904","ID" : "9","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "pass_4","ID" : "10","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_pass5_out_pass5_in_fu_958","ID" : "11","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "pass5_out_pass5_in","ID" : "12","Type" : "pipeline"},]},],
"SubLoops" : [
	{"Name" : "PASS_1","ID" : "13","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_25_1_fu_797","ID" : "14","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_25_1","ID" : "15","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_27_2_fu_805","ID" : "16","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_27_2","ID" : "17","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_25_11_fu_813","ID" : "18","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_25_1","ID" : "19","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_27_22_fu_822","ID" : "20","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_27_2","ID" : "21","Type" : "pipeline"},]},]},
	{"Name" : "PASS1_5_Outer","ID" : "22","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_Pass1_5_inner0_fu_830","ID" : "23","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "Pass1_5_inner0","ID" : "24","Type" : "pipeline"},]},]},
	{"Name" : "PASS2","ID" : "25","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_25_13_fu_865","ID" : "26","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_25_1","ID" : "27","Type" : "pipeline"},]},
	{"Name" : "grp_hls_object_green_classification_Pipeline_VITIS_LOOP_27_24_fu_873","ID" : "28","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "VITIS_LOOP_27_2","ID" : "29","Type" : "pipeline"},]},]},
	{"Name" : "PASS_3_5_2_out","ID" : "30","Type" : "no",
	"SubInsts" : [
	{"Name" : "grp_hls_object_green_classification_Pipeline_PASS_3_5_2_in_fu_936","ID" : "31","Type" : "sequential",
			"SubLoops" : [
			{"Name" : "PASS_3_5_2_in","ID" : "32","Type" : "pipeline"},]},]},]
}]}