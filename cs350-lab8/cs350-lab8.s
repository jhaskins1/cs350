# Write a program that sum the integers in an array and print out the result.
# Your program should include a procedure called “sum”.
# Call “sum” in your “main” procedure, then print out the result that “sum” returns.
# The address of the array will be passed to “sum” in $a0, and the size of the array will be passed to “sum” in $a1.
# Procedure “sum” returns the value in $v0 register.

        .data
array:  .word 9, 10, 1, 4, 26, 9, 33, -4, 11, 2
        .align 2
size:   .word 10

      .text
      .globl main
main:
      #pass values into sum procedure
      la $a0, array
      lw $a1, size
      jal sum
      #return address

      #move result from v0
      move $a0, $v0

      #print result
      li $v0, 1
      syscall

exit:
      li $v0, 10
      syscall

sum:
      #prepare for looping
      li $t0, 0 #i

sumlp:
      mul $t1, $t0, 4 #get value of array at i
      add $t1, $t1, $a0
      lw $t1, ($t1)

      add $v0, $v0, $t1 #add the number to v0

      addi $t0, $t0, 1 #i++

      blt $t0, $a1 sumlp
endsum:
      jr $ra
