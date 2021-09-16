.text		
       	.globl __start 
__start:

	li $v0,5
	syscall
	
	move $s0, $v0
	
	li $v0,5
	syscall
	
	move $s1, $v0
	
loop:
	sub $s0, $s0, $s1
	beq $s0, $zero, it_is
	blt $s0, $zero, is_not
	bgt $s0, $zero, loop

it_is:
	la $a0,is
	li $v0,4
	syscall
	j exit
is_not:
	la $a0, isnot
	li $v0,4
	syscall
exit:
	li $v0,10
	syscall
	

.data
endl: .asciiz "\n"
is: .asciiz "Is mult"
isnot: .asciiz "Is not mult"