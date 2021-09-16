.text		
       	.globl __start 
__start:

	li $v0, 6
	syscall
	
	
	mov.s $f2, $f0
	cvt.w.s $f2, $f2
	mfc1 $t0,$f2
	mtc1 $t0, $f3
	cvt.s.w $f3, $f3
	c.eq.s $f3, $f0
	bc1t is_int
	
	la $a0, isfloat
	li $v0,4
	syscall
	j exit
	
is_int:
	la $a0, isint
	li $v0,4
	syscall
exit:
	li $v0,10
	syscall

.data
isint: .asciiz "Is int"
isfloat: .asciiz "Is float"