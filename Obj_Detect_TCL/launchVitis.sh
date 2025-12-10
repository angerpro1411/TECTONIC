#!/bin/bash 

# Argument numbers
echo "Argument numbers : $#"

# Check argument numbers
if [ $# -eq 0 ]; then
	echo "No argument detected, the program will use the available data !"
elif [ $# -ne 1 ]; then
	echo "Argument is bigger than 1, can not work normally"
	exit 1
else
	# Extract data from image file
	filename="$1"

	# Check if file exists and a .bmp file
	if [ ! -f "$filename" ]; then
		echo "!!!ERROR: File '$filename' doesn't exist."
		exit 1
	fi

	if [[ "$filename" != *.bmp ]]; then
		echo "!!!ERROR: File must be a .bmp image."
		exit 1
	fi

	# Run the program to extract data
	./a.out "$filename"

	# Copy to drivers
	cp data.h ./drivers/
fi



# Call settings64 Vitis, change if your absolute link to Vitis isn't the same
source /tools/Xilinx/Vitis/2023.1/settings64.sh

#xsct is tcl interface of Vitis
xsct Obj_Detect_Vitis.tcl

#exit the design
exit
