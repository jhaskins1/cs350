#Reserve space in memory for two variables called var1 and var2 of size “word” (use the ‘.word’ assembly directive).
#Also, reserve space in the memory for two variables called ext1 and ext2 of size “word” (use the ‘.extern’ assembly directive,
#the assembler will reserve space for them in the data segment that can be accessed using the $gp register).
#This program copies the values of var1 and var2 in ext2 and ext1 respectively

    .data
var1: .word 0xabcdef12
var2: .word 0xffff
    .extern ext1 4
    .extern ext2 4

    .text
    .globl main
main:
    #load the vars into registers
    la $t0, var1
    lw $t1, 0($t0)

    la $t1, var2
    lw $t2, 0($t1)

    
