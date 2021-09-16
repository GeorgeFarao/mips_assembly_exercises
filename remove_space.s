.text
.globl main

main:

	li $t1, 0
	li $s1, 32

loop: la $t0, M
		add $t2,$t1,$t0
		
		lb $s0,0($t2)
		
		beq $s0,$zero, exit
		
		beq $s0,$s1, remove_space
		
	inner:	beq $s0,$s1, skip
		
		addi $t1,$t1,1
		skip: j loop
		
	remove_space: 
		move $t3,$t2
		move $t5, $t2
		
		loop2:
			addi $t3, $t3,1
			
			lb $s3, 0($t3)
			
			beq $s3, $zero, zero_case
			
			sb $s3,0($t5)
			addi $t5,$t5, 1
			j loop2
	
	zero_case: sb $s3, 0($t5)
				
				j inner
			
		

exit: li $v0,10
	  syscall




.data
	M: .asciiz "Hallo Wor  ld     oeeeeeeee kaa"