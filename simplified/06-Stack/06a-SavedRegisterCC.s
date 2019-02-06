#---------------------------------------------------------
# Common MIPS Patterns - Saved Register Calling Convention
# Author: Braedy Kuzma
# Date: January 31, 2019
#---------------------------------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#---------------------------------------------------------
.text

# A leaf function that uses saved registers.
# This is a more advanced topic.
f1:
  # Function prologue, set up stack and save saved registers.
  addi  $sp, $sp, -12             # Allocate three slots on stack.
  sw    $s0, 0($sp)               # $s0 is in the first slot.
  sw    $s1, 4($sp)               # $s1 is in the second slot.
  sw    $s2, 8($sp)               # $s2 is in the third slot.

  # Do your function body, making use of $s0-$s2.
  # ...

  # Function epilogue, restore saved registers and clean up stack.
  lw    $s2, 8($sp)               # Restore $s2.
  lw    $s1, 4($sp)               # Restore $s1.
  lw    $s0, 0($sp)               # Restore $s0.
  addi  $sp, $sp, 12              # Deallocate three slots from stack.

  jr    $ra                       # Return.
