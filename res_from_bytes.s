.text
.globl __start
__start:
	
	la $a0, giveint
	li $v0,4
	syscall
	
	la $a0, endl
	syscall
	
	li $v0,5
	syscall
	
	move $s0, $v0
	
	move $a0, $v0
	
	li $v0,1
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	sll $s1,$s0,24
	sra $s1, $s1,24
	
	sll $s2, $s0,16
	sra $s2,$s2, 24
	
	sll $s3,$s0,8
	sra $s3,$s3,24
	
	sra $s4, $s0,24
	

	move $s5,$s1
	move $s7,$s1
	li $s8,0

	la $s6, arr
	li $t1,1
	
	sll $t2, $t1,2
	add $t2,$t2, $s6
	sw $s1, 0($t2)
	addi $t1, $t1,1
	
	sll $t2, $t1,2
	add $t2,$t2, $s6
	sw $s2, 0($t2)
	addi $t1, $t1,1
	
	sll $t2, $t1,2
	add $t2,$t2, $s6
	sw $s3, 0($t2)
	addi $t1, $t1,1
	
	sll $t2, $t1,2
	add $t2,$t2, $s6
	sw $s4, 0($t2)
	addi $t1, $t1,1
	
	li $t1,1
	li $t9,0
loop:	
	
	sll $t2, $t1,2
	add $t2,$t2, $s6
	lw $t3, 0($t2)
	
	slt $t5,$t3,$s5
	bne $t5,$zero,skip1
	
	move $s5, $t3
	addi $t9, $t9,1
	addi $t1, $t1,1

	add $s8, $s8,$t3
	beq $t9,4, end
	
	j loop
skip1:

	slt $t5, $t3,$s7
	beq $t5,$zero, skip2
	move $s7,$t3
skip2:
	addi $t9, $t9,1
	addi $t1, $t1,1
	add $s8, $s8,$t3
	beq $t9,4, end
	
	j loop
end:
	la $a0, lval
	li $v0,4
	syscall
	
	move $a0, $s5
	li $v0,1
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	la $a0, sval
	li $v0,4
	syscall
	
	move $a0, $s7
	li $v0,1
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	la $a0, sum
	li $v0,4
	syscall
	
	move $a0, $s8
	li $v0,1
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	la $a0, mean
	li $v0,4
	syscall
	
	li $t4,4
	div $s8, $t4
	mflo $a0
	
	li $v0,1
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	li $v0,10
	syscall
	
	
.data
endl: .asciiz "\n"
giveint: .asciiz "Give integer: "
lval: .asciiz "Largest byte value is: "
sval: .asciiz "Smallest byte value is: "
sum: .asciiz "Sum of bytes is: "
mean: .asciiz "Mean of bytes is: "
arr: .word 0, 0, 0, 0