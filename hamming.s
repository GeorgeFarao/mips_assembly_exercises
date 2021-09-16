    .data 
fst: .space 20
snd: .space 20
message: .asciiz "hamming distance: " 
    .text
    .globl __start
__start:

	la $a0, fst
	li $v0,8
	syscall
	
	li $v0,4
	syscall
	
	move $s0,$a0
	
	la $a0,snd
	li $v0,8
	syscall
	
	li $v0,4
	syscall
	
	move $s1,$a0
	li $s2,0
	
loop:
	lbu $t3,0($s0)
	lbu $t4, 0($s1)
	beq $t3,10,exit
	beq $t4,10,exit
	xor $t5,$t3,$t4
	add $s2,$s2,$t5
	addi $s0,$s0,1
	addi $s1,$s1,1
	j loop
	
exit:
	la $a0,message
	li $v0,4
	syscall
	
	move $a0,$s2
	li $v0,1
	syscall
	
	li $v0,10
	syscall