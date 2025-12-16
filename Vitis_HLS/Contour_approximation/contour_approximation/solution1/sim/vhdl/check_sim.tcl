# ==============================================================
# Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2023.1 (64-bit)
# Tool Version Limit: 2023.05
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
# 
# ==============================================================
proc sc_sim_check {ret err logfile} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set errfile "err.log"
    if {[file exists $errfile] && [file size $errfile] != 0} {
        set fl [open $errfile r]
        while {[gets $fl line] >= 0} {
            if {[string first "AESL_mErrNo = " $line] == 0} {
                set mismatch_num [string range $line [string length "AESL_mErrNo = "] end]
                if {$mismatch_num != 0} {
                    ::AP::printMsg ERR COSIM 403 COSIM_403_986 ${mismatch_num}
                    break
                }
            }
        }
    }
    if {$ret || $err != ""} {
        if { [lindex $::errorCode 0] eq "CHILDSTATUS"} {
            set status [lindex $::errorCode 2]
            if {$status != ""} {
                ::AP::printMsg ERR COSIM 404 COSIM_404_987 $status
            } else {
                ::AP::printMsg ERR COSIM 405 COSIM_405_988
            }
        } else {
            ::AP::printMsg ERR COSIM 405 COSIM_405_989
        }
    }
    if {[file exists $logfile]} {
        set cmdret [catch {eval exec "grep \"Error:\" $logfile"} err]
        file delete -force $logfile
        if {$cmdret == 0} {
            ::AP::printMsg ERR COSIM 405 COSIM_405_990
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
}

proc rtl_sim_check {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set errfile "err.log"
    if {[file exists $errfile] && [file size $errfile] != 0} {
        set fl [open $errfile r]
        set unmatch_num 0
        while {[gets $fl line] >= 0} {
            if {[string first "unmatched" $line] != -1} {
                set unmatch_num [expr $unmatch_num + 1]
            }
        }
        if {$unmatch_num != 0} {
            ::AP::printMsg ERR COSIM 406 COSIM_406_991 ${unmatch_num}
        }
    }
    if {[file exists ".aesl_error"]} {
        set errfl [open ".aesl_error" r]
        gets $errfl line
        if {$line != 0} {
            ::AP::printMsg ERR COSIM 407 COSIM_407_992 $line
        }
    }
    if {[file exists ".exit.err"]} {
        ::AP::printMsg ERR COSIM 405 COSIM_405_993
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
}

proc check_tvin_file {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set rtlfilelist {
         "c.ContourApproximation.autotvin_nb_pts.dat"
         "c.ContourApproximation.autotvin_p.dat"
         "c.ContourApproximation.autotvin_espilon.dat"
    }
    foreach rtlfile $rtlfilelist {
        if {[file isfile $rtlfile]} {
        } else {
            ::AP::printMsg ERR COSIM 320 COSIM_320_994
            return 1
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
    return 0
}

proc check_tvout_file {} {
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] start...";
	}
    set rtlfilelist {
         "rtl.ContourApproximation.autotvout_p.dat"
         "rtl.ContourApproximation.autotvout_new_p_0.dat"
         "rtl.ContourApproximation.autotvout_new_p_1.dat"
         "rtl.ContourApproximation.autotvout_new_p_2.dat"
         "rtl.ContourApproximation.autotvout_new_p_3.dat"
         "rtl.ContourApproximation.autotvout_new_p_4.dat"
         "rtl.ContourApproximation.autotvout_new_p_5.dat"
         "rtl.ContourApproximation.autotvout_new_p_6.dat"
         "rtl.ContourApproximation.autotvout_new_p_7.dat"
         "rtl.ContourApproximation.autotvout_new_p_8.dat"
         "rtl.ContourApproximation.autotvout_new_p_9.dat"
         "rtl.ContourApproximation.autotvout_new_p_10.dat"
         "rtl.ContourApproximation.autotvout_new_p_11.dat"
         "rtl.ContourApproximation.autotvout_new_p_12.dat"
         "rtl.ContourApproximation.autotvout_new_p_13.dat"
         "rtl.ContourApproximation.autotvout_new_p_14.dat"
         "rtl.ContourApproximation.autotvout_new_p_15.dat"
         "rtl.ContourApproximation.autotvout_new_p_16.dat"
         "rtl.ContourApproximation.autotvout_new_p_17.dat"
         "rtl.ContourApproximation.autotvout_new_p_18.dat"
         "rtl.ContourApproximation.autotvout_new_p_19.dat"
         "rtl.ContourApproximation.autotvout_new_p_20.dat"
         "rtl.ContourApproximation.autotvout_new_p_21.dat"
         "rtl.ContourApproximation.autotvout_new_p_22.dat"
         "rtl.ContourApproximation.autotvout_new_p_23.dat"
         "rtl.ContourApproximation.autotvout_new_p_24.dat"
         "rtl.ContourApproximation.autotvout_new_p_25.dat"
         "rtl.ContourApproximation.autotvout_new_p_26.dat"
         "rtl.ContourApproximation.autotvout_new_p_27.dat"
         "rtl.ContourApproximation.autotvout_new_p_28.dat"
         "rtl.ContourApproximation.autotvout_new_p_29.dat"
         "rtl.ContourApproximation.autotvout_new_p_30.dat"
         "rtl.ContourApproximation.autotvout_new_p_31.dat"
         "rtl.ContourApproximation.autotvout_new_p_32.dat"
         "rtl.ContourApproximation.autotvout_new_p_33.dat"
         "rtl.ContourApproximation.autotvout_new_p_34.dat"
         "rtl.ContourApproximation.autotvout_new_p_35.dat"
         "rtl.ContourApproximation.autotvout_new_p_36.dat"
         "rtl.ContourApproximation.autotvout_new_p_37.dat"
         "rtl.ContourApproximation.autotvout_new_p_38.dat"
         "rtl.ContourApproximation.autotvout_new_p_39.dat"
         "rtl.ContourApproximation.autotvout_new_p_40.dat"
         "rtl.ContourApproximation.autotvout_new_p_41.dat"
         "rtl.ContourApproximation.autotvout_new_p_42.dat"
         "rtl.ContourApproximation.autotvout_new_p_43.dat"
         "rtl.ContourApproximation.autotvout_new_p_44.dat"
         "rtl.ContourApproximation.autotvout_new_p_45.dat"
         "rtl.ContourApproximation.autotvout_new_p_46.dat"
         "rtl.ContourApproximation.autotvout_new_p_47.dat"
         "rtl.ContourApproximation.autotvout_new_p_48.dat"
         "rtl.ContourApproximation.autotvout_new_p_49.dat"
         "rtl.ContourApproximation.autotvout_new_p_50.dat"
         "rtl.ContourApproximation.autotvout_new_p_51.dat"
         "rtl.ContourApproximation.autotvout_new_p_52.dat"
         "rtl.ContourApproximation.autotvout_new_p_53.dat"
         "rtl.ContourApproximation.autotvout_new_p_54.dat"
         "rtl.ContourApproximation.autotvout_new_p_55.dat"
         "rtl.ContourApproximation.autotvout_new_p_56.dat"
         "rtl.ContourApproximation.autotvout_new_p_57.dat"
         "rtl.ContourApproximation.autotvout_new_p_58.dat"
         "rtl.ContourApproximation.autotvout_new_p_59.dat"
         "rtl.ContourApproximation.autotvout_new_p_60.dat"
         "rtl.ContourApproximation.autotvout_new_p_61.dat"
         "rtl.ContourApproximation.autotvout_new_p_62.dat"
         "rtl.ContourApproximation.autotvout_new_p_63.dat"
         "rtl.ContourApproximation.autotvout_new_p_64.dat"
         "rtl.ContourApproximation.autotvout_new_p_65.dat"
         "rtl.ContourApproximation.autotvout_new_p_66.dat"
         "rtl.ContourApproximation.autotvout_new_p_67.dat"
         "rtl.ContourApproximation.autotvout_new_p_68.dat"
         "rtl.ContourApproximation.autotvout_new_p_69.dat"
         "rtl.ContourApproximation.autotvout_new_p_70.dat"
         "rtl.ContourApproximation.autotvout_new_p_71.dat"
         "rtl.ContourApproximation.autotvout_new_p_72.dat"
         "rtl.ContourApproximation.autotvout_new_p_73.dat"
         "rtl.ContourApproximation.autotvout_new_p_74.dat"
         "rtl.ContourApproximation.autotvout_new_p_75.dat"
         "rtl.ContourApproximation.autotvout_new_p_76.dat"
         "rtl.ContourApproximation.autotvout_new_p_77.dat"
         "rtl.ContourApproximation.autotvout_new_p_78.dat"
         "rtl.ContourApproximation.autotvout_new_p_79.dat"
         "rtl.ContourApproximation.autotvout_new_p_80.dat"
         "rtl.ContourApproximation.autotvout_new_p_81.dat"
         "rtl.ContourApproximation.autotvout_new_p_82.dat"
         "rtl.ContourApproximation.autotvout_new_p_83.dat"
         "rtl.ContourApproximation.autotvout_new_p_84.dat"
         "rtl.ContourApproximation.autotvout_new_p_85.dat"
         "rtl.ContourApproximation.autotvout_new_p_86.dat"
         "rtl.ContourApproximation.autotvout_new_p_87.dat"
         "rtl.ContourApproximation.autotvout_new_p_88.dat"
         "rtl.ContourApproximation.autotvout_new_p_89.dat"
         "rtl.ContourApproximation.autotvout_new_p_90.dat"
         "rtl.ContourApproximation.autotvout_new_p_91.dat"
         "rtl.ContourApproximation.autotvout_new_p_92.dat"
         "rtl.ContourApproximation.autotvout_new_p_93.dat"
         "rtl.ContourApproximation.autotvout_new_p_94.dat"
         "rtl.ContourApproximation.autotvout_new_p_95.dat"
         "rtl.ContourApproximation.autotvout_new_p_96.dat"
         "rtl.ContourApproximation.autotvout_new_p_97.dat"
         "rtl.ContourApproximation.autotvout_new_p_98.dat"
         "rtl.ContourApproximation.autotvout_new_p_99.dat"
         "rtl.ContourApproximation.autotvout_new_p_100.dat"
         "rtl.ContourApproximation.autotvout_new_p_101.dat"
         "rtl.ContourApproximation.autotvout_new_p_102.dat"
         "rtl.ContourApproximation.autotvout_new_p_103.dat"
         "rtl.ContourApproximation.autotvout_new_p_104.dat"
         "rtl.ContourApproximation.autotvout_new_p_105.dat"
         "rtl.ContourApproximation.autotvout_new_p_106.dat"
         "rtl.ContourApproximation.autotvout_new_p_107.dat"
         "rtl.ContourApproximation.autotvout_new_p_108.dat"
         "rtl.ContourApproximation.autotvout_new_p_109.dat"
         "rtl.ContourApproximation.autotvout_new_p_110.dat"
         "rtl.ContourApproximation.autotvout_new_p_111.dat"
         "rtl.ContourApproximation.autotvout_new_p_112.dat"
         "rtl.ContourApproximation.autotvout_new_p_113.dat"
         "rtl.ContourApproximation.autotvout_new_p_114.dat"
         "rtl.ContourApproximation.autotvout_new_p_115.dat"
         "rtl.ContourApproximation.autotvout_new_p_116.dat"
         "rtl.ContourApproximation.autotvout_new_p_117.dat"
         "rtl.ContourApproximation.autotvout_new_p_118.dat"
         "rtl.ContourApproximation.autotvout_new_p_119.dat"
         "rtl.ContourApproximation.autotvout_new_p_120.dat"
         "rtl.ContourApproximation.autotvout_new_p_121.dat"
         "rtl.ContourApproximation.autotvout_new_p_122.dat"
         "rtl.ContourApproximation.autotvout_new_p_123.dat"
         "rtl.ContourApproximation.autotvout_new_p_124.dat"
         "rtl.ContourApproximation.autotvout_new_p_125.dat"
         "rtl.ContourApproximation.autotvout_new_p_126.dat"
         "rtl.ContourApproximation.autotvout_new_p_127.dat"
         "rtl.ContourApproximation.autotvout_new_p_128.dat"
         "rtl.ContourApproximation.autotvout_new_p_129.dat"
         "rtl.ContourApproximation.autotvout_new_p_130.dat"
         "rtl.ContourApproximation.autotvout_new_p_131.dat"
         "rtl.ContourApproximation.autotvout_new_p_132.dat"
         "rtl.ContourApproximation.autotvout_new_p_133.dat"
         "rtl.ContourApproximation.autotvout_new_p_134.dat"
         "rtl.ContourApproximation.autotvout_new_p_135.dat"
         "rtl.ContourApproximation.autotvout_new_p_136.dat"
         "rtl.ContourApproximation.autotvout_new_p_137.dat"
         "rtl.ContourApproximation.autotvout_new_p_138.dat"
         "rtl.ContourApproximation.autotvout_new_p_139.dat"
         "rtl.ContourApproximation.autotvout_new_p_140.dat"
         "rtl.ContourApproximation.autotvout_new_p_141.dat"
         "rtl.ContourApproximation.autotvout_new_p_142.dat"
         "rtl.ContourApproximation.autotvout_new_p_143.dat"
         "rtl.ContourApproximation.autotvout_new_p_144.dat"
         "rtl.ContourApproximation.autotvout_new_p_145.dat"
         "rtl.ContourApproximation.autotvout_new_p_146.dat"
         "rtl.ContourApproximation.autotvout_new_p_147.dat"
         "rtl.ContourApproximation.autotvout_new_p_148.dat"
         "rtl.ContourApproximation.autotvout_new_p_149.dat"
         "rtl.ContourApproximation.autotvout_new_p_150.dat"
         "rtl.ContourApproximation.autotvout_new_p_151.dat"
         "rtl.ContourApproximation.autotvout_new_p_152.dat"
         "rtl.ContourApproximation.autotvout_new_p_153.dat"
         "rtl.ContourApproximation.autotvout_new_p_154.dat"
         "rtl.ContourApproximation.autotvout_new_p_155.dat"
         "rtl.ContourApproximation.autotvout_new_p_156.dat"
         "rtl.ContourApproximation.autotvout_new_p_157.dat"
         "rtl.ContourApproximation.autotvout_new_p_158.dat"
         "rtl.ContourApproximation.autotvout_new_p_159.dat"
         "rtl.ContourApproximation.autotvout_new_p_160.dat"
         "rtl.ContourApproximation.autotvout_new_p_161.dat"
         "rtl.ContourApproximation.autotvout_new_p_162.dat"
         "rtl.ContourApproximation.autotvout_new_p_163.dat"
         "rtl.ContourApproximation.autotvout_new_p_164.dat"
         "rtl.ContourApproximation.autotvout_new_p_165.dat"
         "rtl.ContourApproximation.autotvout_new_p_166.dat"
         "rtl.ContourApproximation.autotvout_new_p_167.dat"
         "rtl.ContourApproximation.autotvout_new_p_168.dat"
         "rtl.ContourApproximation.autotvout_new_p_169.dat"
         "rtl.ContourApproximation.autotvout_new_p_170.dat"
         "rtl.ContourApproximation.autotvout_new_p_171.dat"
         "rtl.ContourApproximation.autotvout_new_p_172.dat"
         "rtl.ContourApproximation.autotvout_new_p_173.dat"
         "rtl.ContourApproximation.autotvout_new_p_174.dat"
         "rtl.ContourApproximation.autotvout_new_p_175.dat"
         "rtl.ContourApproximation.autotvout_new_p_176.dat"
         "rtl.ContourApproximation.autotvout_new_p_177.dat"
         "rtl.ContourApproximation.autotvout_new_p_178.dat"
         "rtl.ContourApproximation.autotvout_new_p_179.dat"
         "rtl.ContourApproximation.autotvout_new_p_180.dat"
         "rtl.ContourApproximation.autotvout_new_p_181.dat"
         "rtl.ContourApproximation.autotvout_new_p_182.dat"
         "rtl.ContourApproximation.autotvout_new_p_183.dat"
         "rtl.ContourApproximation.autotvout_new_p_184.dat"
         "rtl.ContourApproximation.autotvout_new_p_185.dat"
         "rtl.ContourApproximation.autotvout_new_p_186.dat"
         "rtl.ContourApproximation.autotvout_new_p_187.dat"
         "rtl.ContourApproximation.autotvout_new_p_188.dat"
         "rtl.ContourApproximation.autotvout_new_p_189.dat"
         "rtl.ContourApproximation.autotvout_new_p_190.dat"
         "rtl.ContourApproximation.autotvout_new_p_191.dat"
         "rtl.ContourApproximation.autotvout_new_p_192.dat"
         "rtl.ContourApproximation.autotvout_new_p_193.dat"
         "rtl.ContourApproximation.autotvout_new_p_194.dat"
         "rtl.ContourApproximation.autotvout_new_p_195.dat"
         "rtl.ContourApproximation.autotvout_new_p_196.dat"
         "rtl.ContourApproximation.autotvout_new_p_197.dat"
         "rtl.ContourApproximation.autotvout_new_p_198.dat"
         "rtl.ContourApproximation.autotvout_new_p_199.dat"
         "rtl.ContourApproximation.autotvout_new_p_200.dat"
         "rtl.ContourApproximation.autotvout_new_p_201.dat"
         "rtl.ContourApproximation.autotvout_new_p_202.dat"
         "rtl.ContourApproximation.autotvout_new_p_203.dat"
         "rtl.ContourApproximation.autotvout_new_p_204.dat"
         "rtl.ContourApproximation.autotvout_new_p_205.dat"
         "rtl.ContourApproximation.autotvout_new_p_206.dat"
         "rtl.ContourApproximation.autotvout_new_p_207.dat"
         "rtl.ContourApproximation.autotvout_new_p_208.dat"
         "rtl.ContourApproximation.autotvout_new_p_209.dat"
         "rtl.ContourApproximation.autotvout_new_p_210.dat"
         "rtl.ContourApproximation.autotvout_new_p_211.dat"
         "rtl.ContourApproximation.autotvout_new_p_212.dat"
         "rtl.ContourApproximation.autotvout_new_p_213.dat"
         "rtl.ContourApproximation.autotvout_new_p_214.dat"
         "rtl.ContourApproximation.autotvout_new_p_215.dat"
         "rtl.ContourApproximation.autotvout_new_p_216.dat"
         "rtl.ContourApproximation.autotvout_new_p_217.dat"
         "rtl.ContourApproximation.autotvout_new_p_218.dat"
         "rtl.ContourApproximation.autotvout_new_p_219.dat"
         "rtl.ContourApproximation.autotvout_new_p_220.dat"
         "rtl.ContourApproximation.autotvout_new_p_221.dat"
         "rtl.ContourApproximation.autotvout_new_p_222.dat"
         "rtl.ContourApproximation.autotvout_new_p_223.dat"
         "rtl.ContourApproximation.autotvout_new_p_224.dat"
         "rtl.ContourApproximation.autotvout_new_p_225.dat"
         "rtl.ContourApproximation.autotvout_new_p_226.dat"
         "rtl.ContourApproximation.autotvout_new_p_227.dat"
         "rtl.ContourApproximation.autotvout_new_p_228.dat"
         "rtl.ContourApproximation.autotvout_new_p_229.dat"
         "rtl.ContourApproximation.autotvout_new_p_230.dat"
         "rtl.ContourApproximation.autotvout_new_p_231.dat"
         "rtl.ContourApproximation.autotvout_new_p_232.dat"
         "rtl.ContourApproximation.autotvout_new_p_233.dat"
         "rtl.ContourApproximation.autotvout_new_p_234.dat"
         "rtl.ContourApproximation.autotvout_new_p_235.dat"
         "rtl.ContourApproximation.autotvout_new_p_236.dat"
         "rtl.ContourApproximation.autotvout_new_p_237.dat"
         "rtl.ContourApproximation.autotvout_new_p_238.dat"
         "rtl.ContourApproximation.autotvout_new_p_239.dat"
         "rtl.ContourApproximation.autotvout_new_p_240.dat"
         "rtl.ContourApproximation.autotvout_new_p_241.dat"
         "rtl.ContourApproximation.autotvout_new_p_242.dat"
         "rtl.ContourApproximation.autotvout_new_p_243.dat"
         "rtl.ContourApproximation.autotvout_new_p_244.dat"
         "rtl.ContourApproximation.autotvout_new_p_245.dat"
         "rtl.ContourApproximation.autotvout_new_p_246.dat"
         "rtl.ContourApproximation.autotvout_new_p_247.dat"
         "rtl.ContourApproximation.autotvout_new_p_248.dat"
         "rtl.ContourApproximation.autotvout_new_p_249.dat"
         "rtl.ContourApproximation.autotvout_ap_return.dat"
    }
    foreach rtlfile $rtlfilelist {
        if {[file isfile $rtlfile]} {
        } else {
            ::AP::printMsg ERR COSIM 303 COSIM_303_996
            return 1
        }
    }
	if {$::AESL_AUTOSIM::gDebug == 1} {
		puts stdout "[debug_prompt arg check_sim.tcl] finish...";
	}
    return 0
}
