set_param project.enableReportConfiguration 0
load_feature core
current_fileset
xsim {algo} -view {{algo_dataflow_ana.wcfg}} -tclbatch {algo.tcl} -protoinst {algo.protoinst}
