# mark_description "Intel(R) C Intel(R) 64 Compiler for applications running on Intel(R) 64, Version 17.0.1.132 Build 20161005";
# mark_description "-S";
	.file "kernel.c"
	.text
..TXTST0:
# -- Begin  kernel
	.text
# mark_begin;
       .align    16,0x90
	.globl kernel
# --- kernel(int, float *, int32_t *, float *, float (*)[*])
kernel:
# parameter 1: %edi
# parameter 2: %rsi
# parameter 3: %rdx
# parameter 4: %rcx
# parameter 5: %r8
..B1.1:                         # Preds ..B1.0
                                # Execution count [1.00e+00]
	.cfi_startproc
..___tag_value_kernel.1:
..L2:
                                                          #11.75
        pushq     %rbx                                          #11.75
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
        pushq     %rbp                                          #11.75
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
        xorl      %ebx, %ebx                                    #14.2
        testl     %edi, %edi                                    #14.13
        jle       ..B1.11       # Prob 9%                       #14.13
                                # LOE rdx rcx rbx rsi r8 r12 r13 r14 r15 edi
..B1.2:                         # Preds ..B1.1
                                # Execution count [9.00e-01]
        movslq    %edi, %r9                                     #11.73
        movl      %edi, %ebp                                    #11.6
        shrl      $31, %ebp                                     #11.6
        addl      %edi, %ebp                                    #11.6
        sarl      $1, %ebp                                      #11.6
        movq      %r12, -56(%rsp)                               #16.4[spill]
        lea       (,%r9,4), %r10                                #16.4
        movq      %r10, %r11                                    #16.4
        lea       (%r8,%r9,4), %rax                             #16.4
        negq      %r11                                          #16.4
        movq      %r13, -48(%rsp)                               #16.4[spill]
        addq      %r8, %r11                                     #16.4
        movq      %r14, -40(%rsp)                               #16.4[spill]
        movq      %r15, -32(%rsp)                               #16.4[spill]
	.cfi_offset 12, -80
	.cfi_offset 13, -72
	.cfi_offset 14, -64
	.cfi_offset 15, -56
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 ebp edi
..B1.3:                         # Preds ..B1.9 ..B1.2
                                # Execution count [5.00e+00]
        movl      $1, %r13d                                     #15.3
        xorl      %r14d, %r14d                                  #15.3
        testl     %ebp, %ebp                                    #15.3
        jbe       ..B1.7        # Prob 10%                      #15.3
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 ebp edi r13d r14d
..B1.4:                         # Preds ..B1.3
                                # Execution count [4.50e+00]
        movslq    (%rdx,%rbx,4), %r12                           #16.15
        lea       (%r8,%rbx,4), %r15                            #16.4
        movq      %rdx, -16(%rsp)                               #16.15[spill]
        lea       (%rax,%rbx,4), %r13                           #16.4
        movq      %r8, -24(%rsp)                                #16.15[spill]
                                # LOE rax rcx rbx rsi r9 r10 r11 r12 r13 r15 ebp edi r14d
..B1.5:                         # Preds ..B1.5 ..B1.4
                                # Execution count [1.25e+01]
        movss     (%rsi,%r12,4), %xmm0                          #16.13
        lea       (%r14,%r14), %r8d                             #16.25
        movslq    %r8d, %r8                                     #16.25
        movslq    %r14d, %rdx                                   #16.4
        incl      %r14d                                         #15.3
        imulq     %r9, %rdx                                     #16.4
        divss     (%rcx,%r8,4), %xmm0                           #16.25
        movss     %xmm0, (%r15,%rdx,8)                          #16.4
        movss     (%rsi,%r12,4), %xmm1                          #16.13
        divss     4(%rcx,%r8,4), %xmm1                          #16.25
        movss     %xmm1, (%r13,%rdx,8)                          #16.4
        cmpl      %ebp, %r14d                                   #15.3
        jb        ..B1.5        # Prob 64%                      #15.3
                                # LOE rax rcx rbx rsi r9 r10 r11 r12 r13 r15 ebp edi r14d
..B1.6:                         # Preds ..B1.5
                                # Execution count [4.50e+00]
        movq      -16(%rsp), %rdx                               #[spill]
        lea       1(%r14,%r14), %r13d                           #16.4
        movq      -24(%rsp), %r8                                #[spill]
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 ebp edi r13d
..B1.7:                         # Preds ..B1.6 ..B1.3
                                # Execution count [5.00e+00]
        lea       -1(%r13), %r12d                               #15.3
        cmpl      %edi, %r12d                                   #15.3
        jae       ..B1.9        # Prob 10%                      #15.3
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 ebp edi r13d
..B1.8:                         # Preds ..B1.7
                                # Execution count [4.50e+00]
        movslq    (%rdx,%rbx,4), %r12                           #16.15
        movslq    %r13d, %r13                                   #16.25
        movss     (%rsi,%r12,4), %xmm0                          #16.13
        divss     -4(%rcx,%r13,4), %xmm0                        #16.25
        imulq     %r10, %r13                                    #16.4
        addq      %r11, %r13                                    #16.4
        movss     %xmm0, (%r13,%rbx,4)                          #16.4
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 ebp edi
..B1.9:                         # Preds ..B1.7 ..B1.8
                                # Execution count [5.00e+00]
        incq      %rbx                                          #14.2
        cmpq      %r9, %rbx                                     #14.2
        jb        ..B1.3        # Prob 82%                      #14.2
                                # LOE rax rdx rcx rbx rsi r8 r9 r10 r11 ebp edi
..B1.10:                        # Preds ..B1.9
                                # Execution count [9.00e-01]
        movq      -56(%rsp), %r12                               #[spill]
	.cfi_restore 12
        movq      -48(%rsp), %r13                               #[spill]
	.cfi_restore 13
        movq      -40(%rsp), %r14                               #[spill]
	.cfi_restore 14
        movq      -32(%rsp), %r15                               #[spill]
	.cfi_restore 15
                                # LOE r12 r13 r14 r15
..B1.11:                        # Preds ..B1.10 ..B1.1
                                # Execution count [1.00e+00]
	.cfi_restore 6
        popq      %rbp                                          #19.1
	.cfi_def_cfa_offset 16
	.cfi_restore 3
        popq      %rbx                                          #19.1
	.cfi_def_cfa_offset 8
        ret                                                     #19.1
        .align    16,0x90
                                # LOE
	.cfi_endproc
# mark_end;
	.type	kernel,@function
	.size	kernel,.-kernel
	.data
# -- End  kernel
	.data
	.section .note.GNU-stack, ""
// -- Begin DWARF2 SEGMENT .eh_frame
	.section .eh_frame,"a",@progbits
.eh_frame_seg:
	.align 8
# End
