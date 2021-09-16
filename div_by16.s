.text
.globl __start
__start:
	li $v0,5
	syscall
	
	move $s0,$v0
	move $s1,$v0
loop: sle $t0, $s0,$zero
		bne $t0,$zero,res
		
		addi $s0,$s0,-16
		j loop

res: beq $s0,$zero, divided
	move $a0,$s1
	li $v0,1
	syscall
	
	la $a0, no
	li $v0,4
	syscall
	j exit
divided:
	move $a0,$s1
	li $v0,1
	syscall
	
	la $a0, yes
	li $v0,4
	syscall
exit: li $v0,10
	syscall

.data

endl: .asciiz "\n"
yes: .asciiz " is divided by 16"
no: .asciiz " is not divided by 16"