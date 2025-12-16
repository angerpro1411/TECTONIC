# This script segment is generated automatically by AutoPilot

set name BackGrRemoval_stream_v2_sdiv_16ns_9ns_16_20_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {sdiv} IMPL {auto} LATENCY 19 ALLOW_PRAGMA 1
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler BackGrRemoval_stream_v2_BackGrRemoval_stream_v2_Pipeline_VITIS_LOOP_84_1_BackGrRemoval_stream_v2_strebkb BINDTYPE {storage} TYPE {ram_1p} IMPL {bram} LATENCY 2 ALLOW_PRAGMA 1
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 121 \
    name out_stream_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TDATA { O 24 vector } out_stream_TREADY { I 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 122 \
    name out_stream_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TKEEP { O 3 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 123 \
    name out_stream_V_strb_V \
    reset_level 1 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TSTRB { O 3 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 124 \
    name out_stream_V_user_V \
    reset_level 1 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TUSER { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_user_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 125 \
    name out_stream_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TLAST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_last_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 126 \
    name out_stream_V_id_V \
    reset_level 1 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TID { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_id_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 127 \
    name out_stream_V_dest_V \
    reset_level 1 \
    sync_rst true \
    corename {out_stream} \
    metadata {  } \
    op interface \
    ports { out_stream_TVALID { O 1 bit } out_stream_TDEST { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'out_stream_V_dest_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 129 \
    name in_stream_V_data_V \
    reset_level 1 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TDATA { I 24 vector } in_stream_TVALID { I 1 bit } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_data_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 130 \
    name in_stream_V_keep_V \
    reset_level 1 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TKEEP { I 3 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_keep_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 131 \
    name in_stream_V_strb_V \
    reset_level 1 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TSTRB { I 3 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_strb_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 132 \
    name in_stream_V_user_V \
    reset_level 1 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TUSER { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_user_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 133 \
    name in_stream_V_last_V \
    reset_level 1 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TLAST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_last_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 134 \
    name in_stream_V_id_V \
    reset_level 1 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TID { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_id_V'"
}
}


# Native AXIS:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::native_axis_add] == "::AESL_LIB_XILADAPTER::native_axis_add"} {
eval "::AESL_LIB_XILADAPTER::native_axis_add { \
    id 135 \
    name in_stream_V_dest_V \
    reset_level 1 \
    sync_rst true \
    corename {in_stream} \
    metadata {  } \
    op interface \
    ports { in_stream_TREADY { O 1 bit } in_stream_TDEST { I 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'in_stream_V_dest_V'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_219 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_219 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_219 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_218 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_218 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_218 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_217 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_217 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_217 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_216 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_216 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_216 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_215 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_215 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_215 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_214 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_214 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_214 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_213 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_213 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_213 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_212 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_212 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_212 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_211 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_211 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_211 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_210 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_210 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_210 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_209 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_209 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_209 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_208 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_208 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_208 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_207 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_207 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_207 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 19 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_206 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_206 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_206 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 20 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_205 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_205 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_205 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 21 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_204 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_204 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_204 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 22 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_203 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_203 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_203 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 23 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_202 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_202 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_202 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 24 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_201 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_201 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_201 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 25 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_200 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_200 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_200 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 26 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_199 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_199 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_199 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 27 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_198 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_198 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_198 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 28 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_197 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_197 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_197 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 29 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_196 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_196 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_196 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 30 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_195 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_195 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_195 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 31 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_194 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_194 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_194 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 32 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_193 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_193 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_193 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_192 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_192 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_192 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_191 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_191 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_191 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 35 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_190 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_190 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_190 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 36 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_189 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_189 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_189 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 37 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_188 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_188 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_188 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 38 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_187 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_187 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_187 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 39 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_186 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_186 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_186 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 40 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_185 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_185 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_185 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 41 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_184 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_184 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_184 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 42 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_183 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_183 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_183 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 43 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_182 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_182 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_182 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 44 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_181 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_181 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_181 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 45 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_180 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_180 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_180 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 46 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_179 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_179 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_179 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 47 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_178 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_178 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_178 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 48 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_177 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_177 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_177 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 49 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_176 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_176 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_176 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 50 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_175 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_175 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_175 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 51 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_174 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_174 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_174 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 52 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_173 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_173 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_173 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 53 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_172 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_172 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_172 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 54 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_171 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_171 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_171 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 55 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_170 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_170 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_170 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 56 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_169 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_169 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_169 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 57 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_168 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_168 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_168 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 58 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_167 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_167 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_167 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_166 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_166 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_166 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_165 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_165 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_165 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_164 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_164 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_164 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_163 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_163 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_163 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_162 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_162 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_162 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 64 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_161 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_161 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_161 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 65 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_160 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_160 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_160 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 66 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_159 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_159 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_159 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 67 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_158 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_158 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_158 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 68 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_157 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_157 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_157 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 69 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_156 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_156 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_156 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 70 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_155 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_155 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_155 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 71 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_154 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_154 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_154 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 72 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_153 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_153 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_153 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 73 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_152 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_152 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_152 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 74 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_151 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_151 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_151 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 75 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_150 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_150 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_150 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 76 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_149 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_149 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_149 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 77 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_148 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_148 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_148 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 78 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_147 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_147 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_147 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 79 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_146 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_146 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_146 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 80 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_145 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_145 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_145 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 81 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_144 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_144 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_144 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 82 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_143 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_143 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_143 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 83 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_142 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_142 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_142 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 84 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_141 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_141 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_141 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 85 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_140 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_140 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_140 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 86 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_139 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_139 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_139 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 87 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_138 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_138 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_138 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 88 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_137 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_137 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_137 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 89 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_136 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_136 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_136 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 90 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_135 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_135 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_135 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 91 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_134 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_134 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_134 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 92 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_133 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_133 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_133 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 93 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_132 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_132 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_132 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 94 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_131 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_131 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_131 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 95 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_130 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_130 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_130 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 96 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_129 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_129 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_129 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 97 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_128 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_128 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_128 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 98 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_127 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_127 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_127 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 99 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_126 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_126 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_126 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 100 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_125 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_125 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_125 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 101 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_124 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_124 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_124 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 102 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_123 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_123 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_123 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 103 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_122 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_122 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_122 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 104 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_121 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_121 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_121 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 105 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_120 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_120 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_120 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 106 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_119 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_119 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_119 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 107 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_118 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_118 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_118 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 108 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_117 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_117 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_117 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 109 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_116 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_116 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_116 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 110 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_115 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_115 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_115 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 111 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_114 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_114 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_114 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 112 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_113 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_113 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_113 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 113 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_112 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_112 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_112 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 114 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_111 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_111 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_111 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 115 \
    name p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_110 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_110 \
    op interface \
    ports { p_ZZ23BackGrRemoval_stream_v2RN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm1ELm1EEE_110 { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 116 \
    name total \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_total \
    op interface \
    ports { total { I 31 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 117 \
    name sub \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub \
    op interface \
    ports { sub { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 118 \
    name sub81 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub81 \
    op interface \
    ports { sub81 { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 119 \
    name threshold \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_threshold \
    op interface \
    ports { threshold { I 8 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 120 \
    name sub110 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_sub110 \
    op interface \
    ports { sub110 { I 31 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 128 \
    name cols \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_cols \
    op interface \
    ports { cols { I 32 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 136 \
    name hv_119_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_119_out \
    op interface \
    ports { hv_119_out { O 8 vector } hv_119_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 137 \
    name hv_118_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_118_out \
    op interface \
    ports { hv_118_out { O 8 vector } hv_118_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 138 \
    name hv_117_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_117_out \
    op interface \
    ports { hv_117_out { O 8 vector } hv_117_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 139 \
    name hv_116_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_116_out \
    op interface \
    ports { hv_116_out { O 8 vector } hv_116_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 140 \
    name hv_115_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_115_out \
    op interface \
    ports { hv_115_out { O 8 vector } hv_115_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 141 \
    name hv_114_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_114_out \
    op interface \
    ports { hv_114_out { O 8 vector } hv_114_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 142 \
    name hv_113_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_113_out \
    op interface \
    ports { hv_113_out { O 8 vector } hv_113_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 143 \
    name hv_112_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_112_out \
    op interface \
    ports { hv_112_out { O 8 vector } hv_112_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 144 \
    name hv_111_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_111_out \
    op interface \
    ports { hv_111_out { O 8 vector } hv_111_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 145 \
    name hv_110_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_110_out \
    op interface \
    ports { hv_110_out { O 8 vector } hv_110_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 146 \
    name hv_108_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_108_out \
    op interface \
    ports { hv_108_out { O 8 vector } hv_108_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 147 \
    name hv_107_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_107_out \
    op interface \
    ports { hv_107_out { O 8 vector } hv_107_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 148 \
    name hv_106_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_106_out \
    op interface \
    ports { hv_106_out { O 8 vector } hv_106_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 149 \
    name hv_105_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_105_out \
    op interface \
    ports { hv_105_out { O 8 vector } hv_105_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 150 \
    name hv_104_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_104_out \
    op interface \
    ports { hv_104_out { O 8 vector } hv_104_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 151 \
    name hv_103_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_103_out \
    op interface \
    ports { hv_103_out { O 8 vector } hv_103_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 152 \
    name hv_102_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_102_out \
    op interface \
    ports { hv_102_out { O 8 vector } hv_102_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 153 \
    name hv_101_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_101_out \
    op interface \
    ports { hv_101_out { O 8 vector } hv_101_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 154 \
    name hv_100_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_100_out \
    op interface \
    ports { hv_100_out { O 8 vector } hv_100_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 155 \
    name hv_99_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_99_out \
    op interface \
    ports { hv_99_out { O 8 vector } hv_99_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 156 \
    name hv_97_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_97_out \
    op interface \
    ports { hv_97_out { O 8 vector } hv_97_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 157 \
    name hv_96_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_96_out \
    op interface \
    ports { hv_96_out { O 8 vector } hv_96_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 158 \
    name hv_95_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_95_out \
    op interface \
    ports { hv_95_out { O 8 vector } hv_95_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 159 \
    name hv_94_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_94_out \
    op interface \
    ports { hv_94_out { O 8 vector } hv_94_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 160 \
    name hv_93_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_93_out \
    op interface \
    ports { hv_93_out { O 8 vector } hv_93_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 161 \
    name hv_92_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_92_out \
    op interface \
    ports { hv_92_out { O 8 vector } hv_92_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 162 \
    name hv_91_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_91_out \
    op interface \
    ports { hv_91_out { O 8 vector } hv_91_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 163 \
    name hv_90_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_90_out \
    op interface \
    ports { hv_90_out { O 8 vector } hv_90_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 164 \
    name hv_89_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_89_out \
    op interface \
    ports { hv_89_out { O 8 vector } hv_89_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 165 \
    name hv_88_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_88_out \
    op interface \
    ports { hv_88_out { O 8 vector } hv_88_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 166 \
    name hv_86_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_86_out \
    op interface \
    ports { hv_86_out { O 8 vector } hv_86_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 167 \
    name hv_85_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_85_out \
    op interface \
    ports { hv_85_out { O 8 vector } hv_85_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 168 \
    name hv_84_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_84_out \
    op interface \
    ports { hv_84_out { O 8 vector } hv_84_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 169 \
    name hv_83_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_83_out \
    op interface \
    ports { hv_83_out { O 8 vector } hv_83_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 170 \
    name hv_82_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_82_out \
    op interface \
    ports { hv_82_out { O 8 vector } hv_82_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 171 \
    name hv_81_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_81_out \
    op interface \
    ports { hv_81_out { O 8 vector } hv_81_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 172 \
    name hv_80_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_80_out \
    op interface \
    ports { hv_80_out { O 8 vector } hv_80_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 173 \
    name hv_79_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_79_out \
    op interface \
    ports { hv_79_out { O 8 vector } hv_79_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 174 \
    name hv_78_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_78_out \
    op interface \
    ports { hv_78_out { O 8 vector } hv_78_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 175 \
    name hv_77_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_77_out \
    op interface \
    ports { hv_77_out { O 8 vector } hv_77_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 176 \
    name hv_75_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_75_out \
    op interface \
    ports { hv_75_out { O 8 vector } hv_75_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 177 \
    name hv_74_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_74_out \
    op interface \
    ports { hv_74_out { O 8 vector } hv_74_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 178 \
    name hv_73_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_73_out \
    op interface \
    ports { hv_73_out { O 8 vector } hv_73_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 179 \
    name hv_72_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_72_out \
    op interface \
    ports { hv_72_out { O 8 vector } hv_72_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 180 \
    name hv_71_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_71_out \
    op interface \
    ports { hv_71_out { O 8 vector } hv_71_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 181 \
    name hv_70_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_70_out \
    op interface \
    ports { hv_70_out { O 8 vector } hv_70_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 182 \
    name hv_69_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_69_out \
    op interface \
    ports { hv_69_out { O 8 vector } hv_69_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 183 \
    name hv_68_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_68_out \
    op interface \
    ports { hv_68_out { O 8 vector } hv_68_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 184 \
    name hv_67_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_67_out \
    op interface \
    ports { hv_67_out { O 8 vector } hv_67_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 185 \
    name hv_66_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_66_out \
    op interface \
    ports { hv_66_out { O 8 vector } hv_66_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 186 \
    name hv_64_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_64_out \
    op interface \
    ports { hv_64_out { O 8 vector } hv_64_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 187 \
    name hv_63_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_63_out \
    op interface \
    ports { hv_63_out { O 8 vector } hv_63_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 188 \
    name hv_62_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_62_out \
    op interface \
    ports { hv_62_out { O 8 vector } hv_62_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 189 \
    name hv_61_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_61_out \
    op interface \
    ports { hv_61_out { O 8 vector } hv_61_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 190 \
    name hv_60_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_60_out \
    op interface \
    ports { hv_60_out { O 8 vector } hv_60_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 191 \
    name hv_59_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_59_out \
    op interface \
    ports { hv_59_out { O 8 vector } hv_59_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 192 \
    name hv_58_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_58_out \
    op interface \
    ports { hv_58_out { O 8 vector } hv_58_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 193 \
    name hv_57_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_57_out \
    op interface \
    ports { hv_57_out { O 8 vector } hv_57_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 194 \
    name hv_56_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_56_out \
    op interface \
    ports { hv_56_out { O 8 vector } hv_56_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 195 \
    name hv_55_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_55_out \
    op interface \
    ports { hv_55_out { O 8 vector } hv_55_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 196 \
    name hv_53_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_53_out \
    op interface \
    ports { hv_53_out { O 8 vector } hv_53_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 197 \
    name hv_52_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_52_out \
    op interface \
    ports { hv_52_out { O 8 vector } hv_52_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 198 \
    name hv_51_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_51_out \
    op interface \
    ports { hv_51_out { O 8 vector } hv_51_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 199 \
    name hv_50_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_50_out \
    op interface \
    ports { hv_50_out { O 8 vector } hv_50_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 200 \
    name hv_49_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_49_out \
    op interface \
    ports { hv_49_out { O 8 vector } hv_49_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 201 \
    name hv_48_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_48_out \
    op interface \
    ports { hv_48_out { O 8 vector } hv_48_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 202 \
    name hv_47_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_47_out \
    op interface \
    ports { hv_47_out { O 8 vector } hv_47_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 203 \
    name hv_46_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_46_out \
    op interface \
    ports { hv_46_out { O 8 vector } hv_46_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 204 \
    name hv_45_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_45_out \
    op interface \
    ports { hv_45_out { O 8 vector } hv_45_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 205 \
    name hv_44_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_44_out \
    op interface \
    ports { hv_44_out { O 8 vector } hv_44_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 206 \
    name hv_42_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_42_out \
    op interface \
    ports { hv_42_out { O 8 vector } hv_42_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 207 \
    name hv_41_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_41_out \
    op interface \
    ports { hv_41_out { O 8 vector } hv_41_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 208 \
    name hv_40_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_40_out \
    op interface \
    ports { hv_40_out { O 8 vector } hv_40_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 209 \
    name hv_39_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_39_out \
    op interface \
    ports { hv_39_out { O 8 vector } hv_39_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 210 \
    name hv_38_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_38_out \
    op interface \
    ports { hv_38_out { O 8 vector } hv_38_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 211 \
    name hv_37_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_37_out \
    op interface \
    ports { hv_37_out { O 8 vector } hv_37_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 212 \
    name hv_36_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_36_out \
    op interface \
    ports { hv_36_out { O 8 vector } hv_36_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 213 \
    name hv_35_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_35_out \
    op interface \
    ports { hv_35_out { O 8 vector } hv_35_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 214 \
    name hv_34_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_34_out \
    op interface \
    ports { hv_34_out { O 8 vector } hv_34_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 215 \
    name hv_33_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_33_out \
    op interface \
    ports { hv_33_out { O 8 vector } hv_33_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 216 \
    name hv_31_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_31_out \
    op interface \
    ports { hv_31_out { O 8 vector } hv_31_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 217 \
    name hv_30_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_30_out \
    op interface \
    ports { hv_30_out { O 8 vector } hv_30_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 218 \
    name hv_29_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_29_out \
    op interface \
    ports { hv_29_out { O 8 vector } hv_29_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 219 \
    name hv_28_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_28_out \
    op interface \
    ports { hv_28_out { O 8 vector } hv_28_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 220 \
    name hv_27_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_27_out \
    op interface \
    ports { hv_27_out { O 8 vector } hv_27_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 221 \
    name hv_26_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_26_out \
    op interface \
    ports { hv_26_out { O 8 vector } hv_26_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 222 \
    name hv_25_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_25_out \
    op interface \
    ports { hv_25_out { O 8 vector } hv_25_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 223 \
    name hv_24_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_24_out \
    op interface \
    ports { hv_24_out { O 8 vector } hv_24_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 224 \
    name hv_23_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_23_out \
    op interface \
    ports { hv_23_out { O 8 vector } hv_23_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 225 \
    name hv_22_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_22_out \
    op interface \
    ports { hv_22_out { O 8 vector } hv_22_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 226 \
    name hv_20_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_20_out \
    op interface \
    ports { hv_20_out { O 8 vector } hv_20_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 227 \
    name hv_19_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_19_out \
    op interface \
    ports { hv_19_out { O 8 vector } hv_19_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 228 \
    name hv_18_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_18_out \
    op interface \
    ports { hv_18_out { O 8 vector } hv_18_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 229 \
    name hv_17_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_17_out \
    op interface \
    ports { hv_17_out { O 8 vector } hv_17_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 230 \
    name hv_16_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_16_out \
    op interface \
    ports { hv_16_out { O 8 vector } hv_16_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 231 \
    name hv_15_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_15_out \
    op interface \
    ports { hv_15_out { O 8 vector } hv_15_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 232 \
    name hv_14_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_14_out \
    op interface \
    ports { hv_14_out { O 8 vector } hv_14_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 233 \
    name hv_13_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_13_out \
    op interface \
    ports { hv_13_out { O 8 vector } hv_13_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 234 \
    name hv_12_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_12_out \
    op interface \
    ports { hv_12_out { O 8 vector } hv_12_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 235 \
    name hv_11_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_11_out \
    op interface \
    ports { hv_11_out { O 8 vector } hv_11_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 236 \
    name hv_9_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_9_out \
    op interface \
    ports { hv_9_out { O 8 vector } hv_9_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 237 \
    name hv_8_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_8_out \
    op interface \
    ports { hv_8_out { O 8 vector } hv_8_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 238 \
    name hv_7_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_7_out \
    op interface \
    ports { hv_7_out { O 8 vector } hv_7_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 239 \
    name hv_6_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_6_out \
    op interface \
    ports { hv_6_out { O 8 vector } hv_6_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 240 \
    name hv_5_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_5_out \
    op interface \
    ports { hv_5_out { O 8 vector } hv_5_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 241 \
    name hv_4_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_4_out \
    op interface \
    ports { hv_4_out { O 8 vector } hv_4_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 242 \
    name hv_3_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_3_out \
    op interface \
    ports { hv_3_out { O 8 vector } hv_3_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 243 \
    name hv_2_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_2_out \
    op interface \
    ports { hv_2_out { O 8 vector } hv_2_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 244 \
    name hv_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_1_out \
    op interface \
    ports { hv_1_out { O 8 vector } hv_1_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 245 \
    name hv_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_hv_out \
    op interface \
    ports { hv_out { O 8 vector } hv_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


