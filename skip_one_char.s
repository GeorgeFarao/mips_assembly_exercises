
.text
.globl __start

__start:
	
	li $v0,5
	syscall
	
	move $s0,$v0
	
	addi $s0,$s0,-1
	la $s1, string
	add $t0, $s0,$s1
	lb $t0, 0($t0)
	
	li $t1,0
	
loop:
	add $t2, $s1,$t1
	lb $t2, 0($t2)
	
	beq $t2,$zero, end
	
	beq $t2,$t0, skip
	
	move $a0, $t2
	li $v0,11
	syscall
	
skip:	
	addi $t1, $t1,1
	j loop

end:
	move $a0, $t0
	li $v0,11
	syscall
	
	li $v0,10
	syscall

.data
string: .asciiz "abcdefghij"