
.text
.globl __start

__start:
	la $s0,str
	move $a0,$s0
	li $v0,4
	syscall
	
	la $a0,endl
	syscall
	
	la $s1, dot
	
	li $t0,0
	
	add $t9,$t0,$s1
	lb $t9, 0($t9)
	
loop:
	add $t1,$t0,$s0
	lb $t2,0($t1)
	beq $t2,$zero,end
	move $t5,$t2
	sb $t9, 0($t1)
	la $a0, str
	li $v0,4
	syscall
	
	la $a0,endl
	syscall
	sb $t5, 0($t1)
	addi $t0,$t0,1
	j loop
end:
	li $v0,10
	syscall
	
.data
str: .asciiz "what"
dot: .asciiz "%"
endl: .asciiz "\n"