.text
.globl __start

__start:

	la $s0, str
	move $a0,$s0
	li $v0,4
	syscall
	
loop:
	li $t8,32
	li $t7,0
	li $t1,0
	li $t6,7
	
	li $t2,1
	lb $s1,0($s0)

loop2:
	add $t3,$t2,$s0
	lb $t4,0($t3)
	
	addi $t3,$t2,-1
	add $t5,$t3,$s0
	sb $t4,0($t5)
	
	add $t1,$t1,1
	addi $t2,$t2,1
	beq $t1,$t6,end
	j loop2

end:
	addi $t2,$t2,-1
	add $t3,$t2,$s0
	sb $s1,0($t3)
	
	li $v0,4
	la $a0, endl
	syscall
	
	la $a0,str
	syscall
	addi $t7,$t7,1
	beq $t7,$t8,exit
	j loop
	
exit:
	li $v0,10
	syscall
	

.data

str: .asciiz "abcdefgh"
endl: .asciiz "\n"