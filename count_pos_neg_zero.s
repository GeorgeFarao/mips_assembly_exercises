.text		
       	.globl __start 
__start:
	li $s4, 44
	li $s0,0	#zeros
	li $s1,0	#negs
	li $s2,0	#pos
	
loop:
	
	li $v0,5
	syscall
	
	beq $v0, $s4, exit
	
	beq $v0,$zero, inc_zero
	blt $v0,$zero, inc_neg
	
	addi $s2,$s2,1
	j loop

inc_zero:
	addi $s0,$s0,1
	j loop
inc_neg:
	addi $s1, $s1, 1
	j loop

exit:
	la $a0, pos
	li $v0,4
	syscall
	
	move $a0, $s2
	li $v0,1
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	la $a0, negs
	li $v0,4
	syscall
	
	move $a0, $s1
	li $v0,1
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	la $a0, zeros
	li $v0,4
	syscall
	
	move $a0, $s0
	li $v0,1
	syscall
	
	la $a0, endl
	li $v0,4
	syscall


	li $v0,10
	syscall
.data
endl: .asciiz "\n"
pos: .asciiz "Positives: "
negs: .asciiz "Negatives: "
zeros: .asciiz "Zeros: "