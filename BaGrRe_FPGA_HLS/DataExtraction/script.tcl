# Number of arguments
puts "Argument numbers : $argc"

# Check condition, do not accept more than one argument
if {$argc != 1} {
    puts "Zero argument or more than one argument. Invalid !!"
    exit 1
}

# Set main argument
# Get file name
set filename [lindex $argv 0]

# Run C program
exec ./a.out $filename

#print the result
puts "Your output pixel data is in file named data.h"
