
.text
.globl __start

__start:

	lw $t0, seven
	li $t1,0
	li $s0,1
	move $s1,$t0
	
loop:
	beq $t1,$t0,end
	mul $s0, $s0,$s1
	
	addi $s1,$s1,-1
	addi $t1,$t1,1
	j loop

end:
	li $v0,1
	move $a0,$s0
	syscall
	
	li $v0,10
	syscall
	
	

.data
seven: .word 7