#Ask user to input a decimal integer number, then print this decimal number in hexadecimal format

      .data
prompt: .asciiz "Please enter a decimal integer to turn into hexadecimal: "
msg1:   .asciiz "Hexadecimal of "
msg2:   .asciiz " is: 0x"
hexa:   .asciiz "a"
hexb:   .asciiz "b"
hexc:   .asciiz "c"
hexd:   .asciiz "d"
hexe:   .asciiz "e"
hexf:   .asciiz "f"

      .text
      .globl main
main:
      #prompt user for decimal number, store it somewhere
      li $v0, 4
      la $a0, prompt
      syscall

      li $v0, 5
      syscall

      add $s0, $v0, $zero #user decimal number stored in s0 as binary

      #set up a loop to go through 4 bits at a time of the binary number
      #initialize increment and max
      li $t0, 0
      li $s1, 8

      #initialize constant for anding
      li $s2, -268435456

      #print output messages
      li $v0, 4
      la $a0, msg1
      syscall #prints part 1 of message

      li $v0, 1
      add $a0, $s0, $zero
      syscall #prints the user's decimal integer input

      li $v0, 4
      la $a0, msg2
      syscall #prints the second part of the message

loop:
      #check if the loop has already run 8 times
      bge $t0, $s1, exit

      #and the user integer with the and constant
      and $t1, $s2, $s0

      #shift the result so that we can see easily what hex value it is
      srl $t1, $t1, 28

      jal hexcomp

      #increment things
      addi $t0, $t0, 1
      sll $s0, $s0, 4

      j loop

hexcomp:
      #separate area to check which hex value is represented in $t1
      li $t3, 0 #counter
      beq $t1, $t3, zero
      addi $t3, $t3, 1
      beq $t1, $t3, one
      addi $t3, $t3, 1
      beq $t1, $t3, two
      addi $t3, $t3, 1
      beq $t1, $t3, three
      addi $t3, $t3, 1
      beq $t1, $t3, four
      addi $t3, $t3, 1
      beq $t1, $t3, five
      addi $t3, $t3, 1
      beq $t1, $t3, six
      addi $t3, $t3, 1
      beq $t1, $t3, seven
      addi $t3, $t3, 1
      beq $t1, $t3, eight
      addi $t3, $t3, 1
      beq $t1, $t3, nine
      addi $t3, $t3, 1
      beq $t1, $t3, A
      addi $t3, $t3, 1
      beq $t1, $t3, B
      addi $t3, $t3, 1
      beq $t1, $t3, C
      addi $t3, $t3, 1
      beq $t1, $t3, D
      addi $t3, $t3, 1
      beq $t1, $t3, E
      addi $t3, $t3, 1
      beq $t1, $t3, F
      addi $t3, $t3, 1

zero:
      li $v0, 1
      addi $a0, $zero, 0
      syscall

      jr $ra

one:
      li $v0, 1
      addi $a0, $zero, 1
      syscall

      jr $ra

two:
      li $v0, 1
      addi $a0, $zero, 2
      syscall

      jr $ra

three:
      li $v0, 1
      addi $a0, $zero, 3
      syscall

      jr $ra

four:
      li $v0, 1
      addi $a0, $zero, 4
      syscall

      jr $ra

five:
      li $v0, 1
      addi $a0, $zero, 5
      syscall

      jr $ra

six:
      li $v0, 1
      addi $a0, $zero, 6
      syscall

      jr $ra

seven:
      li $v0, 1
      addi $a0, $zero, 7
      syscall

      jr $ra

eight:
      li $v0, 1
      addi $a0, $zero, 8
      syscall

      jr $ra

nine:
      li $v0, 1
      addi $a0, $zero, 9
      syscall

      jr $ra

A:
      li $v0, 4
      la $a0, hexa
      syscall

      jr $ra

B:
      li $v0, 4
      la $a0, hexb
      syscall

      jr $ra

C:
      li $v0, 4
      la $a0, hexc
      syscall

      jr $ra

D:
      li $v0, 4
      la $a0, hexd
      syscall

      jr $ra

E:
      li $v0, 4
      la $a0, hexe
      syscall

      jr $ra

F:
      li $v0, 4
      la $a0, hexf
      syscall

      jr $ra

exit:
      li $v0, 10
      syscall
