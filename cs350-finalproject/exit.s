      .data
msg: .asciiz "\nGoodbye."

      .text
      .globl main

exit:
      li $v0, 10
      syscall
