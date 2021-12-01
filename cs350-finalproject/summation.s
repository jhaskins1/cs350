      .data
msg: .asciiz "\nPlease enter the two values that you would like to take the summation of.\n(Summation from the first value to the second value)\n"
msgo: .asciiz "Output: "
errorm: .asciiz "Error: the first value should be smaller than the second value.\n"
nl: .asciiz "\n"

      .text
      .globl main

summation:
      add $t0, $0, $0 #reset the t0 register

      li $v0, 4
      la $a0, msg
      syscall

      li $v0, 5
      syscall

      addi $t1, $v0, 0

      li $v0, 5
      syscall

      addi $t2, $v0, 0

      #now it should be summation from $t1 to $t2
      #check that the numbers are in the correct order
      blt $t2, $t1, error

      #perform the summation
loop:
      bgt $t1, $t2, endloop

      add $t3, $t3, $t1

      addi $t1, $t1, 1

      j loop

endloop:
      li $v0, 4
      la $a0, msgo
      syscall

      li $v0, 1
      addi $a0, $t3, 0
      syscall

      li $v0, 4
      la $a0, nl
      syscall

      j main

error:
      li $v0, 4
      la $a0, errorm
      syscall

      j summation
