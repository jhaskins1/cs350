#Reserve space in memory for two variables called var1 and var2 of size “word” (use the ‘.word’ assembly directive).
#Also, reserve space in the memory for two variables called ext1 and ext2 of size “word” (use the ‘.extern’ assembly directive)
#This program copies the values of var1 and var2 in ext2 and ext1 respectively

    .data
var1: .word 0xabcdef12
var2: .word 0xffff
    .extern ext1 4
    .extern ext2 4

    .text
    .globl main
main:
    #load numbers from vars into registers
    la $t0, var1 #load address of var1 into $t0
    lw $t1, 0($t0) #load the content of 0($t0) into $t1

    la $t0, var2 #load address of var2 into $t0
    lw $t2, 0($t0) #load the content of 0($t0) into $t2

    #store the number in global space
    la $t0, ext2
    sw $t1, 0($t0)

    la $t0, ext1
    sw $t2, 0($t0)

    #exit gracefully
    li $v0, 10
    syscall
