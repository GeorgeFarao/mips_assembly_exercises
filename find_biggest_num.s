.globl __start

__start:

	la $t0, nums
	lw $t3, 0($t0)
	
	li $t1,1
	li $t2,1
	
loop:	sll $t4, $t2,2
		la $t0, nums
		add $t0, $t0,$t4
		lw $t0, 0($t0)
		
		slt $t5, $t0,$t3
		beq $t5,1,rest
		
		move $t3,$t0
		
rest: addi $t2,$t2,1
		beq $t2,11, exit
		j loop
exit: move $a0,$t3
	  li $v0,1
	  syscall
	  
	  li $v0,10
	  syscall


.data
msg: .asciiz "\nBiggest number is: "
nums: .word 1, 2, 3, 4, 5, 32, 10, 9, 800, 0, 700