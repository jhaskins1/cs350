      .data
msg: .asciiz "\nPlease enter the value that you would like to take the factorial of.\n"
msgo: .asciiz "Output: "
nl: .asciiz "\n"

      .text
      .globl main

factorial:
      add $t0, $0, $0 #reset the t0 register

      li $v0, 4
      la $a0, msg
      syscall

      li $v0, 5
      syscall

      add $t1, $v0, 0
      li $t2, 1

      #perform the factorial
loop:
      beq $0, $t1, endloop

      mul $t2, $t2, $t1

      addi $t1, $t1, -1

      j loop

endloop:
      li $v0, 4
      la $a0, msgo
      syscall

      li $v0, 1
      addi $a0, $t2, 0
      syscall

      li $v0, 4
      la $a0, nl
      syscall

      j main
