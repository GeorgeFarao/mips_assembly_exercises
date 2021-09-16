
.text
.globl __start

__start:

	li $s1,0

loop:
	li $v0,5
	syscall
	
	move $s0, $v0
	
	beq $s0,$zero, end
	
	addi $s1,$s1,1
	
	j loop

end:
	
	li $v0,1
	move $a0, $s1
	syscall
	
	li $v0,10
	syscall