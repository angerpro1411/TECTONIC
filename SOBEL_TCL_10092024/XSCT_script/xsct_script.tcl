#ALL STEPS were running and HIDing under VITIS
# Following operations will be performed before launching the debugger.
# 1. Resets entire system. Clears the FPGA fabric (PL).
# 2. Program FPGA fabric (PL) using the bit file (/home/dell3561-49/workspace/13.SOBEL_END/SOBEL_END/_ide/bitstream/design_1_wrapper.bit).
# 3. Sources the init tcl file (/home/dell3561-49/workspace/13.SOBEL_END/SOBEL_END/_ide/psinit/ps7_init.tcl).
# 4. Runs ps7_init to initialize PS.
# 5. Runs ps7_post_config. Enables level shifters from PL to PS. (Recommended to use this option only after system reset or board power ON).
# 6. All processors in the system will be suspended, and Applications will be downloaded to the following processors as specified in the Applications tab.
# 	1) ps7_cortexa9_0 (/home/dell3561-49/workspace/13.SOBEL_END/SOBEL_END/Debug/SOBEL_END.elf)

puts "Note: If any problem happens, just check if where is your xsct command line at?\n \
      Your xsct command line needs to work at your directory who stores all files needed."

#step 1: connect computer - jtag inside fpga board
connect

#step 2: download bitstream file to fpga
fpga design_1_wrapper.bit

#step 3: choose target to work with
    #3.1 : see all targets (Zedboard normally has 4 target) 2 and 3 are Arm processors.
    targets
    #3.2 : choose target, after that our target will get * next to its target number.
    target 2

#step 4: running ps7 init
source ps7_init.tcl

    #4.1: init ps7(initializing different parts of PS)
    ps7_init
    #4.2: post config ps7
    ps7_post_config

#step 5: download elf file(C file and all configs) to processor(target 2)    
dow SOBEL_END.elf

#step 6: after downloading C file, processor will stop, if we want to run it. 
#Use "con"(continue) command.
con