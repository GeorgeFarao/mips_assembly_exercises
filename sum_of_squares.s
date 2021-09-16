.text
.globl __start

__start:
	lw $t0, number
	li $t1, 1
	li $s0,0
	
loop:
	mul $t2, $t1, $t1
	add $s0, $s0, $t2
	addi $t1, $t1, 1
	bgt $t1, $t0, end
	
	j loop
end:
	sw $s0, sum
	li $v0, 10
	syscall

.data
number: .word 10
sum: .word 0