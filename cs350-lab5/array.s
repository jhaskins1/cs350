#Write a program that prompts the user for 5 integers,
#stores the 5 integers in an array declared in the .data segment
#using the .space directive, then prints all those integers.

      .data
prompt: .asciiz "Enter value at index "
colon:  .asciiz ": "
msg1:   .asciiz "\nPrinting values...\n"
msg2:   .asciiz "\nDone!"
nl:     .asciiz "\n"

        .align 2 #jump to next address divisible by 2^n (4)

array:  .space 20 #takes a number of bytes that you want, we want an array of integers which are 4 bytes, we want 5 things here

      .text
      .globl main
main:
      #initializing looping variables
      li $t0, 0 #i
      la $t1, array #load array address into t1
      li $s0, 5 #max

loop1:
      #make our loop condition with a branching statement
      bge $t0, $s0, print

      li $v0, 4 #print out prompt
      la $a0, prompt
      syscall

      li $v0, 1 #print out index ($t0)
      add $a0, $t0, $0
      syscall

      li $v0, 4 #print the colon and space for the prompt
      la $a0, colon
      syscall

      li $v0, 5 #read int into $v0
      syscall

      sw $v0, 0($t1) #address for array stored in t1, store content of v0 into array at address t1

      #increment
      addi $t0, $t0, 1
      addi $t1, $t1, 4

      j loop1

print:
      #initialize loop values
      li $t0, 0 #t0 = index
      la $t1, array #t1 = array address
      li $s0, 5 #s0 = loop limit

      li $v0, 4
      la $a0, msg1
      syscall

loop2: #loop to print array contents
      bge $t0, $s0, exit #loop while t0 < s0

      li $v0, 1 #print out the integer
      lw $a0, 0($t1) #get the word from the array
      syscall

      li $v0, 4 #print out newline character
      la $a0, nl
      syscall

      #increment stuff
      addi $t0, $t0, 1
      addi $t1, $t1, 4

      j loop2

exit:
      li $v0, 4
      la $a0, msg2
      syscall

      #graceful exit
      li $v0, 10
      syscall
