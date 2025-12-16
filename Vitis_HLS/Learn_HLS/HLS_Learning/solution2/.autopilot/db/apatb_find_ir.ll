; ModuleID = '/home/dell3561-49/Vitis_HLS_folder/Learn_HLS/HLS_Learning/solution2/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<8>" = type { %"struct.ap_int_base<8, false>" }
%"struct.ap_int_base<8, false>" = type { %"struct.ssdm_int<8, false>" }
%"struct.ssdm_int<8, false>" = type { i8 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define void @apatb_find_ir(%"struct.ap_uint<8>"* nocapture readonly %val, %"struct.ap_uint<8>"* noalias nonnull "fpga.decayed.dim.hint"="10" %IN_VEC, %"struct.ap_uint<8>"* noalias nonnull "fpga.decayed.dim.hint"="10" %OUT_VEC) local_unnamed_addr #0 {
entry:
  %IN_VEC_copy = alloca [10 x i8], align 512
  %OUT_VEC_copy = alloca [10 x i8], align 512
  %0 = bitcast %"struct.ap_uint<8>"* %IN_VEC to [10 x %"struct.ap_uint<8>"]*
  %1 = bitcast %"struct.ap_uint<8>"* %OUT_VEC to [10 x %"struct.ap_uint<8>"]*
  call fastcc void @copy_in([10 x %"struct.ap_uint<8>"]* nonnull %0, [10 x i8]* nonnull align 512 %IN_VEC_copy, [10 x %"struct.ap_uint<8>"]* nonnull %1, [10 x i8]* nonnull align 512 %OUT_VEC_copy)
  call void @apatb_find_hw(%"struct.ap_uint<8>"* %val, [10 x i8]* %IN_VEC_copy, [10 x i8]* %OUT_VEC_copy)
  call void @copy_back([10 x %"struct.ap_uint<8>"]* %0, [10 x i8]* %IN_VEC_copy, [10 x %"struct.ap_uint<8>"]* %1, [10 x i8]* %OUT_VEC_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_in([10 x %"struct.ap_uint<8>"]* noalias readonly "unpacked"="0", [10 x i8]* noalias nocapture align 512 "unpacked"="1.0", [10 x %"struct.ap_uint<8>"]* noalias readonly "unpacked"="2", [10 x i8]* noalias nocapture align 512 "unpacked"="3.0") unnamed_addr #1 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<8>.12"([10 x i8]* align 512 %1, [10 x %"struct.ap_uint<8>"]* %0)
  call fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<8>.12"([10 x i8]* align 512 %3, [10 x %"struct.ap_uint<8>"]* %2)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_out([10 x %"struct.ap_uint<8>"]* noalias "unpacked"="0", [10 x i8]* noalias nocapture readonly align 512 "unpacked"="1.0", [10 x %"struct.ap_uint<8>"]* noalias "unpacked"="2", [10 x i8]* noalias nocapture readonly align 512 "unpacked"="3.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<8>"([10 x %"struct.ap_uint<8>"]* %0, [10 x i8]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<8>"([10 x %"struct.ap_uint<8>"]* %2, [10 x i8]* align 512 %3)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<8>"([10 x %"struct.ap_uint<8>"]* noalias "unpacked"="0" %dst, [10 x i8]* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [10 x %"struct.ap_uint<8>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a10struct.ap_uint<8>.8"([10 x %"struct.ap_uint<8>"]* nonnull %dst, [10 x i8]* %src, i64 10)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a10struct.ap_uint<8>.8"([10 x %"struct.ap_uint<8>"]* "unpacked"="0" %dst, [10 x i8]* nocapture readonly "unpacked"="1.0" %src, i64 "unpacked"="2" %num) local_unnamed_addr #4 {
entry:
  %0 = icmp eq [10 x %"struct.ap_uint<8>"]* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [10 x i8], [10 x i8]* %src, i64 0, i64 %for.loop.idx2
  %dst.addr.0.0.06 = getelementptr [10 x %"struct.ap_uint<8>"], [10 x %"struct.ap_uint<8>"]* %dst, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %1 = load i8, i8* %src.addr.0.0.05, align 1
  store i8 %1, i8* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<8>.12"([10 x i8]* noalias nocapture align 512 "unpacked"="0.0" %dst, [10 x %"struct.ap_uint<8>"]* noalias readonly "unpacked"="1" %src) unnamed_addr #3 {
entry:
  %0 = icmp eq [10 x %"struct.ap_uint<8>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @"arraycpy_hls.p0a10struct.ap_uint<8>.15"([10 x i8]* %dst, [10 x %"struct.ap_uint<8>"]* nonnull %src, i64 10)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @"arraycpy_hls.p0a10struct.ap_uint<8>.15"([10 x i8]* nocapture "unpacked"="0.0" %dst, [10 x %"struct.ap_uint<8>"]* readonly "unpacked"="1" %src, i64 "unpacked"="2" %num) local_unnamed_addr #4 {
entry:
  %0 = icmp eq [10 x %"struct.ap_uint<8>"]* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [10 x %"struct.ap_uint<8>"], [10 x %"struct.ap_uint<8>"]* %src, i64 0, i64 %for.loop.idx2, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [10 x i8], [10 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %1 = load i8, i8* %src.addr.0.0.05, align 1
  store i8 %1, i8* %dst.addr.0.0.06, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

declare void @apatb_find_hw(%"struct.ap_uint<8>"*, [10 x i8]*, [10 x i8]*)

; Function Attrs: argmemonly noinline norecurse
define internal fastcc void @copy_back([10 x %"struct.ap_uint<8>"]* noalias "unpacked"="0", [10 x i8]* noalias nocapture readonly align 512 "unpacked"="1.0", [10 x %"struct.ap_uint<8>"]* noalias "unpacked"="2", [10 x i8]* noalias nocapture readonly align 512 "unpacked"="3.0") unnamed_addr #2 {
entry:
  call fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<8>"([10 x %"struct.ap_uint<8>"]* %0, [10 x i8]* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0a10struct.ap_uint<8>"([10 x %"struct.ap_uint<8>"]* %2, [10 x i8]* align 512 %3)
  ret void
}

define void @find_hw_stub_wrapper(%"struct.ap_uint<8>"*, [10 x i8]*, [10 x i8]*) #5 {
entry:
  %3 = alloca [10 x %"struct.ap_uint<8>"]
  %4 = alloca [10 x %"struct.ap_uint<8>"]
  call void @copy_out([10 x %"struct.ap_uint<8>"]* %3, [10 x i8]* %1, [10 x %"struct.ap_uint<8>"]* %4, [10 x i8]* %2)
  %5 = bitcast [10 x %"struct.ap_uint<8>"]* %3 to %"struct.ap_uint<8>"*
  %6 = bitcast [10 x %"struct.ap_uint<8>"]* %4 to %"struct.ap_uint<8>"*
  call void @find_hw_stub(%"struct.ap_uint<8>"* %0, %"struct.ap_uint<8>"* %5, %"struct.ap_uint<8>"* %6)
  call void @copy_in([10 x %"struct.ap_uint<8>"]* %3, [10 x i8]* %1, [10 x %"struct.ap_uint<8>"]* %4, [10 x i8]* %2)
  ret void
}

declare void @find_hw_stub(%"struct.ap_uint<8>"*, %"struct.ap_uint<8>"*, %"struct.ap_uint<8>"*)

attributes #0 = { inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #3 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="arraycpy_hls" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
