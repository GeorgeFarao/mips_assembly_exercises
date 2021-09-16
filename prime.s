
.text
.globl __start

__start:
	
	lw $t0, num	
	li $t1, 1
	li $t2,2
	
loop:
	mul $t3, $t2, $t2
	slt $t7, $t0, $t3
	bne $t7,$zero, end
	
	div $t0, $t2
	mfhi $t7
	bne $t7, $zero, skip
	
	move $t1, $t2
	j end
	
skip:
	addi $t2, $t2, 1
	j loop

end:
	addi $t1, $t1,-1
	bne $t1,$zero, not_prime
	li $v0,4
	la $a0, prime
	syscall
	
	j exit
	
not_prime:
	li $v0,4
	la $a0,notprime
	syscall
	
exit:
	li $v0,10
	syscall
	


.data
num: .word 24
prime: .asciiz "\nIt IS a prime."
notprime: .asciiz "\n It is NOT a prime."