.text		
       	.globl __start 
__start:

	li $v0,4
	la $a0, givestr
	syscall
	
	la $a0, endl
	syscall
	
	li $v0,8
	la $a0, string
	li $a1, 26
	syscall
	
	move $s0, $a0
	
	li $v0,4
	syscall
	
	la $a0, endl
	syscall
	
	li $t0,0
	
	li $t1, 'a'
	li $t2, 'z'
	li $t3, 'A'
	li $t4, 'Z'
	li $t5, '0'
	li $t6, '9'
	li $t7, '!'
	li $t8, '/'
	
	li $s2,0 #counter gia mikra
	li $s3,0 #counter gia kefalaia
	li $s4,0 #counter gia nums
loop:
	add $s1, $t0, $s0
	lb $s1, 0($s1)
	
	beq $s1,$zero, exit
	bge $s1, $t1, label1
	bge $s1, $t3, label3
	#bge $s1, $t5, label5
	#bge $s1, $t7, label7
	la $s7, sp_other
	add $t9, $s7,$s4
	sb $s1, 0($t9)
	addi $s4, $s4,1
	addi $t0,$t0,1
	j loop
	
label1:
	ble $s1, $t2, label2
	addi $t0,$t0,1
	j loop
label2:
	la $s7, sp_lower
	add $t9, $s7,$s2
	sb $s1, 0($t9)
	addi $s2, $s2, 1
	addi $t0,$t0,1
	j loop
label3:
	ble $s1, $t4, label4
	addi $t0,$t0,1
	j loop
label4:
	la $s7, sp_upper
	add $t9, $s7,$s3
	sb $s1, 0($t9)
	addi $s3, $s3,1
	addi $t0,$t0,1
	j loop
label5:
	ble $s1,$t6, label6
	addi $t0,$t0,1
	j loop
label6:
	la $s7, sp_other
	add $t9, $s7,$s4
	sb $s1, 0($t9)
	addi $s4, $s4,1
	addi $t0,$t0,1
	j loop
label7:
	ble $s1, $t8, label8
	addi $t0,$t0,1
	j loop
label8:
	la $s7, sp_other
	add $t9, $s7,$s4
	sb $s1, 0($t9)
	addi $s4, $s4,1
	addi $t0,$t0,1
	j loop

exit:
	la $a0, contains
	li $v0,4
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	move $a0,$s2
	li $v0,1
	syscall
	
	la $a0, mikra
	li $v0,4
	syscall
	
	la $a0, sp_lower
	li $v0,4
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	move $a0,$s3
	li $v0,1
	syscall
	
	la $a0, kefalaia
	li $v0,4
	syscall
	
	la $a0, sp_upper
	li $v0,4
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	move $a0,$s4
	li $v0,1
	syscall
	
	la $a0, alla
	li $v0,4
	syscall
	
	la $a0, sp_other
	li $v0,4
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	li $v0,10
	syscall

.data
endl: .asciiz "\n"
string: .space 26
sp_upper: .space 26
sp_lower: .space 26
sp_other: .space 26
givestr: .asciiz "Give string:"
contains: .asciiz "The string contains:"
mikra: .asciiz " lowercase English letters: "
kefalaia: .asciiz " uppercase English letters: "
alla: .asciiz " other characters:  "