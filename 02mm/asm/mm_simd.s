	.file	"mm.cc"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"clock_gettime"
	.text
	.p2align 4
	.type	_ZL11cur_time_nsv, @function
_ZL11cur_time_nsv:
.LFB7671:
	.cfi_startproc
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	xorl	%edi, %edi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rsi
	call	clock_gettime@PLT
	cmpl	$-1, %eax
	je	.L6
	imulq	$1000000000, (%rsp), %rax
	addq	8(%rsp), %rax
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L7
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L6:
	.cfi_restore_state
	leaq	.LC0(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
.L7:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE7671:
	.size	_ZL11cur_time_nsv, .-_ZL11cur_time_nsv
	.section	.rodata.str1.1
.LC1:
	.string	"counter.h"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"%s:%d:perf_counter_get: the caller thread (%ld) is invalid (!= %ld)\n"
	.section	.rodata.str1.1
.LC3:
	.string	"read"
	.section	.rodata.str1.8
	.align 8
.LC4:
	.string	"long long int perf_counter_get(perf_counter_t)"
	.section	.rodata.str1.1
.LC5:
	.string	"rd == sizeof(long long)"
	.text
	.p2align 4
	.type	_ZL16perf_counter_get14perf_counter_t.isra.0, @function
_ZL16perf_counter_get14perf_counter_t.isra.0:
.LFB7841:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%esi, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	pthread_self@PLT
	cmpq	%rbp, %rax
	jne	.L17
	movq	$0, (%rsp)
	cmpl	$-1, %ebx
	je	.L15
	movq	%rsp, %rsi
	movl	$8, %edx
	movl	%ebx, %edi
	call	read@PLT
	cmpq	$-1, %rax
	je	.L18
	cmpq	$8, %rax
	jne	.L13
	movq	(%rsp), %rax
.L8:
	movq	8(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L19
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L15:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L8
.L17:
	movq	stderr(%rip), %rdi
	movq	%rax, %r8
	movq	%rbp, %r9
	movl	$109, %ecx
	leaq	.LC1(%rip), %rdx
	leaq	.LC2(%rip), %rsi
	xorl	%eax, %eax
	call	fprintf@PLT
	movq	$-1, %rax
	jmp	.L8
.L19:
	call	__stack_chk_fail@PLT
.L13:
	leaq	.LC4(%rip), %rcx
	movl	$119, %edx
	leaq	.LC1(%rip), %rsi
	leaq	.LC5(%rip), %rdi
	call	__assert_fail@PLT
.L18:
	leaq	.LC3(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE7841:
	.size	_ZL16perf_counter_get14perf_counter_t.isra.0, .-_ZL16perf_counter_get14perf_counter_t.isra.0
	.p2align 4
	.globl	_Z4set1f
	.type	_Z4set1f, @function
_Z4set1f:
.LFB7677:
	.cfi_startproc
	vbroadcastss	%xmm0, %ymm0
	ret
	.cfi_endproc
.LFE7677:
	.size	_Z4set1f, .-_Z4set1f
	.p2align 4
	.globl	_Z4zeroR6matrixll
	.type	_Z4zeroR6matrixll, @function
_Z4zeroR6matrixll:
.LFB7681:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	vmovq	%rsi, %xmm1
	movq	%rdi, %r13
	vpinsrq	$1, %rdx, %xmm1, %xmm0
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	leaq	0(,%rdx,4), %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rdx, 16(%rdi)
	movq	%rsi, %rdx
	movl	$64, %esi
	imulq	%rbp, %rdx
	vmovdqu	%xmm0, (%rdi)
	movq	%rsp, %rdi
	call	posix_memalign@PLT
	movq	(%rsp), %rcx
	testl	%eax, %eax
	je	.L22
	xorl	%ecx, %ecx
.L22:
	movq	%rcx, 24(%r13)
	testq	%r12, %r12
	jle	.L21
	testq	%rbx, %rbx
	jle	.L21
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L24:
	movq	%rcx, %rdi
	movq	%rbp, %rdx
	xorl	%esi, %esi
	incq	%rbx
	call	memset@PLT
	movq	%rax, %rcx
	addq	%rbp, %rcx
	cmpq	%rbx, %r12
	jne	.L24
.L21:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L31
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L31:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE7681:
	.size	_Z4zeroR6matrixll, .-_Z4zeroR6matrixll
	.p2align 4
	.globl	_Z4initR6matrixllPt
	.type	_Z4initR6matrixllPt, @function
_Z4initR6matrixllPt:
.LFB7682:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	vmovq	%rsi, %xmm2
	movq	%rdi, %r15
	vpinsrq	$1, %rdx, %xmm2, %xmm0
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	movq	%rdx, 16(%rdi)
	movq	%rsi, %rdx
	movl	$64, %esi
	imulq	%rbp, %rdx
	vmovdqu	%xmm0, (%rdi)
	movq	%rsp, %rdi
	salq	$2, %rdx
	call	posix_memalign@PLT
	movl	%eax, %edx
	movq	(%rsp), %rax
	testl	%edx, %edx
	je	.L33
	xorl	%eax, %eax
.L33:
	movq	%rax, 24(%r15)
	testq	%r13, %r13
	jle	.L32
	xorl	%ebx, %ebx
	testq	%rbp, %rbp
	jle	.L32
	.p2align 4,,10
	.p2align 3
.L35:
	xorl	%r14d, %r14d
	.p2align 4,,10
	.p2align 3
.L36:
	movq	%r12, %rdi
	call	erand48@PLT
	vmovsd	.LC7(%rip), %xmm1
	movq	16(%r15), %rax
	movq	24(%r15), %rdx
	vfmadd132sd	.LC6(%rip), %xmm1, %xmm0
	imulq	%rbx, %rax
	addq	%r14, %rax
	incq	%r14
	vcvtsd2ss	%xmm0, %xmm0, %xmm0
	vmovss	%xmm0, (%rdx,%rax,4)
	cmpq	%r14, %rbp
	jne	.L36
	incq	%rbx
	cmpq	%rbx, %r13
	jne	.L35
.L32:
	movq	8(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L44
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L44:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE7682:
	.size	_Z4initR6matrixllPt, .-_Z4initR6matrixllPt
	.p2align 4
	.globl	_Z7destroyR6matrix
	.type	_Z7destroyR6matrix, @function
_Z7destroyR6matrix:
.LFB7683:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	vpxor	%xmm0, %xmm0, %xmm0
	movq	%rdi, %rbx
	movq	$0, 16(%rdi)
	vmovdqu	%xmm0, (%rdi)
	movq	24(%rdi), %rdi
	call	free@PLT
	movq	$0, 24(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7683:
	.size	_Z7destroyR6matrix, .-_Z7destroyR6matrix
	.section	.rodata.str1.8
	.align 8
.LC8:
	.string	"void mm(matrix&, matrix&, matrix&)"
	.section	.rodata.str1.1
.LC9:
	.string	"mm_simd.h"
.LC10:
	.string	"B.n_rows == K"
.LC11:
	.string	"C.n_rows == M"
.LC12:
	.string	"C.n_cols == N"
.LC13:
	.string	"N % (2L * L) == 0"
.LC14:
	.string	"M % 8 == 0"
	.text
	.p2align 4
	.globl	_Z2mmR6matrixS0_S0_
	.type	_Z2mmR6matrixS0_S0_, @function
_Z2mmR6matrixS0_S0_:
.LFB7684:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	.cfi_offset 15, -24
	movq	%rdi, %r15
	movq	%rsi, %rdi
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$192, %rsp
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	8(%r15), %rbx
	movq	(%r15), %r8
	movq	%rsi, 24(%rsp)
	movq	8(%rsi), %rsi
	movq	%rbx, 184(%rsp)
	movq	%rsi, 88(%rsp)
	cmpq	%rbx, (%rdi)
	jne	.L66
	movq	%rdx, %rax
	cmpq	%r8, (%rdx)
	jne	.L67
	cmpq	%rsi, 8(%rdx)
	jne	.L68
	testb	$15, 88(%rsp)
	jne	.L69
	testb	$7, %r8b
	jne	.L52
	testq	%r8, %r8
	jle	.L64
	cmpq	$0, 88(%rsp)
	jle	.L64
	movq	24(%rdx), %rdx
	movq	16(%rax), %rsi
	movq	$0, 160(%rsp)
	movq	%r8, (%rsp)
	.p2align 4,,10
	.p2align 3
.L55:
	movq	160(%rsp), %rax
	movq	%rdx, 16(%rsp)
	movq	%rsi, 8(%rsp)
	leaq	3(%rax), %rcx
	leaq	1(%rax), %rbx
	leaq	2(%rax), %rdi
	leaq	4(%rax), %r9
	movq	%rbx, 80(%rsp)
	leaq	5(%rax), %r10
	leaq	6(%rax), %r11
	movq	%rdi, 72(%rsp)
	leaq	7(%rax), %r8
	movq	%r9, 56(%rsp)
	imulq	%rsi, %rax
	movq	%r10, 48(%rsp)
	movq	%r11, 40(%rsp)
	movq	%r8, 32(%rsp)
	leaq	(%rdx,%rax,4), %rax
	movq	%rcx, 64(%rsp)
	movq	%rax, 96(%rsp)
	movq	%rbx, %rax
	imulq	%rsi, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 104(%rsp)
	movq	%rdi, %rax
	imulq	%rsi, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 112(%rsp)
	movq	%rcx, %rax
	xorl	%ecx, %ecx
	imulq	%rsi, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 120(%rsp)
	movq	%r9, %rax
	imulq	%rsi, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 128(%rsp)
	movq	%r10, %rax
	imulq	%rsi, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 136(%rsp)
	movq	%r11, %rax
	imulq	%rsi, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 144(%rsp)
	movq	%r8, %rax
	imulq	%rsi, %rax
	leaq	(%rdx,%rax,4), %rax
	movq	%rax, 152(%rsp)
	.p2align 4,,10
	.p2align 3
.L60:
	addq	$8, %rcx
	cmpq	$0, 184(%rsp)
	jle	.L70
	movq	16(%r15), %rsi
	movq	160(%rsp), %rax
	vxorps	%xmm8, %xmm8, %xmm8
	movq	80(%rsp), %r12
	movq	72(%rsp), %rbx
	vmovaps	%ymm8, %ymm7
	vmovaps	%ymm8, %ymm6
	movq	64(%rsp), %r11
	movq	56(%rsp), %r10
	vmovaps	%ymm8, %ymm5
	vmovaps	%ymm8, %ymm4
	movq	48(%rsp), %r9
	movq	40(%rsp), %r8
	imulq	%rsi, %r12
	vmovaps	%ymm8, %ymm3
	movq	32(%rsp), %rdi
	imulq	%rsi, %rbx
	movq	24(%rsp), %rdx
	vmovaps	%ymm8, %ymm2
	imulq	%rsi, %r11
	vmovaps	%ymm8, %ymm1
	imulq	%rsi, %r10
	movq	16(%rdx), %r14
	movq	24(%rdx), %rdx
	imulq	%rsi, %r9
	imulq	%rsi, %r8
	movq	%r14, 168(%rsp)
	leaq	0(,%r14,4), %r13
	movq	184(%rsp), %r14
	imulq	%rsi, %rdi
	leaq	-32(%rdx,%rcx,4), %rdx
	imulq	%rax, %rsi
	movq	24(%r15), %rax
	leaq	(%rax,%rsi,4), %rax
	addq	%rsi, %r14
	subq	%rsi, %r12
	subq	%rsi, %rbx
	movq	%rax, 176(%rsp)
	movq	24(%r15), %rax
	subq	%rsi, %r11
	subq	%rsi, %r10
	subq	%rsi, %r9
	subq	%rsi, %r8
	subq	%rsi, %rdi
	leaq	(%rax,%r14,4), %r14
	movq	176(%rsp), %rax
	.p2align 4,,10
	.p2align 3
.L56:
	vbroadcastss	(%rax), %ymm0
	vbroadcastss	(%rax,%r12,4), %ymm9
	vfmadd231ps	(%rdx), %ymm0, %ymm1
	vmovups	32(%rdx), %ymm0
	addq	%r13, %rdx
	vfmadd231ps	%ymm0, %ymm9, %ymm2
	vbroadcastss	(%rax,%rbx,4), %ymm9
	vfmadd231ps	%ymm0, %ymm9, %ymm3
	vbroadcastss	(%rax,%r11,4), %ymm9
	vfmadd231ps	%ymm0, %ymm9, %ymm4
	vbroadcastss	(%rax,%r10,4), %ymm9
	vfmadd231ps	%ymm0, %ymm9, %ymm5
	vbroadcastss	(%rax,%r9,4), %ymm9
	vfmadd231ps	%ymm0, %ymm9, %ymm6
	vbroadcastss	(%rax,%r8,4), %ymm9
	vfmadd231ps	%ymm0, %ymm9, %ymm7
	vbroadcastss	(%rax,%rdi,4), %ymm9
	addq	$4, %rax
	vfmadd231ps	%ymm0, %ymm9, %ymm8
	cmpq	%rax, %r14
	jne	.L56
.L59:
	movq	96(%rsp), %rax
	vaddps	-32(%rax,%rcx,4), %ymm1, %ymm1
	vmovups	%ymm1, -32(%rax,%rcx,4)
	movq	104(%rsp), %rax
	vaddps	-32(%rax,%rcx,4), %ymm2, %ymm2
	vmovups	%ymm2, -32(%rax,%rcx,4)
	movq	112(%rsp), %rax
	vaddps	-32(%rax,%rcx,4), %ymm3, %ymm3
	vmovups	%ymm3, -32(%rax,%rcx,4)
	movq	120(%rsp), %rax
	vaddps	-32(%rax,%rcx,4), %ymm4, %ymm4
	vmovups	%ymm4, -32(%rax,%rcx,4)
	movq	128(%rsp), %rax
	vaddps	-32(%rax,%rcx,4), %ymm5, %ymm5
	vmovups	%ymm5, -32(%rax,%rcx,4)
	movq	136(%rsp), %rax
	vaddps	-32(%rax,%rcx,4), %ymm6, %ymm6
	vmovups	%ymm6, -32(%rax,%rcx,4)
	movq	144(%rsp), %rax
	vaddps	-32(%rax,%rcx,4), %ymm7, %ymm7
	vmovups	%ymm7, -32(%rax,%rcx,4)
	movq	152(%rsp), %rax
	vaddps	-32(%rax,%rcx,4), %ymm8, %ymm8
	vmovups	%ymm8, -32(%rax,%rcx,4)
	cmpq	%rcx, 88(%rsp)
	jg	.L60
	addq	$8, 160(%rsp)
	movq	16(%rsp), %rdx
	movq	8(%rsp), %rsi
	movq	160(%rsp), %rax
	cmpq	%rax, (%rsp)
	jg	.L55
	vzeroupper
.L64:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L70:
	.cfi_restore_state
	vxorps	%xmm8, %xmm8, %xmm8
	vmovaps	%ymm8, %ymm7
	vmovaps	%ymm8, %ymm6
	vmovaps	%ymm8, %ymm5
	vmovaps	%ymm8, %ymm4
	vmovaps	%ymm8, %ymm3
	vmovaps	%ymm8, %ymm2
	vmovaps	%ymm8, %ymm1
	jmp	.L59
.L66:
	leaq	.LC8(%rip), %rcx
	movl	$12, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC10(%rip), %rdi
	call	__assert_fail@PLT
.L52:
	leaq	.LC8(%rip), %rcx
	movl	$16, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC14(%rip), %rdi
	call	__assert_fail@PLT
.L69:
	leaq	.LC8(%rip), %rcx
	movl	$15, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	call	__assert_fail@PLT
.L68:
	leaq	.LC8(%rip), %rcx
	movl	$14, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	__assert_fail@PLT
.L67:
	leaq	.LC8(%rip), %rcx
	movl	$13, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE7684:
	.size	_Z2mmR6matrixS0_S0_, .-_Z2mmR6matrixS0_S0_
	.section	.rodata.str1.8
	.align 8
.LC15:
	.ascii	"usage:\n  %s [options]:"
	.string	"\nperform matrix matrix multiply of (M,N) += (M,K) * (K,N) \noptions:\n -M num : set M to num (%ld)\n -N num : set N to num (%ld)\n -K num : set K to num (%ld)\n -r num : repeat num times (%ld)\n -x X : set random seed to X, to change initial configuration (%ld)\n"
	.text
	.p2align 4
	.globl	_Z4helpP9options_tPc
	.type	_Z4helpP9options_tPc, @function
_Z4helpP9options_tPc:
.LFB7685:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rsi, %rdx
	leaq	.LC15(%rip), %rsi
	xorl	%eax, %eax
	movq	(%rdi), %rcx
	pushq	32(%rdi)
	.cfi_def_cfa_offset 24
	pushq	24(%rdi)
	.cfi_def_cfa_offset 32
	movq	16(%rdi), %r9
	movq	8(%rdi), %r8
	movq	stderr(%rip), %rdi
	call	fprintf@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE7685:
	.size	_Z4helpP9options_tPc, .-_Z4helpP9options_tPc
	.section	.rodata.str1.1
.LC17:
	.string	"M:N:K:r:x:"
	.text
	.p2align 4
	.globl	_Z10parse_argsiPPcP9options_t
	.type	_Z10parse_argsiPPcP9options_t, @function
_Z10parse_argsiPPcP9options_t:
.LFB7686:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movabsq	$9876543210987654, %rax
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r14
	.cfi_offset 14, -24
	leaq	.LC17(%rip), %r14
	pushq	%r13
	.cfi_offset 13, -32
	movl	%edi, %r13d
	pushq	%r12
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%r10
	pushq	%rbx
	.cfi_offset 10, -48
	.cfi_offset 3, -56
	movq	%rdx, %rbx
	subq	$8, %rsp
	movq	%rax, 32(%rdx)
	vmovdqa	.LC16(%rip), %ymm0
	vmovdqu	%ymm0, (%rdx)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L74:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movl	%r13d, %edi
	call	getopt@PLT
	cmpl	$78, %eax
	je	.L75
	jg	.L76
	cmpl	$75, %eax
	je	.L77
	cmpl	$77, %eax
	je	.L78
	cmpl	$-1, %eax
	jne	.L80
	leaq	-40(%rbp), %rsp
	movl	$1, %eax
	popq	%rbx
	popq	%r10
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L76:
	.cfi_restore_state
	cmpl	$114, %eax
	je	.L81
	cmpl	$120, %eax
	jne	.L80
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 32(%rbx)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L75:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 8(%rbx)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L81:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 24(%rbx)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L78:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, (%rbx)
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L77:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 16(%rbx)
	jmp	.L74
.L80:
	movq	(%rbx), %rcx
	movq	(%r12), %rdx
	pushq	32(%rbx)
	leaq	.LC15(%rip), %rsi
	movq	stderr(%rip), %rdi
	xorl	%eax, %eax
	pushq	24(%rbx)
	movq	16(%rbx), %r9
	movq	8(%rbx), %r8
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE7686:
	.size	_Z10parse_argsiPPcP9options_t, .-_Z10parse_argsiPPcP9options_t
	.section	.rodata.str1.1
.LC22:
	.string	"error: C(%ld,%ld) = %f != %f\n"
.LC23:
	.string	"OK: max relative error = %f\n"
	.text
	.p2align 4
	.globl	_Z5checkR6matrixS0_S0_l
	.type	_Z5checkR6matrixS0_S0_l, @function
_Z5checkR6matrixS0_S0_l:
.LFB7687:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	vxorps	%xmm1, %xmm1, %xmm1
	vxorps	%xmm0, %xmm0, %xmm0
	andq	$-32, %rsp
	pushq	-8(%r10)
	vcvtsi2ssq	%rcx, %xmm1, %xmm1
	pushq	%rbp
	movq	%rsp, %rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	pushq	%r15
	.cfi_escape 0x10,0xf,0x2,0x76,0x78
	leaq	-64(%rbp), %r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	.cfi_escape 0x10,0xe,0x2,0x76,0x70
	.cfi_escape 0x10,0xd,0x2,0x76,0x68
	.cfi_escape 0x10,0xc,0x2,0x76,0x60
	movq	%rdi, %r12
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x58,0x6
	pushq	%rbx
	.cfi_escape 0x10,0x3,0x2,0x76,0x50
	movq	%rdx, %rbx
	subq	$64, %rsp
	movq	%rsi, -96(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movl	$723, %eax
	movl	$60162777, -64(%rbp)
	movw	%ax, -60(%rbp)
	movl	$10, %eax
	movq	%r15, -88(%rbp)
	movq	%rax, %r15
	vmovss	%xmm1, -76(%rbp)
	.p2align 4,,10
	.p2align 3
.L103:
	movq	-88(%rbp), %r14
	vmovss	%xmm0, -72(%rbp)
	movq	%r14, %rdi
	call	nrand48@PLT
	movq	%r14, %rdi
	cqto
	idivq	(%rbx)
	movq	%rdx, %r13
	call	nrand48@PLT
	vmovss	-72(%rbp), %xmm0
	cqto
	idivq	8(%rbx)
	movq	8(%r12), %rax
	testq	%rax, %rax
	jle	.L105
	movq	-96(%rbp), %rdi
	movq	16(%r12), %rsi
	leaq	-1(%rax), %rcx
	movq	24(%r12), %r9
	movq	24(%rdi), %r8
	movq	16(%rdi), %rdi
	imulq	%r13, %rsi
	cmpq	$1, %rdi
	jne	.L120
	cmpq	$6, %rcx
	jbe	.L107
	movq	%rax, %rdi
	leaq	(%r9,%rsi,4), %r11
	leaq	(%r8,%rdx,4), %r10
	xorl	%ecx, %ecx
	shrq	$3, %rdi
	vxorps	%xmm1, %xmm1, %xmm1
	salq	$5, %rdi
	.p2align 4,,10
	.p2align 3
.L94:
	vmovups	(%r11,%rcx), %ymm5
	vmulps	(%r10,%rcx), %ymm5, %ymm3
	addq	$32, %rcx
	vaddss	%xmm3, %xmm1, %xmm1
	vshufps	$85, %xmm3, %xmm3, %xmm2
	vshufps	$255, %xmm3, %xmm3, %xmm4
	vaddss	%xmm2, %xmm1, %xmm1
	vunpckhps	%xmm3, %xmm3, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vextractf128	$0x1, %ymm3, %xmm2
	vunpckhps	%xmm2, %xmm2, %xmm3
	vaddss	%xmm4, %xmm1, %xmm4
	vaddss	%xmm2, %xmm4, %xmm1
	vshufps	$85, %xmm2, %xmm2, %xmm4
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm4, %xmm1, %xmm1
	vaddss	%xmm3, %xmm1, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	cmpq	%rcx, %rdi
	jne	.L94
	movq	%rax, %rcx
	andq	$-8, %rcx
	movq	%rcx, %rdi
	cmpq	%rax, %rcx
	je	.L121
	vzeroupper
.L93:
	movq	%rax, %r10
	subq	%rdi, %r10
	leaq	-1(%r10), %r11
	cmpq	$2, %r11
	jbe	.L98
	leaq	(%rsi,%rdi), %r11
	addq	%rdx, %rdi
	vmovups	(%r8,%rdi,4), %xmm2
	movq	%r10, %rdi
	andq	$-4, %rdi
	vmulps	(%r9,%r11,4), %xmm2, %xmm2
	addq	%rdi, %rcx
	andl	$3, %r10d
	vaddss	%xmm2, %xmm1, %xmm1
	vshufps	$85, %xmm2, %xmm2, %xmm3
	vaddss	%xmm3, %xmm1, %xmm1
	vunpckhps	%xmm2, %xmm2, %xmm3
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm3, %xmm1, %xmm1
	vaddss	%xmm2, %xmm1, %xmm1
	je	.L87
.L98:
	leaq	(%rdx,%rcx), %r10
	leaq	(%rsi,%rcx), %rdi
	vmovss	(%r8,%r10,4), %xmm7
	vfmadd231ss	(%r9,%rdi,4), %xmm7, %xmm1
	leaq	1(%rcx), %rdi
	cmpq	%rax, %rdi
	jge	.L87
	leaq	(%rdi,%rdx), %r10
	addq	$2, %rcx
	addq	%rsi, %rdi
	vmovss	(%r8,%r10,4), %xmm7
	vfmadd231ss	(%r9,%rdi,4), %xmm7, %xmm1
	cmpq	%rcx, %rax
	jle	.L87
	addq	%rcx, %rsi
	addq	%rdx, %rcx
	vmovss	(%r9,%rsi,4), %xmm7
	vfmadd231ss	(%r8,%rcx,4), %xmm7, %xmm1
.L87:
	movq	16(%rbx), %rax
	vmulss	-76(%rbp), %xmm1, %xmm1
	movq	24(%rbx), %rcx
	imulq	%r13, %rax
	addq	%rdx, %rax
	vmovss	(%rcx,%rax,4), %xmm3
	vsubss	%xmm1, %xmm3, %xmm2
	vdivss	%xmm1, %xmm2, %xmm2
	vandps	.LC20(%rip), %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm4
	vcomisd	.LC21(%rip), %xmm4
	ja	.L122
	vmaxss	%xmm0, %xmm2, %xmm0
	decq	%r15
	jne	.L103
	leaq	.LC23(%rip), %rdi
	movl	$1, %eax
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	printf@PLT
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L123
	addq	$64, %rsp
	popq	%rbx
	popq	%r10
	.cfi_remember_state
	.cfi_def_cfa 10, 0
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.p2align 4,,10
	.p2align 3
.L120:
	.cfi_restore_state
	cmpq	$2, %rcx
	jbe	.L106
	movq	%rdi, %rcx
	movq	%rax, %r11
	movq	%r8, -104(%rbp)
	leaq	(%r9,%rsi,4), %r10
	salq	$4, %rcx
	shrq	$2, %r11
	leaq	(%rdi,%rdi,2), %r14
	vxorps	%xmm1, %xmm1, %xmm1
	movq	%rcx, -72(%rbp)
	salq	$4, %r11
	leaq	(%r8,%rdx,4), %rcx
	salq	$2, %r14
	addq	%r10, %r11
	movq	-72(%rbp), %r8
	.p2align 4,,10
	.p2align 3
.L90:
	vmovss	(%rcx,%rdi,8), %xmm2
	vmovss	(%rcx), %xmm3
	addq	$16, %r10
	vinsertps	$0x10, (%rcx,%r14), %xmm2, %xmm2
	vinsertps	$0x10, (%rcx,%rdi,4), %xmm3, %xmm3
	addq	%r8, %rcx
	vmovlhps	%xmm2, %xmm3, %xmm3
	vmulps	-16(%r10), %xmm3, %xmm3
	vaddss	%xmm3, %xmm1, %xmm1
	vshufps	$85, %xmm3, %xmm3, %xmm2
	vaddss	%xmm2, %xmm1, %xmm1
	vunpckhps	%xmm3, %xmm3, %xmm2
	vshufps	$255, %xmm3, %xmm3, %xmm3
	vaddss	%xmm2, %xmm1, %xmm1
	vaddss	%xmm3, %xmm1, %xmm1
	cmpq	%r10, %r11
	jne	.L90
	movq	%rax, %rcx
	movq	-104(%rbp), %r8
	andq	$-4, %rcx
	testb	$3, %al
	je	.L87
.L89:
	movq	%rdi, %r10
	leaq	(%rsi,%rcx), %r11
	imulq	%rcx, %r10
	leaq	(%rdx,%r10), %r14
	vmovss	(%r8,%r14,4), %xmm6
	vfmadd231ss	(%r9,%r11,4), %xmm6, %xmm1
	leaq	1(%rcx), %r11
	cmpq	%r11, %rax
	jle	.L87
	addq	%rsi, %r11
	addq	%rdi, %r10
	addq	$2, %rcx
	vmovss	(%r9,%r11,4), %xmm6
	leaq	(%rdx,%r10), %r14
	vfmadd231ss	(%r8,%r14,4), %xmm6, %xmm1
	cmpq	%rcx, %rax
	jle	.L87
	addq	%rsi, %rcx
	leaq	(%rdx,%rdi), %rax
	vmovss	(%r9,%rcx,4), %xmm6
	addq	%r10, %rax
	vfmadd231ss	(%r8,%rax,4), %xmm6, %xmm1
	jmp	.L87
	.p2align 4,,10
	.p2align 3
.L105:
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.L87
.L121:
	vzeroupper
	jmp	.L87
.L107:
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.L93
.L106:
	xorl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.L89
.L122:
	movq	stderr(%rip), %rdi
	movq	%rdx, %rcx
	leaq	.LC22(%rip), %rsi
	movq	%r13, %rdx
	movl	$2, %eax
	vcvtss2sd	%xmm3, %xmm3, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L123:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE7687:
	.size	_Z5checkR6matrixS0_S0_l, .-_Z5checkR6matrixS0_S0_l
	.section	.rodata.str1.1
.LC24:
	.string	"A = %ld x %ld (%ld bytes)\n"
.LC25:
	.string	"B = %ld x %ld (%ld bytes)\n"
.LC26:
	.string	"C = %ld x %ld (%ld bytes)\n"
.LC27:
	.string	"repeat C += A * B %ld times\n"
.LC28:
	.string	"%ld flops, total %ld bytes\n"
.LC29:
	.string	"cpu cycles"
.LC30:
	.string	"instructions"
.LC31:
	.string	"branch instructions"
.LC32:
	.string	"perf_event_open"
.LC33:
	.string	"ioctl"
	.section	.rodata.str1.8
	.align 8
.LC34:
	.string	"%s:%d:warning: OS does not support perf_event. event counts are always zero\n"
	.section	.rodata.str1.1
.LC35:
	.string	"%20s: %ld\n"
.LC36:
	.string	"ref cycles"
.LC38:
	.string	"time"
.LC39:
	.string	"%20s: %.3f\n"
	.section	.rodata.str1.8
	.align 8
.LC40:
	.string	"%.3f flops/clock = %.3f vfmadds/clock\n"
	.align 8
.LC41:
	.string	"%.3f flops/cpu clock = %.3f vfmadds/cpu clock\n"
	.section	.rodata.str1.1
.LC42:
	.string	"%f GFLOPS\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB7688:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	leaq	-496(%rbp), %rdx
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%r10
	pushq	%rbx
	subq	$800, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 10, -56
	.cfi_offset 3, -64
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	call	_Z10parse_argsiPPcP9options_t
	movl	%eax, %edx
	movl	$1, %eax
	testl	%edx, %edx
	jne	.L165
.L124:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L166
	addq	$800, %rsp
	popq	%rbx
	popq	%r10
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L165:
	.cfi_restore_state
	movq	-464(%rbp), %rax
	movq	-480(%rbp), %rbx
	leaq	-504(%rbp), %r14
	movq	-496(%rbp), %r12
	movq	-488(%rbp), %r13
	movq	%rax, %rcx
	movl	%eax, %edx
	movw	%ax, -500(%rbp)
	leaq	-736(%rbp), %rax
	sarq	$32, %rcx
	xorw	%dx, %dx
	movq	%r12, %rsi
	movq	%rax, %rdi
	movzwl	%cx, %ecx
	movq	%rax, -824(%rbp)
	orl	%ecx, %edx
	movq	%r14, %rcx
	movl	%edx, -504(%rbp)
	movq	%rbx, %rdx
	call	_Z4initR6matrixllPt
	leaq	-704(%rbp), %rax
	movq	%r14, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rax, -776(%rbp)
	movq	%r13, %r14
	call	_Z4initR6matrixllPt
	leaq	-672(%rbp), %rax
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rax, %rdi
	movq	%rax, -816(%rbp)
	imulq	%rbx, %r14
	call	_Z4zeroR6matrixll
	movq	%r12, %rax
	movq	-472(%rbp), %rcx
	movq	%r12, %r8
	imulq	%r13, %rax
	movq	%r12, %rsi
	leaq	.LC24(%rip), %rdi
	movq	%rcx, -784(%rbp)
	imulq	%rbx, %r8
	salq	$2, %r14
	leaq	0(,%rax,4), %r15
	imulq	%rbx, %rax
	salq	$2, %r8
	movq	%r8, -792(%rbp)
	imulq	%rcx, %rax
	movl	$16, %ecx
	addq	%rax, %rax
	cqto
	movq	%rax, -808(%rbp)
	idivq	%rcx
	movq	%r8, %rcx
	movq	%rbx, %rdx
	movq	%rax, -832(%rbp)
	xorl	%eax, %eax
	call	printf@PLT
	movq	%r14, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	leaq	.LC25(%rip), %rdi
	xorl	%eax, %eax
	leaq	-640(%rbp), %rbx
	call	printf@PLT
	movq	%r15, %rcx
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	.LC26(%rip), %rdi
	xorl	%eax, %eax
	leaq	-360(%rbp), %r13
	call	printf@PLT
	movq	-784(%rbp), %rsi
	leaq	.LC27(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	-792(%rbp), %r8
	movq	-808(%rbp), %rsi
	leaq	.LC28(%rip), %rdi
	xorl	%eax, %eax
	leaq	(%r8,%r14), %rdx
	leaq	-208(%rbp), %r14
	addq	%r15, %rdx
	movq	%r14, %r12
	call	printf@PLT
	xorl	%eax, %eax
	movq	$1, -192(%rbp)
	movq	%rax, -208(%rbp)
	leaq	.LC29(%rip), %rax
	movq	%rax, -200(%rbp)
	leaq	.LC30(%rip), %rax
	movq	%rax, -184(%rbp)
	leaq	.LC31(%rip), %rax
	movq	$4, -176(%rbp)
	movq	%rax, -168(%rbp)
	movq	$3, -368(%rbp)
	call	pthread_self@PLT
	movq	%r14, -840(%rbp)
	movq	%rax, -792(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, -800(%rbp)
.L131:
	movq	(%r12), %rax
	vpxor	%xmm0, %xmm0, %xmm0
	movl	$0, -756(%rbp)
	xorl	%r9d, %r9d
	vmovdqu	%ymm0, (%rbx)
	xorl	%edx, %edx
	movl	$-1, %r8d
	movl	$-1, %ecx
	vmovdqu	%ymm0, 32(%rbx)
	movq	%rbx, %rsi
	movl	$298, %edi
	movq	8(%r12), %r15
	movq	%rax, -632(%rbp)
	xorl	%eax, %eax
	movq	$0, 128(%rbx)
	movl	$136, -636(%rbp)
	movb	$97, -600(%rbp)
	vmovdqu	%ymm0, 64(%rbx)
	vmovdqu	%ymm0, 96(%rbx)
	vzeroupper
	call	syscall@PLT
	movl	%eax, %r14d
	cmpl	$-1, %eax
	je	.L167
	xorl	%edx, %edx
	movl	%eax, %edi
	movl	$9219, %esi
	xorl	%eax, %eax
	call	ioctl@PLT
	cmpl	$-1, %eax
	je	.L129
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$9216, %esi
	movl	%r14d, %edi
	call	ioctl@PLT
	incl	%eax
	je	.L129
.L130:
	movq	-792(%rbp), %rax
	movl	%r14d, -760(%rbp)
	addq	$16, %r12
	addq	$24, %r13
	movq	%r15, -8(%r13)
	movq	%rax, -768(%rbp)
	movq	-800(%rbp), %rax
	movq	%r15, -752(%rbp)
	vmovdqa	-768(%rbp), %xmm4
	vmovdqu	%xmm4, -24(%r13)
	cmpq	%rax, %r12
	jne	.L131
	movq	$3, -288(%rbp)
	movq	-840(%rbp), %r14
	leaq	-296(%rbp), %rbx
	call	_ZL11cur_time_nsv
	movq	%rax, -280(%rbp)
	leaq	-368(%rbp), %rax
	movq	%rax, -792(%rbp)
	movq	%rax, %r15
	movq	%rax, %r13
.L132:
	movq	24(%r13), %rax
	movl	16(%r13), %esi
	addq	$24, %r13
	addq	$8, %r15
	movq	-16(%r13), %rdi
	movq	%rax, 96(%r15)
	call	_ZL16perf_counter_get14perf_counter_t.isra.0
	movq	%rax, 120(%r15)
	cmpq	%rbx, %r13
	jne	.L132
	rdtsc
	salq	$32, %rdx
	movq	-784(%rbp), %r12
	orq	%rdx, %rax
	movq	%rax, -272(%rbp)
	testq	%r12, %r12
	jle	.L133
	movq	-816(%rbp), %r13
	movq	-824(%rbp), %r15
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L134:
	movq	-776(%rbp), %rsi
	movq	%r13, %rdx
	movq	%r15, %rdi
	incq	%rbx
	call	_Z2mmR6matrixS0_S0_
	cmpq	%rbx, %r12
	jne	.L134
.L133:
	movq	-792(%rbp), %rsi
	movl	$38, %ecx
	movq	%r14, %rdi
	rep movsl
	movq	-208(%rbp), %rbx
	call	_ZL11cur_time_nsv
	subq	-120(%rbp), %rax
	movq	%rax, -800(%rbp)
	testq	%rbx, %rbx
	jle	.L135
	movq	%r14, %r12
	xorl	%r13d, %r13d
	leaq	-448(%rbp), %r15
.L136:
	movq	104(%r14,%r13,8), %rax
	movl	16(%r12), %esi
	addq	$24, %r12
	movq	-16(%r12), %rdi
	movq	%rax, 24(%r15,%r13,8)
	call	_ZL16perf_counter_get14perf_counter_t.isra.0
	subq	128(%r14,%r13,8), %rax
	movq	%rax, 48(%r15,%r13,8)
	incq	%r13
	cmpq	%r13, %rbx
	jne	.L136
.L135:
	rdtsc
	movl	$38, %ecx
	movq	-792(%rbp), %rsi
	salq	$32, %rdx
	movq	%r14, %rdi
	orq	%rdx, %rax
	subq	-112(%rbp), %rax
	rep movsl
	movq	%rax, %r13
	movl	-192(%rbp), %edi
	cmpl	$-1, %edi
	je	.L137
	call	close@PLT
.L137:
	movl	-168(%rbp), %edi
	cmpl	$-1, %edi
	je	.L138
	call	close@PLT
.L138:
	movl	-144(%rbp), %edi
	cmpl	$-1, %edi
	je	.L139
	call	close@PLT
.L139:
	movq	-400(%rbp), %rax
	leaq	.LC35(%rip), %r12
	movq	%rax, -792(%rbp)
	testq	%rbx, %rbx
	jle	.L140
	xorl	%r14d, %r14d
	leaq	-448(%rbp), %r15
.L141:
	movq	48(%r15,%r14,8), %rdx
	movq	24(%r15,%r14,8), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	incq	%r14
	call	printf@PLT
	cmpq	%rbx, %r14
	jne	.L141
.L140:
	movq	%r13, %rdx
	leaq	.LC36(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	.LC38(%rip), %rsi
	leaq	.LC39(%rip), %rdi
	vcvtsi2sdq	-800(%rbp), %xmm5, %xmm2
	movl	$1, %eax
	vmulsd	.LC37(%rip), %xmm2, %xmm0
	vmovsd	%xmm2, -840(%rbp)
	call	printf@PLT
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	.LC40(%rip), %rdi
	movl	$2, %eax
	vcvtsi2sdq	-832(%rbp), %xmm5, %xmm3
	vcvtsi2sdq	%r13, %xmm5, %xmm1
	vcvtsi2sdq	-808(%rbp), %xmm5, %xmm0
	vmovsd	%xmm3, -800(%rbp)
	vmovq	%xmm0, %rbx
	vdivsd	%xmm1, %xmm0, %xmm0
	vdivsd	%xmm1, %xmm3, %xmm1
	call	printf@PLT
	vxorpd	%xmm5, %xmm5, %xmm5
	vmovsd	-800(%rbp), %xmm3
	vmovq	%rbx, %xmm7
	vcvtsi2sdq	-792(%rbp), %xmm5, %xmm1
	leaq	.LC41(%rip), %rdi
	movl	$2, %eax
	vdivsd	%xmm1, %xmm7, %xmm0
	vdivsd	%xmm1, %xmm3, %xmm1
	call	printf@PLT
	vmovsd	-840(%rbp), %xmm2
	vmovq	%rbx, %xmm6
	leaq	.LC42(%rip), %rdi
	movl	$1, %eax
	vdivsd	%xmm2, %xmm6, %xmm0
	call	printf@PLT
	movq	-784(%rbp), %rcx
	movq	-816(%rbp), %rdx
	movq	-776(%rbp), %rsi
	movq	-824(%rbp), %rdi
	call	_Z5checkR6matrixS0_S0_l
	movq	-712(%rbp), %rdi
	call	free@PLT
	movq	-680(%rbp), %rdi
	call	free@PLT
	movq	-648(%rbp), %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L124
.L167:
	leaq	.LC32(%rip), %rdi
	call	perror@PLT
.L127:
	movq	stderr(%rip), %rdi
	movl	$86, %ecx
	leaq	.LC1(%rip), %rdx
	leaq	.LC34(%rip), %rsi
	xorl	%eax, %eax
	orl	$-1, %r14d
	call	fprintf@PLT
	jmp	.L130
.L129:
	leaq	.LC33(%rip), %rdi
	call	perror@PLT
	jmp	.L127
.L166:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE7688:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC6:
	.long	0
	.long	1073741824
	.align 8
.LC7:
	.long	0
	.long	-1074790400
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC16:
	.quad	16
	.quad	32
	.quad	128
	.quad	1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC20:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC21:
	.long	-755914244
	.long	1062232653
	.align 8
.LC37:
	.long	-400107883
	.long	1041313291
	.ident	"GCC: (GNU) 13.1.1 20230429"
	.section	.note.GNU-stack,"",@progbits
