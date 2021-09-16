.text		
       	.globl __start 
__start:

	li $s0, 12345
	li $s2, 2
	
	move $a0, $s0
	li $v0,1
	syscall
	
	li $v0,4
	la $a0, endl
	syscall
	
	la $s1,space
	li $t0,0
	
loop:

	
	
	div $s0,$s2
	mfhi $t2
	mflo $s0
		
	add $t1,$s1,$t0
	sb $t2, 0($t1)
	
	addi $t0,$t0,1
	beq $s0, $zero, end
	
	j loop
	
end:
	li $s4,10
	add $t3, $t0,$s1
	sb $s4, 0($t3)
	
	addi $t0,$t0,-1
loop2:
	add $t3,$t0,$s1
	lb $t2, 0($t3)
	
	beq $t2,$s4,end2
	
	move $a0,$t2
	li $v0,1
	syscall
	
	addi $t0,$t0,-1
	blt $t0, $zero, end2

	j loop2
	
end2:
	li $v0,10
	syscall


.data

space: .asciiz "                     "
endl: .asciiz "\n"