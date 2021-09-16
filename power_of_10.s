.text
 .globl __start
__start:

loop:
	la $a0, givei
	jal printstr
	
	li $v0,5
	syscall
	
	move $t9, $v0
	
	move $a0, $t9
	jal printint
	la $a0, endl
	jal printstr

	beq $t9,$zero,exit
	
	li $t0, 10
	li $t1, 0
	move $s1, $t9
	loop2:
		div $s1, $t0
		mfhi $t2
		mflo $s1
		
		sb $t2, spaces($t1)
		addi $t1,$t1,1
		bnez $s1, loop2
		
	printres:
			addi $t1, $t1,-1
			
			lb $t3,spaces($t1)
			
			move $a0, $t3
			jal printint
			
			la $a0, star
			jal printstr
			
			la $a0, deka
			jal printstr
			
			move $a0, $t1
			jal printint
			
			bnez $t1, printadd
			
			la $a0, endl
			jal printstr
	
	j loop
	
exit: li $v0, 10
syscall


printadd: la $a0, adds
			li $v0, 4
			syscall
			j printres
			

printstr:	li $v0, 4
			syscall
			jr $ra
printint: li $v0,1
		syscall
		jr $ra
.data

spaces:	.asciiz "                                " #32+\0
star: .asciiz "*"
deka: .asciiz "10^"
adds: .asciiz "+"
givei: .asciiz "Give an int: "
endl: .asciiz "\n"