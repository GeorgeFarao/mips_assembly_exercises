.text

.globl main

main:

	la $t0, Array
	lw $s0, 0($t0)
	
	li $t1,1
	li $t2,10

loop: beq $t1,$t2,end
		
		sll $s1,$t1,2
		add $t5, $t0,$s1
		lw $s2, 0($t5)
		
		slt $t4, $s2,$s0
		beq $t4,$zero, L
		
		move $s0,$s2
	L: add $t1,$t1,1
			j loop
			
	end: move $a0,$s0
		li $v0,1
		syscall
	

	Exit:
		li $v0, 10
		syscall


.data
	Array: .word  0x011, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0xA