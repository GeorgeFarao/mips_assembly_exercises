.text		
       	.globl __start 
__start:
	la $a0, buff1
	li $a1, 20
	li $v0, 8
	syscall
	move $s0, $a0
	
	li $t0,0
	
	li $s3, '\n'
	li $s2,2
	li $s1,1
	li $s4,0
loop:
	add $t1, $s0, $t0
	lb $t1, 0($t1)
	beq $t1, $s3, end
	
	addi $t0, $t0, 1
	
	j loop
end: 
	addi $t0, $t0, -1
	
loop2:
	add $t1, $s0, $t0
	lb $t1, 0($t1)
	sub $t1, $t1, '0'
	mul $t2, $t1, $s1
	mul $s1, $s1, $s2
	addi $t0, $t0, -1
	
	add $s4, $s4, $t2
	beq $t0, $zero, end2
	j loop2
	
end2:
	#li $v0,1
	#move $a0, $s4
	#syscall
	
	li $t8, 8
	la $s0, buff2
	li $t0,0
loop3:
	div $s4,$t8
	mfhi $t2
	mflo $s4
	
	add $t1, $s0, $t0
	sb $t2,0($t1)
	
	addi $t0, $t0,1
	beq $s4,$zero, end3
	
	j loop3
end3:
	addi $t0, $t0,-1
	
loop4:
	add $t1, $s0, $t0
	lb $t1, 0($t1)
	
	
	
	move $a0, $t1
	li $v0,1
	syscall
	addi $t0,$t0,-1
	blt $t0, $zero, end4
	
	j loop4
end4:	
	
	li $v0, 10
	syscall
	
.data
buff1: .space 20
buff2: .asciiz "                   "
endl: .asciiz "\n"