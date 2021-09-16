.text
.globl __start

__start:
	la $s0, string1
	la $s1, string2
	la $s2, finalStr
	
loop1:	lb $t0, ($s0)
		beqz $t0, loop2
		sb $t0, ($s2)
		addi $s0, $s0,1
		addi $s2, $s2, 1
		j loop1

loop2: lb $t0, ($s1)
		beqz $t0, exit
		sb $t0, ($s2)
		addi $s1, $s1,1
		addi $s2, $s2, 1
		j loop2
		
exit:	li $v0,4
		la $a0, finalStr
		syscall
		
		li $v0,10
		syscall


.data  
   string1:    .asciiz "Hello "  
   string2:    .asciiz "World!"  
   finalStr:   .space 256       # A 256 bytes buffer  