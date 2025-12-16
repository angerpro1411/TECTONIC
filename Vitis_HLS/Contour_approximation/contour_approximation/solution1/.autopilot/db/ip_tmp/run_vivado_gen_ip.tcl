create_project prj -part xc7z020-clg484-1 -force
set_property target_language vhdl [current_project]
set vivado_ver [version -short]
set COE_DIR "../../syn/vhdl"
source "/home/dell3561-49/Vitis_HLS_folder/Contour_approximation/contour_approximation/solution1/syn/vhdl/ContourApproximation_fmul_32ns_32ns_32_4_max_dsp_1_ip.tcl"
source "/home/dell3561-49/Vitis_HLS_folder/Contour_approximation/contour_approximation/solution1/syn/vhdl/ContourApproximation_fdiv_32ns_32ns_32_12_no_dsp_1_ip.tcl"
source "/home/dell3561-49/Vitis_HLS_folder/Contour_approximation/contour_approximation/solution1/syn/vhdl/ContourApproximation_fadd_32ns_32ns_32_5_full_dsp_1_ip.tcl"
source "/home/dell3561-49/Vitis_HLS_folder/Contour_approximation/contour_approximation/solution1/syn/vhdl/ContourApproximation_fcmp_32ns_32ns_1_2_no_dsp_1_ip.tcl"
source "/home/dell3561-49/Vitis_HLS_folder/Contour_approximation/contour_approximation/solution1/syn/vhdl/ContourApproximation_fsub_32ns_32ns_32_5_full_dsp_1_ip.tcl"
