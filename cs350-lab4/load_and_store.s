#Write a program that starts with a stored integer 10 in memory.
#Print that integer as an old integer, save 20 to that spot in memory, and then print 20 as the new integer.

    .data
num: .word 10
old: .asciiz "Old Number: "
new: .asciiz "New Number: "
nl: .asciiz "\n"

    .text
    .globl main
main:
    #print old number
    li $v0, 4
    la $a0, old
    syscall

    la $t0, num #load address of number in memory
    lw $a0, 0($t0) #load word from memory at address $t0 into $a0 register

    # could just do lw $a0, num but that would be split into pseudo instructions

    #print integer
    li $v0, 1
    syscall

    #print a new line
    li $v0, 4
    la $a0, nl
    syscall

    #save new value 20 to memory where the 10 was
    li $t2, 20
    sw $t2, 0($t0)

    #print new number
    li $v0, 4
    la $a0, new
    syscall

    li $v0, 1
    add $a0, $t2, $0
    syscall

    #gracefully exit
    li $v0, 10
    syscall
