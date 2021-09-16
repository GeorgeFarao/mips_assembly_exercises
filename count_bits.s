

.text
.globl _start
_start:
	li $v0,5
	syscall
	move $s0,$v0
	
	move $a0,$v0
	li $v0,1
	syscall
	
	la $a0,endl
	li $v0,4
	syscall
	
	li $t9,32
	li $s1,0
loop:
	beq $t9,$zero,exit
	
	srl $t0, $s0,31
	add $s1, $s1,$t0
	sll $s0,$s0,1
	addi $t9,$t9,-1
	j loop
exit:
	la $a0, sum
	li $v0,4
	syscall
	
	move $a0,$s1
	li $v0,1
	syscall
	
	li $v0,10
	syscall


.data
sum: .asciiz "the sum of the bits is:\n"
msg1: .asciiz "Give an int:\n"
endl: .asciiz "\n"