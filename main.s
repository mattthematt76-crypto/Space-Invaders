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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #83886080
	ldr	r1, .L4
	mov	r3, #256
	mov	r0, #3
	ldr	r4, .L4+4
	mov	lr, pc
	bx	r4
	ldr	r0, .L4+8
	ldr	r3, .L4+12
	mov	lr, pc
	bx	r3
	mov	r2, #31
	mov	r4, #0
	mov	ip, #992
	mov	r0, #31744
	mvn	r1, #32768
	ldr	r3, .L4+16
	strh	r2, [r3, #246]	@ movhi
	ldr	r2, .L4+20
	strh	r4, [r3, #244]	@ movhi
	strh	r2, [r3, #254]	@ movhi
	strh	ip, [r3, #248]	@ movhi
	strh	r0, [r3, #250]	@ movhi
	strh	r1, [r3, #252]	@ movhi
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L4+28
	mov	lr, pc
	bx	r3
	ldr	r2, .L4+32
	ldr	r3, .L4+36
	str	r4, [r2]
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	startPal
	.word	DMANow
	.word	startBitmap
	.word	drawFullscreenImage4
	.word	83886336
	.word	15855
	.word	waitForVBlank
	.word	flipPage
	.word	seed
	.word	state
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldr	r2, .L7
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	1044
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	Win.part.0, %function
Win.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToStart
.L12:
	.align	2
.L11:
	.word	buttons
	.size	Win.part.0, .-Win.part.0
	.set	Lose.part.0,Win.part.0
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC1:
	.ascii	"Paused\000"
	.text
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #255
	ldr	r3, .L15
	mov	lr, pc
	bx	r3
	ldr	r4, .L15+4
	mov	r3, #254
	mov	r1, #80
	ldr	r2, .L15+8
	mov	r0, #100
	mov	lr, pc
	bx	r4
	mov	r1, #2
	ldr	r2, .L15+12
	ldr	r3, .L15+16
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	fillScreen4
	.word	drawString4
	.word	.LC1
	.word	state
	.word	waitForVBlank
	.word	flipPage
	.size	goToPause, .-goToPause
	.section	.rodata.str1.4
	.align	2
.LC2:
	.ascii	"You Win!!\000"
	.text
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r2, .L19
	push	{r4, lr}
	mov	r0, #252
	ldr	r3, .L19+4
	str	r1, [r2]
	ldr	r4, .L19+8
	mov	lr, pc
	bx	r3
	ldr	r2, .L19+12
	mov	r1, #80
	mov	r3, #250
	mov	r0, #90
	mov	lr, pc
	bx	r4
	ldr	r3, .L19+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L19+20
	mov	lr, pc
	bx	r3
	mov	r2, #3
	ldr	r3, .L19+24
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L20:
	.align	2
.L19:
	.word	.LANCHOR0
	.word	fillScreen4
	.word	drawString4
	.word	.LC2
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToWin, .-goToWin
	.section	.rodata.str1.4
	.align	2
.LC3:
	.ascii	"You Lose :(\000"
	.text
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r0, #251
	ldr	r3, .L23
	mov	lr, pc
	bx	r3
	ldr	r4, .L23+4
	ldr	r2, .L23+8
	mov	r1, #80
	mov	r3, #250
	mov	r0, #85
	mov	lr, pc
	bx	r4
	ldr	r3, .L23+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L23+16
	mov	lr, pc
	bx	r3
	mov	r2, #4
	ldr	r3, .L23+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L24:
	.align	2
.L23:
	.word	fillScreen4
	.word	drawString4
	.word	.LC3
	.word	waitForVBlank
	.word	flipPage
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, lr}
	ldr	r2, .L27
	ldr	r3, .L27+4
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L27+8
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	state
	.word	waitForVBlank
	.word	flipPage
	.size	goToGame, .-goToGame
	.align	2
	.global	Start
	.syntax unified
	.arm
	.fpu softvfp
	.type	Start, %function
Start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L41
	ldr	r3, [r4]
	ldr	r5, .L41+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r5
	ldr	r3, .L41+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L30
	ldr	r2, .L41+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L39
.L30:
	tst	r3, #4
	beq	.L29
	ldr	r3, .L41+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L40
.L29:
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	ldr	r0, [r4]
	ldr	r3, .L41+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L41+20
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L41+24
	str	r2, [r3]
	mov	lr, pc
	bx	r5
	ldr	r3, .L41+28
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L40:
	pop	{r4, r5, r6, lr}
	b	goToPause
.L42:
	.align	2
.L41:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.word	state
	.word	flipPage
	.size	Start, .-Start
	.align	2
	.global	Pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	Pause, %function
Pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L57
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L44
	ldr	r2, .L57+4
	ldrh	r2, [r2]
	tst	r2, #4
	beq	.L56
.L44:
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L57+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	mov	r1, #1
	push	{r4, lr}
	ldr	r2, .L57+8
	ldr	r3, .L57+12
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L57+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L56:
	b	goToStart
.L58:
	.align	2
.L57:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	waitForVBlank
	.word	flipPage
	.size	Pause, .-Pause
	.section	.rodata.str1.4
	.align	2
.LC4:
	.ascii	"Score: %d\000"
	.text
	.align	2
	.global	Game
	.syntax unified
	.arm
	.fpu softvfp
	.type	Game, %function
Game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L70
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+8
	ldr	r1, .L70+12
	ldr	r2, [r3]
	ldr	r0, .L70+16
	ldr	r3, .L70+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L70+24
	mov	r1, #145
	ldr	r2, .L70+16
	mov	r3, #255
	mov	r0, #15
	mov	lr, pc
	bx	r4
	ldr	r3, .L70+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L70+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L67
.L60:
	ldr	r3, .L70+40
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L68
.L61:
	ldr	r3, .L70+44
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
	ldr	r3, .L70+48
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
.L59:
	pop	{r4, lr}
	bx	lr
.L68:
	bl	goToWin
	b	.L61
.L67:
	bl	goToLose
	b	.L60
.L69:
	pop	{r4, lr}
	b	goToPause
.L71:
	.align	2
.L70:
	.word	updateGame
	.word	drawGame
	.word	.LANCHOR0
	.word	.LC4
	.word	buffer
	.word	sprintf
	.word	drawString4
	.word	waitForVBlank
	.word	flipPage
	.word	playerRemaining
	.word	ballsRemaining
	.word	oldButtons
	.word	buttons
	.size	Game, .-Game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	ldr	r2, .L86
	ldr	r6, .L86+4
	ldr	r10, .L86+8
	push	{r4, r7, fp, lr}
	strh	r2, [r3]	@ movhi
	ldr	r3, .L86+12
	mov	lr, pc
	bx	r3
	ldr	r5, .L86+16
	ldr	r2, [r6]
	ldrh	r0, [r10]
	ldr	r9, .L86+20
	ldr	r8, .L86+24
	ldr	fp, .L86+28
	ldr	r7, .L86+32
	ldr	r4, .L86+36
.L74:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r10]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L82
.L76:
	.word	.L80
	.word	.L79
	.word	.L78
	.word	.L77
	.word	.L75
.L75:
	tst	r0, #8
	beq	.L82
	mov	lr, pc
	bx	fp
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L74
.L77:
	tst	r0, #8
	beq	.L82
	ldr	r3, .L86+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L74
.L78:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L74
.L79:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L74
.L80:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [r10]
	b	.L74
.L82:
	mov	r0, r3
	b	.L74
.L87:
	.align	2
.L86:
	.word	1044
	.word	state
	.word	buttons
	.word	goToStart
	.word	oldButtons
	.word	Start
	.word	Pause
	.word	Lose.part.0
	.word	Game
	.word	67109120
	.word	Win.part.0
	.size	main, .-main
	.text
	.align	2
	.global	Lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	Lose, %function
Lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L90
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	b	Lose.part.0
.L91:
	.align	2
.L90:
	.word	oldButtons
	.size	Lose, .-Lose
	.align	2
	.global	Win
	.syntax unified
	.arm
	.fpu softvfp
	.type	Win, %function
Win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	Lose
	.size	Win, .-Win
	.comm	buffer,41,4
	.comm	seed,4,4
	.comm	state,4,4
	.global	score
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	score, %object
	.size	score, 4
score:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
