#-----------------------------------
# Common MIPS Patterns - Argument Registers
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

# A function called sumAndSquare.
sumAndSquare:
  # Functions often need to give data back to be useful to calling functions. A
  # typical way is return the data (other options are again the stack and static
  # data allocation). Most high level languages allow you to return one piece of
  # data (though it can be composed of many things), MIPS has two return
  # registers instead, allowing for two pieces of data to be returned, though
  # they're still limited to the register size (a word). These are often used
  # for data ($v0) and then an "info" register ($v0). This info could be a
  # boolean indicating success or a length of written bytes. In truth though,
  # it is up to you to decide their meanings when you write the functions.

  # An example function sumAndSquare(a, b, c, d) adds all four arguments
  # together, returns the sum in $v0 and the square of the sum in $v1.

  # Add together the first two arguments. We'll use $t0 to accumulate.
  add   $t0, $a0, $a1

  # Add the second and third arguments to the first two.
  add   $t0, $t0, $a2
  add   $t0, $t0, $a3

  # Set up returning the sum.
  move  $v0, $t0

  # Compute square. (Mult may produce 64 bits and thus puts its answer in 2
  # special registers, lo and hi. Check out the pseudoinstruction mul.)
  mult  $t0, $t0

  # Set up returning the square.
  mflo  $v1

  # Return.
  jr    $ra
