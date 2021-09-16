.text		
    .globl __start
__start:

loop:
	li $v0,6
	syscall
	
	mov.s $f1, $f0
	
	
	mfc1 $s0, $f1
	beq $s0,$zero,exit
	
	srl $s1,$s0,31	#sign
	beq $s1,0, possitive
	la $a0,negative
	li $v0,4
	syscall
	j sposs
	
possitive: la $a0,poss
		li $v0,4
		syscall
	
sposs:	
	sll $s2,$s0,1
	srl $s2, $s2,24
	addi $s2,$s2,-127	#exp
	
	sll $s3, $s0,9
	
	
	li $t1,31
	li $t2,0
	li $t3,1
	li $t4,0
	li $t5,32
	
loop2:
	beq $t4,$t5, end
	move $s4,$s3
	sllv $s4,$s4,$t4
	srlv $s4,$s4,$t1
	beq $s4,$zero,skip
	move $t2,$t4
	skip:
		addi $t4,$t4,1
		j loop2
end:
	move $s4, $t2
	addi $s4,$s4,1
	sub $s5,$t5,$t7
	#srlv $s6,$s3,$s5
	li $t4,31
	li $t6,0
loop3: beq $s4,$zero,end2
	   sll $t9,$s3,$t6
	   srlv $t9,$t9,$t4
	   beq $t9,$zero, pz
	   
	   la $a0,ena
	   li $v0,4
	   syscall
	   
	cont:
	   addi $s4,$s4,-1
	   addi	$t6,$t6,1
	   j loop3
pz: la $a0,mhden
	li $v0,4
	syscall
	j cont
end2:
	la $a0, ekth
	li $v0,4
	syscall
	
	move $a0,$s2
	li $v0,1
	syscall
	
	j loop
exit:	
	li $v0,10
	syscall
	
.data

sp: .asciiz "    "
mhden: .asciiz "0"
ena: .asciiz "1"
poss: .asciiz "+1."
negative: .asciiz "-1."
ekth: .asciiz " x 2^"
endl: .asciiz "\n"
	
	
