.text
.globl __start
__start:
	li $v0,5
	syscall
	
	move $s0, $v0
	
	move $a0, $v0
	li $v0,1
	syscall
	
	la $a0, endl
	li $v0, 4
	syscall
	li.s $f3,0.0
	li.s $f1,1.0
	li.s $f5,1.0
	
	mtc1 $s0, $f0
	cvt.s.w $f0, $f0
	
loop:
	add.s $f2,$f1,$f5
	div.s $f4,$f1,$f2
	add.s $f3, $f3,$f4
	add.s $f1,$f1,$f5
	c.lt.s $f0,$f1
	bc1t end
	j loop
end:
	la $a0, sum
	li $v0,4
	syscall
	
	mov.s $f12, $f3
	li $v0,2
	syscall
	
	la $a0,endl
	li $v0,4
	syscall
	
	li $v0,10
	syscall
.data
endl: .asciiz "\n"
sum: .asciiz "Σ(i/i+1)= "