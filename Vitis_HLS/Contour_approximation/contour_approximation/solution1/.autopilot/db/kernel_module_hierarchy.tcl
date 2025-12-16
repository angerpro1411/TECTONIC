set ModuleHierarchy {[{
"Name" : "ContourApproximation","ID" : "0","Type" : "sequential",
"SubInsts" : [
	{"Name" : "grp_LinearLine_fu_19741","ID" : "1","Type" : "sequential"},
	{"Name" : "grp_Distance_Point_Line_Square_fu_19747","ID" : "2","Type" : "sequential"},
	{"Name" : "grp_ContourApproximation_Pipeline_CHECK_DIFFER_LOOP_fu_20499","ID" : "3","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "CHECK_DIFFER_LOOP","ID" : "4","Type" : "pipeline"},]},
	{"Name" : "grp_ContourApproximation_Pipeline_WRITE_BACK_fu_20508","ID" : "5","Type" : "sequential",
		"SubLoops" : [
		{"Name" : "WRITE_BACK","ID" : "6","Type" : "pipeline"},]},]
}]}