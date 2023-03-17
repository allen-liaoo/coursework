	.file	"batt_update.c"
	.text
	.globl	set_display_from_batt
	.type	set_display_from_batt, @function
set_display_from_batt:
.LFB34:
	.cfi_startproc
	endbr64
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	movl	$63, (%rsp)
	movl	$6, 4(%rsp)
	movl	$91, 8(%rsp)
	movl	$79, 12(%rsp)
	movl	$102, 16(%rsp)
	movl	$109, 20(%rsp)
	movl	$125, 24(%rsp)
	movl	$7, 28(%rsp)
	movl	$127, 32(%rsp)
	movl	$111, 36(%rsp)
	movl	%edi, %edx
	sarl	$24, %edx
	cmpb	$2, %dl
	je	.L16
	movswl	%di, %r8d
	movswq	%di, %rax
	imulq	$1717986919, %rax, %rax
	sarq	$34, %rax
	movl	%r8d, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	movl	%r8d, %ecx
	subl	%eax, %ecx
	cmpl	$4, %ecx
	jle	.L4
	addl	$10, %r8d
.L4:
	movslq	%r8d, %rcx
	imulq	$1717986919, %rcx, %rcx
	sarq	$34, %rcx
	sarl	$31, %r8d
	subl	%r8d, %ecx
.L3:
	movslq	%ecx, %rax
	imulq	$1717986919, %rax, %rax
	sarq	$34, %rax
	movl	%ecx, %r8d
	sarl	$31, %r8d
	subl	%r8d, %eax
	movl	%eax, %r10d
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	cltq
	movl	(%rsp,%rax,4), %r9d
	movslq	%r10d, %rax
	imulq	$1717986919, %rax, %rax
	sarq	$34, %rax
	movl	%r10d, %ecx
	sarl	$31, %ecx
	subl	%ecx, %eax
	movl	%eax, %r8d
	leal	(%rax,%rax,4), %eax
	addl	%eax, %eax
	subl	%eax, %r10d
	movl	%r10d, %eax
	cltq
	movl	(%rsp,%rax,4), %ecx
	movslq	%r8d, %r8
	movl	(%rsp,%r8,4), %eax
	cmpb	$2, %dl
	je	.L17
.L5:
	sall	$14, %eax
	sall	$7, %ecx
	orl	%ecx, %eax
	orl	%r9d, %eax
	cmpb	$2, %dl
	je	.L18
	orl	$12582912, %eax
	movl	%eax, (%rsi)
.L7:
	sall	$8, %edi
	sarl	$24, %edi
	cmpb	$5, %dil
	jle	.L8
	movl	(%rsi), %eax
	orl	$16777216, %eax
	movl	%eax, (%rsi)
.L8:
	cmpb	$29, %dil
	jle	.L9
	movl	(%rsi), %eax
	orl	$33554432, %eax
	movl	%eax, (%rsi)
.L9:
	cmpb	$49, %dil
	jle	.L10
	movl	(%rsi), %eax
	orl	$67108864, %eax
	movl	%eax, (%rsi)
.L10:
	cmpb	$69, %dil
	jle	.L11
	movl	(%rsi), %eax
	orl	$134217728, %eax
	movl	%eax, (%rsi)
.L11:
	cmpb	$89, %dil
	jle	.L12
	movl	(%rsi), %eax
	orl	$268435456, %eax
	movl	%eax, (%rsi)
.L12:
	movq	40(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L19
	movl	$0, %eax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L16:
	.cfi_restore_state
	movl	%edi, %ecx
	sall	$8, %ecx
	sarl	$24, %ecx
	jmp	.L3
.L17:
	cmpl	$63, %eax
	jne	.L5
	cmpl	$63, %ecx
	je	.L14
	movl	$0, %eax
	jmp	.L5
.L14:
	movl	$0, %ecx
	movl	$0, %eax
	jmp	.L5
.L18:
	orl	$2097152, %eax
	movl	%eax, (%rsi)
	jmp	.L7
.L19:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE34:
	.size	set_display_from_batt, .-set_display_from_batt
	.globl	batt_update
	.type	batt_update, @function
batt_update:
.LFB35:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movl	$0, 4(%rsp)
	leaq	4(%rsp), %rdi
	call	set_batt_from_ports@PLT
	testl	%eax, %eax
	je	.L25
	movl	$1, %ebx
.L20:
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L26
	movl	%ebx, %eax
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L25:
	.cfi_restore_state
	movl	%eax, %ebx
	movq	%rsp, %rsi
	movl	4(%rsp), %edi
	call	set_display_from_batt
	movl	(%rsp), %eax
	movl	%eax, BATT_DISPLAY_PORT(%rip)
	jmp	.L20
.L26:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE35:
	.size	batt_update, .-batt_update
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
