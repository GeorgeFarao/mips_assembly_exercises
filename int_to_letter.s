.text
.globl __start

__start:


	li $v0,5
	syscall
	
	move $s0, $v0
	
	li $t0,1
	li $t1,26
	
	blt $s0,$t0, out
	bgt $s0,$t1, out
	
	addi $a0, $s0, 'A'-1
	li $v0,11
	syscall
	
	j exit

out:
	la $a0,out_of_bounds
	li $v0,4
	syscall
exit:
	li $v0,10
	syscall
	
	
.data
out_of_bounds: .asciiz "Number out of bounds\n"
	