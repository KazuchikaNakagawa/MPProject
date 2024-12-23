	.file	1 "test.c"
	.section .mdebug.abi32
	.previous
	.nan	legacy
	.module	softfloat
	.module	nooddspreg
	.text
 #APP
	.global __start__		
	__start__:			
		lui $sp, 0		
		ori $sp, 0xff00		
		li $gp, 0		
		li $k0, 0x02000101	
		mtc0 $k0, $12		
	
 #NO_APP
	.align	2
	.globl	__reset__
	.set	nomips16
	.set	nomicromips
	.ent	__reset__
	.type	__reset__, @function
__reset__:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	lui	$2,%hi(__sbackup)
	addiu	$2,$2,%lo(__sbackup)
	sw	$2,0($fp)
	lui	$2,%hi(__sdata)
	addiu	$2,$2,%lo(__sdata)
	sw	$2,4($fp)
	b	$L2
$L3:
	lw	$3,0($fp)
	#nop
	addiu	$2,$3,4
	sw	$2,0($fp)
	lw	$2,4($fp)
	#nop
	addiu	$4,$2,4
	sw	$4,4($fp)
	lw	$3,0($3)
	#nop
	sw	$3,0($2)
$L2:
	lw	$3,4($fp)
	lui	$2,%hi(__edata)
	addiu	$2,$2,%lo(__edata)
	sltu	$2,$3,$2
	bne	$2,$0,$L3
	lui	$2,%hi(__sbss)
	addiu	$2,$2,%lo(__sbss)
	sw	$2,4($fp)
	b	$L4
$L5:
	lw	$2,4($fp)
	#nop
	sw	$0,0($2)
	lw	$2,4($fp)
	#nop
	addiu	$2,$2,4
	sw	$2,4($fp)
$L4:
	lw	$3,4($fp)
	lui	$2,%hi(__ebss)
	addiu	$2,$2,%lo(__ebss)
	sltu	$2,$3,$2
	bne	$2,$0,$L5
 #APP
 # 24 "crt0.c" 1
	j main
 # 0 "" 2
 #NO_APP
	.set	noreorder
	nop
	.set	reorder
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	jr	$31
	.end	__reset__
	.size	__reset__, .-__reset__
 #APP
	nop			
		nop			
		nop			
		nop			
		nop			
	__vector__:			
	.set noat			
		move $k0, $sp		
		lui $sp, 0		
		ori $sp, 0xc000		
		addiu $sp, $sp, -128	
		sw $k0, 124($sp)	
		sw $at, 120($sp)	
	.set at			
		sw $v0, 116($sp)	
		sw $v1, 112($sp)	
		sw $a0, 108($sp)	
		sw $a1, 104($sp)	
		sw $a2, 100($sp)	
		sw $a3,  96($sp)	
		sw $t0,  92($sp)	
		sw $t1,  88($sp)	
		sw $t2,  84($sp)	
		sw $t3,  80($sp)	
		sw $t4,  76($sp)	
		sw $t5,  72($sp)	
		sw $t6,  68($sp)	
		sw $t7,  64($sp)	
		sw $s0,  60($sp)	
		sw $s1,  56($sp)	
		sw $s2,  52($sp)	
		sw $s3,  48($sp)	
		sw $s4,  44($sp)	
		sw $s5,  40($sp)	
		sw $s6,  36($sp)	
		sw $s7,  32($sp)	
		sw $t8,  28($sp)	
		sw $t9,  24($sp)	
		sw $gp,  20($sp)	
		sw $s8,  16($sp)	
		sw $ra,  12($sp)	
		jal interrupt_handler	
		lw $ra,  12($sp)	
		lw $s8,  16($sp)	
		lw $gp,  20($sp)	
		lw $t9,  24($sp)	
		lw $t8,  28($sp)	
		lw $s7,  32($sp)	
		lw $s6,  36($sp)	
		lw $s5,  40($sp)	
		lw $s4,  44($sp)	
		lw $s3,  48($sp)	
		lw $s2,  52($sp)	
		lw $s1,  56($sp)	
		lw $s0,  60($sp)	
		lw $t7,  64($sp)	
		lw $t6,  68($sp)	
		lw $t5,  72($sp)	
		lw $t4,  76($sp)	
		lw $t3,  80($sp)	
		lw $t2,  84($sp)	
		lw $t1,  88($sp)	
		lw $t0,  92($sp)	
		lw $a3,  96($sp)	
		lw $a2, 100($sp)	
		lw $a1, 104($sp)	
		lw $a0, 108($sp)	
		lw $v1, 112($sp)	
		lw $v0, 116($sp)	
	.set noat			
		lw $at, 120($sp)	
		lw $k0, 124($sp)	
		move $sp, $k0		
		mfc0 $k1, $14		
		nop			
		rfe			
		nop			
		jr $k1			
		nop			
	
 #NO_APP
	.align	2
	.globl	memcpy
	.set	nomips16
	.set	nomicromips
	.ent	memcpy
	.type	memcpy, @function
memcpy:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	sw	$5,20($fp)
	sw	$6,24($fp)
	lw	$2,16($fp)
	nop
	sw	$2,0($fp)
	lw	$2,20($fp)
	nop
	sw	$2,4($fp)
	b	$L7
	nop

$L8:
	lw	$3,4($fp)
	nop
	addiu	$2,$3,1
	sw	$2,4($fp)
	lw	$2,0($fp)
	nop
	addiu	$4,$2,1
	sw	$4,0($fp)
	lb	$3,0($3)
	nop
	sb	$3,0($2)
$L7:
	lw	$2,24($fp)
	nop
	addiu	$3,$2,-1
	sw	$3,24($fp)
	bne	$2,$0,$L8
	nop

	lw	$2,16($fp)
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	memcpy
	.size	memcpy, .-memcpy
	.globl	cos_table
	.data
	.align	2
	.type	cos_table, @object
	.size	cos_table, 1024
cos_table:
	.word	-100
	.word	-99
	.word	-99
	.word	-99
	.word	-99
	.word	-99
	.word	-98
	.word	-98
	.word	-98
	.word	-97
	.word	-97
	.word	-96
	.word	-95
	.word	-94
	.word	-94
	.word	-93
	.word	-92
	.word	-91
	.word	-90
	.word	-89
	.word	-88
	.word	-87
	.word	-85
	.word	-84
	.word	-83
	.word	-81
	.word	-80
	.word	-78
	.word	-77
	.word	-75
	.word	-74
	.word	-72
	.word	-70
	.word	-68
	.word	-67
	.word	-65
	.word	-63
	.word	-61
	.word	-59
	.word	-57
	.word	-55
	.word	-53
	.word	-51
	.word	-49
	.word	-47
	.word	-44
	.word	-42
	.word	-40
	.word	-38
	.word	-35
	.word	-33
	.word	-31
	.word	-29
	.word	-26
	.word	-24
	.word	-21
	.word	-19
	.word	-17
	.word	-14
	.word	-12
	.word	-9
	.word	-7
	.word	-4
	.word	-2
	.word	0
	.word	2
	.word	4
	.word	7
	.word	9
	.word	12
	.word	14
	.word	17
	.word	19
	.word	21
	.word	24
	.word	26
	.word	29
	.word	31
	.word	33
	.word	35
	.word	38
	.word	40
	.word	42
	.word	44
	.word	47
	.word	49
	.word	51
	.word	53
	.word	55
	.word	57
	.word	59
	.word	61
	.word	63
	.word	65
	.word	67
	.word	68
	.word	70
	.word	72
	.word	74
	.word	75
	.word	77
	.word	78
	.word	80
	.word	81
	.word	83
	.word	84
	.word	85
	.word	87
	.word	88
	.word	89
	.word	90
	.word	91
	.word	92
	.word	93
	.word	94
	.word	94
	.word	95
	.word	96
	.word	97
	.word	97
	.word	98
	.word	98
	.word	98
	.word	99
	.word	99
	.word	99
	.word	99
	.word	99
	.word	100
	.word	99
	.word	99
	.word	99
	.word	99
	.word	99
	.word	98
	.word	98
	.word	98
	.word	97
	.word	97
	.word	96
	.word	95
	.word	94
	.word	94
	.word	93
	.word	92
	.word	91
	.word	90
	.word	89
	.word	88
	.word	87
	.word	85
	.word	84
	.word	83
	.word	81
	.word	80
	.word	78
	.word	77
	.word	75
	.word	74
	.word	72
	.word	70
	.word	68
	.word	67
	.word	65
	.word	63
	.word	61
	.word	59
	.word	57
	.word	55
	.word	53
	.word	51
	.word	49
	.word	47
	.word	44
	.word	42
	.word	40
	.word	38
	.word	35
	.word	33
	.word	31
	.word	29
	.word	26
	.word	24
	.word	21
	.word	19
	.word	17
	.word	14
	.word	12
	.word	9
	.word	7
	.word	4
	.word	2
	.word	0
	.word	-2
	.word	-4
	.word	-7
	.word	-9
	.word	-12
	.word	-14
	.word	-17
	.word	-19
	.word	-21
	.word	-24
	.word	-26
	.word	-29
	.word	-31
	.word	-33
	.word	-35
	.word	-38
	.word	-40
	.word	-42
	.word	-44
	.word	-47
	.word	-49
	.word	-51
	.word	-53
	.word	-55
	.word	-57
	.word	-59
	.word	-61
	.word	-63
	.word	-65
	.word	-67
	.word	-68
	.word	-70
	.word	-72
	.word	-74
	.word	-75
	.word	-77
	.word	-78
	.word	-80
	.word	-81
	.word	-83
	.word	-84
	.word	-85
	.word	-87
	.word	-88
	.word	-89
	.word	-90
	.word	-91
	.word	-92
	.word	-93
	.word	-94
	.word	-94
	.word	-95
	.word	-96
	.word	-97
	.word	-97
	.word	-98
	.word	-98
	.word	-98
	.word	-99
	.word	-99
	.word	-99
	.word	-99
	.word	-99

	.comm	win_a,4,4

	.comm	Win_b,4,4
	.globl	font8x8
	.rdata
	.align	2
	.type	font8x8, @object
	.size	font8x8, 768
font8x8:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	95
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	100
	.byte	60
	.byte	38
	.byte	100
	.byte	60
	.byte	38
	.byte	36
	.byte	0
	.byte	38
	.byte	73
	.byte	73
	.byte	127
	.byte	73
	.byte	73
	.byte	50
	.byte	0
	.byte	66
	.byte	37
	.byte	18
	.byte	8
	.byte	36
	.byte	82
	.byte	33
	.byte	0
	.byte	32
	.byte	80
	.byte	78
	.byte	85
	.byte	34
	.byte	88
	.byte	40
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	28
	.byte	34
	.byte	65
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	65
	.byte	34
	.byte	28
	.byte	0
	.byte	0
	.byte	0
	.byte	21
	.byte	21
	.byte	14
	.byte	14
	.byte	21
	.byte	21
	.byte	0
	.byte	0
	.byte	8
	.byte	8
	.byte	62
	.byte	8
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	80
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	64
	.byte	32
	.byte	16
	.byte	8
	.byte	4
	.byte	2
	.byte	1
	.byte	0
	.byte	0
	.byte	62
	.byte	65
	.byte	65
	.byte	65
	.byte	62
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	65
	.byte	127
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	66
	.byte	97
	.byte	81
	.byte	73
	.byte	110
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	65
	.byte	73
	.byte	73
	.byte	54
	.byte	0
	.byte	0
	.byte	0
	.byte	24
	.byte	20
	.byte	18
	.byte	127
	.byte	16
	.byte	0
	.byte	0
	.byte	0
	.byte	39
	.byte	73
	.byte	73
	.byte	73
	.byte	113
	.byte	0
	.byte	0
	.byte	0
	.byte	60
	.byte	74
	.byte	73
	.byte	72
	.byte	112
	.byte	0
	.byte	0
	.byte	0
	.byte	67
	.byte	33
	.byte	17
	.byte	13
	.byte	3
	.byte	0
	.byte	0
	.byte	0
	.byte	54
	.byte	73
	.byte	73
	.byte	73
	.byte	54
	.byte	0
	.byte	0
	.byte	0
	.byte	6
	.byte	9
	.byte	73
	.byte	41
	.byte	30
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	18
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	82
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	20
	.byte	20
	.byte	34
	.byte	0
	.byte	0
	.byte	0
	.byte	20
	.byte	20
	.byte	20
	.byte	20
	.byte	20
	.byte	20
	.byte	0
	.byte	0
	.byte	0
	.byte	34
	.byte	20
	.byte	20
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	1
	.byte	89
	.byte	5
	.byte	2
	.byte	0
	.byte	0
	.byte	62
	.byte	65
	.byte	93
	.byte	85
	.byte	77
	.byte	81
	.byte	46
	.byte	0
	.byte	64
	.byte	124
	.byte	74
	.byte	9
	.byte	74
	.byte	124
	.byte	64
	.byte	0
	.byte	65
	.byte	127
	.byte	73
	.byte	73
	.byte	73
	.byte	73
	.byte	54
	.byte	0
	.byte	28
	.byte	34
	.byte	65
	.byte	65
	.byte	65
	.byte	65
	.byte	34
	.byte	0
	.byte	65
	.byte	127
	.byte	65
	.byte	65
	.byte	65
	.byte	34
	.byte	28
	.byte	0
	.byte	65
	.byte	127
	.byte	73
	.byte	73
	.byte	93
	.byte	65
	.byte	99
	.byte	0
	.byte	65
	.byte	127
	.byte	73
	.byte	9
	.byte	29
	.byte	1
	.byte	3
	.byte	0
	.byte	28
	.byte	34
	.byte	65
	.byte	73
	.byte	73
	.byte	58
	.byte	8
	.byte	0
	.byte	65
	.byte	127
	.byte	8
	.byte	8
	.byte	8
	.byte	127
	.byte	65
	.byte	0
	.byte	0
	.byte	65
	.byte	65
	.byte	127
	.byte	65
	.byte	65
	.byte	0
	.byte	0
	.byte	48
	.byte	64
	.byte	65
	.byte	65
	.byte	63
	.byte	1
	.byte	1
	.byte	0
	.byte	65
	.byte	127
	.byte	8
	.byte	12
	.byte	18
	.byte	97
	.byte	65
	.byte	0
	.byte	65
	.byte	127
	.byte	65
	.byte	64
	.byte	64
	.byte	64
	.byte	96
	.byte	0
	.byte	65
	.byte	127
	.byte	66
	.byte	12
	.byte	66
	.byte	127
	.byte	65
	.byte	0
	.byte	65
	.byte	127
	.byte	66
	.byte	12
	.byte	17
	.byte	127
	.byte	1
	.byte	0
	.byte	28
	.byte	34
	.byte	65
	.byte	65
	.byte	65
	.byte	34
	.byte	28
	.byte	0
	.byte	65
	.byte	127
	.byte	73
	.byte	9
	.byte	9
	.byte	9
	.byte	6
	.byte	0
	.byte	12
	.byte	18
	.byte	33
	.byte	33
	.byte	97
	.byte	82
	.byte	76
	.byte	0
	.byte	65
	.byte	127
	.byte	9
	.byte	9
	.byte	25
	.byte	105
	.byte	70
	.byte	0
	.byte	102
	.byte	73
	.byte	73
	.byte	73
	.byte	73
	.byte	73
	.byte	51
	.byte	0
	.byte	3
	.byte	1
	.byte	65
	.byte	127
	.byte	65
	.byte	1
	.byte	3
	.byte	0
	.byte	1
	.byte	63
	.byte	65
	.byte	64
	.byte	65
	.byte	63
	.byte	1
	.byte	0
	.byte	1
	.byte	15
	.byte	49
	.byte	64
	.byte	49
	.byte	15
	.byte	1
	.byte	0
	.byte	1
	.byte	31
	.byte	97
	.byte	20
	.byte	97
	.byte	31
	.byte	1
	.byte	0
	.byte	65
	.byte	65
	.byte	54
	.byte	8
	.byte	54
	.byte	65
	.byte	65
	.byte	0
	.byte	1
	.byte	3
	.byte	68
	.byte	120
	.byte	68
	.byte	3
	.byte	1
	.byte	0
	.byte	67
	.byte	97
	.byte	81
	.byte	73
	.byte	69
	.byte	67
	.byte	97
	.byte	0
	.byte	0
	.byte	0
	.byte	127
	.byte	65
	.byte	65
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	4
	.byte	8
	.byte	16
	.byte	32
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	65
	.byte	65
	.byte	127
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	2
	.byte	1
	.byte	1
	.byte	2
	.byte	4
	.byte	0
	.byte	0
	.byte	64
	.byte	64
	.byte	64
	.byte	64
	.byte	64
	.byte	64
	.byte	0
	.byte	0
	.byte	1
	.byte	2
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	52
	.byte	74
	.byte	74
	.byte	74
	.byte	60
	.byte	64
	.byte	0
	.byte	0
	.byte	65
	.byte	63
	.byte	72
	.byte	72
	.byte	72
	.byte	48
	.byte	0
	.byte	0
	.byte	60
	.byte	66
	.byte	66
	.byte	66
	.byte	36
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	72
	.byte	72
	.byte	73
	.byte	63
	.byte	64
	.byte	0
	.byte	0
	.byte	60
	.byte	74
	.byte	74
	.byte	74
	.byte	44
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	72
	.byte	126
	.byte	73
	.byte	9
	.byte	0
	.byte	0
	.byte	0
	.byte	38
	.byte	73
	.byte	73
	.byte	73
	.byte	63
	.byte	1
	.byte	0
	.byte	65
	.byte	127
	.byte	72
	.byte	4
	.byte	68
	.byte	120
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	68
	.byte	125
	.byte	64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	64
	.byte	68
	.byte	61
	.byte	0
	.byte	0
	.byte	0
	.byte	65
	.byte	127
	.byte	16
	.byte	24
	.byte	36
	.byte	66
	.byte	66
	.byte	0
	.byte	0
	.byte	64
	.byte	65
	.byte	127
	.byte	64
	.byte	64
	.byte	0
	.byte	0
	.byte	66
	.byte	126
	.byte	2
	.byte	124
	.byte	2
	.byte	126
	.byte	64
	.byte	0
	.byte	66
	.byte	126
	.byte	68
	.byte	2
	.byte	66
	.byte	124
	.byte	64
	.byte	0
	.byte	0
	.byte	60
	.byte	66
	.byte	66
	.byte	66
	.byte	60
	.byte	0
	.byte	0
	.byte	0
	.byte	65
	.byte	127
	.byte	73
	.byte	9
	.byte	9
	.byte	6
	.byte	0
	.byte	0
	.byte	6
	.byte	9
	.byte	9
	.byte	73
	.byte	127
	.byte	65
	.byte	0
	.byte	0
	.byte	66
	.byte	126
	.byte	68
	.byte	2
	.byte	2
	.byte	4
	.byte	0
	.byte	0
	.byte	100
	.byte	74
	.byte	74
	.byte	74
	.byte	54
	.byte	0
	.byte	0
	.byte	0
	.byte	4
	.byte	63
	.byte	68
	.byte	68
	.byte	32
	.byte	0
	.byte	0
	.byte	0
	.byte	2
	.byte	62
	.byte	64
	.byte	64
	.byte	34
	.byte	126
	.byte	64
	.byte	2
	.byte	14
	.byte	50
	.byte	64
	.byte	50
	.byte	14
	.byte	2
	.byte	0
	.byte	2
	.byte	30
	.byte	98
	.byte	24
	.byte	98
	.byte	30
	.byte	2
	.byte	0
	.byte	66
	.byte	98
	.byte	20
	.byte	8
	.byte	20
	.byte	98
	.byte	66
	.byte	0
	.byte	1
	.byte	67
	.byte	69
	.byte	56
	.byte	5
	.byte	3
	.byte	1
	.byte	0
	.byte	0
	.byte	70
	.byte	98
	.byte	82
	.byte	74
	.byte	70
	.byte	98
	.byte	0
	.byte	0
	.byte	0
	.byte	8
	.byte	54
	.byte	65
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	127
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	65
	.byte	54
	.byte	8
	.byte	0
	.byte	0
	.byte	0
	.byte	24
	.byte	8
	.byte	8
	.byte	16
	.byte	16
	.byte	24
	.byte	0
	.byte	-86
	.byte	85
	.byte	-86
	.byte	85
	.byte	-86
	.byte	85
	.byte	-86
	.byte	85

	.comm	lcd_vbuf,6144,4
	.text
	.align	2
	.globl	lcd_wait
	.set	nomips16
	.set	nomicromips
	.ent	lcd_wait
	.type	lcd_wait, @function
lcd_wait:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$4,16($fp)
	sw	$0,0($fp)
	b	$L11
	nop

$L12:
	lw	$2,0($fp)
	nop
	addiu	$2,$2,1
	sw	$2,0($fp)
$L11:
	lw	$3,0($fp)
	lw	$2,16($fp)
	nop
	slt	$2,$3,$2
	bne	$2,$0,$L12
	nop

	nop
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	lcd_wait
	.size	lcd_wait, .-lcd_wait
	.align	2
	.globl	lcd_cmd
	.set	nomips16
	.set	nomicromips
	.ent	lcd_cmd
	.type	lcd_cmd, @function
lcd_cmd:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	move	$2,$4
	sb	$2,32($fp)
	li	$2,65292			# 0xff0c
	sw	$2,16($fp)
	lbu	$3,32($fp)
	lw	$2,16($fp)
	nop
	sw	$3,0($2)
	li	$4,1000			# 0x3e8
	jal	lcd_wait
	nop

	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	lcd_cmd
	.size	lcd_cmd, .-lcd_cmd
	.align	2
	.globl	lcd_data
	.set	nomips16
	.set	nomicromips
	.ent	lcd_data
	.type	lcd_data, @function
lcd_data:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	move	$2,$4
	sb	$2,32($fp)
	li	$2,65292			# 0xff0c
	sw	$2,16($fp)
	lbu	$2,32($fp)
	nop
	ori	$3,$2,0x100
	lw	$2,16($fp)
	nop
	sw	$3,0($2)
	li	$4,200			# 0xc8
	jal	lcd_wait
	nop

	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	lcd_data
	.size	lcd_data, .-lcd_data
	.align	2
	.globl	lcd_pwr_on
	.set	nomips16
	.set	nomicromips
	.ent	lcd_pwr_on
	.type	lcd_pwr_on, @function
lcd_pwr_on:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	li	$2,65292			# 0xff0c
	sw	$2,16($fp)
	lw	$2,16($fp)
	li	$3,512			# 0x200
	sw	$3,0($2)
	li	$2,655360			# 0xa0000
	ori	$4,$2,0xae60
	jal	lcd_wait
	nop

	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	lcd_pwr_on
	.size	lcd_pwr_on, .-lcd_pwr_on
	.align	2
	.globl	lcd_init
	.set	nomips16
	.set	nomicromips
	.ent	lcd_init
	.type	lcd_init, @function
lcd_init:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	jal	lcd_pwr_on
	nop

	li	$4,160			# 0xa0
	jal	lcd_cmd
	nop

	li	$4,32			# 0x20
	jal	lcd_cmd
	nop

	li	$4,21			# 0x15
	jal	lcd_cmd
	nop

	move	$4,$0
	jal	lcd_cmd
	nop

	li	$4,95			# 0x5f
	jal	lcd_cmd
	nop

	li	$4,117			# 0x75
	jal	lcd_cmd
	nop

	move	$4,$0
	jal	lcd_cmd
	nop

	li	$4,63			# 0x3f
	jal	lcd_cmd
	nop

	li	$4,175			# 0xaf
	jal	lcd_cmd
	nop

	nop
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	lcd_init
	.size	lcd_init, .-lcd_init
	.align	2
	.globl	lcd_set_vbuf_pixel
	.set	nomips16
	.set	nomicromips
	.ent	lcd_set_vbuf_pixel
	.type	lcd_set_vbuf_pixel, @function
lcd_set_vbuf_pixel:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
	sw	$4,8($fp)
	sw	$5,12($fp)
	sw	$6,16($fp)
	sw	$7,20($fp)
	lw	$2,16($fp)
	nop
	sra	$2,$2,5
	sw	$2,16($fp)
	lw	$2,20($fp)
	nop
	sra	$2,$2,5
	sw	$2,20($fp)
	lw	$2,24($fp)
	nop
	sra	$2,$2,6
	sw	$2,24($fp)
	lw	$2,16($fp)
	nop
	sll	$2,$2,5
	sll	$3,$2,24
	sra	$3,$3,24
	lw	$2,20($fp)
	nop
	sll	$2,$2,2
	sll	$2,$2,24
	sra	$2,$2,24
	or	$2,$3,$2
	sll	$3,$2,24
	sra	$3,$3,24
	lw	$2,24($fp)
	nop
	sll	$2,$2,24
	sra	$2,$2,24
	or	$2,$3,$2
	sll	$2,$2,24
	sra	$2,$2,24
	andi	$4,$2,0x00ff
	lui	$5,%hi(lcd_vbuf)
	lw	$3,8($fp)
	nop
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	sll	$2,$2,5
	addiu	$3,$5,%lo(lcd_vbuf)
	addu	$3,$2,$3
	lw	$2,12($fp)
	nop
	addu	$2,$3,$2
	sb	$4,0($2)
	nop
	move	$sp,$fp
	lw	$fp,4($sp)
	addiu	$sp,$sp,8
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	lcd_set_vbuf_pixel
	.size	lcd_set_vbuf_pixel, .-lcd_set_vbuf_pixel
	.align	2
	.globl	lcd_clear_vbuf
	.set	nomips16
	.set	nomicromips
	.ent	lcd_clear_vbuf
	.type	lcd_clear_vbuf, @function
lcd_clear_vbuf:
	.frame	$fp,16,$31		# vars= 8, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-16
	sw	$fp,12($sp)
	move	$fp,$sp
	sw	$0,0($fp)
	b	$L19
	nop

$L22:
	sw	$0,4($fp)
	b	$L20
	nop

$L21:
	lui	$4,%hi(lcd_vbuf)
	lw	$3,0($fp)
	nop
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	sll	$2,$2,5
	addiu	$3,$4,%lo(lcd_vbuf)
	addu	$3,$2,$3
	lw	$2,4($fp)
	nop
	addu	$2,$3,$2
	sb	$0,0($2)
	lw	$2,4($fp)
	nop
	addiu	$2,$2,1
	sw	$2,4($fp)
$L20:
	lw	$2,4($fp)
	nop
	slt	$2,$2,96
	bne	$2,$0,$L21
	nop

	lw	$2,0($fp)
	nop
	addiu	$2,$2,1
	sw	$2,0($fp)
$L19:
	lw	$2,0($fp)
	nop
	slt	$2,$2,64
	bne	$2,$0,$L22
	nop

	nop
	move	$sp,$fp
	lw	$fp,12($sp)
	addiu	$sp,$sp,16
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	lcd_clear_vbuf
	.size	lcd_clear_vbuf, .-lcd_clear_vbuf
	.align	2
	.globl	lcd_sync_vbuf
	.set	nomips16
	.set	nomicromips
	.ent	lcd_sync_vbuf
	.type	lcd_sync_vbuf, @function
lcd_sync_vbuf:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$0,16($fp)
	b	$L24
	nop

$L27:
	sw	$0,20($fp)
	b	$L25
	nop

$L26:
	lui	$4,%hi(lcd_vbuf)
	lw	$3,16($fp)
	nop
	move	$2,$3
	sll	$2,$2,1
	addu	$2,$2,$3
	sll	$2,$2,5
	addiu	$3,$4,%lo(lcd_vbuf)
	addu	$3,$2,$3
	lw	$2,20($fp)
	nop
	addu	$2,$3,$2
	lbu	$2,0($2)
	nop
	move	$4,$2
	jal	lcd_data
	nop

	lw	$2,20($fp)
	nop
	addiu	$2,$2,1
	sw	$2,20($fp)
$L25:
	lw	$2,20($fp)
	nop
	slt	$2,$2,96
	bne	$2,$0,$L26
	nop

	lw	$2,16($fp)
	nop
	addiu	$2,$2,1
	sw	$2,16($fp)
$L24:
	lw	$2,16($fp)
	nop
	slt	$2,$2,64
	bne	$2,$0,$L27
	nop

	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	lcd_sync_vbuf
	.size	lcd_sync_vbuf, .-lcd_sync_vbuf
	.align	2
	.globl	lcd_putc
	.set	nomips16
	.set	nomicromips
	.ent	lcd_putc
	.type	lcd_putc, @function
lcd_putc:
	.frame	$fp,40,$31		# vars= 8, regs= 2/0, args= 24, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	move	$fp,$sp
	sw	$4,40($fp)
	sw	$5,44($fp)
	sw	$6,48($fp)
	sw	$0,24($fp)
	b	$L29
	nop

$L33:
	sw	$0,28($fp)
	b	$L30
	nop

$L32:
	lw	$2,48($fp)
	nop
	addiu	$2,$2,-32
	sll	$3,$2,3
	lw	$2,28($fp)
	nop
	addu	$3,$3,$2
	lui	$2,%hi(font8x8)
	addiu	$2,$2,%lo(font8x8)
	addu	$2,$3,$2
	lbu	$2,0($2)
	nop
	move	$3,$2
	lw	$2,24($fp)
	nop
	sra	$2,$3,$2
	andi	$2,$2,0x1
	beq	$2,$0,$L31
	nop

	lw	$2,40($fp)
	nop
	sll	$3,$2,3
	lw	$2,24($fp)
	nop
	addu	$4,$3,$2
	lw	$2,44($fp)
	nop
	sll	$3,$2,3
	lw	$2,28($fp)
	nop
	addu	$2,$3,$2
	sw	$0,16($sp)
	li	$7,255			# 0xff
	move	$6,$0
	move	$5,$2
	jal	lcd_set_vbuf_pixel
	nop

$L31:
	lw	$2,28($fp)
	nop
	addiu	$2,$2,1
	sw	$2,28($fp)
$L30:
	lw	$2,28($fp)
	nop
	slt	$2,$2,8
	bne	$2,$0,$L32
	nop

	lw	$2,24($fp)
	nop
	addiu	$2,$2,1
	sw	$2,24($fp)
$L29:
	lw	$2,24($fp)
	nop
	slt	$2,$2,8
	bne	$2,$0,$L33
	nop

	nop
	move	$sp,$fp
	lw	$31,36($sp)
	lw	$fp,32($sp)
	addiu	$sp,$sp,40
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	lcd_putc
	.size	lcd_putc, .-lcd_putc
	.align	2
	.globl	lcd_puts
	.set	nomips16
	.set	nomicromips
	.ent	lcd_puts
	.type	lcd_puts, @function
lcd_puts:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$4,32($fp)
	sw	$5,36($fp)
	sw	$6,40($fp)
	lw	$2,36($fp)
	nop
	sw	$2,16($fp)
	b	$L35
	nop

$L38:
	lw	$2,16($fp)
	lw	$3,40($fp)
	nop
	addu	$2,$3,$2
	lb	$2,0($2)
	nop
	slt	$2,$2,32
	bne	$2,$0,$L39
	nop

	lw	$2,16($fp)
	lw	$3,40($fp)
	nop
	addu	$2,$3,$2
	lb	$2,0($2)
	nop
	move	$6,$2
	lw	$5,16($fp)
	lw	$4,32($fp)
	jal	lcd_putc
	nop

	lw	$2,16($fp)
	nop
	addiu	$2,$2,1
	sw	$2,16($fp)
$L35:
	lw	$2,16($fp)
	nop
	slt	$2,$2,12
	bne	$2,$0,$L38
	nop

	b	$L37
	nop

$L39:
	nop
$L37:
	nop
	move	$sp,$fp
	lw	$31,28($sp)
	lw	$fp,24($sp)
	addiu	$sp,$sp,32
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	lcd_puts
	.size	lcd_puts, .-lcd_puts
	.globl	sin_table
	.data
	.align	2
	.type	sin_table, @object
	.size	sin_table, 1024
sin_table:
	.word	0
	.word	-2
	.word	-4
	.word	-7
	.word	-9
	.word	-12
	.word	-14
	.word	-17
	.word	-19
	.word	-21
	.word	-24
	.word	-26
	.word	-29
	.word	-31
	.word	-33
	.word	-35
	.word	-38
	.word	-40
	.word	-42
	.word	-44
	.word	-47
	.word	-49
	.word	-51
	.word	-53
	.word	-55
	.word	-57
	.word	-59
	.word	-61
	.word	-63
	.word	-65
	.word	-67
	.word	-68
	.word	-70
	.word	-72
	.word	-74
	.word	-75
	.word	-77
	.word	-78
	.word	-80
	.word	-81
	.word	-83
	.word	-84
	.word	-85
	.word	-87
	.word	-88
	.word	-89
	.word	-90
	.word	-91
	.word	-92
	.word	-93
	.word	-94
	.word	-94
	.word	-95
	.word	-96
	.word	-97
	.word	-97
	.word	-98
	.word	-98
	.word	-98
	.word	-99
	.word	-99
	.word	-99
	.word	-99
	.word	-99
	.word	-100
	.word	-99
	.word	-99
	.word	-99
	.word	-99
	.word	-99
	.word	-98
	.word	-98
	.word	-98
	.word	-97
	.word	-97
	.word	-96
	.word	-95
	.word	-94
	.word	-94
	.word	-93
	.word	-92
	.word	-91
	.word	-90
	.word	-89
	.word	-88
	.word	-87
	.word	-85
	.word	-84
	.word	-83
	.word	-81
	.word	-80
	.word	-78
	.word	-77
	.word	-75
	.word	-74
	.word	-72
	.word	-70
	.word	-68
	.word	-67
	.word	-65
	.word	-63
	.word	-61
	.word	-59
	.word	-57
	.word	-55
	.word	-53
	.word	-51
	.word	-49
	.word	-47
	.word	-44
	.word	-42
	.word	-40
	.word	-38
	.word	-35
	.word	-33
	.word	-31
	.word	-29
	.word	-26
	.word	-24
	.word	-21
	.word	-19
	.word	-17
	.word	-14
	.word	-12
	.word	-9
	.word	-7
	.word	-4
	.word	-2
	.word	0
	.word	2
	.word	4
	.word	7
	.word	9
	.word	12
	.word	14
	.word	17
	.word	19
	.word	21
	.word	24
	.word	26
	.word	29
	.word	31
	.word	33
	.word	35
	.word	38
	.word	40
	.word	42
	.word	44
	.word	47
	.word	49
	.word	51
	.word	53
	.word	55
	.word	57
	.word	59
	.word	61
	.word	63
	.word	65
	.word	67
	.word	68
	.word	70
	.word	72
	.word	74
	.word	75
	.word	77
	.word	78
	.word	80
	.word	81
	.word	83
	.word	84
	.word	85
	.word	87
	.word	88
	.word	89
	.word	90
	.word	91
	.word	92
	.word	93
	.word	94
	.word	94
	.word	95
	.word	96
	.word	97
	.word	97
	.word	98
	.word	98
	.word	98
	.word	99
	.word	99
	.word	99
	.word	99
	.word	99
	.word	100
	.word	99
	.word	99
	.word	99
	.word	99
	.word	99
	.word	98
	.word	98
	.word	98
	.word	97
	.word	97
	.word	96
	.word	95
	.word	94
	.word	94
	.word	93
	.word	92
	.word	91
	.word	90
	.word	89
	.word	88
	.word	87
	.word	85
	.word	84
	.word	83
	.word	81
	.word	80
	.word	78
	.word	77
	.word	75
	.word	74
	.word	72
	.word	70
	.word	68
	.word	67
	.word	65
	.word	63
	.word	61
	.word	59
	.word	57
	.word	55
	.word	53
	.word	51
	.word	49
	.word	47
	.word	44
	.word	42
	.word	40
	.word	38
	.word	35
	.word	33
	.word	31
	.word	29
	.word	26
	.word	24
	.word	21
	.word	19
	.word	17
	.word	14
	.word	12
	.word	9
	.word	7
	.word	4
	.word	2
	.align	2
	.type	racket1, @object
	.size	racket1, 16
racket1:
	.word	16
	.word	16
	.word	16
	.word	32
	.align	2
	.type	racket2, @object
	.size	racket2, 16
racket2:
	.word	80
	.word	16
	.word	80
	.word	32
	.text
	.align	2
	.globl	draw_racket1
	.set	nomips16
	.set	nomicromips
	.ent	draw_racket1
	.type	draw_racket1, @function
draw_racket1:
	.frame	$fp,72,$31		# vars= 40, regs= 2/0, args= 24, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$fp,64($sp)
	move	$fp,$sp
	lui	$2,%hi(racket1)
	lw	$2,%lo(racket1)($2)
	nop
	sw	$2,24($fp)
	lui	$2,%hi(racket1)
	addiu	$2,$2,%lo(racket1)
	lw	$2,4($2)
	nop
	sw	$2,28($fp)
	lui	$2,%hi(racket1)
	addiu	$2,$2,%lo(racket1)
	lw	$2,8($2)
	nop
	sw	$2,36($fp)
	lui	$2,%hi(racket1)
	addiu	$2,$2,%lo(racket1)
	lw	$2,12($2)
	nop
	sw	$2,40($fp)
	lw	$3,36($fp)
	lw	$2,24($fp)
	nop
	subu	$2,$3,$2
	bgez	$2,$L41
	nop

	subu	$2,$0,$2
$L41:
	sw	$2,44($fp)
	lw	$3,40($fp)
	lw	$2,28($fp)
	nop
	subu	$2,$3,$2
	bgez	$2,$L42
	nop

	subu	$2,$0,$2
$L42:
	sw	$2,48($fp)
	lw	$3,24($fp)
	lw	$2,36($fp)
	nop
	slt	$2,$3,$2
	beq	$2,$0,$L43
	nop

	li	$2,1			# 0x1
	b	$L44
	nop

$L43:
	li	$2,-1			# 0xffffffffffffffff
$L44:
	sw	$2,52($fp)
	lw	$3,28($fp)
	lw	$2,40($fp)
	nop
	slt	$2,$3,$2
	beq	$2,$0,$L45
	nop

	li	$2,1			# 0x1
	b	$L46
	nop

$L45:
	li	$2,-1			# 0xffffffffffffffff
$L46:
	sw	$2,56($fp)
	lw	$3,44($fp)
	lw	$2,48($fp)
	nop
	subu	$2,$3,$2
	sw	$2,32($fp)
$L51:
	sw	$0,16($sp)
	li	$7,255			# 0xff
	move	$6,$0
	lw	$5,24($fp)
	lw	$4,28($fp)
	jal	lcd_set_vbuf_pixel
	nop

	lw	$3,24($fp)
	lw	$2,36($fp)
	nop
	bne	$3,$2,$L47
	nop

	lw	$3,28($fp)
	lw	$2,40($fp)
	nop
	beq	$3,$2,$L53
	nop

$L47:
	lw	$2,32($fp)
	nop
	sll	$2,$2,1
	sw	$2,60($fp)
	lw	$2,48($fp)
	nop
	subu	$2,$0,$2
	lw	$3,60($fp)
	nop
	slt	$2,$2,$3
	beq	$2,$0,$L49
	nop

	lw	$3,32($fp)
	lw	$2,48($fp)
	nop
	subu	$2,$3,$2
	sw	$2,32($fp)
	lw	$3,24($fp)
	lw	$2,52($fp)
	nop
	addu	$2,$3,$2
	sw	$2,24($fp)
$L49:
	lw	$3,60($fp)
	lw	$2,44($fp)
	nop
	slt	$2,$3,$2
	beq	$2,$0,$L51
	nop

	lw	$3,32($fp)
	lw	$2,44($fp)
	nop
	addu	$2,$3,$2
	sw	$2,32($fp)
	lw	$3,28($fp)
	lw	$2,56($fp)
	nop
	addu	$2,$3,$2
	sw	$2,28($fp)
	b	$L51
	nop

$L53:
	nop
	lui	$2,%hi(racket1)
	addiu	$2,$2,%lo(racket1)
	lw	$3,4($2)
	lui	$2,%hi(racket1)
	lw	$2,%lo(racket1)($2)
	sw	$0,16($sp)
	li	$7,255			# 0xff
	move	$6,$0
	move	$5,$2
	move	$4,$3
	jal	lcd_set_vbuf_pixel
	nop

	lui	$2,%hi(racket1)
	addiu	$2,$2,%lo(racket1)
	lw	$3,12($2)
	lui	$2,%hi(racket1)
	addiu	$2,$2,%lo(racket1)
	lw	$2,8($2)
	sw	$0,16($sp)
	li	$7,255			# 0xff
	move	$6,$0
	move	$5,$2
	move	$4,$3
	jal	lcd_set_vbuf_pixel
	nop

	nop
	move	$sp,$fp
	lw	$31,68($sp)
	lw	$fp,64($sp)
	addiu	$sp,$sp,72
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	draw_racket1
	.size	draw_racket1, .-draw_racket1
	.align	2
	.globl	draw_racket2
	.set	nomips16
	.set	nomicromips
	.ent	draw_racket2
	.type	draw_racket2, @function
draw_racket2:
	.frame	$fp,72,$31		# vars= 40, regs= 2/0, args= 24, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-72
	sw	$31,68($sp)
	sw	$fp,64($sp)
	move	$fp,$sp
	lui	$2,%hi(racket2)
	lw	$2,%lo(racket2)($2)
	nop
	sw	$2,24($fp)
	lui	$2,%hi(racket2)
	addiu	$2,$2,%lo(racket2)
	lw	$2,4($2)
	nop
	sw	$2,28($fp)
	lui	$2,%hi(racket2)
	addiu	$2,$2,%lo(racket2)
	lw	$2,8($2)
	nop
	sw	$2,36($fp)
	lui	$2,%hi(racket2)
	addiu	$2,$2,%lo(racket2)
	lw	$2,12($2)
	nop
	sw	$2,40($fp)
	lw	$3,36($fp)
	lw	$2,24($fp)
	nop
	subu	$2,$3,$2
	bgez	$2,$L55
	nop

	subu	$2,$0,$2
$L55:
	sw	$2,44($fp)
	lw	$3,40($fp)
	lw	$2,28($fp)
	nop
	subu	$2,$3,$2
	bgez	$2,$L56
	nop

	subu	$2,$0,$2
$L56:
	sw	$2,48($fp)
	lw	$3,24($fp)
	lw	$2,36($fp)
	nop
	slt	$2,$3,$2
	beq	$2,$0,$L57
	nop

	li	$2,1			# 0x1
	b	$L58
	nop

$L57:
	li	$2,-1			# 0xffffffffffffffff
$L58:
	sw	$2,52($fp)
	lw	$3,28($fp)
	lw	$2,40($fp)
	nop
	slt	$2,$3,$2
	beq	$2,$0,$L59
	nop

	li	$2,1			# 0x1
	b	$L60
	nop

$L59:
	li	$2,-1			# 0xffffffffffffffff
$L60:
	sw	$2,56($fp)
	lw	$3,44($fp)
	lw	$2,48($fp)
	nop
	subu	$2,$3,$2
	sw	$2,32($fp)
$L65:
	sw	$0,16($sp)
	li	$7,255			# 0xff
	move	$6,$0
	lw	$5,24($fp)
	lw	$4,28($fp)
	jal	lcd_set_vbuf_pixel
	nop

	lw	$3,24($fp)
	lw	$2,36($fp)
	nop
	bne	$3,$2,$L61
	nop

	lw	$3,28($fp)
	lw	$2,40($fp)
	nop
	beq	$3,$2,$L67
	nop

$L61:
	lw	$2,32($fp)
	nop
	sll	$2,$2,1
	sw	$2,60($fp)
	lw	$2,48($fp)
	nop
	subu	$2,$0,$2
	lw	$3,60($fp)
	nop
	slt	$2,$2,$3
	beq	$2,$0,$L63
	nop

	lw	$3,32($fp)
	lw	$2,48($fp)
	nop
	subu	$2,$3,$2
	sw	$2,32($fp)
	lw	$3,24($fp)
	lw	$2,52($fp)
	nop
	addu	$2,$3,$2
	sw	$2,24($fp)
$L63:
	lw	$3,60($fp)
	lw	$2,44($fp)
	nop
	slt	$2,$3,$2
	beq	$2,$0,$L65
	nop

	lw	$3,32($fp)
	lw	$2,44($fp)
	nop
	addu	$2,$3,$2
	sw	$2,32($fp)
	lw	$3,28($fp)
	lw	$2,56($fp)
	nop
	addu	$2,$3,$2
	sw	$2,28($fp)
	b	$L65
	nop

$L67:
	nop
	nop
	move	$sp,$fp
	lw	$31,68($sp)
	lw	$fp,64($sp)
	addiu	$sp,$sp,72
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	draw_racket2
	.size	draw_racket2, .-draw_racket2
	.align	2
	.globl	read_dials
	.set	nomips16
	.set	nomicromips
	.ent	read_dials
	.type	read_dials, @function
read_dials:
	.frame	$fp,24,$31		# vars= 16, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$fp,20($sp)
	move	$fp,$sp
	li	$2,65300			# 0xff14
	sw	$2,0($fp)
	lw	$2,0($fp)
	nop
	lw	$2,0($2)
	nop
	sra	$2,$2,2
	sw	$2,4($fp)
	lui	$2,%hi(cos_table)
	lw	$3,4($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(cos_table)
	addu	$2,$3,$2
	lw	$2,0($2)
	nop
	sw	$2,8($fp)
	lui	$2,%hi(sin_table)
	lw	$3,4($fp)
	nop
	sll	$3,$3,2
	addiu	$2,$2,%lo(sin_table)
	addu	$2,$3,$2
	lw	$2,0($2)
	nop
	sw	$2,12($fp)
	lui	$2,%hi(racket1)
	addiu	$2,$2,%lo(racket1)
	lw	$2,4($2)
	lw	$3,8($fp)
	nop
	sll	$4,$3,4
	li	$3,100			# 0x64
	div	$0,$4,$3
	bne	$3,$0,1f
	nop
	break	7
1:
	mfhi	$3
	mflo	$3
	addu	$3,$2,$3
	lui	$2,%hi(racket1)
	addiu	$2,$2,%lo(racket1)
	sw	$3,12($2)
	lui	$2,%hi(racket1)
	lw	$2,%lo(racket1)($2)
	lw	$3,12($fp)
	nop
	sll	$4,$3,4
	li	$3,100			# 0x64
	div	$0,$4,$3
	bne	$3,$0,1f
	nop
	break	7
1:
	mfhi	$3
	mflo	$3
	addu	$3,$2,$3
	lui	$2,%hi(racket1)
	addiu	$2,$2,%lo(racket1)
	sw	$3,8($2)
	nop
	move	$sp,$fp
	lw	$fp,20($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	read_dials
	.size	read_dials, .-read_dials
	.align	2
	.globl	draw_rackets
	.set	nomips16
	.set	nomicromips
	.ent	draw_rackets
	.type	draw_rackets, @function
draw_rackets:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	jal	read_dials
	nop

	jal	lcd_clear_vbuf
	nop

	jal	draw_racket1
	nop

	jal	draw_racket2
	nop

	jal	lcd_sync_vbuf
	nop

	nop
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	draw_rackets
	.size	draw_rackets, .-draw_rackets
	.align	2
	.globl	handle_playing
	.set	nomips16
	.set	nomicromips
	.ent	handle_playing
	.type	handle_playing, @function
handle_playing:
	.frame	$fp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x40000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-8
	sw	$fp,4($sp)
	move	$fp,$sp
$L71:
	b	$L71
	nop

	.set	macro
	.set	reorder
	.end	handle_playing
	.size	handle_playing, .-handle_playing
	.align	2
	.globl	interrupt_playing
	.set	nomips16
	.set	nomicromips
	.ent	interrupt_playing
	.type	interrupt_playing, @function
interrupt_playing:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	jal	draw_rackets
	nop

	nop
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	interrupt_playing
	.size	interrupt_playing, .-interrupt_playing
	.align	2
	.globl	main
	.set	nomips16
	.set	nomicromips
	.ent	main
	.type	main, @function
main:
	.frame	$fp,32,$31		# vars= 8, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-32
	sw	$31,28($sp)
	sw	$fp,24($sp)
	move	$fp,$sp
	sw	$0,16($fp)
	lui	$2,%hi(racket1)
	li	$3,16			# 0x10
	sw	$3,%lo(racket1)($2)
	lui	$2,%hi(racket1)
	addiu	$2,$2,%lo(racket1)
	li	$3,16			# 0x10
	sw	$3,4($2)
	lui	$2,%hi(racket2)
	li	$3,80			# 0x50
	sw	$3,%lo(racket2)($2)
	lui	$2,%hi(racket2)
	addiu	$2,$2,%lo(racket2)
	li	$3,16			# 0x10
	sw	$3,4($2)
	jal	lcd_init
	nop

$L74:
	jal	handle_playing
	nop

	sw	$2,16($fp)
	b	$L74
	nop

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.align	2
	.globl	interrupt_handler
	.set	nomips16
	.set	nomicromips
	.ent	interrupt_handler
	.type	interrupt_handler, @function
interrupt_handler:
	.frame	$fp,24,$31		# vars= 0, regs= 2/0, args= 16, gp= 0
	.mask	0xc0000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	addiu	$sp,$sp,-24
	sw	$31,20($sp)
	sw	$fp,16($sp)
	move	$fp,$sp
	jal	interrupt_playing
	nop

	nop
	move	$sp,$fp
	lw	$31,20($sp)
	lw	$fp,16($sp)
	addiu	$sp,$sp,24
	jr	$31
	nop

	.set	macro
	.set	reorder
	.end	interrupt_handler
	.size	interrupt_handler, .-interrupt_handler
	.ident	"GCC: (GNU) 7.4.0"
