# This script segment is generated automatically by AutoPilot

# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

set axilite_register_dict [dict create]
# XIL_BRAM:
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc ::AESL_LIB_XILADAPTER::xil_bram_gen] == "::AESL_LIB_XILADAPTER::xil_bram_gen"} {
eval "::AESL_LIB_XILADAPTER::xil_bram_gen { \
    id 291 \
    name p \
    reset_level 1 \
    sync_rst true \
    dir IO \
    corename p \
    op interface \
    ports { p_address0 { O 8 vector } p_ce0 { O 1 bit } p_we0 { O 1 bit } p_d0 { O 64 vector } p_q0 { I 64 vector } p_address1 { O 8 vector } p_ce1 { O 1 bit } p_we1 { O 1 bit } p_d1 { O 64 vector } p_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 290 \
    name nb_pts \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_nb_pts \
    op interface \
    ports { nb_pts { I 16 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 292 \
    name new_p_0 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_0 \
    op interface \
    ports { new_p_0 { O 64 vector } new_p_0_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 293 \
    name new_p_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_1 \
    op interface \
    ports { new_p_1 { O 64 vector } new_p_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 294 \
    name new_p_2 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_2 \
    op interface \
    ports { new_p_2 { O 64 vector } new_p_2_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 295 \
    name new_p_3 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_3 \
    op interface \
    ports { new_p_3 { O 64 vector } new_p_3_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 296 \
    name new_p_4 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_4 \
    op interface \
    ports { new_p_4 { O 64 vector } new_p_4_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 297 \
    name new_p_5 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_5 \
    op interface \
    ports { new_p_5 { O 64 vector } new_p_5_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 298 \
    name new_p_6 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_6 \
    op interface \
    ports { new_p_6 { O 64 vector } new_p_6_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 299 \
    name new_p_7 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_7 \
    op interface \
    ports { new_p_7 { O 64 vector } new_p_7_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 300 \
    name new_p_8 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_8 \
    op interface \
    ports { new_p_8 { O 64 vector } new_p_8_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 301 \
    name new_p_9 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_9 \
    op interface \
    ports { new_p_9 { O 64 vector } new_p_9_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 302 \
    name new_p_10 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_10 \
    op interface \
    ports { new_p_10 { O 64 vector } new_p_10_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 303 \
    name new_p_11 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_11 \
    op interface \
    ports { new_p_11 { O 64 vector } new_p_11_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 304 \
    name new_p_12 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_12 \
    op interface \
    ports { new_p_12 { O 64 vector } new_p_12_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 305 \
    name new_p_13 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_13 \
    op interface \
    ports { new_p_13 { O 64 vector } new_p_13_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 306 \
    name new_p_14 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_14 \
    op interface \
    ports { new_p_14 { O 64 vector } new_p_14_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 307 \
    name new_p_15 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_15 \
    op interface \
    ports { new_p_15 { O 64 vector } new_p_15_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 308 \
    name new_p_16 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_16 \
    op interface \
    ports { new_p_16 { O 64 vector } new_p_16_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 309 \
    name new_p_17 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_17 \
    op interface \
    ports { new_p_17 { O 64 vector } new_p_17_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 310 \
    name new_p_18 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_18 \
    op interface \
    ports { new_p_18 { O 64 vector } new_p_18_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 311 \
    name new_p_19 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_19 \
    op interface \
    ports { new_p_19 { O 64 vector } new_p_19_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 312 \
    name new_p_20 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_20 \
    op interface \
    ports { new_p_20 { O 64 vector } new_p_20_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 313 \
    name new_p_21 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_21 \
    op interface \
    ports { new_p_21 { O 64 vector } new_p_21_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 314 \
    name new_p_22 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_22 \
    op interface \
    ports { new_p_22 { O 64 vector } new_p_22_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 315 \
    name new_p_23 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_23 \
    op interface \
    ports { new_p_23 { O 64 vector } new_p_23_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 316 \
    name new_p_24 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_24 \
    op interface \
    ports { new_p_24 { O 64 vector } new_p_24_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 317 \
    name new_p_25 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_25 \
    op interface \
    ports { new_p_25 { O 64 vector } new_p_25_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 318 \
    name new_p_26 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_26 \
    op interface \
    ports { new_p_26 { O 64 vector } new_p_26_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 319 \
    name new_p_27 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_27 \
    op interface \
    ports { new_p_27 { O 64 vector } new_p_27_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 320 \
    name new_p_28 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_28 \
    op interface \
    ports { new_p_28 { O 64 vector } new_p_28_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 321 \
    name new_p_29 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_29 \
    op interface \
    ports { new_p_29 { O 64 vector } new_p_29_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 322 \
    name new_p_30 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_30 \
    op interface \
    ports { new_p_30 { O 64 vector } new_p_30_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 323 \
    name new_p_31 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_31 \
    op interface \
    ports { new_p_31 { O 64 vector } new_p_31_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 324 \
    name new_p_32 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_32 \
    op interface \
    ports { new_p_32 { O 64 vector } new_p_32_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 325 \
    name new_p_33 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_33 \
    op interface \
    ports { new_p_33 { O 64 vector } new_p_33_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 326 \
    name new_p_34 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_34 \
    op interface \
    ports { new_p_34 { O 64 vector } new_p_34_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 327 \
    name new_p_35 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_35 \
    op interface \
    ports { new_p_35 { O 64 vector } new_p_35_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 328 \
    name new_p_36 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_36 \
    op interface \
    ports { new_p_36 { O 64 vector } new_p_36_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 329 \
    name new_p_37 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_37 \
    op interface \
    ports { new_p_37 { O 64 vector } new_p_37_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 330 \
    name new_p_38 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_38 \
    op interface \
    ports { new_p_38 { O 64 vector } new_p_38_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 331 \
    name new_p_39 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_39 \
    op interface \
    ports { new_p_39 { O 64 vector } new_p_39_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 332 \
    name new_p_40 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_40 \
    op interface \
    ports { new_p_40 { O 64 vector } new_p_40_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 333 \
    name new_p_41 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_41 \
    op interface \
    ports { new_p_41 { O 64 vector } new_p_41_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 334 \
    name new_p_42 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_42 \
    op interface \
    ports { new_p_42 { O 64 vector } new_p_42_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 335 \
    name new_p_43 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_43 \
    op interface \
    ports { new_p_43 { O 64 vector } new_p_43_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 336 \
    name new_p_44 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_44 \
    op interface \
    ports { new_p_44 { O 64 vector } new_p_44_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 337 \
    name new_p_45 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_45 \
    op interface \
    ports { new_p_45 { O 64 vector } new_p_45_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 338 \
    name new_p_46 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_46 \
    op interface \
    ports { new_p_46 { O 64 vector } new_p_46_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 339 \
    name new_p_47 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_47 \
    op interface \
    ports { new_p_47 { O 64 vector } new_p_47_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 340 \
    name new_p_48 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_48 \
    op interface \
    ports { new_p_48 { O 64 vector } new_p_48_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 341 \
    name new_p_49 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_49 \
    op interface \
    ports { new_p_49 { O 64 vector } new_p_49_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 342 \
    name new_p_50 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_50 \
    op interface \
    ports { new_p_50 { O 64 vector } new_p_50_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 343 \
    name new_p_51 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_51 \
    op interface \
    ports { new_p_51 { O 64 vector } new_p_51_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 344 \
    name new_p_52 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_52 \
    op interface \
    ports { new_p_52 { O 64 vector } new_p_52_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 345 \
    name new_p_53 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_53 \
    op interface \
    ports { new_p_53 { O 64 vector } new_p_53_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 346 \
    name new_p_54 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_54 \
    op interface \
    ports { new_p_54 { O 64 vector } new_p_54_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 347 \
    name new_p_55 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_55 \
    op interface \
    ports { new_p_55 { O 64 vector } new_p_55_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 348 \
    name new_p_56 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_56 \
    op interface \
    ports { new_p_56 { O 64 vector } new_p_56_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 349 \
    name new_p_57 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_57 \
    op interface \
    ports { new_p_57 { O 64 vector } new_p_57_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 350 \
    name new_p_58 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_58 \
    op interface \
    ports { new_p_58 { O 64 vector } new_p_58_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 351 \
    name new_p_59 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_59 \
    op interface \
    ports { new_p_59 { O 64 vector } new_p_59_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 352 \
    name new_p_60 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_60 \
    op interface \
    ports { new_p_60 { O 64 vector } new_p_60_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 353 \
    name new_p_61 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_61 \
    op interface \
    ports { new_p_61 { O 64 vector } new_p_61_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 354 \
    name new_p_62 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_62 \
    op interface \
    ports { new_p_62 { O 64 vector } new_p_62_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 355 \
    name new_p_63 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_63 \
    op interface \
    ports { new_p_63 { O 64 vector } new_p_63_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 356 \
    name new_p_64 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_64 \
    op interface \
    ports { new_p_64 { O 64 vector } new_p_64_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 357 \
    name new_p_65 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_65 \
    op interface \
    ports { new_p_65 { O 64 vector } new_p_65_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 358 \
    name new_p_66 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_66 \
    op interface \
    ports { new_p_66 { O 64 vector } new_p_66_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 359 \
    name new_p_67 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_67 \
    op interface \
    ports { new_p_67 { O 64 vector } new_p_67_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 360 \
    name new_p_68 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_68 \
    op interface \
    ports { new_p_68 { O 64 vector } new_p_68_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 361 \
    name new_p_69 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_69 \
    op interface \
    ports { new_p_69 { O 64 vector } new_p_69_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 362 \
    name new_p_70 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_70 \
    op interface \
    ports { new_p_70 { O 64 vector } new_p_70_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 363 \
    name new_p_71 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_71 \
    op interface \
    ports { new_p_71 { O 64 vector } new_p_71_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 364 \
    name new_p_72 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_72 \
    op interface \
    ports { new_p_72 { O 64 vector } new_p_72_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 365 \
    name new_p_73 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_73 \
    op interface \
    ports { new_p_73 { O 64 vector } new_p_73_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 366 \
    name new_p_74 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_74 \
    op interface \
    ports { new_p_74 { O 64 vector } new_p_74_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 367 \
    name new_p_75 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_75 \
    op interface \
    ports { new_p_75 { O 64 vector } new_p_75_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 368 \
    name new_p_76 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_76 \
    op interface \
    ports { new_p_76 { O 64 vector } new_p_76_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 369 \
    name new_p_77 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_77 \
    op interface \
    ports { new_p_77 { O 64 vector } new_p_77_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 370 \
    name new_p_78 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_78 \
    op interface \
    ports { new_p_78 { O 64 vector } new_p_78_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 371 \
    name new_p_79 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_79 \
    op interface \
    ports { new_p_79 { O 64 vector } new_p_79_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 372 \
    name new_p_80 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_80 \
    op interface \
    ports { new_p_80 { O 64 vector } new_p_80_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 373 \
    name new_p_81 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_81 \
    op interface \
    ports { new_p_81 { O 64 vector } new_p_81_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 374 \
    name new_p_82 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_82 \
    op interface \
    ports { new_p_82 { O 64 vector } new_p_82_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 375 \
    name new_p_83 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_83 \
    op interface \
    ports { new_p_83 { O 64 vector } new_p_83_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 376 \
    name new_p_84 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_84 \
    op interface \
    ports { new_p_84 { O 64 vector } new_p_84_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 377 \
    name new_p_85 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_85 \
    op interface \
    ports { new_p_85 { O 64 vector } new_p_85_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 378 \
    name new_p_86 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_86 \
    op interface \
    ports { new_p_86 { O 64 vector } new_p_86_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 379 \
    name new_p_87 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_87 \
    op interface \
    ports { new_p_87 { O 64 vector } new_p_87_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 380 \
    name new_p_88 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_88 \
    op interface \
    ports { new_p_88 { O 64 vector } new_p_88_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 381 \
    name new_p_89 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_89 \
    op interface \
    ports { new_p_89 { O 64 vector } new_p_89_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 382 \
    name new_p_90 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_90 \
    op interface \
    ports { new_p_90 { O 64 vector } new_p_90_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 383 \
    name new_p_91 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_91 \
    op interface \
    ports { new_p_91 { O 64 vector } new_p_91_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 384 \
    name new_p_92 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_92 \
    op interface \
    ports { new_p_92 { O 64 vector } new_p_92_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 385 \
    name new_p_93 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_93 \
    op interface \
    ports { new_p_93 { O 64 vector } new_p_93_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 386 \
    name new_p_94 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_94 \
    op interface \
    ports { new_p_94 { O 64 vector } new_p_94_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 387 \
    name new_p_95 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_95 \
    op interface \
    ports { new_p_95 { O 64 vector } new_p_95_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 388 \
    name new_p_96 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_96 \
    op interface \
    ports { new_p_96 { O 64 vector } new_p_96_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 389 \
    name new_p_97 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_97 \
    op interface \
    ports { new_p_97 { O 64 vector } new_p_97_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 390 \
    name new_p_98 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_98 \
    op interface \
    ports { new_p_98 { O 64 vector } new_p_98_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 391 \
    name new_p_99 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_99 \
    op interface \
    ports { new_p_99 { O 64 vector } new_p_99_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 392 \
    name new_p_100 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_100 \
    op interface \
    ports { new_p_100 { O 64 vector } new_p_100_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 393 \
    name new_p_101 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_101 \
    op interface \
    ports { new_p_101 { O 64 vector } new_p_101_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 394 \
    name new_p_102 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_102 \
    op interface \
    ports { new_p_102 { O 64 vector } new_p_102_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 395 \
    name new_p_103 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_103 \
    op interface \
    ports { new_p_103 { O 64 vector } new_p_103_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 396 \
    name new_p_104 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_104 \
    op interface \
    ports { new_p_104 { O 64 vector } new_p_104_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 397 \
    name new_p_105 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_105 \
    op interface \
    ports { new_p_105 { O 64 vector } new_p_105_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 398 \
    name new_p_106 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_106 \
    op interface \
    ports { new_p_106 { O 64 vector } new_p_106_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 399 \
    name new_p_107 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_107 \
    op interface \
    ports { new_p_107 { O 64 vector } new_p_107_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 400 \
    name new_p_108 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_108 \
    op interface \
    ports { new_p_108 { O 64 vector } new_p_108_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 401 \
    name new_p_109 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_109 \
    op interface \
    ports { new_p_109 { O 64 vector } new_p_109_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 402 \
    name new_p_110 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_110 \
    op interface \
    ports { new_p_110 { O 64 vector } new_p_110_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 403 \
    name new_p_111 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_111 \
    op interface \
    ports { new_p_111 { O 64 vector } new_p_111_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 404 \
    name new_p_112 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_112 \
    op interface \
    ports { new_p_112 { O 64 vector } new_p_112_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 405 \
    name new_p_113 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_113 \
    op interface \
    ports { new_p_113 { O 64 vector } new_p_113_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 406 \
    name new_p_114 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_114 \
    op interface \
    ports { new_p_114 { O 64 vector } new_p_114_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 407 \
    name new_p_115 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_115 \
    op interface \
    ports { new_p_115 { O 64 vector } new_p_115_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 408 \
    name new_p_116 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_116 \
    op interface \
    ports { new_p_116 { O 64 vector } new_p_116_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 409 \
    name new_p_117 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_117 \
    op interface \
    ports { new_p_117 { O 64 vector } new_p_117_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 410 \
    name new_p_118 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_118 \
    op interface \
    ports { new_p_118 { O 64 vector } new_p_118_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 411 \
    name new_p_119 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_119 \
    op interface \
    ports { new_p_119 { O 64 vector } new_p_119_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 412 \
    name new_p_120 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_120 \
    op interface \
    ports { new_p_120 { O 64 vector } new_p_120_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 413 \
    name new_p_121 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_121 \
    op interface \
    ports { new_p_121 { O 64 vector } new_p_121_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 414 \
    name new_p_122 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_122 \
    op interface \
    ports { new_p_122 { O 64 vector } new_p_122_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 415 \
    name new_p_123 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_123 \
    op interface \
    ports { new_p_123 { O 64 vector } new_p_123_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 416 \
    name new_p_124 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_124 \
    op interface \
    ports { new_p_124 { O 64 vector } new_p_124_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 417 \
    name new_p_125 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_125 \
    op interface \
    ports { new_p_125 { O 64 vector } new_p_125_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 418 \
    name new_p_126 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_126 \
    op interface \
    ports { new_p_126 { O 64 vector } new_p_126_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 419 \
    name new_p_127 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_127 \
    op interface \
    ports { new_p_127 { O 64 vector } new_p_127_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 420 \
    name new_p_128 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_128 \
    op interface \
    ports { new_p_128 { O 64 vector } new_p_128_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 421 \
    name new_p_129 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_129 \
    op interface \
    ports { new_p_129 { O 64 vector } new_p_129_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 422 \
    name new_p_130 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_130 \
    op interface \
    ports { new_p_130 { O 64 vector } new_p_130_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 423 \
    name new_p_131 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_131 \
    op interface \
    ports { new_p_131 { O 64 vector } new_p_131_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 424 \
    name new_p_132 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_132 \
    op interface \
    ports { new_p_132 { O 64 vector } new_p_132_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 425 \
    name new_p_133 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_133 \
    op interface \
    ports { new_p_133 { O 64 vector } new_p_133_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 426 \
    name new_p_134 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_134 \
    op interface \
    ports { new_p_134 { O 64 vector } new_p_134_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 427 \
    name new_p_135 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_135 \
    op interface \
    ports { new_p_135 { O 64 vector } new_p_135_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 428 \
    name new_p_136 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_136 \
    op interface \
    ports { new_p_136 { O 64 vector } new_p_136_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 429 \
    name new_p_137 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_137 \
    op interface \
    ports { new_p_137 { O 64 vector } new_p_137_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 430 \
    name new_p_138 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_138 \
    op interface \
    ports { new_p_138 { O 64 vector } new_p_138_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 431 \
    name new_p_139 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_139 \
    op interface \
    ports { new_p_139 { O 64 vector } new_p_139_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 432 \
    name new_p_140 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_140 \
    op interface \
    ports { new_p_140 { O 64 vector } new_p_140_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 433 \
    name new_p_141 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_141 \
    op interface \
    ports { new_p_141 { O 64 vector } new_p_141_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 434 \
    name new_p_142 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_142 \
    op interface \
    ports { new_p_142 { O 64 vector } new_p_142_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 435 \
    name new_p_143 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_143 \
    op interface \
    ports { new_p_143 { O 64 vector } new_p_143_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 436 \
    name new_p_144 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_144 \
    op interface \
    ports { new_p_144 { O 64 vector } new_p_144_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 437 \
    name new_p_145 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_145 \
    op interface \
    ports { new_p_145 { O 64 vector } new_p_145_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 438 \
    name new_p_146 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_146 \
    op interface \
    ports { new_p_146 { O 64 vector } new_p_146_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 439 \
    name new_p_147 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_147 \
    op interface \
    ports { new_p_147 { O 64 vector } new_p_147_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 440 \
    name new_p_148 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_148 \
    op interface \
    ports { new_p_148 { O 64 vector } new_p_148_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 441 \
    name new_p_149 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_149 \
    op interface \
    ports { new_p_149 { O 64 vector } new_p_149_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 442 \
    name new_p_150 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_150 \
    op interface \
    ports { new_p_150 { O 64 vector } new_p_150_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 443 \
    name new_p_151 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_151 \
    op interface \
    ports { new_p_151 { O 64 vector } new_p_151_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 444 \
    name new_p_152 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_152 \
    op interface \
    ports { new_p_152 { O 64 vector } new_p_152_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 445 \
    name new_p_153 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_153 \
    op interface \
    ports { new_p_153 { O 64 vector } new_p_153_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 446 \
    name new_p_154 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_154 \
    op interface \
    ports { new_p_154 { O 64 vector } new_p_154_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 447 \
    name new_p_155 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_155 \
    op interface \
    ports { new_p_155 { O 64 vector } new_p_155_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 448 \
    name new_p_156 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_156 \
    op interface \
    ports { new_p_156 { O 64 vector } new_p_156_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 449 \
    name new_p_157 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_157 \
    op interface \
    ports { new_p_157 { O 64 vector } new_p_157_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 450 \
    name new_p_158 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_158 \
    op interface \
    ports { new_p_158 { O 64 vector } new_p_158_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 451 \
    name new_p_159 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_159 \
    op interface \
    ports { new_p_159 { O 64 vector } new_p_159_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 452 \
    name new_p_160 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_160 \
    op interface \
    ports { new_p_160 { O 64 vector } new_p_160_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 453 \
    name new_p_161 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_161 \
    op interface \
    ports { new_p_161 { O 64 vector } new_p_161_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 454 \
    name new_p_162 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_162 \
    op interface \
    ports { new_p_162 { O 64 vector } new_p_162_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 455 \
    name new_p_163 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_163 \
    op interface \
    ports { new_p_163 { O 64 vector } new_p_163_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 456 \
    name new_p_164 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_164 \
    op interface \
    ports { new_p_164 { O 64 vector } new_p_164_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 457 \
    name new_p_165 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_165 \
    op interface \
    ports { new_p_165 { O 64 vector } new_p_165_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 458 \
    name new_p_166 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_166 \
    op interface \
    ports { new_p_166 { O 64 vector } new_p_166_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 459 \
    name new_p_167 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_167 \
    op interface \
    ports { new_p_167 { O 64 vector } new_p_167_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 460 \
    name new_p_168 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_168 \
    op interface \
    ports { new_p_168 { O 64 vector } new_p_168_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 461 \
    name new_p_169 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_169 \
    op interface \
    ports { new_p_169 { O 64 vector } new_p_169_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 462 \
    name new_p_170 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_170 \
    op interface \
    ports { new_p_170 { O 64 vector } new_p_170_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 463 \
    name new_p_171 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_171 \
    op interface \
    ports { new_p_171 { O 64 vector } new_p_171_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 464 \
    name new_p_172 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_172 \
    op interface \
    ports { new_p_172 { O 64 vector } new_p_172_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 465 \
    name new_p_173 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_173 \
    op interface \
    ports { new_p_173 { O 64 vector } new_p_173_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 466 \
    name new_p_174 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_174 \
    op interface \
    ports { new_p_174 { O 64 vector } new_p_174_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 467 \
    name new_p_175 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_175 \
    op interface \
    ports { new_p_175 { O 64 vector } new_p_175_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 468 \
    name new_p_176 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_176 \
    op interface \
    ports { new_p_176 { O 64 vector } new_p_176_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 469 \
    name new_p_177 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_177 \
    op interface \
    ports { new_p_177 { O 64 vector } new_p_177_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 470 \
    name new_p_178 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_178 \
    op interface \
    ports { new_p_178 { O 64 vector } new_p_178_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 471 \
    name new_p_179 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_179 \
    op interface \
    ports { new_p_179 { O 64 vector } new_p_179_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 472 \
    name new_p_180 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_180 \
    op interface \
    ports { new_p_180 { O 64 vector } new_p_180_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 473 \
    name new_p_181 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_181 \
    op interface \
    ports { new_p_181 { O 64 vector } new_p_181_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 474 \
    name new_p_182 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_182 \
    op interface \
    ports { new_p_182 { O 64 vector } new_p_182_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 475 \
    name new_p_183 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_183 \
    op interface \
    ports { new_p_183 { O 64 vector } new_p_183_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 476 \
    name new_p_184 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_184 \
    op interface \
    ports { new_p_184 { O 64 vector } new_p_184_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 477 \
    name new_p_185 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_185 \
    op interface \
    ports { new_p_185 { O 64 vector } new_p_185_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 478 \
    name new_p_186 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_186 \
    op interface \
    ports { new_p_186 { O 64 vector } new_p_186_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 479 \
    name new_p_187 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_187 \
    op interface \
    ports { new_p_187 { O 64 vector } new_p_187_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 480 \
    name new_p_188 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_188 \
    op interface \
    ports { new_p_188 { O 64 vector } new_p_188_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 481 \
    name new_p_189 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_189 \
    op interface \
    ports { new_p_189 { O 64 vector } new_p_189_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 482 \
    name new_p_190 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_190 \
    op interface \
    ports { new_p_190 { O 64 vector } new_p_190_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 483 \
    name new_p_191 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_191 \
    op interface \
    ports { new_p_191 { O 64 vector } new_p_191_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 484 \
    name new_p_192 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_192 \
    op interface \
    ports { new_p_192 { O 64 vector } new_p_192_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 485 \
    name new_p_193 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_193 \
    op interface \
    ports { new_p_193 { O 64 vector } new_p_193_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 486 \
    name new_p_194 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_194 \
    op interface \
    ports { new_p_194 { O 64 vector } new_p_194_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 487 \
    name new_p_195 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_195 \
    op interface \
    ports { new_p_195 { O 64 vector } new_p_195_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 488 \
    name new_p_196 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_196 \
    op interface \
    ports { new_p_196 { O 64 vector } new_p_196_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 489 \
    name new_p_197 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_197 \
    op interface \
    ports { new_p_197 { O 64 vector } new_p_197_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 490 \
    name new_p_198 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_198 \
    op interface \
    ports { new_p_198 { O 64 vector } new_p_198_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 491 \
    name new_p_199 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_199 \
    op interface \
    ports { new_p_199 { O 64 vector } new_p_199_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 492 \
    name new_p_200 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_200 \
    op interface \
    ports { new_p_200 { O 64 vector } new_p_200_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 493 \
    name new_p_201 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_201 \
    op interface \
    ports { new_p_201 { O 64 vector } new_p_201_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 494 \
    name new_p_202 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_202 \
    op interface \
    ports { new_p_202 { O 64 vector } new_p_202_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 495 \
    name new_p_203 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_203 \
    op interface \
    ports { new_p_203 { O 64 vector } new_p_203_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 496 \
    name new_p_204 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_204 \
    op interface \
    ports { new_p_204 { O 64 vector } new_p_204_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 497 \
    name new_p_205 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_205 \
    op interface \
    ports { new_p_205 { O 64 vector } new_p_205_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 498 \
    name new_p_206 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_206 \
    op interface \
    ports { new_p_206 { O 64 vector } new_p_206_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 499 \
    name new_p_207 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_207 \
    op interface \
    ports { new_p_207 { O 64 vector } new_p_207_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 500 \
    name new_p_208 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_208 \
    op interface \
    ports { new_p_208 { O 64 vector } new_p_208_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 501 \
    name new_p_209 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_209 \
    op interface \
    ports { new_p_209 { O 64 vector } new_p_209_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 502 \
    name new_p_210 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_210 \
    op interface \
    ports { new_p_210 { O 64 vector } new_p_210_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 503 \
    name new_p_211 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_211 \
    op interface \
    ports { new_p_211 { O 64 vector } new_p_211_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 504 \
    name new_p_212 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_212 \
    op interface \
    ports { new_p_212 { O 64 vector } new_p_212_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 505 \
    name new_p_213 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_213 \
    op interface \
    ports { new_p_213 { O 64 vector } new_p_213_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 506 \
    name new_p_214 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_214 \
    op interface \
    ports { new_p_214 { O 64 vector } new_p_214_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 507 \
    name new_p_215 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_215 \
    op interface \
    ports { new_p_215 { O 64 vector } new_p_215_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 508 \
    name new_p_216 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_216 \
    op interface \
    ports { new_p_216 { O 64 vector } new_p_216_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 509 \
    name new_p_217 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_217 \
    op interface \
    ports { new_p_217 { O 64 vector } new_p_217_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 510 \
    name new_p_218 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_218 \
    op interface \
    ports { new_p_218 { O 64 vector } new_p_218_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 511 \
    name new_p_219 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_219 \
    op interface \
    ports { new_p_219 { O 64 vector } new_p_219_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 512 \
    name new_p_220 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_220 \
    op interface \
    ports { new_p_220 { O 64 vector } new_p_220_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 513 \
    name new_p_221 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_221 \
    op interface \
    ports { new_p_221 { O 64 vector } new_p_221_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 514 \
    name new_p_222 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_222 \
    op interface \
    ports { new_p_222 { O 64 vector } new_p_222_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 515 \
    name new_p_223 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_223 \
    op interface \
    ports { new_p_223 { O 64 vector } new_p_223_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 516 \
    name new_p_224 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_224 \
    op interface \
    ports { new_p_224 { O 64 vector } new_p_224_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 517 \
    name new_p_225 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_225 \
    op interface \
    ports { new_p_225 { O 64 vector } new_p_225_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 518 \
    name new_p_226 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_226 \
    op interface \
    ports { new_p_226 { O 64 vector } new_p_226_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 519 \
    name new_p_227 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_227 \
    op interface \
    ports { new_p_227 { O 64 vector } new_p_227_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 520 \
    name new_p_228 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_228 \
    op interface \
    ports { new_p_228 { O 64 vector } new_p_228_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 521 \
    name new_p_229 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_229 \
    op interface \
    ports { new_p_229 { O 64 vector } new_p_229_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 522 \
    name new_p_230 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_230 \
    op interface \
    ports { new_p_230 { O 64 vector } new_p_230_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 523 \
    name new_p_231 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_231 \
    op interface \
    ports { new_p_231 { O 64 vector } new_p_231_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 524 \
    name new_p_232 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_232 \
    op interface \
    ports { new_p_232 { O 64 vector } new_p_232_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 525 \
    name new_p_233 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_233 \
    op interface \
    ports { new_p_233 { O 64 vector } new_p_233_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 526 \
    name new_p_234 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_234 \
    op interface \
    ports { new_p_234 { O 64 vector } new_p_234_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 527 \
    name new_p_235 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_235 \
    op interface \
    ports { new_p_235 { O 64 vector } new_p_235_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 528 \
    name new_p_236 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_236 \
    op interface \
    ports { new_p_236 { O 64 vector } new_p_236_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 529 \
    name new_p_237 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_237 \
    op interface \
    ports { new_p_237 { O 64 vector } new_p_237_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 530 \
    name new_p_238 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_238 \
    op interface \
    ports { new_p_238 { O 64 vector } new_p_238_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 531 \
    name new_p_239 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_239 \
    op interface \
    ports { new_p_239 { O 64 vector } new_p_239_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 532 \
    name new_p_240 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_240 \
    op interface \
    ports { new_p_240 { O 64 vector } new_p_240_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 533 \
    name new_p_241 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_241 \
    op interface \
    ports { new_p_241 { O 64 vector } new_p_241_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 534 \
    name new_p_242 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_242 \
    op interface \
    ports { new_p_242 { O 64 vector } new_p_242_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 535 \
    name new_p_243 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_243 \
    op interface \
    ports { new_p_243 { O 64 vector } new_p_243_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 536 \
    name new_p_244 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_244 \
    op interface \
    ports { new_p_244 { O 64 vector } new_p_244_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 537 \
    name new_p_245 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_245 \
    op interface \
    ports { new_p_245 { O 64 vector } new_p_245_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 538 \
    name new_p_246 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_246 \
    op interface \
    ports { new_p_246 { O 64 vector } new_p_246_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 539 \
    name new_p_247 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_247 \
    op interface \
    ports { new_p_247 { O 64 vector } new_p_247_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 540 \
    name new_p_248 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_248 \
    op interface \
    ports { new_p_248 { O 64 vector } new_p_248_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 541 \
    name new_p_249 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_new_p_249 \
    op interface \
    ports { new_p_249 { O 64 vector } new_p_249_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 542 \
    name espilon \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_espilon \
    op interface \
    ports { espilon { I 32 vector } } \
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

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -2 \
    name ap_return \
    type ap_return \
    reset_level 1 \
    sync_rst true \
    corename ap_return \
    op interface \
    ports { ap_return { O 16 vector } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -3 \
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
    id -4 \
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


