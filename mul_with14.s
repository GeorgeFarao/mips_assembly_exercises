
.data

endl: .asciiz "\n"

.text
.globl __start
__start:
	
	li $v0,5
	syscall
	
	move $s0, $v0
	
	li $t0,14
	li $t1,0
	li $t2,2
	li $s1,0
	
loop:
	beq $t1,$s0,end
	
	add $s1,$s1,$t0
	addi $t1,$t1, 1
	
	j loop

end:
	div $s0,$t2
	mfhi $s0
	
	beq $s0,$zero,exit
	
	neg $s1,$s1

exit: 
	li $v0,1
	move $a0,$s1
	syscall
	
	li $v0,10
	syscall