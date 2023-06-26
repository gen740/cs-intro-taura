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
.LC9:
	.string	"void mm(matrix&, matrix&, matrix&)"
	.section	.rodata.str1.1
.LC10:
	.string	"mm_seq.h"
.LC11:
	.string	"B.n_rows == K"
.LC12:
	.string	"C.n_rows == M"
.LC13:
	.string	"C.n_cols == N"
	.text
	.p2align 4
	.globl	_Z2mmR6matrixS0_S0_
	.type	_Z2mmR6matrixS0_S0_, @function
_Z2mmR6matrixS0_S0_:
.LFB7684:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	8(%rsi), %rax
	movq	8(%rdi), %rbp
	movq	(%rdi), %rcx
	movq	%rax, (%rsp)
	cmpq	%rbp, (%rsi)
	jne	.L67
	cmpq	%rcx, (%rdx)
	jne	.L68
	cmpq	%rax, 8(%rdx)
	jne	.L50
	testq	%rcx, %rcx
	jle	.L65
	testq	%rax, %rax
	jle	.L65
	leaq	-1(%rbp), %rbx
	movq	%rsi, %r14
	movq	%rbp, %rsi
	movq	24(%rdx), %rax
	movq	%rbx, 8(%rsp)
	movq	%rbp, %rbx
	movq	16(%rdx), %rdx
	shrq	$2, %rsi
	andq	$-4, %rbx
	salq	$4, %rsi
	movq	%rcx, 40(%rsp)
	movq	%rdi, %r13
	movq	%rbx, 32(%rsp)
	movq	%rbp, %rbx
	xorl	%r15d, %r15d
	andl	$3, %ebx
	movq	%rsi, 16(%rsp)
	movq	%rbx, 24(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rdx, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L52:
	movq	56(%rsp), %rsi
	movq	48(%rsp), %rax
	imulq	%r15, %rsi
	leaq	(%rax,%rsi,4), %r12
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L59:
	vxorps	%xmm1, %xmm1, %xmm1
	testq	%rbp, %rbp
	jle	.L58
	movq	16(%r13), %r10
	movq	24(%r13), %r11
	movq	24(%r14), %rbx
	movq	16(%r14), %rcx
	imulq	%r15, %r10
	cmpq	$2, 8(%rsp)
	jbe	.L60
	movq	16(%rsp), %rdi
	leaq	(%r11,%r10,4), %rdx
	movq	%rcx, %r9
	leaq	(%rbx,%rsi,4), %rax
	salq	$4, %r9
	vxorps	%xmm1, %xmm1, %xmm1
	leaq	(%rdx,%rdi), %r8
	leaq	(%rcx,%rcx,2), %rdi
	salq	$2, %rdi
	.p2align 4,,10
	.p2align 3
.L54:
	vmovss	(%rax,%rcx,8), %xmm0
	addq	$16, %rdx
	vinsertps	$0x10, (%rax,%rdi), %xmm0, %xmm2
	vmovss	(%rax), %xmm0
	vinsertps	$0x10, (%rax,%rcx,4), %xmm0, %xmm0
	addq	%r9, %rax
	vmovlhps	%xmm2, %xmm0, %xmm0
	vmulps	-16(%rdx), %xmm0, %xmm0
	vaddss	%xmm1, %xmm0, %xmm1
	vshufps	$85, %xmm0, %xmm0, %xmm2
	vaddss	%xmm1, %xmm2, %xmm2
	vunpckhps	%xmm0, %xmm0, %xmm1
	vshufps	$255, %xmm0, %xmm0, %xmm0
	vaddss	%xmm2, %xmm1, %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	cmpq	%r8, %rdx
	jne	.L54
	cmpq	$0, 24(%rsp)
	je	.L58
	movq	32(%rsp), %rax
.L53:
	movq	%rcx, %rdx
	leaq	(%r10,%rax), %rdi
	imulq	%rax, %rdx
	leaq	(%rdx,%rsi), %r8
	vmovss	(%rbx,%r8,4), %xmm3
	vfmadd231ss	(%r11,%rdi,4), %xmm3, %xmm1
	leaq	1(%rax), %rdi
	cmpq	%rdi, %rbp
	jle	.L58
	addq	%r10, %rdi
	addq	%rcx, %rdx
	addq	$2, %rax
	vmovss	(%r11,%rdi,4), %xmm4
	leaq	(%rsi,%rdx), %r8
	vfmadd231ss	(%rbx,%r8,4), %xmm4, %xmm1
	cmpq	%rax, %rbp
	jle	.L58
	addq	%rsi, %rcx
	addq	%rax, %r10
	addq	%rdx, %rcx
	vmovss	(%rbx,%rcx,4), %xmm5
	vfmadd231ss	(%r11,%r10,4), %xmm5, %xmm1
.L58:
	vaddss	(%r12,%rsi,4), %xmm1, %xmm1
	vmovss	%xmm1, (%r12,%rsi,4)
	incq	%rsi
	cmpq	%rsi, (%rsp)
	jne	.L59
	incq	%r15
	cmpq	%r15, 40(%rsp)
	jne	.L52
.L65:
	addq	$72, %rsp
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
.L60:
	.cfi_restore_state
	xorl	%eax, %eax
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.L53
.L67:
	leaq	.LC9(%rip), %rcx
	movl	$9, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	__assert_fail@PLT
.L50:
	leaq	.LC9(%rip), %rcx
	movl	$11, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	call	__assert_fail@PLT
.L68:
	leaq	.LC9(%rip), %rcx
	movl	$10, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	__assert_fail@PLT
	.cfi_endproc
.LFE7684:
	.size	_Z2mmR6matrixS0_S0_, .-_Z2mmR6matrixS0_S0_
	.section	.rodata.str1.8
	.align 8
.LC14:
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
	leaq	.LC14(%rip), %rsi
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
.LC16:
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
	leaq	.LC16(%rip), %r14
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
	vmovdqa	.LC15(%rip), %ymm0
	vmovdqu	%ymm0, (%rdx)
	vzeroupper
	.p2align 4,,10
	.p2align 3
.L72:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movl	%r13d, %edi
	call	getopt@PLT
	cmpl	$78, %eax
	je	.L73
	jg	.L74
	cmpl	$75, %eax
	je	.L75
	cmpl	$77, %eax
	je	.L76
	cmpl	$-1, %eax
	jne	.L78
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
.L74:
	.cfi_restore_state
	cmpl	$114, %eax
	je	.L79
	cmpl	$120, %eax
	jne	.L78
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 32(%rbx)
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L73:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 8(%rbx)
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L79:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 24(%rbx)
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L76:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, (%rbx)
	jmp	.L72
	.p2align 4,,10
	.p2align 3
.L75:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 16(%rbx)
	jmp	.L72
.L78:
	movq	(%rbx), %rcx
	movq	(%r12), %rdx
	pushq	32(%rbx)
	leaq	.LC14(%rip), %rsi
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
.LC20:
	.string	"error: C(%ld,%ld) = %f != %f\n"
.LC21:
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
.L101:
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
	jle	.L103
	movq	-96(%rbp), %rdi
	movq	16(%r12), %rsi
	leaq	-1(%rax), %rcx
	movq	24(%r12), %r9
	movq	24(%rdi), %r8
	movq	16(%rdi), %rdi
	imulq	%r13, %rsi
	cmpq	$1, %rdi
	jne	.L118
	cmpq	$6, %rcx
	jbe	.L105
	movq	%rax, %rdi
	leaq	(%r9,%rsi,4), %r11
	leaq	(%r8,%rdx,4), %r10
	xorl	%ecx, %ecx
	shrq	$3, %rdi
	vxorps	%xmm1, %xmm1, %xmm1
	salq	$5, %rdi
	.p2align 4,,10
	.p2align 3
.L92:
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
	jne	.L92
	movq	%rax, %rcx
	andq	$-8, %rcx
	movq	%rcx, %rdi
	cmpq	%rax, %rcx
	je	.L119
	vzeroupper
.L91:
	movq	%rax, %r10
	subq	%rdi, %r10
	leaq	-1(%r10), %r11
	cmpq	$2, %r11
	jbe	.L96
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
	je	.L85
.L96:
	leaq	(%rdx,%rcx), %r10
	leaq	(%rsi,%rcx), %rdi
	vmovss	(%r8,%r10,4), %xmm7
	vfmadd231ss	(%r9,%rdi,4), %xmm7, %xmm1
	leaq	1(%rcx), %rdi
	cmpq	%rax, %rdi
	jge	.L85
	leaq	(%rdi,%rdx), %r10
	addq	$2, %rcx
	addq	%rsi, %rdi
	vmovss	(%r8,%r10,4), %xmm7
	vfmadd231ss	(%r9,%rdi,4), %xmm7, %xmm1
	cmpq	%rcx, %rax
	jle	.L85
	addq	%rcx, %rsi
	addq	%rdx, %rcx
	vmovss	(%r9,%rsi,4), %xmm7
	vfmadd231ss	(%r8,%rcx,4), %xmm7, %xmm1
.L85:
	movq	16(%rbx), %rax
	vmulss	-76(%rbp), %xmm1, %xmm1
	movq	24(%rbx), %rcx
	imulq	%r13, %rax
	addq	%rdx, %rax
	vmovss	(%rcx,%rax,4), %xmm3
	vsubss	%xmm1, %xmm3, %xmm2
	vdivss	%xmm1, %xmm2, %xmm2
	vandps	.LC18(%rip), %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm4
	vcomisd	.LC19(%rip), %xmm4
	ja	.L120
	vmaxss	%xmm0, %xmm2, %xmm0
	decq	%r15
	jne	.L101
	leaq	.LC21(%rip), %rdi
	movl	$1, %eax
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	printf@PLT
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L121
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
.L118:
	.cfi_restore_state
	cmpq	$2, %rcx
	jbe	.L104
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
.L88:
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
	jne	.L88
	movq	%rax, %rcx
	movq	-104(%rbp), %r8
	andq	$-4, %rcx
	testb	$3, %al
	je	.L85
.L87:
	movq	%rdi, %r10
	leaq	(%rsi,%rcx), %r11
	imulq	%rcx, %r10
	leaq	(%rdx,%r10), %r14
	vmovss	(%r8,%r14,4), %xmm6
	vfmadd231ss	(%r9,%r11,4), %xmm6, %xmm1
	leaq	1(%rcx), %r11
	cmpq	%r11, %rax
	jle	.L85
	addq	%rsi, %r11
	addq	%rdi, %r10
	addq	$2, %rcx
	vmovss	(%r9,%r11,4), %xmm6
	leaq	(%rdx,%r10), %r14
	vfmadd231ss	(%r8,%r14,4), %xmm6, %xmm1
	cmpq	%rcx, %rax
	jle	.L85
	addq	%rsi, %rcx
	leaq	(%rdx,%rdi), %rax
	vmovss	(%r9,%rcx,4), %xmm6
	addq	%r10, %rax
	vfmadd231ss	(%r8,%rax,4), %xmm6, %xmm1
	jmp	.L85
	.p2align 4,,10
	.p2align 3
.L103:
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.L85
.L119:
	vzeroupper
	jmp	.L85
.L105:
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.L91
.L104:
	xorl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.L87
.L120:
	movq	stderr(%rip), %rdi
	movq	%rdx, %rcx
	leaq	.LC20(%rip), %rsi
	movq	%r13, %rdx
	movl	$2, %eax
	vcvtss2sd	%xmm3, %xmm3, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L121:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE7687:
	.size	_Z5checkR6matrixS0_S0_l, .-_Z5checkR6matrixS0_S0_l
	.section	.rodata.str1.1
.LC22:
	.string	"A = %ld x %ld (%ld bytes)\n"
.LC23:
	.string	"B = %ld x %ld (%ld bytes)\n"
.LC24:
	.string	"C = %ld x %ld (%ld bytes)\n"
.LC25:
	.string	"repeat C += A * B %ld times\n"
.LC26:
	.string	"%ld flops, total %ld bytes\n"
.LC27:
	.string	"cpu cycles"
.LC28:
	.string	"instructions"
.LC29:
	.string	"branch instructions"
.LC30:
	.string	"perf_event_open"
.LC31:
	.string	"ioctl"
	.section	.rodata.str1.8
	.align 8
.LC32:
	.string	"%s:%d:warning: OS does not support perf_event. event counts are always zero\n"
	.section	.rodata.str1.1
.LC33:
	.string	"ref cycles"
.LC34:
	.string	"%20s: %ld\n"
.LC36:
	.string	"time"
.LC37:
	.string	"%20s: %.3f\n"
	.section	.rodata.str1.8
	.align 8
.LC38:
	.string	"%.3f flops/clock = %.3f vfmadds/clock\n"
	.align 8
.LC39:
	.string	"%.3f flops/cpu clock = %.3f vfmadds/cpu clock\n"
	.section	.rodata.str1.1
.LC40:
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
	subq	$928, %rsp
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
	jne	.L183
.L122:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L184
	addq	$928, %rsp
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
.L183:
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
	movq	%rax, -928(%rbp)
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
	movq	%rax, -936(%rbp)
	movq	%r13, %r14
	call	_Z4initR6matrixllPt
	leaq	-672(%rbp), %rax
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rax, %rdi
	movq	%rax, -944(%rbp)
	imulq	%rbx, %r14
	call	_Z4zeroR6matrixll
	movq	%r12, %rax
	movq	-472(%rbp), %rcx
	movq	%r12, %r8
	imulq	%r13, %rax
	movq	%r12, %rsi
	leaq	.LC22(%rip), %rdi
	movq	%rcx, -872(%rbp)
	imulq	%rbx, %r8
	salq	$2, %r14
	leaq	0(,%rax,4), %r15
	imulq	%rbx, %rax
	salq	$2, %r8
	movq	%r8, -776(%rbp)
	imulq	%rcx, %rax
	movl	$16, %ecx
	addq	%rax, %rax
	cqto
	movq	%rax, -888(%rbp)
	idivq	%rcx
	movq	%r8, %rcx
	movq	%rbx, %rdx
	movq	%rax, -920(%rbp)
	xorl	%eax, %eax
	call	printf@PLT
	movq	%r13, %rdx
	movq	%rbx, %rsi
	movq	%r14, %rcx
	leaq	.LC23(%rip), %rdi
	xorl	%eax, %eax
	leaq	-640(%rbp), %rbx
	call	printf@PLT
	movq	%r15, %rcx
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	.LC24(%rip), %rdi
	xorl	%eax, %eax
	leaq	-208(%rbp), %r12
	call	printf@PLT
	movq	-872(%rbp), %rsi
	leaq	.LC25(%rip), %rdi
	xorl	%eax, %eax
	movq	%r12, %r13
	call	printf@PLT
	movq	-776(%rbp), %r8
	movq	-888(%rbp), %rsi
	leaq	.LC26(%rip), %rdi
	xorl	%eax, %eax
	leaq	(%r8,%r14), %rdx
	addq	%r15, %rdx
	leaq	-360(%rbp), %r15
	call	printf@PLT
	xorl	%eax, %eax
	movq	$1, -192(%rbp)
	movq	%rax, -208(%rbp)
	leaq	.LC27(%rip), %rax
	movq	%rax, -200(%rbp)
	leaq	.LC28(%rip), %rax
	movq	%rax, -184(%rbp)
	leaq	.LC29(%rip), %rax
	movq	$4, -176(%rbp)
	movq	%rax, -168(%rbp)
	movq	$3, -368(%rbp)
	call	pthread_self@PLT
	movq	%r12, -792(%rbp)
	movq	%rax, -776(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, -784(%rbp)
.L129:
	movq	0(%r13), %rax
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
	movq	8(%r13), %r12
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
	je	.L185
	xorl	%edx, %edx
	movl	%eax, %edi
	movl	$9219, %esi
	xorl	%eax, %eax
	call	ioctl@PLT
	cmpl	$-1, %eax
	je	.L127
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$9216, %esi
	movl	%r14d, %edi
	call	ioctl@PLT
	incl	%eax
	je	.L127
.L128:
	movq	-776(%rbp), %rax
	movl	%r14d, -760(%rbp)
	addq	$16, %r13
	addq	$24, %r15
	movq	%r12, -8(%r15)
	movq	%rax, -768(%rbp)
	movq	-784(%rbp), %rax
	movq	%r12, -752(%rbp)
	vmovdqa	-768(%rbp), %xmm7
	vmovdqu	%xmm7, -24(%r15)
	cmpq	%rax, %r13
	jne	.L129
	movq	$3, -288(%rbp)
	movq	-792(%rbp), %r12
	leaq	-296(%rbp), %r14
	call	_ZL11cur_time_nsv
	movq	%rax, -280(%rbp)
	leaq	-368(%rbp), %rax
	movq	%rax, -896(%rbp)
	movq	%rax, %r13
	movq	%rax, %rbx
.L130:
	movq	24(%rbx), %rax
	movl	16(%rbx), %esi
	addq	$24, %rbx
	addq	$8, %r13
	movq	-16(%rbx), %rdi
	movq	%rax, 96(%r13)
	call	_ZL16perf_counter_get14perf_counter_t.isra.0
	movq	%rax, 120(%r13)
	cmpq	%r14, %rbx
	jne	.L130
	rdtsc
	salq	$32, %rdx
	movq	-712(%rbp), %r15
	movq	-680(%rbp), %rbx
	orq	%rdx, %rax
	cmpq	$0, -872(%rbp)
	movq	%rax, -272(%rbp)
	movq	-648(%rbp), %rax
	movq	%rax, -880(%rbp)
	jle	.L148
	movq	-736(%rbp), %rax
	movq	-720(%rbp), %r9
	movq	%r12, -952(%rbp)
	xorl	%ecx, %ecx
	movq	-728(%rbp), %rdi
	movq	-688(%rbp), %r10
	movq	%rax, -832(%rbp)
	movq	-696(%rbp), %rax
	movq	-672(%rbp), %r8
	movq	%rdi, %r13
	movq	%rax, -776(%rbp)
	movq	-704(%rbp), %rax
	andl	$3, %r13d
	movq	%rax, -904(%rbp)
	movq	-664(%rbp), %rax
	movq	%rax, -912(%rbp)
	movq	-656(%rbp), %rax
	leaq	0(,%rax,4), %r14
	leaq	0(,%r9,4), %rax
	movq	%rax, -856(%rbp)
	leaq	-1(%rdi), %rax
	movq	%rax, -784(%rbp)
	movq	%r10, %rax
	salq	$4, %rax
	movq	%r14, -864(%rbp)
	movq	%r8, %r14
	movq	%rax, -808(%rbp)
	movq	%rdi, %rax
	shrq	$2, %rax
	salq	$4, %rax
	movq	%rax, -848(%rbp)
	movq	%rdi, %rax
	andq	$-4, %rax
	movq	%rax, -792(%rbp)
	leaq	(%r10,%r10,2), %rax
	movq	%rax, -816(%rbp)
.L147:
	movq	-904(%rbp), %rax
	cmpq	%rax, %rdi
	jne	.L186
	cmpq	%r14, -832(%rbp)
	jne	.L187
	movq	-776(%rbp), %rax
	movq	-912(%rbp), %rsi
	cmpq	%rsi, %rax
	jne	.L136
	cmpq	$0, -832(%rbp)
	jle	.L137
	testq	%rax, %rax
	jle	.L137
	movq	%rcx, -960(%rbp)
	movq	-880(%rbp), %rsi
	movq	%r15, %r11
	xorl	%r12d, %r12d
	movq	%r14, -968(%rbp)
	xorl	%r8d, %r8d
	movq	%r9, -840(%rbp)
	.p2align 4,,10
	.p2align 3
.L139:
	movq	-848(%rbp), %rax
	movq	%r8, -824(%rbp)
	movq	%rbx, %rcx
	addq	%r11, %rax
	movq	%rax, -800(%rbp)
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L146:
	vxorps	%xmm0, %xmm0, %xmm0
	testq	%rdi, %rdi
	jle	.L145
	cmpq	$2, -784(%rbp)
	jbe	.L159
	movq	%r11, %r8
	movq	%rcx, %rdx
	vxorps	%xmm0, %xmm0, %xmm0
.L141:
	vmovss	(%rdx,%r10,8), %xmm1
	movq	-816(%rbp), %r14
	addq	$16, %r8
	vmovss	(%rdx), %xmm2
	movq	-800(%rbp), %r9
	vinsertps	$0x10, (%rdx,%r14,4), %xmm1, %xmm1
	movq	-808(%rbp), %r14
	vinsertps	$0x10, (%rdx,%r10,4), %xmm2, %xmm2
	addq	%r14, %rdx
	vmovlhps	%xmm1, %xmm2, %xmm2
	vmulps	-16(%r8), %xmm2, %xmm2
	vaddss	%xmm0, %xmm2, %xmm0
	vshufps	$85, %xmm2, %xmm2, %xmm1
	vaddss	%xmm0, %xmm1, %xmm1
	vunpckhps	%xmm2, %xmm2, %xmm0
	vshufps	$255, %xmm2, %xmm2, %xmm2
	vaddss	%xmm1, %xmm0, %xmm0
	vaddss	%xmm2, %xmm0, %xmm0
	cmpq	%r9, %r8
	jne	.L141
	testq	%r13, %r13
	je	.L145
	movq	-792(%rbp), %rdx
.L140:
	movq	%r10, %r8
	leaq	(%r12,%rdx), %r14
	imulq	%rdx, %r8
	vmovss	(%r15,%r14,4), %xmm4
	leaq	(%r8,%rax), %r9
	vfmadd231ss	(%rbx,%r9,4), %xmm4, %xmm0
	leaq	1(%rdx), %r9
	cmpq	%rdi, %r9
	jge	.L145
	addq	%r12, %r9
	addq	%r10, %r8
	addq	$2, %rdx
	vmovss	(%r15,%r9,4), %xmm5
	leaq	(%rax,%r8), %r14
	vfmadd231ss	(%rbx,%r14,4), %xmm5, %xmm0
	cmpq	%rdx, %rdi
	jle	.L145
	leaq	(%r10,%rax), %r9
	addq	%r12, %rdx
	addq	%r8, %r9
	vmovss	(%rbx,%r9,4), %xmm7
	vfmadd231ss	(%r15,%rdx,4), %xmm7, %xmm0
	.p2align 4,,10
	.p2align 3
.L145:
	vaddss	(%rsi,%rax,4), %xmm0, %xmm0
	addq	$4, %rcx
	vmovss	%xmm0, (%rsi,%rax,4)
	incq	%rax
	cmpq	%rax, -776(%rbp)
	jne	.L146
	movq	-864(%rbp), %rax
	movq	-824(%rbp), %r8
	addq	%rax, %rsi
	movq	-840(%rbp), %rax
	incq	%r8
	addq	%rax, %r12
	movq	-856(%rbp), %rax
	addq	%rax, %r11
	cmpq	%r8, -832(%rbp)
	jne	.L139
	movq	-960(%rbp), %rcx
	movq	-968(%rbp), %r14
	movq	-840(%rbp), %r9
.L137:
	incq	%rcx
	cmpq	%rcx, -872(%rbp)
	jne	.L147
	movq	-952(%rbp), %r12
.L148:
	movq	-896(%rbp), %rsi
	movl	$38, %ecx
	movq	%r12, %rdi
	rep movsl
	movq	-208(%rbp), %r13
	call	_ZL11cur_time_nsv
	subq	-120(%rbp), %rax
	movq	%rax, -784(%rbp)
	testq	%r13, %r13
	jle	.L133
	leaq	-448(%rbp), %rcx
	movq	%r15, -776(%rbp)
	xorl	%r14d, %r14d
	movq	%r13, %r15
	movq	%rbx, -792(%rbp)
	movq	%rcx, %r13
	movq	%r12, %rbx
.L153:
	movq	104(%r12,%r14,8), %rax
	movl	16(%rbx), %esi
	addq	$24, %rbx
	movq	-16(%rbx), %rdi
	movq	%rax, 24(%r13,%r14,8)
	call	_ZL16perf_counter_get14perf_counter_t.isra.0
	subq	128(%r12,%r14,8), %rax
	movq	%rax, 48(%r13,%r14,8)
	incq	%r14
	cmpq	%r15, %r14
	jne	.L153
	movq	%r15, %r13
	movq	-792(%rbp), %rbx
	movq	-776(%rbp), %r15
.L133:
	rdtsc
	movl	$38, %ecx
	movq	-896(%rbp), %rsi
	salq	$32, %rdx
	movq	%r12, %rdi
	orq	%rdx, %rax
	subq	-112(%rbp), %rax
	rep movsl
	movq	%rax, %r14
	movl	-192(%rbp), %edi
	cmpl	$-1, %edi
	je	.L149
	call	close@PLT
.L149:
	movl	-168(%rbp), %edi
	cmpl	$-1, %edi
	je	.L150
	call	close@PLT
.L150:
	movl	-144(%rbp), %edi
	cmpl	$-1, %edi
	je	.L152
	call	close@PLT
.L152:
	movq	-400(%rbp), %rax
	movq	%rax, -776(%rbp)
	testq	%r13, %r13
	jle	.L188
	leaq	-448(%rbp), %rcx
	leaq	.LC34(%rip), %rdi
	movq	%r15, -792(%rbp)
	xorl	%r12d, %r12d
	movq	%rbx, -800(%rbp)
	movq	%r14, %r15
	movq	%rcx, %rbx
	movq	%rdi, %r14
.L155:
	movq	48(%rbx,%r12,8), %rdx
	movq	24(%rbx,%r12,8), %rsi
	movq	%r14, %rdi
	xorl	%eax, %eax
	incq	%r12
	call	printf@PLT
	cmpq	%r13, %r12
	jne	.L155
	movq	%r14, %rdi
	movq	-800(%rbp), %rbx
	movq	%r15, %r14
	movq	-792(%rbp), %r15
.L156:
	movq	%r14, %rdx
	leaq	.LC33(%rip), %rsi
	xorl	%eax, %eax
	call	printf@PLT
	vxorpd	%xmm6, %xmm6, %xmm6
	leaq	.LC36(%rip), %rsi
	leaq	.LC37(%rip), %rdi
	vcvtsi2sdq	-784(%rbp), %xmm6, %xmm2
	movl	$1, %eax
	vmulsd	.LC35(%rip), %xmm2, %xmm0
	vmovsd	%xmm2, -792(%rbp)
	call	printf@PLT
	vxorpd	%xmm6, %xmm6, %xmm6
	leaq	.LC38(%rip), %rdi
	movl	$2, %eax
	vcvtsi2sdq	-920(%rbp), %xmm6, %xmm3
	vcvtsi2sdq	%r14, %xmm6, %xmm1
	vcvtsi2sdq	-888(%rbp), %xmm6, %xmm0
	vmovsd	%xmm3, -784(%rbp)
	vmovq	%xmm0, %r12
	vdivsd	%xmm1, %xmm0, %xmm0
	vdivsd	%xmm1, %xmm3, %xmm1
	call	printf@PLT
	vxorpd	%xmm6, %xmm6, %xmm6
	vmovq	%r12, %xmm3
	leaq	.LC39(%rip), %rdi
	vcvtsi2sdq	-776(%rbp), %xmm6, %xmm1
	movl	$2, %eax
	vdivsd	%xmm1, %xmm3, %xmm0
	vmovsd	-784(%rbp), %xmm3
	vdivsd	%xmm1, %xmm3, %xmm1
	call	printf@PLT
	vmovsd	-792(%rbp), %xmm2
	vmovq	%r12, %xmm7
	leaq	.LC40(%rip), %rdi
	movl	$1, %eax
	vdivsd	%xmm2, %xmm7, %xmm0
	call	printf@PLT
	movq	-872(%rbp), %rcx
	movq	-944(%rbp), %rdx
	movq	-936(%rbp), %rsi
	movq	-928(%rbp), %rdi
	call	_Z5checkR6matrixS0_S0_l
	movq	%r15, %rdi
	call	free@PLT
	movq	%rbx, %rdi
	call	free@PLT
	movq	-880(%rbp), %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L122
	.p2align 4,,10
	.p2align 3
.L159:
	vxorps	%xmm0, %xmm0, %xmm0
	xorl	%edx, %edx
	jmp	.L140
.L127:
	leaq	.LC31(%rip), %rdi
	call	perror@PLT
.L125:
	movq	stderr(%rip), %rdi
	movl	$86, %ecx
	leaq	.LC1(%rip), %rdx
	leaq	.LC32(%rip), %rsi
	xorl	%eax, %eax
	orl	$-1, %r14d
	call	fprintf@PLT
	jmp	.L128
.L185:
	leaq	.LC30(%rip), %rdi
	call	perror@PLT
	jmp	.L125
.L188:
	leaq	.LC34(%rip), %rdi
	jmp	.L156
.L136:
	leaq	.LC9(%rip), %rcx
	movl	$11, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	call	__assert_fail@PLT
.L184:
	call	__stack_chk_fail@PLT
.L186:
	leaq	.LC9(%rip), %rcx
	movl	$9, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	__assert_fail@PLT
.L187:
	leaq	.LC9(%rip), %rcx
	movl	$10, %edx
	leaq	.LC10(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	__assert_fail@PLT
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
.LC15:
	.quad	16
	.quad	32
	.quad	128
	.quad	1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC18:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC19:
	.long	-755914244
	.long	1062232653
	.align 8
.LC35:
	.long	-400107883
	.long	1041313291
	.ident	"GCC: (GNU) 13.1.1 20230429"
	.section	.note.GNU-stack,"",@progbits
