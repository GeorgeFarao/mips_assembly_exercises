.text
.globl __start
__start:
	li $v0,6
	syscall
	
	la $a0,val
	li $v0,4
	syscall
	
	mov.s $f12, $f0
	li $v0,2
	syscall
	
	la $a0, endl
	li $v0,4
	syscall
	
	mfc1 $s0, $f0
	
	sll $s1, $s0,1
	li $t8,8
	li $t0,0
	
	la $a0,exp
	li $v0,4
	syscall
loop:
	sll $t1,$s1,$t0
	srl $t1,$t1,31
	
	move $a0,$t1
	li $v0,1
	syscall
	
	addi $t0,$t0,1
	addi $t8,$t8,-1
	beq $t8,$zero,end
	
	j loop
end:
	la $a0,endl
	li $v0,4
	syscall
	
	sll $s2, $s0,9
	li $t8,23
	li $t0,0
	
	la $a0,fract
	syscall
	
loop2:
	sll $t1,$s2,$t0
	srl $t1,$t1,31
	
	move $a0,$t1
	li $v0,1
	syscall
	
	addi $t0,$t0,1
	addi $t8,$t8,-1
	beq $t8,$zero,end2
	
	j loop2
end2:	
	
	sll $s1, $s0,1
	srl $s1,$s1,24
	
	sll $s2,$s0,9
	li $t8,23
	li $t0,0
	li $t4,3
	li $s4,0
loop3:
	sll $t2, $s2,$t0
	srl $t2,$t2,24
	
	#and $t3, $t2,$s1
	beq $t2,$s1,inc
cont:	
	addi $t0,$t0,8
	addi $t4,$t4,-1
	beq $t4, $zero, end3
	
	j loop3
inc:
	addi $s4, $s4,1
	j cont
end3:
	la $a0, endl
	li $v0,4
	syscall
	
	move $a0, $s4
	li $v0,1
	syscall
	
	la $a0, endl
	li $v0,4
	syscall	
	la $a0, endl
	li $v0,4
	syscall
	
	srl $s3, $s0,31
	sll $s3, $s3,31
	
	sll $s1, $s0,1
	srl $s1,$s1,24
	
	sll $s2,$s0,9
	srl $s2,$s2,9
	
	addi $s1,$s1,8
	addi $s2, $s2,8
	
	sll $s1,$s1,23
	
	li $s5,0
	
	or $s3,$s3,$s1
	or $s3, $s3,$s2
	
	mtc1 $s3, $f12
	
	li $v0,2
	syscall

	mov.s $f2,$f12
	abs.s $f3,$f2
	
	abs.s $f4, $f0
	
	sub.s $f5, $f3,$f4
	
	la $a0, endl
	li $v0,4
	syscall
	
	mov.s $f12, $f5
	li $v0,2
	syscall
	
	li $v0,10
	syscall

.data
endl: .asciiz "\n"
val: .asciiz "VALUE IS "
exp: .asciiz "EXPONENT="
fract: .asciiz "FRACTION="