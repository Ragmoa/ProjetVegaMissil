	.file	"kernel.c"
	.text
	.p2align 4,,15
	.globl	kernel
	.type	kernel, @function
kernel:
.LFB28:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L10
	leal	-1(%rdi), %eax
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%edi, %r11
	movq	%r8, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	salq	$2, %r11
	leaq	4(%rcx,%rax,4), %r8
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L3:
	movslq	(%rdx,%rbx,4), %rax
	movq	%rbp, %r9
	leaq	(%rsi,%rax,4), %r10
	movq	%rcx, %rax
	.p2align 4,,10
	.p2align 3
.L4:
	movss	(%r10), %xmm0
	addq	$4, %rax
	divss	-4(%rax), %xmm0
	movss	%xmm0, (%r9)
	addq	%r11, %r9
	cmpq	%rax, %r8
	jne	.L4
	addq	$1, %rbx
	addq	$4, %rbp
	cmpl	%ebx, %edi
	jg	.L3
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
.L10:
	rep ret
	.cfi_endproc
.LFE28:
	.size	kernel, .-kernel
	.ident	"GCC: (GNU) 6.3.1 20170306"
	.section	.note.GNU-stack,"",@progbits
