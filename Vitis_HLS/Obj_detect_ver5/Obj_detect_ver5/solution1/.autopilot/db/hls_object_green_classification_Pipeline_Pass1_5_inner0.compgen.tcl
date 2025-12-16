# This script segment is generated automatically by AutoPilot

set name hls_object_green_classification_urem_9ns_3ns_2_13_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {urem} IMPL {auto} LATENCY 12 ALLOW_PRAGMA 1
}


set name hls_object_green_classification_mul_9ns_11ns_19_1_1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mul} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set id 24
set name hls_object_green_classification_mux_3_2_1_1_1
set corename simcore_mux
set op mux
set stage_num 1
set din0_width 1
set din0_signed 0
set din1_width 1
set din1_signed 0
set din2_width 1
set din2_signed 0
set din3_width 2
set din3_signed 0
set dout_width 1
if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $name BINDTYPE {op} TYPE {mux} IMPL {auto} LATENCY 0 ALLOW_PRAGMA 1
}


set op mux
set corename Multiplexer
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_pipemux] == "::AESL_LIB_VIRTEX::xil_gen_pipemux"} {
eval "::AESL_LIB_VIRTEX::xil_gen_pipemux { \
    id ${id} \
    name ${name} \
    corename ${corename} \
    op ${op} \
    reset_level 1 \
    sync_rst true \
    stage_num ${stage_num} \
    din0_width ${din0_width} \
    din0_signed ${din0_signed} \
    din1_width ${din1_width} \
    din1_signed ${din1_signed} \
    din2_width ${din2_width} \
    din2_signed ${din2_signed} \
    din3_width ${din3_width} \
    din3_signed ${din3_signed} \
    dout_width ${dout_width} \
}"
} else {
puts "@W \[IMPL-101\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_pipemux, check your platform lib"
}
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 64 \
    name p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8 \
    op interface \
    ports { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_address0 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_ce0 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_q0 { I 1 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_address1 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_ce1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_we1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_8'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 65 \
    name p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7 \
    op interface \
    ports { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_address0 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_ce0 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_q0 { I 1 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_address1 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_ce1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_we1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_7'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 66 \
    name p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6 \
    op interface \
    ports { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_address0 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_ce0 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_q0 { I 1 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_address1 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_ce1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_we1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_6'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 67 \
    name p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5 \
    op interface \
    ports { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_address0 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_ce0 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_q0 { I 1 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_address1 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_ce1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_we1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_5'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 68 \
    name p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4 \
    op interface \
    ports { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_address0 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_ce0 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_q0 { I 1 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_address1 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_ce1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_we1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_4'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 69 \
    name p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3 \
    op interface \
    ports { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_address0 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_ce0 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_q0 { I 1 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_address1 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_ce1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_we1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_3'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 70 \
    name p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2 \
    op interface \
    ports { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_address0 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_ce0 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_q0 { I 1 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_address1 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_ce1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_we1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_2'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 71 \
    name p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1 \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1 \
    op interface \
    ports { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_address0 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_ce0 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_q0 { I 1 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_address1 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_ce1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_we1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_1'"
}
}


# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 72 \
    name p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm \
    op interface \
    ports { p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_address0 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_ce0 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_q0 { I 1 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_address1 { O 14 vector } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_ce1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_we1 { O 1 bit } p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm_d1 { O 1 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p_ZZ31hls_object_green_classificationRN3hls6streamINS_4axisI7ap_uintILi24EELm1ELm'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 59 \
    name tmp \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_tmp \
    op interface \
    ports { tmp { I 1 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 60 \
    name mul_ln509 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln509 \
    op interface \
    ports { mul_ln509 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 61 \
    name empty \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_empty \
    op interface \
    ports { empty { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 62 \
    name mul_ln509_1 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_mul_ln509_1 \
    op interface \
    ports { mul_ln509_1 { I 14 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 63 \
    name trunc_ln3 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_trunc_ln3 \
    op interface \
    ports { trunc_ln3 { I 2 vector } } \
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


# flow_control definition:
set InstName hls_object_green_classification_flow_control_loop_pipe_sequential_init_U
set CompName hls_object_green_classification_flow_control_loop_pipe_sequential_init
set name flow_control_loop_pipe_sequential_init
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control] == "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control"} {
eval "::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control { \
    name ${name} \
    prefix hls_object_green_classification_ \
}"
} else {
puts "@W \[IMPL-107\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_UPC_flow_control, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $CompName BINDTYPE interface TYPE internal_upc_flow_control INSTNAME $InstName
}


