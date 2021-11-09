      .data
prmt: .asciiz "Enter an integer (0 to exit): "
msge: .asciiz "The number is even.\n"
msgo: .asciiz "The number is odd.\n"

      .text
      .globl main

main:
loop:
      # prompt user for number
      li $v0, 4
      la $a0, prmt
      syscall

      li $v0, 5
      syscall

      beq $v0, 0, exit

      #check remainder of number
      add $t0, $v0, $0
      li $t1, 2
      div $t0, $t1
      mfhi $a0

      #if number is 1 odd, if 0 even
      beq $a0, 1, odd
      beq $a0, 0, even

exit:
      # exit gracefully if 0
      li $v0, 10
      syscall

odd:
      li $v0, 4
      la $a0, msgo
      syscall
      j loop

even:
      li $v0, 4
      la $a0, msge
      syscall
      j loop
