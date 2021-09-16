
.text
.globl __start

__start:
	lw $t0, sidea
	lw $t1, sideb
	lw $t2, sidec
	
	mul $t0,$t0,$t0
	mul $t1,$t1,$t1
	mul $t2,$t2,$t2
	
	add $t3, $t0, $t1
	beq $t3, $t2, pyes
	
	add $t3, $t1, $t2
	beq $t3, $t0, pyes
	
	add $t3, $t2, $t0
	beq $t3, $t1, pyes
	
pno:
	la $a0, ans2
	li $v0,4
	syscall
	
	j exit

pyes:
	la $a0, ans1
	li $v0,4
	syscall
exit:
	li $v0,10
	syscall
	
.data
sidea: .word 6
sideb: .word 4
sidec: .word 5
ans1: .asciiz "\nYes, the triangle is rectangular.\n"
ans2: .asciiz "\nNo, the triangle is not rectangular.\n"
endl: .asciiz "\n"