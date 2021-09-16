.text		
       	.globl __start 
__start:
	la $a0,str
	li $a1,40
	li $v0,8
	syscall
	
	li $v0,4
	syscall
	move $s0, $a0
	la $a0, endl
	syscall
	
	
	
	li $s1,1
	li $t0,0
	li $s2, ' '
loop:
	add $t2, $s0, $t0
	lb $t2, 0($t2)
	
	beq $t2, $zero, exit
	beq $t2, $s2, inc
	
	addi $t0, $t0,1
	j loop
inc:
	addi $s1, $s1,1
	addi $t0,$t0,1
	j loop
exit:
	move $a0,$s1
	li $v0,1
	syscall
	
	li $v0,10
	syscall

.data
str: .space 250
endl: .asciiz "\n"
