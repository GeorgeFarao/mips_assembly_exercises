
.text
.globl __start

__start:
	li $v0,5
	syscall
	
	move $s0,$v0
	
	la $s1,str
	addi $s0,$s0,-1
	add $t0,$s0,$s1
	lb $t0,0($t0)
	
	move $a0,$t0
	li $v0,11
	syscall

	li $v0,10
	syscall
.data
str: .asciiz "abcdefghij"