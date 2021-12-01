      .data
msg: .asciiz "\nPlease enter the value that you would like to square.\n"
msgo: .asciiz "Output: "
nl: .asciiz "\n"

      .text
      .globl main

square:
      add $t0, $0, $0 #reset the t0 register

      li $v0, 4
      la $a0, msg
      syscall

      li $v0, 5
      syscall

      mul $t1, $v0, $v0

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
