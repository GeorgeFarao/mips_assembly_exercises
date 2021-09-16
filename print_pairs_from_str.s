.text		
       	.globl __start 
__start:
	li $t0,0
	li $t9,9
	
	la $s0, string
	
loop:
	add $t1, $t0, $s0
	lb $t1, 0($t1)
	
	move $a0, $t1
	li $v0,11
	syscall
	
	la $a0,paula
	li $v0,4
	syscall
	
	add $t1, $t9, $s0
	lb $t1, 0($t1)
	
	move $a0, $t1
	li $v0,11
	syscall
	
	la $a0,komma
	li $v0,4
	syscall
	
	bgt $t0, $t9, exit
	
	addi $t0,$t0,1
	addi $t9, $t9,-1
	
	j loop
exit:
	li $v0,10
	syscall

.data
string: .asciiz "abcdefghij"
paula: .asciiz "-"
komma: .asciiz ", "