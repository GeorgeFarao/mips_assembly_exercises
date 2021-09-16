.text		
       	.globl __start 
__start:
	
	la $s0, str
	li $s2, 2
	li $s3,0
	
	la $s1, space
	li $t0,0
	li $t9,10
	li $t8,1
mloop:
	add $t1, $s0,$t0
	lb $t1, 0($t1)
	
	beq $t1, $zero, endm
	sub $t1, $t1,'0'
	add $s3, $s3,$t1
	mul $s3,$s3,$t9
	addi $t0, $t0,1
	j mloop

endm:
	div $s3, $t9
	mflo $s0
	#move $s0,$s3
	li $t0,0
	
loop:
	div $s0,$s2
	mfhi $t2
	mflo $s0
	
	add $t1, $s1, $t0
	sb $t2, 0($t1)
	
	addi $t0, $t0,1
	beq $s0, $zero, end
	
	j loop
	
end:
	li $s4, 10
	
	addi $t0, $t0,-1
loop2:
	add $t3,$t0, $s1
	lb $t2,0($t3)
	
	move $a0,$t2
	li $v0,1
	syscall
	
	addi $t0, $t0,-1
	blt $t0, $zero, end2
	
	j loop2

end2:
	li $v0,10
	syscall
	
.data
space: .asciiz "                   "
str: .asciiz "12345"
endl: .asciiz "\n"