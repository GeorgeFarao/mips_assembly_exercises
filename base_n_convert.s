.text		
    .globl __start
__start:

mloop:	la $a0, givebase
	li $v0, 4
	syscall
	
	la $a0, endl
	syscall
	
readbase:
	li $v0, 5
	syscall
	
	move $s0,$v0
	move $a0, $v0
	li $v0,1
	syscall
	
	li $v0,4
	la $a0, endl
	syscall
	
	li $t0, 2
	li $t1,10
	beq $s0,$zero, exit
	blt $s0,$t0, wrongbase
	bgt $s0,$t1, wrongbase
	
	j cont
wrongbase: 
	la $a0, wbase
	syscall
	la $a0, endl
	syscall
	j readbase
	
cont:	li $v0,4
		la $a0, givenum
		syscall
		
		move $a0,$s0
		li $v0,1
		syscall
		
		li $v0,4
		la $a0, endl
		syscall

readnum:
		la $a0, str
		li $a1,6
		li $v0,8
		syscall
		
		la $a0,str
		li $v0,4
		syscall
		
		la $a0, endl
		syscall
		
		li $t2,0
		la $s1, str
		addi $s2,$s0,-1
		
		li $t4,48
		add $t5,$t4,$s2
		
loop:
	add $t3, $s1, $t2
	lbu $t3, 0($t3)
	
	beq $t3,$zero, end
	beq $t3,$t1, end
	
	blt $t3,$t4, wrongnumber
	bgt $t3,$t5,wrongnumber
	addi $t2,$t2,1
	j loop
	
wrongnumber: 
	la $a0, wnum
	syscall
	la $a0, endl
	syscall
	j readnum

end: 
	beq $s0,$t1,printdec
	
	li $t2,0
	
	jal conv_str
	move $a1,$s0
	move $s0,$v0
	#beq $s0,$t1,printdec
	
	move $a0,$v0
	jal conv_dec
	move $s0,$v0
	
printdec: 
	la $a0,res
	li $v0, 4
	syscall
			
	li $v0,4
	la $a0, endl
	syscall
	
	move $a0,$s0
	li $v0,1
	syscall
	
	li $v0,4
	la $a0, endl
	syscall
	
	j mloop	

exit:
li $v0, 10
syscall

conv_str:
	addi $sp, $sp, -16
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $s3,12($sp)
	sw $ra,16($sp)
	
	la $s0, str
	li $s1, 0
	li $a0,0
	li $t8,10
	
	add $t9, $s0,$s1
	lbu $t9,0($t9)

	addi $t9,$t9,-48
	add $a0, $a0, $t9
	addi $s1,$s1,1
	add $t9, $s0,$s1
	lbu $t9,0($t9)

cloop:
	beq $t9,$t8,endf
	addi $t9,$t9,-48
	mul $t7, $a0,10
	add $a0,$t7,$t9
	addi $s1,$s1,1
	add $t9, $s0,$s1
	lbu $t9,0($t9)
	j cloop

endf:
	move $v0, $a0
	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	lw $ra,16($sp)
	addi $sp, $sp, 16
	jr $ra

conv_dec:
	addi $sp, $sp, -16
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $s3,12($sp)
	sw $ra,16($sp)

	move $s0,$a0
	li $s1,10
	move $s2,$a1
	li $s3,0
	li $t7,1
dloop:
	div $s0,$s1
	mfhi $t9
	mflo $t8
	
	mul $t9,$t9,$t7
	add $s3,$s3,$t9
	
	mul $t7,$t7,$s2
	move $s0,$t8
	beq $s0,$zero,endd
	j dloop
endd: 
	move $v0, $s3
	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	lw $ra,16($sp)
	addi $sp, $sp, 16
	jr $ra
	
	
	
	

.data
str2: .space 20
str: .space 20
givebase: .asciiz "Give base:"
wbase: .asciiz "Wrong base. Give again: "
givenum: .asciiz "Give 5-digit number in base "
wnum: .asciiz "Wrong number. Give again: "
res: .asciiz "Number in decimal is: "
endl: .asciiz "\n"