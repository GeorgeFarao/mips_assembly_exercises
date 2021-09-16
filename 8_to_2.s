.text
.globl __start

__start:

loop:
	la $a0, gives
	jal printstr
	
	la $a0, buffer
	li $a1, 5
	li $v0, 8
	syscall
	
	li $v0, 4
	syscall
	
	
	
	la $a0, endl
	li $v0,4
	syscall
	
	la $a0, conv
	jal printstr
	
	li $t0,0
	li $t9,0
	li $t8,5
	
cases:	beq $t0,$t8,loop
		lb $t1, buffer($t0)
		beqz $t1, loop
		
		beq $t1,'1', p1
		beq $t1,'2', p2
		beq $t1,'3', p3
		beq $t1,'4', p4
		beq $t1,'5', p5
		beq $t1,'6', p6
		beq $t1,'7', p6
		
		j exit
	
inc: addi $t0,$t0,1
	j cases

p1: la $a0,one
	jal printstr
	j inc

p2: la $a0,two
	jal printstr
	j inc
p3: la $a0,three
	jal printstr
	j inc	
p4: la $a0,four
	jal printstr
	j inc	
p5: la $a0,five
	jal printstr
	j inc
p6: la $a0,six
	jal printstr
	j inc
p7: la $a0,seven
	jal printstr
	j inc	


exit: li $v0, 10
	syscall

printstr:	li $v0, 4
			syscall
			jr $ra

.data

buffer: .space 10
gives: .asciiz "Give a string: "
conv: .asciiz "Converted: "
endl: .asciiz "\n"
one:   .asciiz "001"
two:   .asciiz "010"
three:   .asciiz "011"
four:   .asciiz "100"
five:   .asciiz "101"
six:   .asciiz "110"
seven:   .asciiz "111"