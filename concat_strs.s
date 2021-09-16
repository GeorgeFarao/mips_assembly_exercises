 .data  
   string1:    .asciiz "Hello "  
   string2:    .asciiz "World!"  
   finalStr:   .space 256       # A 256 bytes buffer  


   .text  
 main:  
 
	la $s0, finalStr
	la $s1, string1
	la $s2, string2
	
	li $t0,0
	li $t4,0
loop:
	add $t1,$t0,$s1
	lb $t1, 0($t1)
	beq $t1,$zero, loop2
	
	add $t2, $t0, $s0
	sb $t1,0($t2)
	
	addi $t0,$t0,1
	j loop

loop2:
	
	add $t1,$t4,$s2
	lb $t1, 0($t1)
	beq $t1,$zero, end
	
	add $t2, $t0, $s0
	sb $t1,0($t2)
	
	addi $t0,$t0,1
	addi $t4, $t4,1
	j loop2
	
end:
	li $v0,4
	la $a0, finalStr
	syscall
	
	li $v0,10
	syscall