.text		
       	.globl __start 
__start:

	li $t0,'='

	la $a0, str1
	li $a1,20
	#li $v0,8
#	syscall
	
	lbu $a0,luedge
	li $v0,11
	syscall
	
	li $v0,10
	syscall
	
.data
str1: .space 20
str2: .space 20
luedge: .byte 97