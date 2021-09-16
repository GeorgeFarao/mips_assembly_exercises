.text
.globl __start
__start:

loop:
	li $v0, 6
	syscall
	
	mov.s $f1, $f0
	
	li $v0, 6
	syscall
	
	mov.s $f2, $f0
	
	li.s $f3, 0.0
	
	c.eq.s $f1,$f3
	bc1t onez
	
ok:
	mfc1 $s0, $f1
	mfc1 $s1, $f2
	
	xor $s2, $s0, $s1
	nor $s2,$s2,0
	
	li $t0,32
	li $t1,0
loop2:
	sll $t3, $s2,$t1
	srl $t2, $t3,31
	move $a0, $t2
	li $v0,1
	syscall
	
	addi $t0,$t0,-1
	addi $t1, $t1,1
	beq $t0, $zero, end2
	j loop2
end2:
	la $a0,endl
	li $v0,4
	syscall
	j loop
	
onez:
	c.eq.s $f2,$f3
	bc1t exit	
	j ok
exit:
	li $v0,10
	syscall

.data
endl: .asciiz "\n"