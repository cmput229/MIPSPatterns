#-----------------------------------
# Common MIPS Patterns - Return Register
# Author: Braedy Kuzma
# Date: March 12, 2020
#-----------------------------------
# Copyright 2020 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#-----------------------------------
.text

# A function called sum.
sum:
  # Functions need to access data to perform meaningful actions. A typical way
  # to get these pieces of data is through arguments (other options are the
  # stack and static data allocation). MIPS has four argument registers: $a0,
  # $a1, $a2, and $a3.

  # An example function sum(a, b, c, d) adds all four arguments together and
  # prints them.

  # Add together the first two arguments. We'll use $t0 to accumulate.
  add   $t0, $a0, $a1

  # Add the second and third arguments to the first two.
  add   $t0, $t0, $a2
  add   $t0, $t0, $a3

  # Setup for the print by moving the sum to the first argument register and
  # setting the "print int" syscall.
  move  $a0, $t0
  li    $v0, 1

  # Do the print.
  syscall

  # Return.
  jr    $ra
