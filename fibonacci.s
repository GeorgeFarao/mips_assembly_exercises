    .data
msg_ask:    .asciiz     "Enter n for fibonacci(n) (-1=stop): "
msg_fibo:   .asciiz     "fibonacci(n) is: "
msg_nl:     .asciiz     "\n"
    .text

main:
    # prompt user
    la      $a0,msg_ask
    li      $v0,4
    syscall

    # get number from user
    li      $v0,5
    syscall
    move    $a0,$v0
    bltz    $a0,main_exit

    jal     fibo
    move    $t2,$v0                 # save the result

    # print message
    la      $a0,msg_fibo
    li      $v0,4
    syscall

    # print the result
    li      $v0,1
    move    $a0,$t2
    syscall

    # print message
    la      $a0,msg_nl
    li      $v0,4
    syscall

    j       main

main_exit:
    li      $v0,10
    syscall

# fibo -- recursive fibonacci
#
# RETURNS:
#   v0 -- fibonacci(n)
#
# arguments:
#   a0 -- the "n" for the Nth fibonacci number
#
# registers:
#   t0 -- temporary
fibo:
    # fibo(0) is 0 and fibo(1) is 1 -- no need to establish a stack frame
    bgt     $a0,1,fibo_full         # do we need recursion? if yes, fly
    move    $v0,$a0                 # no, just set return value
    jr      $ra                     # fast return

    # establish stack frame
    # we need an extra cell (to preserve the result of fibo(n-1))
fibo_full:
    # this gives us a temp word at 0($sp)
    subu    $sp,$sp,12              # one more than we need
    sw      $ra,4($sp)
    sw      $a0,8($sp)

    addi    $a0,$a0,-1               # call for fibo(n-1)
    jal     fibo                    # recursive
    sw      $v0,0($sp)              # save result in our frame (in extra cell)

    addi    $a0,$a0,-1               # call for fibo(n-2)
    jal     fibo                    # recursive

    lw      $t0,0($sp)              # restore fibo(n-1) from our stack frame
    add     $v0,$t0,$v0             # result is: fibo(n-1) + fibo(n-2)

    # restore from stack frame
    lw      $ra,4($sp)
    lw      $a0,8($sp)
    addu    $sp,$sp,12

    jr      $ra                     # return