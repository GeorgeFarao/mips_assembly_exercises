.text		
       	.globl __start 
__start:
	li $v0,5
	syscall
	move $s0, $v0
	
	li $t2,2
	
	div $s0, $t2
	mfhi $t0
	
	beq $t0, $zero, art
	
	li $v0,4
	la $a0, peritos
	syscall
	j exit
art:
	li $v0,4
	la $a0, artios
	syscall
exit:
	li $v0, 10
	syscall

.data
artios: .asciiz "Einai artios"
peritos: .asciiz "Einai peritos"