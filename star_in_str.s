.text   
.globl __start  

__start:

loop:
	la $a0, input
	li $v0, 4
	syscall
	
	la $a0,string
	syscall
	
	la $a0, endl
	syscall
	
	li $t0,0
	la $s0, string
	la $t9, star
	lb $t9, 0($t9)
	
loop2:	lb $t1, 0($s0)
		beqz $t1,end
		sb $t9, 0($s0)
		
		la $a0, string
		li $v0, 4
		syscall
		la $a0, endl
		syscall
		sb $t1, 0($s0)
		addi $s0,$s0,1
		j loop2

end: 	
		li $v0, 10
		syscall
.data

input: .asciiz "String is: "
string: .asciiz "randomstring"
endl: .asciiz "\n"
star: .asciiz "*"   
