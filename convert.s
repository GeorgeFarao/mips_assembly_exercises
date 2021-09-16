.text
.globl main
main: 
	la $t0,A
	la $t1,a
	lb $t0,0($t0)
	lb $t1,0($t1)
	
	li $t3,0
	sub $s7, $t1,$t0
	
	li $v0,12
	la $a0, letter_given
	li $a0,2
	syscall
	
	move $s2,$v0
	
	la $s0, str
	
	beq $s2,$t0,upper
	beq $s2,$t1,lower
	j exit

upper:
	add $t2, $t3,$s0
	
	lbu $s4, 0($t2)
	
	beq $s4,$zero,end
	
	li $s5,'a'
	li $s6,'z'
	
	slt $t5,$s4,$s5
	bne $t5,$zero,skip
	
	slt $t5,$s6,$s4
	bne $t5,$zero,skip
	
	sub $s4,$s4,$s7
	sb $s4,0($t2)
	
	skip:
		li $v0,11
		move $a0,$s4
		syscall
		addi $t3, $t3,1
		j upper
lower:
	add $t2, $t3,$s0
	
	lbu $s4, 0($t2)

	beq $s4,$zero,end
	
	li $s5,'A'
	li $s6,'Z'
	
	slt $t5,$s4,$s5
	bne $t5,$zero,skip2
	
	slt $t5,$s6,$s4
	bne $t5,$zero,skip2
	
	add $s4,$s4,$s7
	sb $s4,0($t2)
	
	skip2:
		li $v0,11
		move $a0,$s4
		syscall
		addi $t3, $t3,1
		j lower
	
	
	end:
exit: li $v0,10
		syscall

.data
A: .asciiz "A"
a: .asciiz "a"
str: .asciiz "AaBbCcDd"
space: .asciiz "\n"
letter_given: .space 2