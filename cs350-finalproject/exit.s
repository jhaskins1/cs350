      .data
msg: .asciiz "Goodbye."

      .text
      .globl main

exit:
      li $v0, 10
      syscall
