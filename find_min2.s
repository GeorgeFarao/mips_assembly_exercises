.text
.globl __start
__start:
	
	li $t1,1
	li $t9,10
	
	la $s0, array
	lw $s1, 0($s0)
	
	
loop: 	
		beq $t1,$t9, exit
		
		sll $s2,$t1,2
		add $t5,$s0,$s2
		lw $s2, 0($t5)
		
		slt $t7, $s1,$s2
		bne $t7,$zero,skip
		
		move $s1,$s2
		skip:	addi $t1, $t1,1
				j loop
exit: move $a0,$s1
	  li $v0,1
	  syscall
	  
	  li $v0,10
	  syscall
		
	
	
.data

array: .word 2, 3, 5, 6, 7, 9, 5, 4, 1, 100