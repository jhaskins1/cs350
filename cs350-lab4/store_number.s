#Store a number in global space and print it out from the other file

    .data
prmt: .asciiz "What is your number: "
num1: .word 0xFFFFFFFF
      .extern num 4 #num is the label of it, 4 is the size (a word)

      .text
      .globl main
main:
    #print prompt
    la $a0, prmt
    li $v0, 4
    syscall

    #read int
    li $v0, 5
    syscall

    #store the number in memory
    la $t0, num1 #load address of .data memory labelled by "num1"
    sw $v0, 0($t0) #store content of $v0 into memory

    #store the number in global space
    la $t1, num
    sw $v0, 0($t1)

    #go to the hello file

    j print
