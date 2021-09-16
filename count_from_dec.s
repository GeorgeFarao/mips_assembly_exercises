    .data
read_float_msg:     .asciiz "Please insert a float, decimal part goes right after comma(',')\n>> "
ones:               .asciiz "Ones: "
zeros:              .asciiz "Zeros: "
exit_msg:           .asciiz "Exiting now...\n"
endl: .asciiz "\n"

    .text
    .globl __start
__start:

	li $s0, 1000000
	mtc1 $s0,$f1
	cvt.s.w $f1,$f1
	
	la $a0,read_float_msg
	li $v0,4
	syscall
	
	li $v0,6
	syscall
	
	mov.s $f12,$f0
	li $v0,2
	syscall
	la $a0,endl
	li $v0,4
	syscall
	
	cvt.w.s $f0,$f12
	cvt.s.w $f0,$f0
	sub.s $f12,$f12,$f0
	mul.s $f12,$f12,$f1
	cvt.w.s $f12,$f12
	mfc1 $a0,$f12
	li $v0,1
	syscall
	
	la $a0,endl
	li $v0,4
	syscall
	
	li $v0,0
	li $v1,0
	li $a1,2
	jal count
	
	la $a0,zeros
	li $v0,4
	syscall
	move $a0,$v0
	li $v0,1
	syscall
	
	la $a0,endl
	li $v0,4
	syscall
	
	la $a0,ones
	li $v0,4
	syscall
	move $a0,$v1
	li $v0,1
	syscall
	
	la $a0,endl
	li $v0,4
	syscall
	
	li $v0,10
	syscall
	
count:
	addi $sp,$sp,-12
	sw $a0, 8($sp)
	sw $t0, 4($sp)
	sw $ra,0($sp)
	
	div $a0,$a1
	mfhi $t0
	mflo $a0
	
	beq $a0,$zero,base
	jal count
	
	base:
		beq $t0,$zero,zcase
		addi $v1,$v1,1
		j return
	zcase:
		addi $v0, $v0,1
		
	return:
		lw $ra, 0($sp)
		lw $t0, 4($sp)
		lw $a0,8($sp)
		addi $sp,$sp,12
		j $ra
	
	
	
	
	
	
	
	
	
	
	