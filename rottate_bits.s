.text		
       	.globl __start 
__start:
	li $v0,5
	syscall
	
	move $s0, $v0	#p
	
	li $v0,5
	syscall
	move $s1, $v0	#k
	
	li $t1,32
	
	sub $t0,$t1, $s1
	
	srl $t2, $s0, $s1
	sll $t3, $s0, $t0
	
	or $s2, $t3,$t2
	
	li $v0,10
	syscall
	
	

.data
endl: .asciiz "\n"