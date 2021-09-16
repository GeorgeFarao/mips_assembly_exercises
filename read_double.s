.text		
       	.globl __start 
__start:

	li $v0,7
	syscall
	
	mov.d $f12, $f0
	li $v0,3
	syscall
	
	
	la $a0, endl
	li $v0,4
	syscall
	
	mfc1 $s0, $f1
	
	li $s1,0
	li $t1,11
	
	sll $s0, $s0,1
	
	li $t0,0
	
loop:
	srl $t3, $s0,31
	beq $t3, $zero, inc
	
	sll $s0,$s0,1
	addi $t0,$t0,1
	beq $t0,$t1, end
	
	j loop

inc:
	addi $s1,$s1,1
	sll $s0,$s0,1
	addi $t0,$t0,1
	beq $t0,$t1, end
	
	j loop
end:
	move $a0, $s1
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	
	
	
.data
endl: .asciiz "\n"

