.text
.globl __start

__start:

	li $s0,0
	li $s1,1
	li $s2,2
	li $s3,3
	li $s4,4
	li $s5,5
	
	addi $sp, $sp, -24
	sw $s0, 20($sp)
	sw $s1, 16($sp)
	sw $s2, 12($sp)	
	sw $s3, 8($sp)
	sw $s4, 4($sp)
	sw $s5, 0($sp)
	
	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $s3, 12($sp)
	lw $s4, 16($sp)
	lw $s5, 20($sp)
	
	li $v0, 1
	move $a0, $s0
	syscall
	move $a0, $s1
	syscall
	move $a0, $s2
	syscall
	move $a0, $s3
	syscall
	move $a0, $s4
	syscall
	move $a0, $s5
	syscall
	
	li $v0, 10
	syscall





	