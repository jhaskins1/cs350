#Prompt user to input a decimal integer number, then print the number in binary format

      .data
prompt: .asciiz "Please enter a decimal number to turn into binary: "
msg1:   .asciiz "Binary of "
msg2:   .asciiz " is: "
nl:     .asciiz "\n"

      .text
      .globl main
main:
      #prompt user for decimal number, store it somewhere
      li $v0, 4
      la $a0, prompt
      syscall

      li $v0, 5
      syscall

      add $t0, $v0, $zero #user decimal number stored in s0

      #loop to print out each bit stored in the register
      #initialize increment
      li $t1, 0
      li $s0, 32

      #initialize constant for anding
      li $s1, -2147483648

      #print output message
      li $v0, 4
      la $a0, msg1
      syscall

      li $v0, 1 #print out number
      add $a0, $t0, $zero
      syscall

      li $v0, 4
      la $a0, msg2
      syscall

loop:
      #check if the loop has already run 31 times
      bge $t1, $s0, exit

      #and t0 with the leftmost bit being 1
      and $t2, $t0, $s1

      #in case the value of t2 is now -2147483648, we should set it to 1
      slt $t2, $t2, $zero

      #now if the value in t2 is 0, then the bit is a 0, else it is a 1
      #print what is in t2
      li $v0, 1
      add $a0, $t2, $zero
      syscall

      #increment things
      addi $t1, $t1, 1
      sll $t0, $t0, 1

      j loop

exit:
      li $v0, 10
      syscall
