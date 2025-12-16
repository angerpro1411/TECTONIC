; ModuleID = '/home/dell3561-49/Vitis_HLS_folder/ping_pong/ping_pong/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

; Function Attrs: inaccessiblememonly nounwind
declare void @llvm.sideeffect() #0

; Function Attrs: inaccessiblemem_or_argmemonly noinline
define void @apatb_algo_ir(i8* noalias nocapture nonnull readonly "fpga.decayed.dim.hint"="100" "partition" %vecIn, i8* noalias nocapture nonnull "fpga.decayed.dim.hint"="100" "partition" %vecOut) local_unnamed_addr #1 {
entry:
  %vecIn_copy_0 = alloca [50 x i8], align 512
  %vecIn_copy_1 = alloca [50 x i8], align 512
  %vecOut_copy_0 = alloca [50 x i8], align 512
  %vecOut_copy_1 = alloca [50 x i8], align 512
  %0 = bitcast i8* %vecIn to [100 x i8]*
  %1 = bitcast i8* %vecOut to [100 x i8]*
  call void @copy_in([100 x i8]* nonnull %0, [50 x i8]* nonnull align 512 %vecIn_copy_0, [50 x i8]* nonnull align 512 %vecIn_copy_1, [100 x i8]* nonnull %1, [50 x i8]* nonnull align 512 %vecOut_copy_0, [50 x i8]* nonnull align 512 %vecOut_copy_1)
  %vecIn_copy.gep_0 = getelementptr [50 x i8], [50 x i8]* %vecIn_copy_0, i64 0, i64 0
  %vecIn_copy.gep_1 = getelementptr [50 x i8], [50 x i8]* %vecIn_copy_1, i64 0, i64 0
  %vecOut_copy.gep_0 = getelementptr [50 x i8], [50 x i8]* %vecOut_copy_0, i64 0, i64 0
  %vecOut_copy.gep_1 = getelementptr [50 x i8], [50 x i8]* %vecOut_copy_1, i64 0, i64 0
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i8* %vecIn_copy.gep_0, i32 999, i32 1, i32 1, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i8* %vecIn_copy.gep_1, i32 999, i32 1, i32 1, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i8* %vecIn_copy.gep_0, i32 998, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i8* %vecIn_copy.gep_1, i32 998, i32 1, i32 0, i1 false) ], !dbg !19
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i8* %vecOut_copy.gep_0, i32 999, i32 1, i32 1, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i8* %vecOut_copy.gep_1, i32 999, i32 1, i32 1, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i8* %vecOut_copy.gep_0, i32 998, i32 1, i32 0, i1 false) ], !dbg !30
  call void @llvm.sideeffect() #8 [ "xlx_array_partition"(i8* %vecOut_copy.gep_1, i32 998, i32 1, i32 0, i1 false) ], !dbg !30
  call void @apatb_algo_hw([50 x i8]* %vecIn_copy_0, [50 x i8]* %vecIn_copy_1, [50 x i8]* %vecOut_copy_0, [50 x i8]* %vecOut_copy_1)
  call void @copy_back([100 x i8]* %0, [50 x i8]* %vecIn_copy_0, [50 x i8]* %vecIn_copy_1, [100 x i8]* %1, [50 x i8]* %vecOut_copy_0, [50 x i8]* %vecOut_copy_1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a100i8([100 x i8]* "orig.arg.no"="0" %dst, [100 x i8]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) local_unnamed_addr #2 {
entry:
  %0 = icmp eq [100 x i8]* %src, null
  %1 = icmp eq [100 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %for.loop ]
  %dst.addr = getelementptr [100 x i8], [100 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr = getelementptr [100 x i8], [100 x i8]* %src, i64 0, i64 %for.loop.idx2
  %3 = load i8, i8* %src.addr, align 1
  store i8 %3, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %for.loop, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: nounwind
declare void @llvm.assume(i1) #3

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a100i8.4.5([50 x i8]* "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [50 x i8]* "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [100 x i8]* readonly "orig.arg.no"="1" %src, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [100 x i8]* %src, null
  %1 = icmp eq [50 x i8]* %dst_0, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %dst.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %dst.addr.exit ]
  %3 = udiv i64 %for.loop.idx2, 2
  %4 = urem i64 %for.loop.idx2, 2
  %dst.addr_0 = getelementptr [50 x i8], [50 x i8]* %dst_0, i64 0, i64 %3
  %dst.addr_1 = getelementptr [50 x i8], [50 x i8]* %dst_1, i64 0, i64 %3
  %src.addr = getelementptr [100 x i8], [100 x i8]* %src, i64 0, i64 %for.loop.idx2
  %5 = load i8, i8* %src.addr, align 1
  %cond = icmp eq i64 %4, 0
  br i1 %cond, label %dst.addr.case.0, label %dst.addr.case.1

dst.addr.case.0:                                  ; preds = %for.loop
  store i8 %5, i8* %dst.addr_0, align 1
  br label %dst.addr.exit

dst.addr.case.1:                                  ; preds = %for.loop
  %6 = icmp eq i64 %4, 1
  call void @llvm.assume(i1 %6)
  store i8 %5, i8* %dst.addr_1, align 1
  br label %dst.addr.exit

dst.addr.exit:                                    ; preds = %dst.addr.case.1, %dst.addr.case.0
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %dst.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a100i8.3.6([50 x i8]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.0" %dst_0, [50 x i8]* noalias align 512 "orig.arg.no"="0" "unpacked"="0.1" %dst_1, [100 x i8]* noalias readonly "orig.arg.no"="1" %src) #4 {
entry:
  %0 = icmp eq [50 x i8]* %dst_0, null
  %1 = icmp eq [100 x i8]* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a100i8.4.5([50 x i8]* nonnull %dst_0, [50 x i8]* %dst_1, [100 x i8]* nonnull %src, i64 100)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_in([100 x i8]* noalias readonly "orig.arg.no"="0", [50 x i8]* noalias align 512 "orig.arg.no"="1" "unpacked"="1.0" %_0, [50 x i8]* noalias align 512 "orig.arg.no"="1" "unpacked"="1.1" %_1, [100 x i8]* noalias readonly "orig.arg.no"="2", [50 x i8]* noalias align 512 "orig.arg.no"="3" "unpacked"="3.0" %_01, [50 x i8]* noalias align 512 "orig.arg.no"="3" "unpacked"="3.1" %_12) #5 {
entry:
  call void @onebyonecpy_hls.p0a100i8.3.6([50 x i8]* align 512 %_0, [50 x i8]* align 512 %_1, [100 x i8]* %0)
  call void @onebyonecpy_hls.p0a100i8.3.6([50 x i8]* align 512 %_01, [50 x i8]* align 512 %_12, [100 x i8]* %1)
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define void @arraycpy_hls.p0a100i8.12.13([100 x i8]* "orig.arg.no"="0" %dst, [50 x i8]* readonly "orig.arg.no"="1" "unpacked"="1.0" %src_0, [50 x i8]* readonly "orig.arg.no"="1" "unpacked"="1.1" %src_1, i64 "orig.arg.no"="2" %num) #2 {
entry:
  %0 = icmp eq [50 x i8]* %src_0, null
  %1 = icmp eq [100 x i8]* %dst, null
  %2 = or i1 %1, %0
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %for.loop.cond1 = icmp sgt i64 %num, 0
  br i1 %for.loop.cond1, label %for.loop.lr.ph, label %copy.split

for.loop.lr.ph:                                   ; preds = %copy
  br label %for.loop

for.loop:                                         ; preds = %src.addr.exit, %for.loop.lr.ph
  %for.loop.idx2 = phi i64 [ 0, %for.loop.lr.ph ], [ %for.loop.idx.next, %src.addr.exit ]
  %3 = udiv i64 %for.loop.idx2, 2
  %4 = urem i64 %for.loop.idx2, 2
  %dst.addr = getelementptr [100 x i8], [100 x i8]* %dst, i64 0, i64 %for.loop.idx2
  %src.addr_0 = getelementptr [50 x i8], [50 x i8]* %src_0, i64 0, i64 %3
  %src.addr_1 = getelementptr [50 x i8], [50 x i8]* %src_1, i64 0, i64 %3
  %cond = icmp eq i64 %4, 0
  br i1 %cond, label %src.addr.case.0, label %src.addr.case.1

src.addr.case.0:                                  ; preds = %for.loop
  %_0 = load i8, i8* %src.addr_0, align 1
  br label %src.addr.exit

src.addr.case.1:                                  ; preds = %for.loop
  %5 = icmp eq i64 %4, 1
  call void @llvm.assume(i1 %5)
  %_1 = load i8, i8* %src.addr_1, align 1
  br label %src.addr.exit

src.addr.exit:                                    ; preds = %src.addr.case.1, %src.addr.case.0
  %6 = phi i8 [ %_0, %src.addr.case.0 ], [ %_1, %src.addr.case.1 ]
  store i8 %6, i8* %dst.addr, align 1
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx2, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, %num
  br i1 %exitcond, label %for.loop, label %copy.split

copy.split:                                       ; preds = %src.addr.exit, %copy
  br label %ret

ret:                                              ; preds = %copy.split, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @onebyonecpy_hls.p0a100i8.11.14([100 x i8]* noalias "orig.arg.no"="0" %dst, [50 x i8]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %src_0, [50 x i8]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %src_1) #4 {
entry:
  %0 = icmp eq [100 x i8]* %dst, null
  %1 = icmp eq [50 x i8]* %src_0, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  call void @arraycpy_hls.p0a100i8.12.13([100 x i8]* nonnull %dst, [50 x i8]* nonnull %src_0, [50 x i8]* %src_1, i64 100)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_out([100 x i8]* noalias "orig.arg.no"="0", [50 x i8]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %_0, [50 x i8]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %_1, [100 x i8]* noalias "orig.arg.no"="2", [50 x i8]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.0" %_01, [50 x i8]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.1" %_12) #6 {
entry:
  call void @onebyonecpy_hls.p0a100i8.11.14([100 x i8]* %0, [50 x i8]* align 512 %_0, [50 x i8]* align 512 %_1)
  call void @onebyonecpy_hls.p0a100i8.11.14([100 x i8]* %1, [50 x i8]* align 512 %_01, [50 x i8]* align 512 %_12)
  ret void
}

declare void @apatb_algo_hw([50 x i8]*, [50 x i8]*, [50 x i8]*, [50 x i8]*)

; Function Attrs: argmemonly noinline norecurse
define internal void @copy_back([100 x i8]* noalias "orig.arg.no"="0", [50 x i8]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.0" %_0, [50 x i8]* noalias readonly align 512 "orig.arg.no"="1" "unpacked"="1.1" %_1, [100 x i8]* noalias "orig.arg.no"="2", [50 x i8]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.0" %_01, [50 x i8]* noalias readonly align 512 "orig.arg.no"="3" "unpacked"="3.1" %_12) #6 {
entry:
  call void @onebyonecpy_hls.p0a100i8.11.14([100 x i8]* %1, [50 x i8]* align 512 %_01, [50 x i8]* align 512 %_12)
  ret void
}

define void @algo_hw_stub_wrapper([50 x i8]*, [50 x i8]*, [50 x i8]*, [50 x i8]*) #7 {
entry:
  %4 = alloca [100 x i8]
  %5 = alloca [100 x i8]
  call void @copy_out([100 x i8]* %4, [50 x i8]* %0, [50 x i8]* %1, [100 x i8]* %5, [50 x i8]* %2, [50 x i8]* %3)
  %6 = bitcast [100 x i8]* %4 to i8*
  %7 = bitcast [100 x i8]* %5 to i8*
  call void @algo_hw_stub(i8* %6, i8* %7)
  call void @copy_in([100 x i8]* %4, [50 x i8]* %0, [50 x i8]* %1, [100 x i8]* %5, [50 x i8]* %2, [50 x i8]* %3)
  ret void
}

declare void @algo_hw_stub(i8*, i8*)

attributes #0 = { inaccessiblememonly nounwind }
attributes #1 = { inaccessiblemem_or_argmemonly noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline norecurse "fpga.wrapper.func"="arraycpy_hls" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly noinline norecurse "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #5 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyin" }
attributes #6 = { argmemonly noinline norecurse "fpga.wrapper.func"="copyout" }
attributes #7 = { "fpga.wrapper.func"="stub" }
attributes #8 = { inaccessiblememonly nounwind "xlx.source"="user" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}
!datalayout.transforms.on.top = !{!5, !13}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
!5 = !{!6, !8, !10}
!6 = !{!7}
!7 = !{!"0", [100 x i8]* null}
!8 = !{!9}
!9 = !{!"array_partition", !"type=Cyclic", !"dim=1", !"factor=2"}
!10 = !{!11, !12}
!11 = !{!"0.0", [50 x i8]* null}
!12 = !{!"0.1", [50 x i8]* null}
!13 = !{!14, !8, !16}
!14 = !{!15}
!15 = !{!"1", [100 x i8]* null}
!16 = !{!17, !18}
!17 = !{!"1.0", [50 x i8]* null}
!18 = !{!"1.1", [50 x i8]* null}
!19 = !DILocation(line: 4, column: 9, scope: !20)
!20 = distinct !DISubprogram(name: "algo", scope: !21, file: !21, line: 3, type: !22, isLocal: false, isDefinition: true, scopeLine: 3, flags: DIFlagPrototyped, isOptimized: false, unit: !28, variables: !4)
!21 = !DIFile(filename: "../../C_PROGRAM/5.Ping_pong_HLS/ping_pong.c", directory: "/home/dell3561-49/Vitis_HLS_folder/ping_pong")
!22 = !DISubroutineType(types: !23)
!23 = !{null, !24, !24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!25 = !DIDerivedType(tag: DW_TAG_typedef, name: "data_t", file: !26, line: 9, baseType: !27)
!26 = !DIFile(filename: "../../C_PROGRAM/5.Ping_pong_HLS/ping_pong.h", directory: "/home/dell3561-49/Vitis_HLS_folder/ping_pong")
!27 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!28 = distinct !DICompileUnit(language: DW_LANG_C99, file: !29, producer: "clang version 7.0.0 ", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4)
!29 = !DIFile(filename: "/home/dell3561-49/Vitis_HLS_folder/ping_pong/ping_pong/solution1/.autopilot/db/ping_pong.pp.0.c", directory: "/home/dell3561-49/Vitis_HLS_folder/ping_pong")
!30 = !DILocation(line: 5, column: 9, scope: !20)
