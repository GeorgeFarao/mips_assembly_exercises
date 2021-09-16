.text		
       	.globl __start 
__start:

	li $v0,5
	syscall
	
	move $s0, $v0
	
	li $t0,0
	li $t8, 8
	
	la $s1, buff
	li $s2,0
loop:
	div $s0, $t8
	mfhi $t2
	mflo $s0
	
	
	
	bgt $t2, $s2, newmax
	
	beq $s0, $zero, end
	j loop
	
newmax:
	move $s2, $t2
	beq $s0, $zero, end
	j loop
end:
	move $a0, $s2
	li $v0,1
	syscall
	
	li $v0,10
	syscall

	

.data
buff: .asciiz "                   "