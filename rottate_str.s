.text
.globl __start
__start:

	la $s0, str
	li $t0,1
	li $t1,5
	
	
loop: lb $t2,0($s0)
		beq $t2, $zero, res
		
		slt $t3,$t0,$t1
		beq $t3,$zero,do
		
		move $a0, $t2
		li $v0,11
		syscall
		addi $t0,$t0,1
		addi $s0,$s0,1
		j loop
do: move $a0, $t2
	li $v0, 11
	syscall
	
	la $a0, endl
	li $v0, 4
	syscall
	
	li $t0,1
	j loop
res: la $s0, str
	li $v0,5
	syscall
	beq $v0,$zero,exit
		j loop
exit: li $v0,10
	syscall
.data

endl: .asciiz "\n"
str: .asciiz "abcde"