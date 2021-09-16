.text
.globl __start
__start:
	li $s0,0
loop: li $v0,5
	  syscall
	  
	  move $t0, $v0
	  
	  beq $t0, $zero,end
	  
	  slt $t1,$t0, $zero
	  bne $t1,$zero, loop
	  
	  addi $s0, $s0,1
	  j loop
end:
	move $a0,$s0
	li $v0,1
	syscall
	
	li $v0,10
	syscall
	  


.data

endl: .asciiz "\n"