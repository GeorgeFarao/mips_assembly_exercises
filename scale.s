.text
.globl __start
__start:
	
	la $t0, str
	li $t1,0
	li $s0,0
	
	
	li $s1,0
	
loop: add $t3, $t1,$t0
		lbu $t2,0($t3)

		beq $t2,$zero, exit
		beq $s1,$s0, print
		
		li $v0,4
		la $a0, space
		syscall
		
		addi $s1, $s1,1
		j loop


print: li $s1,0
		addi $s0, $s0, 1
		move $a0, $t2
		li $v0, 11
		syscall
		
		li $v0,4
		la $a0, endl
		syscall
		
		addi $t1, $t1,1
		j loop
		
exit: li $v0, 10
		syscall


.data

str:	.asciiz "abcdefg"
endl:	.asciiz "\n"
space:	.asciiz " "	