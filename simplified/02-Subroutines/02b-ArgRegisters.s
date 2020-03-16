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
  # MIPS subroutines have four argument registers: $a0, $a1, $a2, and $a3.

  # An example function:
  # sum(a, b, c, d) -> print(a + b + c + d);

  # Accumulate sum in $t0.
  add   $t0, $a0, $a1             # $t0 = $a0 + $a1
  add   $t0, $t0, $a2             # $t0 = $a0 + $a1 + $a2
  add   $t0, $t0, $a3             # $t0 = $a0 + $a1 + $a2 + $a3

  # Print $t0.
  move  $a0, $t0                  # Set print arg.
  li    $v0, 1                    # Set print int mode.
  syscall                         # Call print.

  jr    $ra                       # Return.
