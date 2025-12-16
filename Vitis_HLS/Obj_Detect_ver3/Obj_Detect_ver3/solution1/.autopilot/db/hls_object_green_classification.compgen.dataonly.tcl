# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_CTRL {
object_count { 
	dir O
	width 16
	depth 1
	mode ap_vld
	offset 16
	offset_end 23
}
obj_is_green { 
	dir O
	width 1
	depth 32
	mode ap_memory
	offset 32
	offset_end 63
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
obj_x { 
	dir O
	width 16
	depth 32
	mode ap_memory
	offset 64
	offset_end 127
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
obj_y { 
	dir O
	width 16
	depth 32
	mode ap_memory
	offset 128
	offset_end 191
	core_op ram_1p
	core_impl auto
	core_latency 1
	byte_write 0
}
}
dict set axilite_register_dict CTRL $port_CTRL


