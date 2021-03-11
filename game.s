	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBarrier.part.0, %function
updateBarrier.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r4, #0
	ldr	r3, .L12
	add	ip, r3, #240
.L3:
	ldr	r2, [r3, #36]
	cmp	r2, #1
	beq	.L10
.L2:
	add	r3, r3, #48
	cmp	r3, ip
	bne	.L3
	ldr	r3, .L12+4
	mov	r4, #0
	add	ip, r3, #720
	b	.L5
.L4:
	add	r3, r3, #48
	cmp	r3, ip
	beq	.L11
.L5:
	ldr	r2, [r3, #36]
	cmp	r2, #1
	bne	.L4
	ldr	lr, [r3]
	ldr	r2, [r3, #20]
	ldr	r1, [r0]
	add	r2, lr, r2
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L4
	ldr	r2, [r0, #8]
	add	r1, r1, r2
	sub	r1, r1, #1
	cmp	lr, r1
	bge	.L4
	ldr	lr, [r3, #4]
	ldr	r2, [r3, #24]
	ldr	r1, [r0, #4]
	add	r2, lr, r2
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L4
	ldr	r2, [r0, #12]
	add	r1, r1, r2
	sub	r1, r1, #1
	cmp	lr, r1
	strlt	r4, [r3, #36]
	ldrlt	r2, [r0, #24]
	add	r3, r3, #48
	sublt	r2, r2, #1
	strlt	r2, [r0, #24]
	cmp	r3, ip
	bne	.L5
.L11:
	pop	{r4, lr}
	bx	lr
.L10:
	ldr	lr, [r3]
	ldr	r2, [r3, #20]
	ldr	r1, [r0]
	add	r2, lr, r2
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L2
	ldr	r2, [r0, #8]
	add	r1, r1, r2
	sub	r1, r1, #1
	cmp	lr, r1
	bge	.L2
	ldr	lr, [r3, #4]
	ldr	r2, [r3, #24]
	ldr	r1, [r0, #4]
	add	r2, lr, r2
	sub	r2, r2, #1
	cmp	r2, r1
	ble	.L2
	ldr	r2, [r0, #12]
	add	r2, r1, r2
	sub	r2, r2, #1
	cmp	lr, r2
	strlt	r4, [r3, #36]
	ldrlt	r2, [r0, #24]
	sublt	r2, r2, #1
	strlt	r2, [r0, #24]
	b	.L2
.L13:
	.align	2
.L12:
	.word	playerbullets
	.word	ballbullets
	.size	updateBarrier.part.0, .-updateBarrier.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayerBullet.part.0, %function
updatePlayerBullet.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0]
	ldr	r3, [r0, #20]
	add	r3, r2, r3
	cmp	r3, #0
	ble	.L15
	ldr	r1, [r0, #28]
	ldr	r3, [r0, #4]
	add	r3, r3, r1
	sub	r1, r3, #1
	cmp	r1, #237
	bls	.L17
.L15:
	mov	r3, #0
	str	r3, [r0, #36]
	bx	lr
.L17:
	ldr	r1, [r0, #16]
	add	r2, r1, r2
	stm	r0, {r2, r3}
	bx	lr
	.size	updatePlayerBullet.part.0, .-updatePlayerBullet.part.0
	.align	2
	.global	initBarriers
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBarriers, %function
initBarriers:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r2, #0
	mov	r5, #20
	mov	r1, #10
	mov	r4, #110
	mvn	lr, #2
	mov	ip, #1
	ldr	r3, .L22
	ldr	r0, .L22+4
.L19:
	str	r2, [r3, #4]
	add	r2, r2, #110
	cmp	r2, r0
	str	r5, [r3, #12]
	str	r1, [r3, #8]
	str	r1, [r3, #16]
	str	r4, [r3]
	strb	lr, [r3, #20]
	str	r1, [r3, #24]
	str	ip, [r3, #28]
	add	r3, r3, #32
	bne	.L19
	pop	{r4, r5, lr}
	bx	lr
.L23:
	.align	2
.L22:
	.word	barriers
	.word	330
	.size	initBarriers, .-initBarriers
	.align	2
	.global	updateBarrier
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBarrier, %function
updateBarrier:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	b	updateBarrier.part.0
	.size	updateBarrier, .-updateBarrier
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	ip, #3
	push	{r4, r5, lr}
	mov	r1, #118
	mov	r5, #130
	mov	r4, #1
	mov	lr, #5
	mov	r2, #10
	mov	r0, #20
	ldr	r3, .L28
	strb	ip, [r3, #36]
	str	r5, [r3]
	str	r4, [r3, #16]
	str	lr, [r3, #28]
	str	r0, [r3, #40]
	str	r1, [r3, #4]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	pop	{r4, r5, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L52
	ldrh	r3, [r3, #48]
	ldr	r2, .L52+4
	tst	r3, #32
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r5, [r2, #4]
	bne	.L31
	cmp	r5, #9
	ldrgt	r3, [r2, #16]
	subgt	r5, r5, r3
	strgt	r5, [r2, #4]
.L31:
	ldr	r3, .L52
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L32
	ldr	r3, [r2, #16]
	rsb	r1, r3, #230
	cmp	r1, r5
	addgt	r5, r5, r3
	strgt	r5, [r2, #4]
.L32:
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	tst	r3, #2
	ldr	r4, [r2]
	ldr	r3, [r2, #40]
	beq	.L49
	ldr	r1, .L52+12
	ldrh	r1, [r1]
	ands	r1, r1, #2
	beq	.L35
.L49:
	add	r1, r3, #1
.L34:
	ldr	lr, [r2, #24]
	ldr	r6, [r2, #28]
	ldr	r9, .L52+16
	ldr	r8, .L52+20
	ldr	r3, .L52+24
	add	lr, r4, lr
	sub	r6, r6, #1
	mov	r7, #0
	str	r1, [r2, #40]
	ldr	fp, [r9]
	ldr	r10, [r8]
	sub	lr, lr, #1
	add	r6, r6, r5
	add	r0, r3, #720
	b	.L41
.L40:
	add	r3, r3, #48
	cmp	r3, r0
	beq	.L50
.L41:
	ldr	r1, [r3, #36]
	cmp	r1, #1
	bne	.L40
	ldr	ip, [r3]
	ldr	r2, [r3, #20]
	add	r2, ip, r2
	sub	r2, r2, #1
	cmp	r2, r4
	ble	.L40
	cmp	ip, lr
	bge	.L40
	ldr	ip, [r3, #4]
	ldr	r2, [r3, #24]
	add	r2, ip, r2
	sub	r2, r2, #1
	cmp	r2, r5
	ble	.L40
	cmp	ip, r6
	movlt	fp, #0
	movlt	r2, fp
	add	r3, r3, #48
	strlt	r2, [r3, #-12]
	movlt	r7, r1
	sublt	r10, r10, #1
	cmp	r3, r0
	bne	.L41
.L50:
	cmp	r7, #0
	strne	fp, [r9]
	strne	r10, [r8]
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L35:
	cmp	r3, #19
	ble	.L49
	ldr	ip, .L52+28
	mov	r3, r1
	mov	r1, ip
.L39:
	ldr	r0, [r1, #36]
	cmp	r0, #0
	beq	.L51
	add	r3, r3, #1
	cmp	r3, #5
	add	r1, r1, #48
	bne	.L39
.L38:
	mov	r1, #1
	b	.L34
.L51:
	mov	lr, #1
	mov	r1, #3
	add	r3, r3, r3, lsl lr
	str	r4, [ip, r3, lsl #4]
	add	r3, ip, r3, lsl #4
	str	r5, [r3, #4]
	str	r0, [r3, #40]
	str	lr, [r3, #36]
	str	r1, [r3, #44]
	b	.L38
.L53:
	.align	2
.L52:
	.word	67109120
	.word	player
	.word	oldButtons
	.word	buttons
	.word	playerRemaining
	.word	ballsRemaining
	.word	ballbullets
	.word	playerbullets
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r4, .L56
	ldrb	r2, [r4, #36]	@ zero_extendqisi2
	sub	sp, sp, #12
	ldr	r3, [r4, #24]
	str	r2, [sp]
	ldr	r1, [r4]
	ldr	r2, [r4, #28]
	ldr	r0, [r4, #4]
	ldr	r5, .L56+4
	mov	lr, pc
	bx	r5
	ldr	r3, [r4, #4]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	player
	.word	drawRect4
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L64
	push	{r4, r5, r6, r7, r8, lr}
	mov	r3, r0
	mov	r8, #2
	mov	r5, #1
	mov	r1, #0
	mvn	r4, #1
	mvn	lr, #0
	ldr	r2, .L64+4
	add	r6, r2, #8
	ldm	r6, {r6, r7}
	add	ip, r0, #240
.L59:
	str	r8, [r3, #20]
	str	r5, [r3, #24]
	ldr	r2, [r0, #20]
	rsb	r2, r2, #0
	str	r2, [r3]
	str	r4, [r3, #16]
	strb	lr, [r3, #32]
	str	r1, [r3, #36]
	stmib	r3, {r1, r6, r7}
	add	r3, r3, #48
	cmp	r3, ip
	bne	.L59
	mov	r5, #2
	mov	r4, #1
	mov	r1, #0
	mvn	lr, #1
	mvn	ip, #0
	ldr	r3, .L64+8
	add	r0, r3, #720
.L60:
	str	r5, [r3, #20]
	str	r4, [r3, #24]
	str	r2, [r3]
	strb	ip, [r3, #32]
	str	r1, [r3, #36]
	stmib	r3, {r1, r6, r7, lr}
	add	r3, r3, #48
	cmp	r3, r0
	bne	.L60
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	playerbullets
	.word	player
	.word	ballbullets
	.size	initBullets, .-initBullets
	.align	2
	.global	firePlayerBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	firePlayerBullet, %function
firePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L77
	mov	r2, r0
	ldr	r1, [r2, #36]
	cmp	r1, #0
	mov	r3, #0
	beq	.L76
.L67:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #48
	bxeq	lr
	ldr	r1, [r2, #36]
	cmp	r1, #0
	bne	.L67
.L76:
	push	{r4, lr}
	mov	lr, #1
	mov	ip, #3
	ldr	r2, .L77+4
	ldr	r4, [r2]
	add	r3, r3, r3, lsl lr
	ldr	r2, [r2, #4]
	str	r4, [r0, r3, lsl #4]
	add	r3, r0, r3, lsl #4
	str	lr, [r3, #36]
	str	r2, [r3, #4]
	str	r1, [r3, #40]
	str	ip, [r3, #44]
	pop	{r4, lr}
	bx	lr
.L78:
	.align	2
.L77:
	.word	playerbullets
	.word	player
	.size	firePlayerBullet, .-firePlayerBullet
	.align	2
	.global	fireBallBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBallBullet, %function
fireBallBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L89
	mov	r3, #0
	mov	r2, ip
	b	.L82
.L80:
	add	r3, r3, #1
	cmp	r3, #15
	add	r2, r2, #48
	bxeq	lr
.L82:
	ldr	r1, [r2, #36]
	cmp	r1, #0
	bne	.L80
	push	{r4, lr}
	mov	lr, #1
	mov	r2, #3
	ldr	r4, [r0]
	add	r3, r3, r3, lsl lr
	ldr	r0, [r0, #4]
	str	r4, [ip, r3, lsl #4]
	add	r3, ip, r3, lsl #4
	str	lr, [r3, #36]
	str	r0, [r3, #4]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	pop	{r4, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	ballbullets
	.size	fireBallBullet, .-fireBallBullet
	.align	2
	.global	updatePlayerBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayerBullet, %function
updatePlayerBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	b	updatePlayerBullet.part.0
	.size	updatePlayerBullet, .-updatePlayerBullet
	.align	2
	.global	updateBallBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBallBullet, %function
updateBallBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0]
	cmp	r3, #159
	movgt	r3, #0
	addle	r3, r3, #1
	strle	r3, [r0]
	strgt	r3, [r0, #36]
	bx	lr
	.size	updateBallBullet, .-updateBallBullet
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	ldr	r3, [r0, #36]
	cmp	r3, #0
	mov	r4, r0
	sub	sp, sp, #12
	bne	.L103
	ldr	r3, [r0, #40]
	cmp	r3, #0
	beq	.L104
.L101:
	ldm	r4, {r2, r3}
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L104:
	str	r3, [sp]
	ldr	r5, .L105
	ldr	r3, [r0, #20]
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4, #40]
	b	.L101
.L103:
	mov	r2, #0
	ldr	r3, [r0, #20]
	str	r2, [sp]
	ldr	r5, .L105
	ldr	r2, [r0, #24]
	ldr	r1, [r0, #8]
	ldr	r0, [r0, #12]
	mov	lr, pc
	bx	r5
	ldrb	r2, [r4, #32]	@ zero_extendqisi2
	ldr	r3, [r4, #20]
	str	r2, [sp]
	ldr	r2, [r4, #24]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	b	.L101
.L106:
	.align	2
.L105:
	.word	drawRect4
	.size	drawBullet, .-drawBullet
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, .L126
	sub	sp, sp, #12
	mov	r0, #254
	mov	lr, pc
	bx	r3
	bl	drawPlayer
	ldr	r0, .L126+4
	bl	drawBullet
	ldr	r0, .L126+8
	bl	drawBullet
	ldr	r0, .L126+12
	bl	drawBullet
	ldr	r0, .L126+16
	bl	drawBullet
	ldr	r0, .L126+20
	bl	drawBullet
	ldr	r4, .L126+24
	add	r5, r4, #720
.L108:
	mov	r0, r4
	add	r4, r4, #48
	bl	drawBullet
	cmp	r4, r5
	bne	.L108
	ldr	r4, .L126+28
	ldr	r7, .L126+32
	ldr	r6, .L126+36
	add	r5, r4, #840
	b	.L110
.L109:
	add	r4, r4, #56
	cmp	r4, r5
	beq	.L124
.L110:
	ldr	r3, [r4, #36]
	cmp	r3, #0
	beq	.L109
	str	r7, [sp]
	add	r4, r4, #56
	ldr	r3, [r4, #-32]
	ldr	r2, [r4, #-28]
	ldr	r1, [r4, #-56]
	ldr	r0, [r4, #-52]
	mov	lr, pc
	bx	r6
	cmp	r4, r5
	bne	.L110
.L124:
	mov	r6, #0
	ldr	r4, .L126+40
	ldr	r7, .L126+44
	add	r5, r4, #96
.L113:
	ldr	r3, [r4, #28]
	cmp	r3, #0
	beq	.L111
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bgt	.L125
.L111:
	str	r6, [r4, #28]
.L112:
	add	r4, r4, #32
	cmp	r5, r4
	bne	.L113
	add	sp, sp, #12
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L125:
	ldrb	r2, [r4, #20]	@ zero_extendqisi2
	ldr	r3, [r4, #8]
	str	r2, [sp]
	ldr	r2, [r4, #12]
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	b	.L112
.L127:
	.align	2
.L126:
	.word	fillScreen4
	.word	playerbullets
	.word	playerbullets+48
	.word	playerbullets+96
	.word	playerbullets+144
	.word	playerbullets+192
	.word	ballbullets
	.word	balls
	.word	enemyBitmap
	.word	drawImage4
	.word	barriers
	.word	drawRect4
	.size	drawGame, .-drawGame
	.align	2
	.global	initBalls
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBalls, %function
initBalls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, #10
	ldr	r4, .L136
	mov	r8, r9
	mov	r5, r4
	mov	fp, #16
	ldr	r6, .L136+4
	ldr	r7, .L136+8
.L129:
	mov	r3, #0
	mov	r10, #1
	str	r3, [r5, #40]
	str	r3, [r5, #44]
	stm	r5, {r8, r9}
	str	r9, [r5, #12]
	str	fp, [r5, #24]
	str	fp, [r5, #28]
	str	r10, [r5, #16]
	str	r10, [r5, #20]
	str	r10, [r5, #36]
	mov	lr, pc
	bx	r6
	smull	r3, r2, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #3
	add	r9, r9, #20
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	cmp	r9, #110
	str	r10, [r5, #52]
	str	r0, [r5, #48]
	add	r5, r5, #56
	bne	.L129
	mov	r9, #10
	mov	r10, #16
	mov	r8, #25
	ldr	r5, .L136
	ldr	r7, .L136+8
.L130:
	mov	r3, #1
	mov	r2, #0
	str	r3, [r5, #296]
	str	r3, [r5, #300]
	str	r3, [r5, #316]
	str	r9, [r5, #284]
	str	r9, [r5, #292]
	str	r2, [r5, #320]
	str	r2, [r5, #324]
	str	r10, [r5, #304]
	str	r10, [r5, #308]
	str	r8, [r5, #280]
	mov	lr, pc
	bx	r6
	mov	r2, #2
	smull	r3, r1, r7, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr #3
	add	r9, r9, #20
	add	r3, r3, r3, lsl r2
	sub	r0, r0, r3, lsl r2
	cmp	r9, #110
	str	r0, [r5, #328]
	str	r2, [r5, #332]
	add	r5, r5, #56
	bne	.L130
	mov	r8, #10
	mov	r9, #16
	mov	r7, #40
	ldr	r5, .L136+8
.L131:
	mov	r3, #1
	mov	r2, #0
	str	r3, [r4, #576]
	str	r3, [r4, #580]
	str	r3, [r4, #596]
	str	r8, [r4, #564]
	str	r8, [r4, #572]
	str	r2, [r4, #600]
	str	r2, [r4, #604]
	str	r9, [r4, #584]
	str	r9, [r4, #588]
	str	r7, [r4, #560]
	mov	lr, pc
	bx	r6
	mov	r2, #3
	smull	r3, r1, r5, r0
	asr	r3, r0, #31
	rsb	r3, r3, r1, asr r2
	add	r8, r8, #20
	add	r3, r3, r3, lsl #2
	sub	r0, r0, r3, lsl #2
	cmp	r8, #110
	str	r0, [r4, #608]
	str	r2, [r4, #612]
	add	r4, r4, #56
	bne	.L131
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L137:
	.align	2
.L136:
	.word	balls
	.word	rand
	.word	1717986919
	.size	initBalls, .-initBalls
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #118
	mov	r4, #10
	mov	ip, #130
	mov	r0, #5
	mvn	r1, #3
	mov	r6, #20
	mov	r5, #1
	ldr	r3, .L142
	str	ip, [r3]
	str	r0, [r3, #28]
	strb	r1, [r3, #36]
	str	r2, [r3, #4]
	str	r2, [r3, #12]
	str	r4, [r3, #24]
	str	r4, [r3, #32]
	str	r5, [r3, #16]
	str	r6, [r3, #40]
	bl	initBullets
	mov	r2, r4
	mov	r0, r6
	mov	r1, #0
	mov	r4, #110
	mvn	lr, #2
	ldr	r3, .L142+4
	ldr	ip, .L142+8
.L139:
	str	r1, [r3, #4]
	add	r1, r1, #110
	cmp	r1, ip
	str	r0, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #16]
	str	r4, [r3]
	strb	lr, [r3, #20]
	str	r2, [r3, #24]
	str	r5, [r3, #28]
	add	r3, r3, #32
	bne	.L139
	bl	initBalls
	ldr	r4, .L142+12
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L142+16
	mov	lr, pc
	bx	r4
	mov	ip, #31
	mov	r1, #992
	mov	r2, #31744
	mov	r4, #0
	mvn	lr, #32768
	mov	r0, #15
	ldr	r3, .L142+20
	strh	ip, [r3, #246]	@ movhi
	strh	r1, [r3, #248]	@ movhi
	strh	r2, [r3, #250]	@ movhi
	ldr	ip, .L142+24
	ldr	r1, .L142+28
	ldr	r2, .L142+32
	strh	r4, [r3, #244]	@ movhi
	strh	lr, [r3, #252]	@ movhi
	strh	ip, [r3, #254]	@ movhi
	str	r5, [r2]
	str	r0, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L143:
	.align	2
.L142:
	.word	player
	.word	barriers
	.word	330
	.word	DMANow
	.word	enemyPal
	.word	83886336
	.word	15855
	.word	ballsRemaining
	.word	playerRemaining
	.size	initGame, .-initGame
	.align	2
	.global	updateBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBall, %function
updateBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #1
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	lr, .L202
	mov	r4, r3
	mov	r6, r3
	mov	r5, r3
	mov	r1, lr
	b	.L150
.L145:
	cmp	ip, #4
	ldr	r2, [r1, #36]
	bls	.L195
	cmp	r2, #0
	movne	r4, #0
	cmp	r3, #15
	beq	.L149
.L174:
	add	r3, r3, #1
	add	r1, r1, #56
.L150:
	sub	r2, r3, #1
	cmp	r2, #4
	sub	ip, r3, #6
	bhi	.L145
	ldr	r2, [r1, #36]
	cmp	r2, #0
	movne	r5, #0
	b	.L174
.L149:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L144
	ldr	r2, [r0, #4]
	cmp	r2, #0
	ble	.L196
	ldr	r3, [r0, #28]
	add	r3, r2, r3
	cmp	r3, #239
	ble	.L157
	mvn	r1, #0
	ldr	r3, .L202+4
.L158:
	str	r1, [lr, #20]
	add	lr, lr, #56
	cmp	lr, r3
	bne	.L158
.L157:
	cmp	r4, #0
	bne	.L197
	ldr	r3, [r0, #48]
	cmp	r3, #19
	bgt	.L159
.L161:
	ldr	ip, [r0]
	add	r1, r3, #1
.L160:
	mov	r6, #0
	mov	fp, r6
	ldr	lr, [r0, #20]
	ldr	r8, .L202+8
	ldr	r7, .L202+12
	ldr	r3, .L202+16
	add	lr, r2, lr
	str	r1, [r0, #48]
	str	lr, [r0, #4]
	ldr	r10, [r8]
	ldr	r9, [r7]
	add	r4, r3, #240
.L171:
	ldr	r1, [r3, #36]
	cmp	r1, #1
	beq	.L198
.L170:
	add	r3, r3, #48
	cmp	r4, r3
	bne	.L171
	ldr	r2, .L202+20
	ldr	r4, [r2]
	ldr	r1, [r2, #32]
	add	r3, r4, r1
	cmp	r6, #0
	sub	r3, r3, #1
	strne	r10, [r8]
	strne	r9, [r7]
	cmp	r3, ip
	ble	.L144
	ldr	r3, [r0, #24]
	add	r3, ip, r3
	sub	r3, r3, #1
	cmp	r4, r3
	bge	.L144
	ldr	r2, [r2, #4]
	add	r3, r1, r2
	sub	r3, r3, #1
	cmp	lr, r3
	bge	.L144
	ldr	r3, [r0, #28]
	add	r3, lr, r3
	sub	r3, r3, #1
	cmp	r2, r3
	movlt	r2, #0
	ldrlt	r3, .L202+24
	strlt	r2, [r3]
.L144:
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L198:
	ldr	r5, [r3]
	ldr	r2, [r3, #20]
	add	r2, r5, r2
	sub	r2, r2, #1
	cmp	r2, ip
	ble	.L170
	ldr	r2, [r0, #24]
	add	r2, ip, r2
	sub	r2, r2, #1
	cmp	r5, r2
	bge	.L170
	ldr	r5, [r3, #4]
	ldr	r2, [r3, #24]
	add	r2, r5, r2
	sub	r2, r2, #1
	cmp	lr, r2
	bge	.L170
	ldr	r2, [r0, #28]
	add	r2, lr, r2
	sub	r2, r2, #1
	cmp	r5, r2
	bge	.L170
	str	fp, [r3, #36]
	mov	r6, r1
	str	fp, [r0, #36]
	ldr	ip, [r0]
	sub	r10, r10, #1
	add	r9, r9, #100
	b	.L170
.L197:
	cmp	r6, #0
	ldr	r3, [r0, #48]
	bne	.L165
	cmp	r3, #19
	ble	.L161
	ldr	r1, [r0, #52]
	cmp	r1, #2
	bne	.L161
	ldr	lr, .L202+28
	mov	r3, lr
.L167:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L199
	add	r6, r6, #1
	cmp	r6, #15
	add	r3, r3, #48
	bne	.L167
.L194:
	ldr	ip, [r0]
.L163:
	mov	r1, #1
	b	.L160
.L196:
	mov	r1, #1
	ldr	r3, .L202+4
.L154:
	str	r1, [lr, #20]
	add	lr, lr, #56
	cmp	lr, r3
	bne	.L154
	b	.L157
.L165:
	cmp	r5, #0
	bne	.L161
	cmp	r3, #19
	ble	.L161
	ldr	r1, [r0, #52]
	cmp	r1, #1
	bne	.L161
	ldr	lr, .L202+28
	mov	r3, lr
.L169:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L200
	add	r5, r5, #1
	cmp	r5, #15
	add	r3, r3, #48
	bne	.L169
	b	.L194
.L159:
	ldr	r1, [r0, #52]
	cmp	r1, #3
	bne	.L161
	ldr	lr, .L202+28
	mov	r3, lr
.L164:
	ldr	r1, [r3, #36]
	cmp	r1, #0
	beq	.L201
	add	r4, r4, #1
	cmp	r4, #15
	add	r3, r3, #48
	bne	.L164
	b	.L194
.L201:
	mov	r6, #1
	mov	r5, #3
	ldr	ip, [r0]
	add	r4, r4, r4, lsl r6
	add	r3, lr, r4, lsl #4
	str	r6, [r3, #36]
	str	r2, [r3, #4]
	str	r1, [r3, #40]
	str	ip, [lr, r4, lsl #4]
	str	r5, [r3, #44]
	b	.L163
.L199:
	mov	r5, #1
	mov	r4, #3
	ldr	ip, [r0]
	add	r6, r6, r6, lsl r5
	add	r3, lr, r6, lsl #4
	str	ip, [lr, r6, lsl #4]
	str	r5, [r3, #36]
	str	r2, [r3, #4]
	str	r1, [r3, #40]
	str	r4, [r3, #44]
	b	.L163
.L200:
	mov	r6, #1
	mov	r4, #3
	ldr	ip, [r0]
	add	r5, r5, r5, lsl r6
	add	r3, lr, r5, lsl #4
	str	ip, [lr, r5, lsl #4]
	str	r6, [r3, #36]
	str	r2, [r3, #4]
	str	r1, [r3, #40]
	str	r4, [r3, #44]
	b	.L163
.L195:
	cmp	r2, #0
	movne	r6, #0
	b	.L174
.L203:
	.align	2
.L202:
	.word	balls
	.word	balls+840
	.word	ballsRemaining
	.word	score
	.word	playerbullets
	.word	player
	.word	playerRemaining
	.word	ballbullets
	.size	updateBall, .-updateBall
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	bl	updatePlayer
	ldr	r0, .L230
	add	r4, r0, #240
.L206:
	ldr	r3, [r0, #36]
	cmp	r3, #0
	blne	updatePlayerBullet.part.0
.L205:
	add	r0, r0, #48
	cmp	r0, r4
	bne	.L206
	mov	r0, #0
	ldr	r3, .L230+4
	add	r1, r3, #720
.L209:
	ldr	r2, [r3, #36]
	cmp	r2, #0
	beq	.L207
	ldr	r2, [r3]
	cmp	r2, #159
	add	r2, r2, #1
	strle	r2, [r3]
	strgt	r0, [r3, #36]
.L207:
	add	r3, r3, #48
	cmp	r3, r1
	bne	.L209
	ldr	r4, .L230+8
	add	r5, r4, #840
.L210:
	mov	r0, r4
	add	r4, r4, #56
	bl	updateBall
	cmp	r4, r5
	bne	.L210
	ldr	r4, .L230+12
	ldr	r3, [r4, #28]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBarrier.part.0
.L211:
	ldr	r3, [r4, #60]
	cmp	r3, #0
	ldrne	r0, .L230+16
	blne	updateBarrier.part.0
.L212:
	ldr	r3, [r4, #92]
	cmp	r3, #0
	ldrne	r0, .L230+20
	popne	{r4, r5, r6, lr}
	bne	updateBarrier.part.0
.L204:
	pop	{r4, r5, r6, lr}
	bx	lr
.L231:
	.align	2
.L230:
	.word	playerbullets
	.word	ballbullets
	.word	balls
	.word	barriers
	.word	barriers+32
	.word	barriers+64
	.size	updateGame, .-updateGame
	.align	2
	.global	drawBall
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBall, %function
drawBall:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #36]
	cmp	r3, #0
	bxeq	lr
	push	{r4, lr}
	ldr	r2, .L241
	sub	sp, sp, #8
	ldr	r3, [r0, #24]
	str	r2, [sp]
	ldr	r4, .L241+4
	ldr	r2, [r0, #28]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L242:
	.align	2
.L241:
	.word	enemyBitmap
	.word	drawImage4
	.size	drawBall, .-drawBall
	.align	2
	.global	drawBarrier
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBarrier, %function
drawBarrier:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #28]
	cmp	r3, #0
	beq	.L244
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bgt	.L253
.L244:
	mov	r3, #0
	str	r3, [r0, #28]
	bx	lr
.L253:
	push	{r4, lr}
	ldrb	r2, [r0, #20]	@ zero_extendqisi2
	sub	sp, sp, #8
	ldr	r3, [r0, #8]
	str	r2, [sp]
	ldr	r4, .L254
	ldr	r2, [r0, #12]
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	mov	lr, pc
	bx	r4
	add	sp, sp, #8
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L255:
	.align	2
.L254:
	.word	drawRect4
	.size	drawBarrier, .-drawBarrier
	.comm	playerRemaining,4,4
	.global	prevdirection
	.global	direction
	.comm	ballsRemaining,4,4
	.comm	barriers,96,4
	.comm	balls,840,4
	.comm	ballbullets,720,4
	.comm	playerbullets,240,4
	.comm	player,44,4
	.bss
	.align	2
	.type	prevdirection, %object
	.size	prevdirection, 4
prevdirection:
	.space	4
	.type	direction, %object
	.size	direction, 4
direction:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
