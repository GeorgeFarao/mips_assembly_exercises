.text
	.globl __start
__start:
#################################################################
program_start:
	li $v0, 4         #
	la $a0, inputt    # PRINT STRING
	syscall  		  #
	
	li $v0, 8         #
	la $a0, streeng   # READ STRING INTO ADDRESS IN $a0
	li $a1, 21        # LENGTH+1
	syscall           #
	
	li $v0, 4         #
	la $a0, inputtk   # PRINT STRING
	syscall           #
	
	li $v0, 5         # READ INT
	syscall           # INT GOES TO $v0
	move $s0, $v0   # k is in $s0

	li $v0, 1         # PRINT INT
	move $a0, $s0     # COPY INT TO $a0 FOR PRINTING
	syscall           #

	beq $s0, $zero, exitt
	bgt $s0, 20, mistake
	blt $s0, $zero, mistake

	addi $s0, $s0, -1

	li $s1, '*'
	li $t9, 20    # iterations   FOR-LOOP
	
start_for:
	bge $s0, $t9, end_for

	sb $s1, streeng($s0)

	addi $s0, $s0, 1      # i++
	j start_for
	
end_for:

	li $v0, 4         #
	la $a0, outputt   # PRINT STRING
	syscall           #
	li $v0, 4         #
	la $a0, streeng   # PRINT STRING
	syscall           #

	j program_start

	
mistake:
	li $v0, 4         #
	la $a0, wrongg    # PRINT STRING
	syscall           #
	j program_start

	#################################################################
	
exitt:        # exit
	li $v0, 4         #
	la $a0, enddd     # PRINT STRING
	syscall           #
	li $v0, 10    # exit
	syscall       # exit

.data
streeng: .asciiz "01234567890123456789"
inputt: .asciiz "\nType a string: "
inputtk: .asciiz "\nType a number k from 1 to 20: "
outputt: .asciiz "\nResulting string is: "
new_line: .asciiz "\n"
wrongg: .asciiz "\nWrong input. Must be from 1 to 20"
enddd: .asciiz "\nEnd of program.-"
