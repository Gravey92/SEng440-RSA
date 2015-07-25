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
	.file	"rsa_encryptMMM.c"
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
	str	r0, [fp, #-60]
	str	r1, [fp, #-56]
	str	r2, [fp, #-68]
	str	r3, [fp, #-64]
	mov	r2, #0
	mov	r3, #0
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	mov	r3, #0
	str	r3, [fp, #-48]
	b	.L2
.L3:
	sub	r1, fp, #44
	ldmia	r1, {r0-r1}
	mov	r2, #1
	mov	r3, #0
	and	r4, r0, r2
	and	r5, r1, r3
	str	r4, [fp, #-76]
	str	r5, [fp, #-72]
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	ldr	r1, [fp, #-48]
	rsb	ip, r1, #32
	sub	r0, r1, #32
	mov	r4, r2, lsr r1
	orr	r4, r4, r3, asl ip
	orr	r4, r4, r3, lsr r0
	mov	r5, r3, lsr r1
	mov	r2, #1
	mov	r3, #0
	and	r8, r4, r2
	and	r9, r5, r3
	sub	r1, fp, #68
	ldmia	r1, {r0-r1}
	mov	r2, #1
	mov	r3, #0
	and	r0, r0, r2
	and	r1, r1, r3
	mul	r2, r0, r9
	mul	r3, r8, r1
	add	ip, r2, r3
	umull	r2, r3, r8, r0
	add	r1, ip, r3
	mov	r3, r1
	sub	r1, fp, #76
	ldmia	r1, {r0-r1}
	adds	r2, r2, r0
	adc	r3, r3, r1
	str	r2, [fp, #-36]
	str	r3, [fp, #-32]
	sub	r3, fp, #60
	ldmia	r3, {r2-r3}
	ldr	r1, [fp, #-48]
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
	ldr	r1, [fp, #-68]
	mul	r0, r3, r1
	ldr	r1, [fp, #-64]
	mul	r1, r2, r1
	add	ip, r0, r1
	ldr	r8, [fp, #-68]
	umull	r0, r1, r8, r2
	add	r3, ip, r1
	mov	r1, r3
	ldr	r3, .L6
	ldmia	r3, {r8-r9}
	ldr	r3, [fp, #-36]
	mul	r2, r9, r3
	ldr	r3, [fp, #-32]
	mul	r3, r8, r3
	add	ip, r2, r3
	ldr	sl, [fp, #-36]
	umull	r2, r3, sl, r8
	add	ip, ip, r3
	mov	r3, ip
	adds	r0, r0, r2
	adc	r1, r1, r3
	sub	r3, fp, #44
	ldmia	r3, {r2-r3}
	adds	r2, r2, r0
	adc	r3, r3, r1
	movs	r3, r3, lsr #1
	mov	r2, r2, rrx
	str	r2, [fp, #-44]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-48]
	add	r3, r3, #1
	str	r3, [fp, #-48]
.L2:
	ldr	r3, .L6+4
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-48]
	cmp	r2, r3
	blt	.L3
	ldr	r3, .L6
	ldmia	r3, {r3-r4}
	sub	r2, fp, #44
	ldmia	r2, {r1-r2}
	cmp	r2, r4
	it eq
	cmpeq	r1, r3
	bcc	.L4
	ldr	r3, .L6
	ldmia	r3, {r3-r4}
	sub	r2, fp, #44
	ldmia	r2, {r1-r2}
	subs	r3, r1, r3
	sbc	r4, r2, r4
	str	r3, [fp, #-44]
	str	r4, [fp, #-40]
.L4:
	sub	r4, fp, #44
	ldmia	r4, {r3-r4}
	mov	r0, r3
	mov	r1, r4
	sub	sp, fp, #28
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
.L7:
	.align	2
.L6:
	.word	N
	.word	num_bits
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
	ldr	r3, .L13
	ldr	r3, [r3, #0]
	mov	r3, r3, asl #1
	mov	r2, #1
	mov	r1, r2, asl r3
	mov	r2, r1
	mov	r3, r2, asr #31
	ldr	r1, .L13+4
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
	b	.L9
.L11:
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
	beq	.L10
	sub	r1, fp, #36
	ldmia	r1, {r0-r1}
	sub	r3, fp, #52
	ldmia	r3, {r2-r3}
	bl	montgomery_multiply
	str	r0, [fp, #-36]
	str	r1, [fp, #-32]
.L10:
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
.L9:
	ldr	r3, .L13
	ldr	r3, [r3, #0]
	ldr	r2, [fp, #-40]
	cmp	r2, r3
	blt	.L11
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
.L14:
	.align	2
.L13:
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
	ldr	r3, .L17
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
.L18:
	.align	2
.L17:
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
	ldr	r3, .L21
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
.L22:
	.align	2
.L21:
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
	b	.L24
.L25:
	ldr	r0, .L27
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
.L24:
	ldr	r2, [fp, #-16]
	ldr	r3, .L27+4
	cmp	r2, r3
	ble	.L25
	mov	r3, #1
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, pc}
.L28:
	.align	2
.L27:
	.word	3231
	.word	9999
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.7.3-12ubuntu1) 4.7.3"
	.section	.note.GNU-stack,"",%progbits
