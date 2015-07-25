	.arch armv5t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"rsa_encryptMMM_optloc.c"
	.global	N
	.section	.rodata
	.align	3
	.type	N, %object
	.size	N, 8
N:
	.word	3233
	.word	0
	.global	e
	.align	3
	.type	e, %object
	.size	e, 8
e:
	.word	17
	.word	0
	.global	d
	.align	3
	.type	d, %object
	.size	d, 8
d:
	.word	2753
	.word	0
	.global	num_bits
	.align	2
	.type	num_bits, %object
	.size	num_bits, 4
num_bits:
	.word	12
	.text
	.align	2
	.global	montgomery_multiply
	.type	montgomery_multiply, %function
montgomery_multiply:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	add	fp, sp, #28
	sub	sp, sp, #48
	str	r0, [fp, #-68]
	str	r1, [fp, #-64]
	str	r2, [fp, #-76]
	str	r3, [fp, #-72]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	mov	r3, #12
	str	r3, [fp, #-56]
	ldr	r2, .L8
	mov	r3, #0
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-60]
	b	.L2
.L5:
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	mov	r2, #1
	mov	r3, #0
	and	r8, r0, r2
	and	r9, r1, r3
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	ldr	r1, [fp, #-60]
	rsb	ip, r1, #32
	sub	r0, r1, #32
	mov	r4, r2, lsr r1
	orr	r4, r4, r3, asl ip
	orr	r4, r4, r3, lsr r0
	mov	r5, r3, lsr r1
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	and	r0, r4, r2
	and	r1, r5, r3
	mov	r2, #1
	mov	r3, #0
	and	r2, r2, r0
	and	r3, r3, r1
	adds	r2, r2, r8
	adc	r3, r3, r9
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	sub	r3, fp, #68
	ldmia	r3, {r2-r3}
	ldr	r1, [fp, #-60]
	rsb	ip, r1, #32
	sub	r0, r1, #32
	mov	r6, r2, lsr r1
	orr	r6, r6, r3, asl ip
	orr	r6, r6, r3, lsr r0
	mov	r7, r3, lsr r1
	mov	r2, #1
	mov	r3, #0
	and	r2, r2, r6
	and	r3, r3, r7
	orrs	r1, r2, r3
	beq	.L3
	sub	r3, fp, #76
	ldmia	r3, {r2-r3}
	b	.L4
.L3:
	mov	r2, #0
	mov	r3, #0
.L4:
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	adds	r0, r0, r2
	adc	r1, r1, r3
	ldr	r3, [fp, #-32]
	ldr	r2, [fp, #-44]
	mul	r2, r3, r2
	ldr	r3, [fp, #-40]
	ldr	ip, [fp, #-36]
	mul	r3, ip, r3
	add	ip, r2, r3
	ldr	sl, [fp, #-36]
	ldr	r8, [fp, #-44]
	umull	r2, r3, sl, r8
	add	ip, ip, r3
	mov	r3, ip
	adds	r2, r2, r0
	adc	r3, r3, r1
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	str	r2, [fp, #-52]
	str	r3, [fp, #-48]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-60]
.L2:
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-56]
	cmp	r2, r3
	blt	.L5
	sub	r2, fp, #52
	ldmia	r2, {r1-r2}
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	cmp	r2, r4
	it eq
	cmpeq	r1, r3
	bcc	.L6
	sub	r2, fp, #52
	ldmia	r2, {r1-r2}
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	subs	r3, r1, r3
	sbc	r4, r2, r4
	str	r3, [fp, #-52]
	str	r4, [fp, #-48]
.L6:
	sub	r4, fp, #52
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L9:
	.align	2
.L8:
	.word	3233
	.size	montgomery_multiply, .-montgomery_multiply
	.global	__aeabi_uldivmod
	.align	2
	.global	multiply_square
	.type	multiply_square, %function
multiply_square:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	add	fp, sp, #20
	sub	sp, sp, #40
	str	r0, [fp, #-52]
	str	r1, [fp, #-48]
	str	r2, [fp, #-60]
	str	r3, [fp, #-56]
	ldr	r3, .L15
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #1
	mov	r2, #1
	mov	r1, r2, asl r3
	mov	r2, r1
	mov	r3, r2, asr #31
	ldr	r1, .L15+4
	ldmia	r1, {r6-r7}
	mov	r0, r2
	mov	r1, r3
	mov	r2, r6
	mov	r3, r7
	bl	__aeabi_uldivmod
	str	r2, [fp, #-28]
	str	r3, [fp, #-24]
	mov	r0, #1
	mov	r1, #0
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	montgomery_multiply
	str	r0, [fp, #-36]
	str	r1, [fp, #-32]
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	sub	r3, fp, #28
	ldmia	r3, {r2-r3}
	bl	montgomery_multiply
	str	r0, [fp, #-52]
	str	r1, [fp, #-48]
	mov	r3, #0
	str	r3, [fp, #-40]
	b	.L11
.L13:
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	ldr	r1, [fp, #-40]
	rsb	ip, r1, #32
	sub	r0, r1, #32
	mov	r4, r2, lsr r1
	orr	r4, r4, r3, asl ip
	orr	r4, r4, r3, lsr r0
	mov	r5, r3, lsr r1
	mov	r2, #1
	mov	r3, #0
	and	r2, r2, r4
	and	r3, r3, r5
	orrs	r1, r2, r3
	beq	.L12
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	montgomery_multiply
	str	r0, [fp, #-36]
	str	r1, [fp, #-32]
.L12:
	sub	r1, fp, #52
	ldmia	r1, {r0-r1}
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	montgomery_multiply
	str	r0, [fp, #-52]
	str	r1, [fp, #-48]
	ldr	r3, [fp, #-40]
	add	r3, r3, #1
	str	r3, [fp, #-40]
.L11:
	ldr	r3, .L15
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-40]
	cmp	r2, r3
	blt	.L13
	mov	r0, #1
	mov	r1, #0
	sub	r3, fp, #36
	ldmia	r3, {r2-r3}
	bl	montgomery_multiply
	str	r0, [fp, #-36]
	str	r1, [fp, #-32]
	sub	r4, fp, #36
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #20
	ldmfd	sp!, {r4, r5, r6, r7, fp, pc}
.L16:
	.align	2
.L15:
	.word	num_bits
	.word	N
	.size	multiply_square, .-multiply_square
	.align	2
	.global	encrypt
	.type	encrypt, %function
encrypt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	str	r1, [fp, #-24]
	ldr	r3, .L19
	ldmia	r3, {r3-r4}
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	mov	r2, r3
	mov	r3, r4
	bl	multiply_square
	str	r0, [fp, #-20]
	str	r1, [fp, #-16]
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L20:
	.align	2
.L19:
	.word	e
	.size	encrypt, .-encrypt
	.align	2
	.global	decrypt
	.type	decrypt, %function
decrypt:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #20
	str	r0, [fp, #-28]
	str	r1, [fp, #-24]
	ldr	r3, .L23
	ldmia	r3, {r3-r4}
	sub	r1, fp, #28
	ldmia	r1, {r0-r1}
	mov	r2, r3
	mov	r3, r4
	bl	multiply_square
	str	r0, [fp, #-20]
	str	r1, [fp, #-16]
	sub	r4, fp, #20
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L24:
	.align	2
.L23:
	.word	d
	.size	decrypt, .-decrypt
	.align	2
	.global	main
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #12
	mov	r3, #0
	str	r3, [fp, #-16]
	b	.L26
.L27:
	ldr	r0, .L29
	mov	r1, #0
	bl	encrypt
	mov	r3, r0
	mov	r4, r1
	mov	r0, r3
	mov	r1, r4
	bl	decrypt
	ldr	r3, [fp, #-16]
	add	r3, r3, #1
	str	r3, [fp, #-16]
.L26:
	ldr	r2, [fp, #-16]
	ldr	r3, .L29+4
	cmp	r2, r3
	ble	.L27
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L30:
	.align	2
.L29:
	.word	3231
	.word	9999
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.7.3-12ubuntu1) 4.7.3"
	.section	.note.GNU-stack,"",%progbits
