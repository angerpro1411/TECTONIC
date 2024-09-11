#FPGA config file.
- [.bit] file normally is found inside "$vivado_project_name/$vivado_project_name.runs/impl_1/"
- or also "workspace/"$your_folder_project"/"$wrapper_name"/hw/ (vitis workspace).

#Processing system file
- [.elf] file normally is found inside "workspace/"$your_folder_project"/$vitis_project_name/Debug/"

#Processing system initial config file.
#config ddr,ppl,mio,clock and peripherals.
- [ps7_init.tcl] normally is found inside "workspace/"$your_folder_project"/"$wrapper_name"/hw/