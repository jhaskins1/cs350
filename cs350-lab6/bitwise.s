      .data

      .text
      .globl main

main:

loop:
      li $t0, 0xabc123
      #do something
      srl $t1, $t0, 1
      andi $t2, $t1, 1 #0b010
      bgt $t2, $zero, LABEL
      #branch statement, print something out
      j loop

LABEL:
      #blah blah blah
