.text		
    .globl __start
__start:

	li $v0, 4
	la $a0,give
	syscall
	
	la $a0,endl
	syscall
	
	la $a0,str
	li $v0,8
	li $a1,20
	syscall
	
	li $v0,4
	la $a0,str
	syscall
	
	la $a0,endl
	syscall
	
	li $t1,0
	li $s0,10
	
	li $t7,48 #0
	li $s1,49
	li $s2,55 #7
	li $s3,57
	
	li $s5,0
	li $s6,0
	li $s7,0
	
	la $t4, str
	
loop:	add $t2, $t4, $t1
		lbu $t0, 0($t2)
		
		beq $t0, $s0, end
		beq $t0, $zero, end
		
		blt $t0,$t7, notbi
		bgt $t0, $s1, notbi
		addi $s5,$s5,1
		
		notbi:
		blt $t0, $t7, notoct
		bgt $t0, $s2, notoct
		addi $s6, $s6,1
		
		notoct:
		blt $t0, $t7, notdec
		bgt $t0, $s3, notdec
		addi $s7, $s7,1	
		
		notdec:
		addi $t1,$t1,1
		j loop

end:
	li $v0, 4 #prints string
	la $a0, mess
	syscall
	
	li $v0, 1
	move $a0, $s5
	syscall
	li $v0, 4 #prints string
	la $a0, bin
	syscall
	
	li $v0, 1
	move $a0, $s6
	syscall
	li $v0, 4 #prints string
	la $a0, oct
	syscall
	
	li $v0, 1
	move $a0, $s7
	syscall
	li $v0, 4 #prints string
	la $a0, dec
	syscall
		
	li $v0,10
	syscall
.data
str: .space 20
give: .asciiz "Give string:"
endl: .asciiz "\n"
mess: .asciiz "The string contains:\n"
dec: .asciiz " decimal digits\n"
bin: .asciiz " binary digits\n"
oct: .asciiz " octal digits\n"