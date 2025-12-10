# =====================================================
# USER Settings
# =====================================================
set proj_name 		obj_detect_tcl
set ws_dir		./workspace
set hw_xsa_name		Obj_Detect
set hw_xsa		./Obj_Detect/Obj_Detect.xsa
set platform_name	Obj_Detect_platform
set domain_name		ps7_domain
set app_name		obj_detect_app
set drive_dir		./drivers

# =====================================================
# Start XSCT
# =====================================================
puts " ==== Starting Vitis XSCT ==== "

# Check if XSA exists
if {![file exists $hw_xsa]} {
	puts "Not found XSA file: $hw_xsa"
	exit 1
}

# Choose workspace
setws $ws_dir
puts "Workspace: $ws_dir"

# Check if folder exists, delete permanently old project
if {[file exists ${ws_dir}]} {
	puts "INFO: Project directory already exists. Deleting permanently it"
	file delete -force ${ws_dir}
}

# CREATE HARDWARE PLATFORM FROM XSA

## Remove old platform if exists
catch {platform remove $platform_name}

platform create \
	-name $platform_name \
	-hw $hw_xsa \
	-proc ps7_cortexa9_0 \
	-os standalone \
	-out $ws_dir

# Create domain (STANDALONE)
domain create \
	-name $domain_name \
	-os standalone \
	-proc ps7_cortexa9_0

domain active $domain_name
platform generate

# Create Application
app create \
	-name $app_name \
	-platform $platform_name \
	-domain $domain_name \
	-template "Empty Application"

# Import sources C,H files
importsources \
	-name $app_name \
	-path $drive_dir


# BUILD APPLICATION
app build -name $app_name

# CONNECT 2 HARDWARE
connect

targets -set -filter {name =~ "APU*"}
rst -system

# PROGRAM FPGA WITH .BIT INSIDE FPGA
set bit_file "$ws_dir/$platform_name/hw/$hw_xsa_name.bit"
fpga -file $bit_file

# Select processor
targets -set -filter {name =~ "*Cortex-A9*#0"}
stop

# Init PS7
source $ws_dir/$platform_name/hw/ps7_init.tcl
ps7_init
ps7_post_config


# Reset and download
rst -processor
dow $ws_dir/$app_name/Debug/${app_name}.elf

# Run application
con

exit
