#include "macros.inc"
.set noat
.set noreorder

.section .text

glabel osMapTLB
	mfc0  $t0, $10
	mtc0  $a0, $0
	mtc0  $a1, $5
	lw    $t1, 0x14($sp)
	addiu $at, $zero, -1
	beq   $t1, $at, .L0004e1d8
	addiu $t4, $zero, 0x1
	addiu $t2, $zero, 0x1e
	b     .L0004e1dc
	or    $a2, $a2, $t1
.L0004e1d8:
	addiu $t2, $zero, 0x1f
.L0004e1dc:
	mtc0  $a2, $10
	addiu $at, $zero, -1
	beq   $a3, $at, .L0004e200
 	nop
	srl   $t3, $a3, 0x6
	or    $t3, $t3, $t2
	mtc0  $t3, $2
	b     .L0004e204
 	nop
.L0004e200:
	mtc0  $t4, $2
.L0004e204:
	lw    $t3, 0x10($sp)
	addiu $at, $zero, -1
	beq   $t3, $at, .L0004e228
 	nop
	srl   $t3, $t3, 0x6
	or    $t3, $t3, $t2
	mtc0  $t3, $3
	b     .L0004e240
 	nop
.L0004e228:
	mtc0  $t4, $3
	addiu $at, $zero, -1
	bne   $a3, $at, .L0004e240
 	nop
	lui   $t3, 0x8000
	mtc0  $t3, $10
.L0004e240:
 	nop
 	tlbwi
 	nop
 	nop
 	nop
 	nop
	mtc0  $t0, $10
	jr    $ra
 	nop
