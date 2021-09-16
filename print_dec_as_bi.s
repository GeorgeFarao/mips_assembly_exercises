.data
newline:	.asciiz		"\n"
msg1: .asciiz "Give Number in DEC : \n"
msg2: .asciiz "Given Number in BIN : \n"

buffer: .space 25

.text
.globl main

main:

	la $a0, msg1
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	
	move $s0,$v0
	li $t1,2
	li $t4,1
	la $s1, buffer
	
loop:
	beq $s0,$zero, end
	
	div $s0,$t1
	mfhi $t3
	mflo $s0
	
	add $s2, $s1,$t4
	sb $t3, buffer($t4)
	#sb $t3, 0($s2)
	addi $t4,$t4,1
	
	j loop
	
end:
	#lb $t6, 0($s2)
	lb $t6, buffer($t4)
	
	move $a0,$t6
	li $v0,1
	syscall
	
	addi $t4,$t4,-1
	add $s2,$s1,$t4
	beq $t4,$zero, exit
	
	j end
	
exit:
	li $v0,10
	syscall