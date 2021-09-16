.text
.globl __start
__start:

	li $v0,8
	la $a0,str
	li $a1,12
	syscall
	
	li $v0,4
	syscall
	
	la $a0, endl
	syscall
	
	la $s0,str
	li $t0,0
	li $t1,0
	addi $sp, $sp, -4
	sb $t1, 0($sp)
	
loop:
	add $t1,$t0,$s0
	lb $t1,0($t1)
	beq $t1,$zero, end
	
	addi $sp, $sp, -4
	sb $t1, 0($sp)
	
	addi $t0,$t0,1
	j loop
	
end:
	li $t0,0
	la $s0, revstr
loop2:
	lb $t1, 0($sp)
	addi $sp, $sp, 4
	add $t2, $t0,$s0
	sb $t1, 0($t2)
	beq $t1,$zero,end2
	addi $t0,$t0,1
	j loop2
	
end2:
	li $v0,4
	la $a0,revstr
	syscall
	
	li $v0,10
	syscall


.data 
str: .space 12
revstr: .space 12
endl: .asciiz "\n"