.text
.globl __start
__start:
	la $a0,mes
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $s0,$v0
	move $a0, $v0
	li $v0,1
	syscall

	
	
	la $a0,endl
	li $v0,4
	syscall
	
	mtc1 $s0, $f1
	cvt.s.w $f1,$f1

	
	li $s1,8
	li $s3,0
	li.s $f5, 0.0
	li $t0,0
	li $t2,0
	li.s $f2, 1.0  #x^n
	li.s $f3, 1.0
	li.s $f6, 1.0
	li.s $f7, 1.0
	mov.s $f4,$f1
loop:
	
	beq $t0,$s1, end
	
loop2:
	beq $t2, $t0, end2
	mul.s $f2, $f2,$f1
	addi $t2, $t2,1
	
	j loop2
	
end2:
	li $t2,0
fact:
	beq $t2,$t0, end3

	mul.s $f3,$f3,$f6
	add.s $f6,$f6,$f7
	addi $t2, $t2, 1
	j fact
end3:
	div.s $f2,$f2,$f3
	add.s $f5,$f5,$f2
	add $t0,$t0,1
	li.s $f2,1.0
	li.s $f3,1.0
	li.s $f6,1.0
	li $t2,0
	j loop

end:
	li $v0,2
	mov.s $f12,$f5
	syscall
	
exit:	
	li $v0,10
	syscall
	
.data
mes: .asciiz "Give a number for x:"
endl: .asciiz "\n"
