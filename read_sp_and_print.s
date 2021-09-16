.data
str: .asciiz "abcd"
endl: .asciiz "\n"

.text
.globl __start
__start:
	
	li $t1,' '
	li $t4,4
	li $t3,0
	la $t5, str
loop:
	
	li $v0,12
	syscall
	
	move $t0,$v0
	
	bne $t0, $t1, loop
	
	
	
	beq $t3,$t4,init

next:
	#sll $t7,$t3,2
	add $t6, $t5,$t3
	lb $t2,0($t6)
	
	li $v0,11
	move $a0, $t2
	syscall
	
	addi $t3,$t3,1
	
	j loop

init:
	li $t3,0
	j next