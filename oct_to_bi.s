.text		
       	.globl __start 
__start:

	li $a1,5
	la $a0, buff
	li $v0,8
	syscall
	
	move $s0, $a0
	
	li $v0,4
	syscall
	
	la $a0, endl
	syscall
	
	li $t0,0
	
	li $s1, 0
	li $t8,8
	li $t2,1
	
loop:
	add $t1, $t0, $s0
	lb $t1, 0($t1)
	
	beq $t1, $zero, end
	beq $t1, '\n', end
	
	sub $t1, $t1, '0'
	mul $t1, $t1,$t2
	mul $t2, $t2,$t8
	add $s1, $s1, $t1
	
	addi $t0, $t0, 1
	
	j loop
	
end:
	la $s2, buff2
	li $t0,0
	li $t2,2
loop2:
	
	div $s1,$t2
	mfhi $t3
	mflo $s1
	
	add $t1, $t0, $s2
	sb $t3, 0($t1)
	
	addi $t0, $t0,1
	beq $s1, $zero, end2
	
	j loop2

end2:
	addi $t0, $t0,-1
loop3:
	add $t1, $t0, $s2
	lb $t1, 0($t1)
	
	move $a0,$t1
	li $v0,1
	syscall
	
	addi $t0,$t0,-1
	blt $t0,$zero, end3
	
	j loop3
	
end3:
	
	li $v0,10
	syscall
	

.data
buff2: .asciiz "                  "
buff: .space 20
endl: .asciiz "\n"