.text
.globl __start
__start:

loop:
	li $v0,5
	syscall
	
	move $t0,$v0
	la $s0,string
	
	li $t1,0
	
	loop2:	lb $t2, 0($s0)
			beqz $t2, end
			
			loop3:	bge $t1, $t0, end3
					move $a0, $t2
					li $v0,11
					syscall
					
					addi $t1, $t1,1
					j loop3
			end3: li $t1,0
					addi $s0, $s0,1
					j loop2
	end: la $a0, endl
		li $v0,4
		syscall
		
		j loop

.data

endl: .asciiz "\n"
string:		.asciiz		"abcdefghij"
