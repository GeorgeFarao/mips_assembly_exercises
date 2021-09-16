.text		
       	.globl __start 
__start:

	li $s0,12345
	li $v0,1
	move $a0,$s0
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	li $t0,10
	la $s1, space
	li $t3,0
	
loop:
	div $s0,$t0
	mflo $s0
	mfhi $t1
	
	add $t2, $t3,$s1
	sb $t1, 0($t2)
	
	beq $s0,$zero, end
	
	addi $t3,$t3,1
	j loop

end:
	add $t2, $t3,$s1
	lb $t2, 0($t2)
	
	li $v0,1
	move $a0, $t2
	syscall
	la $a0, endl
	li $v0,4
	syscall
	
	
	beq $t3, $zero, exit
	addi $t3, $t3,-1
	j end
exit:
	li $v0,10
	syscall
	
	
.data
space: .asciiz "                   "
endl: .asciiz "\n"