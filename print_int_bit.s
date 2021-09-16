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

	
	
	
	move $a0,$s0
	jal loop
	
	li $v0,10
	syscall	
	
loop: 	addi $sp, $sp, -8
		sw $ra, 0($sp)
		sw $s0, 4($sp)
		
		move $s0,$a0
		
		ble $s0,9, out
		
		li $t1,10
		
		div $s0,$t1
		mfhi $s0
		mflo $a0
		
		jal loop
		
		out:	add $a0, $s0,'0'
				li $v0,11
				syscall
				la $a0, endl
				li $v0,4
				syscall
		lw $ra, 0($sp)
		lw $s0, 4($sp)
		
		addi $sp,$sp,8
		jr $ra
		
	
.data
space: .asciiz "                   "
endl: .asciiz "\n"