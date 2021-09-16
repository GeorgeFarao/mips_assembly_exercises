.text		
       	.globl __start 
__start:

	la $s0, merge
	la $s1, str1
	la $s2, str2
	
	li $t0,0
	li $t3,0
	li $s4,10
loop:
	beq $t0, $s4, end
	add $t1, $t0, $s1
	lb $t1,0($t1)
	
	add $t9, $t3, $s0
	sb $t1, 0($t9)	
	addi $t3, $t3,1
	
	add $t2, $t0, $s2
	lb $t2, 0($t2)
	
	add $t9, $t3, $s0
	sb $t2, 0($t9)
	
	addi $t0, $t0, 1
	addi $t3,$t3,1
	j loop

end:
	move $a0, $s0
	li $v0,4
	syscall
	
	li $v0,10
	syscall
.data
str1: .asciiz "0123456789"
str2: .asciiz "abcdefghij"
merge: .space 20