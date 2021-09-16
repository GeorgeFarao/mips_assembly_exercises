.text
.globl __start

__start:

	li $v0, 6
	syscall
	
	mov.s $f1, $f0
	mov.s $f2, $f0
	cvt.w.s $f2, $f2	#convert to int
	mfc1 $s0, $f2
	cvt.s.w $f2, $f2	#part before .
	sub.s $f3,$f1,$f2  #part after . (decimal)
	
	li.s $f5,1.0
	div.s $f4, $f5, $f3
	
	li $v0,1
	move $a0, $s0
	syscall
	
	li $v0,4
	la $a0,message2
	syscall
	
	li $v0,2
	mov.s $f12, $f4
	syscall
	
	li $v0,10
	syscall
	
.data
endl:  .asciiz "\n"
message2: .asciiz "+1/"
	
	