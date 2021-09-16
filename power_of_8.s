.text
.globl __start
__start:

loop:
	la $a0, givenum
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	la $a0,endl
	li $v0,4
	syscall
	
	beq $s0, $zero,exit
	la $s1, storage
	li $t0,0
	li $t8,8
	
loop2:
	
	div $s0,$t8
	mfhi $t2
	mflo $s0
	
	add $t1,$s1,$t0
	sb $t2, 0($t1)
	
	addi $t0,$t0,1
	beq $s0,$zero,end
	
	j loop2
end: 
	move $s3,$t0 
	add $t1,$s1,$t0
	sb $zero, 0($t1)
	
	#li $t0,0
	addi $t0,$t0,-1
	la $a0,mess
	li $v0,4
	syscall
	
loop3:
	add $t1,$s1,$t0
	lb $t2, 0($t1)
	
	beq $t2,$zero,end2
	
	move $a0,$t2
	li $v0,1
	syscall
	
	la $a0, exp8
	li $v0,4
	syscall
	
	move $a0, $t0
	li $v0,1
	syscall
	addi $t0,$t0,-1
	blt $t0, $zero, end2
	
	
	
	la $a0, add_sign
	li $v0,4
	syscall
	
	j loop3

end2:	
	li $v0,4
	la $a0,endl
	syscall
	j loop
exit:
	li $v0,10
	syscall

.data
storage: .asciiz "                    "
givenum: .asciiz "Give a number: "
endl: .asciiz "\n"
mess: .asciiz "POWERS-SUM="
add_sign: .asciiz "+"
exp8: .asciiz "*8^"