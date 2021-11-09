#Part of the program that prints the number

    .data
say: .asciiz "Your number: "

    .text
print:

    #we can't load local data from store_name.s
    #we CAN access the external space

    la $t1, num #num stored in the first program
    lw $t0, 0($t1)

    #print number
    li $v0, 4
    la $a0, say
    syscall

    li $v0, 1
    add $a0, $t0, $0
    syscall

    #gracefully exit
    li $v0, 10
    syscall
