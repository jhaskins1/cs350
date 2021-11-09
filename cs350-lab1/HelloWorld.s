      .data
msg:  .asciiz "Hello World!\n"

      .text
      .globl main # saying that main procedure is accessible from programs outside
main:
      # print hello world
      li $v0, 4 # print a string
      la $a0, msg # load address
      syscall

      # exit gracefully
      li $v0, 10 #load immediate
      syscall
