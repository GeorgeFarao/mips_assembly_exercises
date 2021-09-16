.text
.globl __start
__start:
	
	li $v0,8
	la $a0, buff
	li $a1,8
	syscall
	
	la $s0,buff
	
	
	li $t0,4
	li $t1,4
	li $t2,0
	li $t6,7
loop:
	li $s1,0
	move $t8,$t1
	beq $t2,$t1, print
	la $a0,space
	li $v0,4
	syscall
	addi $t2,$t2,1
	j loop

print:
	add $t7, $s0,$s1
	lb $t7, buff($s1)
	
	move $a0,$t7
	li $v0,11
	syscall
	
	addi $s1,$s1,1
	addi $t8,$t8,1
	bgt $t8,$t0,fix
	j print
	
fix:
	la $a0,endl
	li $v0,4
	syscall
	addi $t0,$t0,1
	addi $t1,$t1,-1
	sub $t8,$t0,$t1
	addi $t8,$t8,1
	li $t2,0
	beq $t0,$t6,exit
	j loop
exit:	
	li $v0,10
	syscall


.data

endl: .asciiz "\n"
space: .asciiz " "
buff: .word 8