; ModuleID = '/home/dell3561-49/Vitis_HLS_folder/MeanShiftFilter/MeanShiftFilter/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.Pixel = type { i8, i8, i8 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define i8 @apatb_MeanShiftFiltering_ir(%struct.Pixel* noalias nocapture nonnull readonly "partition" %in, %struct.Pixel* noalias nocapture nonnull "partition" %out, i32 %ImageWidth, i32 %ImageHeight, i8 signext %sd, i8 signext %cd, i8 zeroext %max_iter) local_unnamed_addr #0 {
entry:
  %in_copy = alloca i24, align 512
  %out_copy = alloca i24, align 512
  call fastcc void @copy_in(%struct.Pixel* nonnull %in, i24* nonnull align 512 %in_copy, %struct.Pixel* nonnull %out, i24* nonnull align 512 %out_copy)
  %0 = call i8 @apatb_MeanShiftFiltering_hw(i24* %in_copy, i24* %out_copy, i32 %ImageWidth, i32 %ImageHeight, i8 %sd, i8 %cd, i8 %max_iter)
  call void @copy_back(%struct.Pixel* %in, i24* %in_copy, %struct.Pixel* %out, i24* %out_copy)
  ret i8 %0
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in(%struct.Pixel* noalias readonly, i24* noalias align 512, %struct.Pixel* noalias readonly, i24* noalias align 512) unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.Pixel.38(i24* align 512 %1, %struct.Pixel* %0)
  call fastcc void @onebyonecpy_hls.p0struct.Pixel.38(i24* align 512 %3, %struct.Pixel* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out(%struct.Pixel* noalias, i24* noalias readonly align 512, %struct.Pixel* noalias, i24* noalias readonly align 512) unnamed_addr #2 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.Pixel(%struct.Pixel* %0, i24* align 512 %1)
  call fastcc void @onebyonecpy_hls.p0struct.Pixel(%struct.Pixel* %2, i24* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.Pixel(%struct.Pixel* noalias %dst, i24* noalias readonly align 512 %src) unnamed_addr #3 {
entry:
  %0 = icmp eq %struct.Pixel* %dst, null
  %1 = icmp eq i24* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0 = getelementptr %struct.Pixel, %struct.Pixel* %dst, i64 0, i32 0
  %3 = load i24, i24* %src, align 512
  %.partselect2 = trunc i24 %3 to i8
  store i8 %.partselect2, i8* %dst.0, align 512
  %dst.1 = getelementptr %struct.Pixel, %struct.Pixel* %dst, i64 0, i32 1
  %4 = lshr i24 %3, 8
  %.partselect1 = trunc i24 %4 to i8
  store i8 %.partselect1, i8* %dst.1, align 1
  %dst.2 = getelementptr %struct.Pixel, %struct.Pixel* %dst, i64 0, i32 2
  %5 = lshr i24 %3, 16
  %.partselect = trunc i24 %5 to i8
  store i8 %.partselect, i8* %dst.2, align 2
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @onebyonecpy_hls.p0struct.Pixel.38(i24* noalias align 512 %dst, %struct.Pixel* noalias readonly %src) unnamed_addr #3 {
entry:
  %0 = icmp eq i24* %dst, null
  %1 = icmp eq %struct.Pixel* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0 = getelementptr %struct.Pixel, %struct.Pixel* %src, i64 0, i32 0
  %3 = load i8, i8* %src.0, align 1
  %4 = zext i8 %3 to i24
  %src.1 = getelementptr %struct.Pixel, %struct.Pixel* %src, i64 0, i32 1
  %5 = load i8, i8* %src.1, align 1
  %6 = zext i8 %5 to i24
  %7 = shl i24 %6, 8
  %.partset1 = or i24 %7, %4
  %src.2 = getelementptr %struct.Pixel, %struct.Pixel* %src, i64 0, i32 2
  %8 = load i8, i8* %src.2, align 1
  %9 = zext i8 %8 to i24
  %10 = shl i24 %9, 16
  %.partset = or i24 %.partset1, %10
  store i24 %.partset, i24* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare i8 @apatb_MeanShiftFiltering_hw(i24*, i24*, i32, i32, i8, i8, i8)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back(%struct.Pixel* noalias, i24* noalias readonly align 512, %struct.Pixel* noalias, i24* noalias readonly align 512) unnamed_addr #2 {
entry:
  call fastcc void @onebyonecpy_hls.p0struct.Pixel(%struct.Pixel* %2, i24* align 512 %3)
  ret void
}

define i8 @MeanShiftFiltering_hw_stub_wrapper(i24*, i24*, i32, i32, i8, i8, i8) #4 {
entry:
  %7 = alloca %struct.Pixel
  %8 = alloca %struct.Pixel
  call void @copy_out(%struct.Pixel* %7, i24* %0, %struct.Pixel* %8, i24* %1)
  %9 = call i8 @MeanShiftFiltering_hw_stub(%struct.Pixel* %7, %struct.Pixel* %8, i32 %2, i32 %3, i8 %4, i8 %5, i8 %6)
  call void @copy_in(%struct.Pixel* %7, i24* %0, %struct.Pixel* %8, i24* %1)
  ret i8 %9
}

declare i8 @MeanShiftFiltering_hw_stub(%struct.Pixel*, %struct.Pixel*, i32, i32, i8, i8, i8)

attributes #0 = { inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
