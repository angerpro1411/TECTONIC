#!/bin/bash

# Call settings64 Vivado through source, change it depends on version
# and the folder that you installed Vivado.
source /tools/Xilinx/Vivado/2023.1/settings64.sh

# Call Vivado
vivado -nojournal -nolog -mode batch -source Obj_Detect_vivado.tcl

# Exit
exit
