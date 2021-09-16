.text
.globl __start
__start:
	lw $s0, sideA
	lw $s1, sideB
	lw $s2, sideC
	
	mul $t0, $s0, $s1
	mul $t0, $t0, $s2
	sw $t0, volume
	
	mul $t0, $s0,$s1
	mul $t1, $s0,$s2
	mul $t2, $s2, $s1
	add $t2, $t2, $t1
	add $t2, $t2, $t0
	sw $t2, area
	
	li $v0, 10
	syscall

.data
sideA: .word 12
sideB: .word 8
sideC: .word 15
volume: .word 0
area: .word 0

