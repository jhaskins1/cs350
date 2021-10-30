      .data
msga: .asciiz "a: "
msgb: .asciiz "b: "
msgc: .asciiz "c: "
msgr: .asciiz "Result is: "

      .text
      .globl main

main:
      # read a
      # prompt a
      li $v0, 4
      la $a0, msga
      syscall

      # read in the integer
      # read integer is 5
      li $v0, 5
      syscall
      # save to another register: t0-9 or s0-7, either or at the start
      # registers are basically variables but thats all you get is those variables

      add $t0, $v0, $0 #move from v0 into t0

      # read b
      # prompt b
      li $v0, 4
      la $a0, msgb
      syscall

      li $v0, 5
      syscall

      add $t1, $v0, $0 #move from v0 into t1

      # read c
      # prompt c
      li $v0, 4
      la $a0, msgc
      syscall

      li $v0, 5
      syscall

      add $t2, $v0, $0 #move from v0 into t2
      # a is in t0, b is in t1, c is in t2

      # now do the big operation
      # first find a*a, store it somewhere
      mul $t3, $t0, $t0
      # then find b*b, store it somewhere
      mul $t4, $t1, $t1
      # then add a and b and store it where a used to be
      add $t3, $t3, $t4
      # then find c*c store it where b used to be
      mul $t4, $t2, $t2 # find c^2
      # repeat that process
      add $t3, $t3, $t4
      mul $t4, $t0, $t1 # find ab
      sub $t3, $t3, $t4
      mul $t4, $t0, $t2
      sub $t3, $t3, $t4
      mul $t4, $t1, $t2
      sub $t3, $t3, $t4

      #print result
      li $v0, 4
      la $a0, msgr
      syscall

      li $v0, 1
      add $a0, $t3, $0 #move t3 to a0
      syscall

      # exit gracefully
      li $v0, 10
      syscall
