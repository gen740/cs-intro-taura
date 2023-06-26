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
.LFB7842:
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
.LFE7842:
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
	.string	"N % L == 0"
	.text
	.p2align 4
	.globl	_Z2mmR6matrixS0_S0_
	.type	_Z2mmR6matrixS0_S0_, @function
_Z2mmR6matrixS0_S0_:
.LFB7684:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	(%rdi), %rcx
	movq	8(%rdi), %rdi
	movq	8(%rsi), %rax
	cmpq	%rdi, (%rsi)
	jne	.L54
	cmpq	%rcx, (%rdx)
	jne	.L55
	cmpq	%rax, 8(%rdx)
	jne	.L56
	testb	$3, %al
	jne	.L57
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L54:
	.cfi_restore_state
	leaq	.LC8(%rip), %rcx
	movl	$12, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC10(%rip), %rdi
	call	__assert_fail@PLT
.L57:
	leaq	.LC8(%rip), %rcx
	movl	$15, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	call	__assert_fail@PLT
.L56:
	leaq	.LC8(%rip), %rcx
	movl	$14, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	__assert_fail@PLT
.L55:
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
.L61:
	movq	%r14, %rdx
	movq	%r12, %rsi
	movl	%r13d, %edi
	call	getopt@PLT
	cmpl	$78, %eax
	je	.L62
	jg	.L63
	cmpl	$75, %eax
	je	.L64
	cmpl	$77, %eax
	je	.L65
	cmpl	$-1, %eax
	jne	.L67
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
.L63:
	.cfi_restore_state
	cmpl	$114, %eax
	je	.L68
	cmpl	$120, %eax
	jne	.L67
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 32(%rbx)
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L62:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 8(%rbx)
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L68:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 24(%rbx)
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L65:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, (%rbx)
	jmp	.L61
	.p2align 4,,10
	.p2align 3
.L64:
	movq	optarg(%rip), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movq	%rax, 16(%rbx)
	jmp	.L61
.L67:
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
.LC21:
	.string	"error: C(%ld,%ld) = %f != %f\n"
.LC22:
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
.L90:
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
	jle	.L92
	movq	-96(%rbp), %rdi
	movq	16(%r12), %rsi
	leaq	-1(%rax), %rcx
	movq	24(%r12), %r9
	movq	24(%rdi), %r8
	movq	16(%rdi), %rdi
	imulq	%r13, %rsi
	cmpq	$1, %rdi
	jne	.L107
	cmpq	$6, %rcx
	jbe	.L94
	movq	%rax, %rdi
	leaq	(%r9,%rsi,4), %r11
	leaq	(%r8,%rdx,4), %r10
	xorl	%ecx, %ecx
	shrq	$3, %rdi
	vxorps	%xmm1, %xmm1, %xmm1
	salq	$5, %rdi
	.p2align 4,,10
	.p2align 3
.L81:
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
	jne	.L81
	movq	%rax, %rcx
	andq	$-8, %rcx
	movq	%rcx, %rdi
	cmpq	%rax, %rcx
	je	.L108
	vzeroupper
.L80:
	movq	%rax, %r10
	subq	%rdi, %r10
	leaq	-1(%r10), %r11
	cmpq	$2, %r11
	jbe	.L85
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
	je	.L74
.L85:
	leaq	(%rdx,%rcx), %r10
	leaq	(%rsi,%rcx), %rdi
	vmovss	(%r8,%r10,4), %xmm7
	vfmadd231ss	(%r9,%rdi,4), %xmm7, %xmm1
	leaq	1(%rcx), %rdi
	cmpq	%rax, %rdi
	jge	.L74
	leaq	(%rdi,%rdx), %r10
	addq	$2, %rcx
	addq	%rsi, %rdi
	vmovss	(%r8,%r10,4), %xmm7
	vfmadd231ss	(%r9,%rdi,4), %xmm7, %xmm1
	cmpq	%rcx, %rax
	jle	.L74
	addq	%rcx, %rsi
	addq	%rdx, %rcx
	vmovss	(%r9,%rsi,4), %xmm7
	vfmadd231ss	(%r8,%rcx,4), %xmm7, %xmm1
.L74:
	movq	16(%rbx), %rax
	vmulss	-76(%rbp), %xmm1, %xmm1
	movq	24(%rbx), %rcx
	imulq	%r13, %rax
	addq	%rdx, %rax
	vmovss	(%rcx,%rax,4), %xmm3
	vsubss	%xmm1, %xmm3, %xmm2
	vdivss	%xmm1, %xmm2, %xmm2
	vandps	.LC19(%rip), %xmm2, %xmm2
	vcvtss2sd	%xmm2, %xmm2, %xmm4
	vcomisd	.LC20(%rip), %xmm4
	ja	.L109
	vmaxss	%xmm0, %xmm2, %xmm0
	decq	%r15
	jne	.L90
	leaq	.LC22(%rip), %rdi
	movl	$1, %eax
	vcvtss2sd	%xmm0, %xmm0, %xmm0
	call	printf@PLT
	movq	-56(%rbp), %rax
	subq	%fs:40, %rax
	jne	.L110
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
.L107:
	.cfi_restore_state
	cmpq	$2, %rcx
	jbe	.L93
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
.L77:
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
	jne	.L77
	movq	%rax, %rcx
	movq	-104(%rbp), %r8
	andq	$-4, %rcx
	testb	$3, %al
	je	.L74
.L76:
	movq	%rdi, %r10
	leaq	(%rsi,%rcx), %r11
	imulq	%rcx, %r10
	leaq	(%rdx,%r10), %r14
	vmovss	(%r8,%r14,4), %xmm6
	vfmadd231ss	(%r9,%r11,4), %xmm6, %xmm1
	leaq	1(%rcx), %r11
	cmpq	%r11, %rax
	jle	.L74
	addq	%rsi, %r11
	addq	%rdi, %r10
	addq	$2, %rcx
	vmovss	(%r9,%r11,4), %xmm6
	leaq	(%rdx,%r10), %r14
	vfmadd231ss	(%r8,%r14,4), %xmm6, %xmm1
	cmpq	%rcx, %rax
	jle	.L74
	addq	%rsi, %rcx
	leaq	(%rdx,%rdi), %rax
	vmovss	(%r9,%rcx,4), %xmm6
	addq	%r10, %rax
	vfmadd231ss	(%r8,%rax,4), %xmm6, %xmm1
	jmp	.L74
	.p2align 4,,10
	.p2align 3
.L92:
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.L74
.L108:
	vzeroupper
	jmp	.L74
.L94:
	xorl	%edi, %edi
	xorl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.L80
.L93:
	xorl	%ecx, %ecx
	vxorps	%xmm1, %xmm1, %xmm1
	jmp	.L76
.L109:
	movq	stderr(%rip), %rdi
	movq	%rdx, %rcx
	leaq	.LC21(%rip), %rsi
	movq	%r13, %rdx
	movl	$2, %eax
	vcvtss2sd	%xmm3, %xmm3, %xmm0
	vcvtss2sd	%xmm1, %xmm1, %xmm1
	call	fprintf@PLT
	movl	$1, %edi
	call	exit@PLT
.L110:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE7687:
	.size	_Z5checkR6matrixS0_S0_l, .-_Z5checkR6matrixS0_S0_l
	.section	.rodata.str1.1
.LC23:
	.string	"A = %ld x %ld (%ld bytes)\n"
.LC24:
	.string	"B = %ld x %ld (%ld bytes)\n"
.LC25:
	.string	"C = %ld x %ld (%ld bytes)\n"
.LC26:
	.string	"repeat C += A * B %ld times\n"
.LC27:
	.string	"%ld flops, total %ld bytes\n"
.LC28:
	.string	"cpu cycles"
.LC29:
	.string	"instructions"
.LC30:
	.string	"branch instructions"
.LC31:
	.string	"perf_event_open"
.LC32:
	.string	"ioctl"
	.section	.rodata.str1.8
	.align 8
.LC33:
	.string	"%s:%d:warning: OS does not support perf_event. event counts are always zero\n"
	.section	.rodata.str1.1
.LC34:
	.string	"%20s: %ld\n"
.LC35:
	.string	"ref cycles"
.LC37:
	.string	"time"
.LC38:
	.string	"%20s: %.3f\n"
	.section	.rodata.str1.8
	.align 8
.LC39:
	.string	"%.3f flops/clock = %.3f vfmadds/clock\n"
	.align 8
.LC40:
	.string	"%.3f flops/cpu clock = %.3f vfmadds/cpu clock\n"
	.section	.rodata.str1.1
.LC41:
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
	jne	.L156
.L111:
	movq	-56(%rbp), %rdx
	subq	%fs:40, %rdx
	jne	.L157
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
.L156:
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
	movq	%rax, -832(%rbp)
	movq	%r13, %r14
	call	_Z4initR6matrixllPt
	leaq	-672(%rbp), %rax
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rax, %rdi
	movq	%rax, -840(%rbp)
	imulq	%rbx, %r14
	call	_Z4zeroR6matrixll
	movq	%r12, %rax
	movq	-472(%rbp), %rcx
	movq	%r12, %r8
	imulq	%r13, %rax
	movq	%r12, %rsi
	leaq	.LC23(%rip), %rdi
	movq	%rcx, -792(%rbp)
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
	movq	%rax, -800(%rbp)
	idivq	%rcx
	movq	%r8, %rcx
	movq	%rbx, %rdx
	movq	%rax, -816(%rbp)
	xorl	%eax, %eax
	call	printf@PLT
	movq	%r14, %rcx
	movq	%r13, %rdx
	movq	%rbx, %rsi
	leaq	.LC24(%rip), %rdi
	xorl	%eax, %eax
	leaq	-640(%rbp), %rbx
	call	printf@PLT
	movq	%r15, %rcx
	movq	%r13, %rdx
	movq	%r12, %rsi
	leaq	.LC25(%rip), %rdi
	xorl	%eax, %eax
	leaq	-360(%rbp), %r13
	call	printf@PLT
	movq	-792(%rbp), %rsi
	leaq	.LC26(%rip), %rdi
	xorl	%eax, %eax
	call	printf@PLT
	movq	-776(%rbp), %r8
	movq	-800(%rbp), %rsi
	leaq	.LC27(%rip), %rdi
	xorl	%eax, %eax
	leaq	(%r8,%r14), %rdx
	leaq	-208(%rbp), %r14
	addq	%r15, %rdx
	movq	%r14, %r12
	call	printf@PLT
	xorl	%eax, %eax
	movq	$1, -192(%rbp)
	movq	%rax, -208(%rbp)
	leaq	.LC28(%rip), %rax
	movq	%rax, -200(%rbp)
	leaq	.LC29(%rip), %rax
	movq	%rax, -184(%rbp)
	leaq	.LC30(%rip), %rax
	movq	$4, -176(%rbp)
	movq	%rax, -168(%rbp)
	movq	$3, -368(%rbp)
	call	pthread_self@PLT
	movq	%r14, -808(%rbp)
	movq	%rax, -776(%rbp)
	leaq	-160(%rbp), %rax
	movq	%rax, -784(%rbp)
.L118:
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
	je	.L158
	xorl	%edx, %edx
	movl	%eax, %edi
	movl	$9219, %esi
	xorl	%eax, %eax
	call	ioctl@PLT
	cmpl	$-1, %eax
	je	.L116
	xorl	%edx, %edx
	xorl	%eax, %eax
	movl	$9216, %esi
	movl	%r14d, %edi
	call	ioctl@PLT
	incl	%eax
	je	.L116
.L117:
	movq	-776(%rbp), %rax
	movl	%r14d, -760(%rbp)
	addq	$16, %r12
	addq	$24, %r13
	movq	%r15, -8(%r13)
	movq	%rax, -768(%rbp)
	movq	-784(%rbp), %rax
	movq	%r15, -752(%rbp)
	vmovdqa	-768(%rbp), %xmm4
	vmovdqu	%xmm4, -24(%r13)
	cmpq	%rax, %r12
	jne	.L118
	movq	$3, -288(%rbp)
	movq	-808(%rbp), %r14
	leaq	-296(%rbp), %rbx
	call	_ZL11cur_time_nsv
	movq	%rax, -280(%rbp)
	leaq	-368(%rbp), %rax
	movq	%rax, -776(%rbp)
	movq	%rax, %r15
	movq	%rax, %r13
.L119:
	movq	24(%r13), %rax
	movl	16(%r13), %esi
	addq	$24, %r13
	addq	$8, %r15
	movq	-16(%r13), %rdi
	movq	%rax, 96(%r15)
	call	_ZL16perf_counter_get14perf_counter_t.isra.0
	movq	%rax, 120(%r15)
	cmpq	%rbx, %r13
	jne	.L119
	rdtsc
	salq	$32, %rdx
	movq	%rax, %r8
	orq	%rdx, %r8
	cmpq	$0, -792(%rbp)
	movq	%r8, -272(%rbp)
	jle	.L120
	movq	-696(%rbp), %rax
	movq	-704(%rbp), %rbx
	movq	-736(%rbp), %rdi
	movq	-672(%rbp), %rsi
	movq	%rax, %rdx
	movq	-664(%rbp), %rcx
	andl	$3, %edx
	cmpq	%rbx, -728(%rbp)
	jne	.L159
	cmpq	%rsi, %rdi
	jne	.L160
	cmpq	%rcx, %rax
	jne	.L161
	testq	%rdx, %rdx
	jne	.L162
.L120:
	movq	-776(%rbp), %rsi
	movl	$38, %ecx
	movq	%r14, %rdi
	movq	%r8, -808(%rbp)
	rep movsl
	movq	-208(%rbp), %rbx
	call	_ZL11cur_time_nsv
	movq	-808(%rbp), %r8
	subq	-120(%rbp), %rax
	testq	%rbx, %rbx
	movq	%rax, -784(%rbp)
	jle	.L124
	movq	%r14, %r12
	xorl	%r13d, %r13d
	leaq	-448(%rbp), %r15
.L125:
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
	jne	.L125
	movq	-808(%rbp), %r8
.L124:
	rdtsc
	movl	$38, %ecx
	movq	-776(%rbp), %rsi
	movq	%r14, %rdi
	salq	$32, %rdx
	orq	%rdx, %rax
	rep movsl
	subq	%r8, %rax
	movq	%rax, %r13
	movl	-192(%rbp), %edi
	cmpl	$-1, %edi
	je	.L126
	call	close@PLT
.L126:
	movl	-168(%rbp), %edi
	cmpl	$-1, %edi
	je	.L127
	call	close@PLT
.L127:
	movl	-144(%rbp), %edi
	cmpl	$-1, %edi
	je	.L128
	call	close@PLT
.L128:
	movq	-400(%rbp), %rax
	leaq	.LC34(%rip), %r12
	movq	%rax, -776(%rbp)
	testq	%rbx, %rbx
	jle	.L129
	xorl	%r14d, %r14d
	leaq	-448(%rbp), %r15
.L130:
	movq	48(%r15,%r14,8), %rdx
	movq	24(%r15,%r14,8), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	incq	%r14
	call	printf@PLT
	cmpq	%rbx, %r14
	jne	.L130
.L129:
	movq	%r13, %rdx
	leaq	.LC35(%rip), %rsi
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	.LC37(%rip), %rsi
	leaq	.LC38(%rip), %rdi
	vcvtsi2sdq	-784(%rbp), %xmm5, %xmm2
	movl	$1, %eax
	vmulsd	.LC36(%rip), %xmm2, %xmm0
	vmovsd	%xmm2, -808(%rbp)
	call	printf@PLT
	vxorpd	%xmm5, %xmm5, %xmm5
	leaq	.LC39(%rip), %rdi
	movl	$2, %eax
	vcvtsi2sdq	-816(%rbp), %xmm5, %xmm3
	vcvtsi2sdq	%r13, %xmm5, %xmm1
	vcvtsi2sdq	-800(%rbp), %xmm5, %xmm0
	vmovsd	%xmm3, -784(%rbp)
	vmovq	%xmm0, %rbx
	vdivsd	%xmm1, %xmm0, %xmm0
	vdivsd	%xmm1, %xmm3, %xmm1
	call	printf@PLT
	vxorpd	%xmm5, %xmm5, %xmm5
	vmovsd	-784(%rbp), %xmm3
	vmovq	%rbx, %xmm7
	vcvtsi2sdq	-776(%rbp), %xmm5, %xmm1
	leaq	.LC40(%rip), %rdi
	movl	$2, %eax
	vdivsd	%xmm1, %xmm7, %xmm0
	vdivsd	%xmm1, %xmm3, %xmm1
	call	printf@PLT
	vmovsd	-808(%rbp), %xmm2
	vmovq	%rbx, %xmm6
	leaq	.LC41(%rip), %rdi
	movl	$1, %eax
	vdivsd	%xmm2, %xmm6, %xmm0
	call	printf@PLT
	movq	-792(%rbp), %rcx
	movq	-840(%rbp), %rdx
	movq	-832(%rbp), %rsi
	movq	-824(%rbp), %rdi
	call	_Z5checkR6matrixS0_S0_l
	movq	-712(%rbp), %rdi
	call	free@PLT
	movq	-680(%rbp), %rdi
	call	free@PLT
	movq	-648(%rbp), %rdi
	call	free@PLT
	xorl	%eax, %eax
	jmp	.L111
.L158:
	leaq	.LC31(%rip), %rdi
	call	perror@PLT
.L114:
	movq	stderr(%rip), %rdi
	movl	$86, %ecx
	leaq	.LC1(%rip), %rdx
	leaq	.LC33(%rip), %rsi
	xorl	%eax, %eax
	orl	$-1, %r14d
	call	fprintf@PLT
	jmp	.L117
.L116:
	leaq	.LC32(%rip), %rdi
	call	perror@PLT
	jmp	.L114
.L159:
	leaq	.LC8(%rip), %rcx
	movl	$12, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC10(%rip), %rdi
	call	__assert_fail@PLT
.L160:
	leaq	.LC8(%rip), %rcx
	movl	$13, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	call	__assert_fail@PLT
.L161:
	leaq	.LC8(%rip), %rcx
	movl	$14, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC12(%rip), %rdi
	call	__assert_fail@PLT
.L162:
	leaq	.LC8(%rip), %rcx
	movl	$15, %edx
	leaq	.LC9(%rip), %rsi
	leaq	.LC13(%rip), %rdi
	call	__assert_fail@PLT
.L157:
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
.LC15:
	.quad	16
	.quad	32
	.quad	128
	.quad	1
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC19:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.section	.rodata.cst8
	.align 8
.LC20:
	.long	-755914244
	.long	1062232653
	.align 8
.LC36:
	.long	-400107883
	.long	1041313291
	.ident	"GCC: (GNU) 13.1.1 20230429"
	.section	.note.GNU-stack,"",@progbits
