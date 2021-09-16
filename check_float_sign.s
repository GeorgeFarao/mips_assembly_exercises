.text
.globl __start
__start:

loop:
	
	li $v0,6
	syscall
	
	li.s $f2, 0.0
	
	c.eq.s $f0,$f2
	bc1t exit
	
	mov.s $f12, $f0
	li $v0,2
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	mfc1 $s0,$f12
	
	srl $t0, $s0,31
	
	beq $t0,$zero, pos
	
	la $a0, negat
	li $v0,4
	syscall
	j loop
pos:
	la $a0, possit
	li $v0,4
	syscall
	j loop
exit:
	li $v0,10
	syscall
.data
endl: .asciiz "\n"
negat: .asciiz "Is negative\n"
possit: .asciiz "Is possitive\n"