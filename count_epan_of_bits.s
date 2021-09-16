.text		
       	.globl __start 
__start:

	li $v0,5
	syscall
	
	move $s0,$v0	#p
	
	li$v0,5
	syscall
	
	move $s1, $v0
	
	srl $t4,$s1,3
	
	sll $t3,$s1,29
	srl $t3,$t3,31
	
	sll $t2, $s1, 30
	srl $t2, $t2, 31
	
	sll $t1, $s1,31
	srl $t1, $t1,31
	
	li $t0,0
	li $t9,31
	li $s2,0
	
loop:
	bge $t0, $t9, end
	sll $t5, $s0, $t0
	srl $t5, $t5,31
	
	beq $t5,$t4, c1
	
	addi $t0, $t0,1
	
	
	j loop
	
c1:
	addi $t0,$t0,1
	
	sll $t5, $s0, $t0
	srl $t5, $t5,31
	
	beq $t5,$t3, c2
	
	beq $t0, $t9, end
	j loop
	
c2:
	addi $t0,$t0,1
	
	sll $t5, $s0, $t0
	srl $t5, $t5,31
	
	beq $t5,$t2, c3
	
	beq $t0, $t9, end
	j loop
	
c3:
	addi $t0,$t0,1
	
	sll $t5, $s0, $t0
	srl $t5, $t5,31
	
	beq $t5,$t1, inc
	
	beq $t0, $t9, end
	j loop
inc:
	addi $s2, $s2,1
	
	addi $t0, $t0,1
	j loop

end:
	move $a0, $s2
	li $v0,1
	syscall
	
	li $v0,10
	syscall