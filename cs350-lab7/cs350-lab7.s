#Ask user to input a decimal integer number, then print this decimal number in hexadecimal format

      .data
prompt: .asciiz "Please enter a decimal integer to turn into hexadecimal: "
msg1:   .asciiz "Hexadecimal of "
msg2:   .asciiz " is: 0x"

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
      
