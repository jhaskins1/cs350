      .data
msg1: .asciiz "Please enter you age: "
msg2: .asciiz "You are "
msg3: .asciiz " years old."

      .text
      .globl main
main:
      # read age
      li $v0, 4
      la $a0, msg1
      syscall

      li $v0, 5
      syscall

      add $t0, $v0, $0

      # print age message
      li $v0, 4
      la $a0, msg2
      syscall

      li $v0, 1
      add $a0, $t0, $0
      syscall

      li $v0, 4
      la $a0, msg3
      syscall

      # exit gracefully
      li $v0, 10
      syscall
