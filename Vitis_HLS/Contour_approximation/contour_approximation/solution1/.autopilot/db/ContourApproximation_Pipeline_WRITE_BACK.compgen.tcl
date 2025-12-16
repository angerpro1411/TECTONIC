# This script segment is generated automatically by AutoPilot

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
    id 284 \
    name p \
    reset_level 1 \
    sync_rst true \
    dir I \
    corename p \
    op interface \
    ports { p_address0 { O 8 vector } p_ce0 { O 1 bit } p_q0 { I 64 vector } p_address1 { O 8 vector } p_ce1 { O 1 bit } p_q1 { I 64 vector } } \
} "
} else {
puts "@W \[IMPL-110\] Cannot find bus interface model in the library. Ignored generation of bus interface for 'p'"
}
}


# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 33 \
    name add_ln75 \
    type other \
    dir I \
    reset_level 1 \
    sync_rst true \
    corename dc_add_ln75 \
    op interface \
    ports { add_ln75 { I 17 vector } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 34 \
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
    id 35 \
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
    id 36 \
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
    id 37 \
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
    id 38 \
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
    id 39 \
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
    id 40 \
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
    id 41 \
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
    id 42 \
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
    id 43 \
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
    id 44 \
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
    id 45 \
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
    id 46 \
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
    id 47 \
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
    id 48 \
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
    id 49 \
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
    id 50 \
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
    id 51 \
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
    id 52 \
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
    id 53 \
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
    id 54 \
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
    id 55 \
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
    id 56 \
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
    id 57 \
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
    id 58 \
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
    id 59 \
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
    id 60 \
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
    id 61 \
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
    id 62 \
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
    id 63 \
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
    id 64 \
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
    id 65 \
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
    id 66 \
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
    id 67 \
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
    id 68 \
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
    id 69 \
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
    id 70 \
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
    id 71 \
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
    id 72 \
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
    id 73 \
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
    id 74 \
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
    id 75 \
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
    id 76 \
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
    id 77 \
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
    id 78 \
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
    id 79 \
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
    id 80 \
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
    id 81 \
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
    id 82 \
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
    id 83 \
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
    id 84 \
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
    id 85 \
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
    id 86 \
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
    id 87 \
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
    id 88 \
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
    id 89 \
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
    id 90 \
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
    id 91 \
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
    id 92 \
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
    id 93 \
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
    id 94 \
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
    id 95 \
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
    id 96 \
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
    id 97 \
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
    id 98 \
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
    id 99 \
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
    id 100 \
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
    id 101 \
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
    id 102 \
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
    id 103 \
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
    id 104 \
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
    id 105 \
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
    id 106 \
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
    id 107 \
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
    id 108 \
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
    id 109 \
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
    id 110 \
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
    id 111 \
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
    id 112 \
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
    id 113 \
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
    id 114 \
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
    id 115 \
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
    id 116 \
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
    id 117 \
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
    id 118 \
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
    id 119 \
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
    id 120 \
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
    id 121 \
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
    id 122 \
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
    id 123 \
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
    id 124 \
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
    id 125 \
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
    id 126 \
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
    id 127 \
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
    id 128 \
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
    id 129 \
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
    id 130 \
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
    id 131 \
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
    id 132 \
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
    id 133 \
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
    id 134 \
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
    id 135 \
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
    id 136 \
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
    id 137 \
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
    id 138 \
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
    id 139 \
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
    id 140 \
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
    id 141 \
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
    id 142 \
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
    id 143 \
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
    id 144 \
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
    id 145 \
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
    id 146 \
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
    id 147 \
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
    id 148 \
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
    id 149 \
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
    id 150 \
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
    id 151 \
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
    id 152 \
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
    id 153 \
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
    id 154 \
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
    id 155 \
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
    id 156 \
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
    id 157 \
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
    id 158 \
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
    id 159 \
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
    id 160 \
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
    id 161 \
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
    id 162 \
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
    id 163 \
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
    id 164 \
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
    id 165 \
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
    id 166 \
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
    id 167 \
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
    id 168 \
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
    id 169 \
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
    id 170 \
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
    id 171 \
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
    id 172 \
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
    id 173 \
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
    id 174 \
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
    id 175 \
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
    id 176 \
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
    id 177 \
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
    id 178 \
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
    id 179 \
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
    id 180 \
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
    id 181 \
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
    id 182 \
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
    id 183 \
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
    id 184 \
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
    id 185 \
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
    id 186 \
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
    id 187 \
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
    id 188 \
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
    id 189 \
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
    id 190 \
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
    id 191 \
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
    id 192 \
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
    id 193 \
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
    id 194 \
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
    id 195 \
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
    id 196 \
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
    id 197 \
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
    id 198 \
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
    id 199 \
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
    id 200 \
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
    id 201 \
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
    id 202 \
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
    id 203 \
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
    id 204 \
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
    id 205 \
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
    id 206 \
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
    id 207 \
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
    id 208 \
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
    id 209 \
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
    id 210 \
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
    id 211 \
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
    id 212 \
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
    id 213 \
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
    id 214 \
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
    id 215 \
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
    id 216 \
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
    id 217 \
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
    id 218 \
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
    id 219 \
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
    id 220 \
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
    id 221 \
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
    id 222 \
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
    id 223 \
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
    id 224 \
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
    id 225 \
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
    id 226 \
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
    id 227 \
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
    id 228 \
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
    id 229 \
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
    id 230 \
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
    id 231 \
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
    id 232 \
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
    id 233 \
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
    id 234 \
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
    id 235 \
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
    id 236 \
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
    id 237 \
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
    id 238 \
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
    id 239 \
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
    id 240 \
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
    id 241 \
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
    id 242 \
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
    id 243 \
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
    id 244 \
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
    id 245 \
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
    id 246 \
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
    id 247 \
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
    id 248 \
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
    id 249 \
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
    id 250 \
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
    id 251 \
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
    id 252 \
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
    id 253 \
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
    id 254 \
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
    id 255 \
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
    id 256 \
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
    id 257 \
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
    id 258 \
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
    id 259 \
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
    id 260 \
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
    id 261 \
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
    id 262 \
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
    id 263 \
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
    id 264 \
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
    id 265 \
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
    id 266 \
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
    id 267 \
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
    id 268 \
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
    id 269 \
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
    id 270 \
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
    id 271 \
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
    id 272 \
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
    id 273 \
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
    id 274 \
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
    id 275 \
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
    id 276 \
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
    id 277 \
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
    id 278 \
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
    id 279 \
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
    id 280 \
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
    id 281 \
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
    id 282 \
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
    id 283 \
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
    id 285 \
    name newcnt_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_newcnt_out \
    op interface \
    ports { newcnt_out { O 8 vector } newcnt_out_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 286 \
    name newcnt_1_out \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_newcnt_1_out \
    op interface \
    ports { newcnt_1_out { O 8 vector } newcnt_1_out_ap_vld { O 1 bit } } \
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
    ports { ap_return { O 1 vector } } \
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


