#Reserve a space in memory for an array of words of size 10 (10 elements, each element takes space of 4 bytes). Array called my_array.
#Implement the C code shown in the snippet in the folder as assembly code. Ask user to input integer as the initial_value.

      .data
prompt: .asciiz "Please enter the initial value: "
msg1:   .asciiz "my_array["
msg2:   .asciiz "] = "
nl:     .asciiz "\n"

      .align 2

my_array: .space 40


      .text
      .globl main
main:
      #initialize first loop variables: increment, max, array address
      li $t0, 0 #i
      la $t1, my_array #load array address into t1
      li $s0, 10 #max

      #prompt user for initial_value
      li $v0, 4 #print out prompt
      la $a0, prompt
      syscall

      #read initial_value
      li $v0, 5
      syscall

      #save initial value into first part of array
      sw $v0, 0($t1)

      #have to increment the array address and index once now because we already added an element
      addi $t0, $t0, 1
      addi $t1, $t1, 4

      #now we have space reserved for a 10 element array where we already have the first element
      #now need to generate the rest of the elements for the array
      #then need to print out the elements
genloop:
      #generate the rest of the array elements
      bge $t0, $s0, print

      #compute the next value to store
      addi $t2, $t1, -4 #find the address of the previous array element and put it in t2
      lw $t2, 0($t2) #load the integer from t2 into t2

      addi $t2, $t2, 2 #add 2 to whatever value was in t2
      sw $t2, 0($t1) #save the new value into our current t1 address

      #increment
      addi $t0, $t0, 1
      addi $t1, $t1, 4

      j genloop

print:
      #now the array is full of values, now initialize a loop to print them all out
      #initialize second loop variables: increment, max, array address
      li $t0, 0 #i
      la $t1, my_array #load array address into t1
      li $s0, 10 #max

printloop:
      #now print off all the values
      bge $t0, $s0, exit

      #print msg1
      li $v0, 4 #print out prompt
      la $a0, msg1
      syscall

      #print index
      li $v0, 1
      add $a0, $t0, $0
      syscall

      #print msg2
      li $v0, 4 #print out prompt
      la $a0, msg2
      syscall

      #print value
      li $v0, 1
      lw $a0, 0($t1) #get the word from the array
      syscall

      #print newline
      li $v0, 4
      la $a0, nl
      syscall

      #increment
      addi $t0, $t0, 1
      addi $t1, $t1, 4

      j printloop

exit:
      #gracefully exit
      li $v0, 10
      syscall
