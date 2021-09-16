.text		
       	.globl __start 
__start:
	li.s $f1, 1000.0
	li.s $f2, 0.0
	
loop:
	li $v0,6
	syscall
	
	mov.s $f12, $f0
	li $v0, 2
	syscall
	
	mov.s $f3, $f0
	
	c.eq.s $f3, $f2
	bc1t exit
	
	c.lt.s $f3, $f1
	bc1t issmall
	
	la $a0, big
	li $v0,4
	syscall
	
	la $a0, endl
	syscall
	
	
	j loop
	
issmall:
	la $a0, small
	li $v0,4
	syscall
	
	la $a0, endl
	syscall
	
	j loop
	
exit:
	li $v0,10
	syscall
	

.data
endl: .asciiz "\n"
big: .asciiz " Too big"
small: .asciiz " Too small"
