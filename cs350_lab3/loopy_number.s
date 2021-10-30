# program that has a stored lucky number for user to guess, tell user if too high or too low
      .data
prmt: .asciiz "Show me a number: "
msgg: .asciiz "The secret number is greater than that.\n"
msgl: .asciiz "The secret number is less than that.\n"
msge: .asciiz "You guessed the secret number!\n"

      .text
      .globl main

main:
      # put secret number in register
      li $s0, 7

loop:
      li $v0, 4
      la $a0, prmt
      syscall

      li $v0, 5
      syscall

      # now do branching part
      bgt $s0, $v0, great
      blt $s0, $v0, less

      # if we get here we know theyre equal
      li $v0, 4
      la $a0, msge
      syscall

exit:
      li $v0, 10
      syscall

great:
      # if branch greater than works
      li $v0, 4
      la $a0, msgg
      syscall

      # jump to the top of the loop
      j loop

less:
      # if branch less than works
      li $v0, 4
      la $a0, msgl
      syscall

      #jump to the top of the loop
      j loop
