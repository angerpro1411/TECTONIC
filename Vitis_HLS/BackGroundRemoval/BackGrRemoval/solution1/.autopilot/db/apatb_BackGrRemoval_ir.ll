; ModuleID = '/home/dell3561-49/Vitis_HLS_folder/BackGroundRemoval/BackGrRemoval/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.PixelBGR = type { %"struct.ap_uint<8>", %"struct.ap_uint<8>", %"struct.ap_uint<8>" }
%"struct.ap_uint<8>" = type { %"struct.ap_int_base<8, false>" }
%"struct.ap_int_base<8, false>" = type { %"struct.ssdm_int<8, false>" }
%"struct.ssdm_int<8, false>" = type { i8 }

; Function Attrs: noinline
define void @apatb_BackGrRemoval_ir(%struct.PixelBGR* noalias nocapture nonnull "maxi" %inBGR, %"struct.ap_uint<8>"* nocapture readonly %threshold) local_unnamed_addr #0 {
entry:
  %inBGR_copy = alloca %struct.PixelBGR, align 512
  call fastcc void @copy_in(%struct.PixelBGR* nonnull %inBGR, %struct.PixelBGR* nonnull align 512 %inBGR_copy)
  call void @apatb_BackGrRemoval_hw(%struct.PixelBGR* %inBGR_copy, %"struct.ap_uint<8>"* %threshold)
  call void @copy_back(%struct.PixelBGR* %inBGR, %struct.PixelBGR* %inBGR_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in(%struct.PixelBGR* noalias readonly, %struct.PixelBGR* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.PixelBGR(%struct.PixelBGR* align 512 %1, %struct.PixelBGR* %0)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.PixelBGR(%struct.PixelBGR* noalias align 512 %dst, %struct.PixelBGR* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %struct.PixelBGR* %dst, null
  %1 = icmp eq %struct.PixelBGR* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.0.05 = getelementptr %struct.PixelBGR, %struct.PixelBGR* %src, i64 0, i32 0, i32 0, i32 0, i32 0
  %dst.0.0.0.06 = getelementptr %struct.PixelBGR, %struct.PixelBGR* %dst, i64 0, i32 0, i32 0, i32 0, i32 0
  %3 = load i8, i8* %src.0.0.0.05, align 1
  store i8 %3, i8* %dst.0.0.0.06, align 512
  %src.1.0.0.011 = getelementptr %struct.PixelBGR, %struct.PixelBGR* %src, i64 0, i32 1, i32 0, i32 0, i32 0
  %dst.1.0.0.012 = getelementptr %struct.PixelBGR, %struct.PixelBGR* %dst, i64 0, i32 1, i32 0, i32 0, i32 0
  %4 = load i8, i8* %src.1.0.0.011, align 1
  store i8 %4, i8* %dst.1.0.0.012, align 1
  %src.2.0.0.017 = getelementptr %struct.PixelBGR, %struct.PixelBGR* %src, i64 0, i32 2, i32 0, i32 0, i32 0
  %dst.2.0.0.018 = getelementptr %struct.PixelBGR, %struct.PixelBGR* %dst, i64 0, i32 2, i32 0, i32 0, i32 0
  %5 = load i8, i8* %src.2.0.0.017, align 1
  store i8 %5, i8* %dst.2.0.0.018, align 2
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out(%struct.PixelBGR* noalias, %struct.PixelBGR* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.PixelBGR(%struct.PixelBGR* %0, %struct.PixelBGR* align 512 %1)
  ret void
}

declare void @apatb_BackGrRemoval_hw(%struct.PixelBGR*, %"struct.ap_uint<8>"*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back(%struct.PixelBGR* noalias, %struct.PixelBGR* noalias readonly align 512) unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.PixelBGR(%struct.PixelBGR* %0, %struct.PixelBGR* align 512 %1)
  ret void
}

define void @BackGrRemoval_hw_stub_wrapper(%struct.PixelBGR*, %"struct.ap_uint<8>"*) #4 {
entry:
  call void @copy_out(%struct.PixelBGR* null, %struct.PixelBGR* %0)
  call void @BackGrRemoval_hw_stub(%struct.PixelBGR* %0, %"struct.ap_uint<8>"* %1)
  call void @copy_in(%struct.PixelBGR* null, %struct.PixelBGR* %0)
  ret void
}

declare void @BackGrRemoval_hw_stub(%struct.PixelBGR*, %"struct.ap_uint<8>"*)

attributes #0 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
