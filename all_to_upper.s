.text
.globl __start
__start:
	la $a0,buff
	li $v0,8
	li $a1,21
	syscall
	
	li $v0,4
	syscall
	
	move $s0, $a0
	
	li $t0,'a'
	li $t1, 'A'
	
	sub $t1, $t1, $t0
	li $t2, 'z'
	
	li $t3,0
	
loop:
	add $t4,$t3,$s0
	lb $t4,0($t4)
	beq $t4,$zero, end
	
	slt $t5, $t4,$t0
	bne $t5,$zero, print
	
	slt $t5, $t4,$t2
	beq $t5,$zero, print
	
	add $t4,$t4,$t1

print:
	move $a0,$t4
	li $v0,11
	syscall
	
	addi $t3,$t3,1
	j loop

end:
li $v0,10
syscall
	
	

.data
buff: .space 21
