.text		
       	.globl __start 
__start:
	li $v0,5
	syscall
	
	move $s0, $v0
	
	li $v0,5
	syscall
	move $s1, $v0
	
	li $t0,1
	li $t1,0
	
loop:
	beq $t1,$s1,end
	
	mul $t0, $t0,$s0
	addi $t1, $t1,1
	j loop

end:
	move $a0, $t0
	li $v0, 1
	syscall
	
	li $v0,10
	syscall

.data
endl: .asciiz "\n"