# this part will be for giving the the user the options menu
# add
# subtract
# multiply
# divide
# modulus
# square
# factorial
# summation

      .data
prmt: .asciiz "\n1) Addition\n2) Subtraction\n3) Multiplication\n4) Division\n5) Modulo\n6) Square\n7) Factorial\n8) Summation\n9) Exit\nPlease select an option 1-9: "

      .text
      .globl main
main:
      #print out message
      li $v0, 4
      la $a0, prmt
      syscall

      #read user input
      li $v0, 5
      syscall

      #branch accordingly, or repeat
      li $t0, 1

      beq $t0, $v0, addition
      addi $t0, $t0, 1
      beq $t0, $v0, subtraction
      addi $t0, $t0, 1
      beq $t0, $v0, multiplication
      addi $t0, $t0, 1
      beq $t0, $v0, division
      addi $t0, $t0, 1
      #beq $t0, $v0, modulo
      addi $t0, $t0, 1
      #beq $t0, $v0, square
      addi $t0, $t0, 1
      #beq $t0, $v0, factorial
      addi $t0, $t0, 1
      #beq $t0, $v0, summation
      addi $t0, $t0, 1
      beq $t0, $v0, exit
      addi $t0, $t0, 1

      j main
