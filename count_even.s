.text
.globl __start
__start:

	li $v0, 5
	syscall
	
	move $s0, $v0
	
	li $s1,0
	li $s2,0
	
loop:
	sub $t0, $s0,$s1
	blt $t0, $zero, end
	add $s2,$s2,$s1
	addi $s1, $s1,2
	j loop
end:
	move $a0, $s2
	li $v0,1
	syscall
	
	li $v0,10
	syscall
