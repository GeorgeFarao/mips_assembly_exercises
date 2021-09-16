.text
.globl __start

__start:
	la $t0, nums
	lw $t3, 0($t0)
	
	li $t1,1
	
loop:
	sll $t2,$t1,2
	add $t2, $t2, $t0
	lw $t2,0($t2)
	
	slt $t5,$t2,$t3
	bne $t5, $zero, skip
	
	move $t3, $t2
	
skip:
	addi $t1, $t1,1
	beq $t1, 11, exit
	j loop

exit:
	li $v0,1
	move $a0, $t3
	syscall
	
	li $v0, 10
	syscall

.data
msg: .asciiz "\nBiggest number is: "
nums: .word 1, 2, 3, 4, 5, 32, 10, 9, 800, 0, 700