      .data
msg: .asciiz "\nPlease enter the two values that you would like to subtract.\n(First input - second input)\n"
msgo: .asciiz "Output: "
nl: .asciiz "\n"

      .text
      .globl main

subtraction:
      add $t0, $0, $0 #reset the t0 register

      li $v0, 4
      la $a0, msg
      syscall

      li $v0, 5
      syscall

      addi $t1, $v0, 0

      li $v0, 5
      syscall

      sub $t1, $t1, $v0

      li $v0, 4
      la $a0, msgo
      syscall

      li $v0, 1
      addi $a0, $t1, 0
      syscall

      li $v0, 4
      la $a0, nl
      syscall

      j main
