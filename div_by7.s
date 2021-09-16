.text
.globl __start
__start:

	la $t0, Numbers
	li $t1,0
	li $t2,10
	li $s0,0
	
loop: beq $t1, $t2,end

		sll $t3, $t1,2
		add $t4, $t3,$t0
		
		lw $t5, 0($t4)
		li $t7,7
		
		div $t5, $t7
		mfhi $t6
		
		beqz $t6, count
		j next
		
	count: addi $s0,$s0,1
	next: addi $t1,$t1,1
			j loop

end: move $a0,$s0
	li $v0,1
	syscall
	
exit: li $v0, 10
		syscall



.data
Numbers: .word 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0xe, 0x07, 0x08, 0x09, 0x10
	M1: .asciiz "Counter is: "
	endl: .asciiz "\n"