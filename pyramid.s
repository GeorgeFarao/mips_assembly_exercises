.text
.globl __start
__start:

	la $s0, string
	li $s1,0
	  
	add $t0, $s0,$s1
	lbu $t1,0($t0)
	
loop: beq $t1,$zero,step2
		addi $s1,$s1,1
		add $t6, $s0,$s1
		lbu $t1,0($t6)
		j loop
		
step2:	li $t0,0
		move $t1, $s1
		addi $t1, $t1,-1
		li $t2,0
		
loop2:	bgt $t0,$s1, exit
		blt $t1,$zero,exit
		add $t4, $t2,$s0
		lb $t5, 0($t4)
		beq $t5,$zero, ch
		beq $t0,$t2,print
		beq $t1, $t2, print
		
	printsp: li $v0,4
			 la $a0, space
			 syscall
			 
			 addi $t2,$t2,1
			 j loop2

	print: 	move $a0,$t5
			li $v0,11
			syscall
			
			addi $t2,$t2,1
			j loop2
			
	ch:	li $v0,4
			la $a0, endl
			syscall
			li $t2,0
			addi $t0,$t0,1
			addi $t1,$t1,-1
			j loop2
			
exit: li $v0,10
	  syscall
			
	  


.data
string:		.asciiz "abcdefghij"
endl:		.asciiz "\n"
space:		.asciiz " "