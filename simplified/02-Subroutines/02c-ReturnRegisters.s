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
  # MIPS subroutines have two return registers: $v0 and $v1.

  # An example function:
  # sumAndSquare(a, b, c, d) -> {
  #   sum = a + b + c + d;
  #   return (sum, sum * sum);
  # }

  # Accumulate sum in $t0.
  add   $t0, $a0, $a1             # $t0 = $a0 + $a1
  add   $t0, $t0, $a2             # $t0 = $a0 + $a1 + $a2
  add   $t0, $t0, $a3             # $t0 = $a0 + $a1 + $a2 + $a3

  # Setup first return value (sum).
  move  $v0, $t0                  # Move sum to first return register.

  # Calculate square and set up second return value (sum squared).
  mult  $t0, $t0                  # (hi, lo) = $t0 * $t0
  mflo  $v1                       # Move sum squared to second return register.

  jr    $ra                       # Return.
