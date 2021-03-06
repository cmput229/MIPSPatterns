#----------------------------------------------
# Common MIPS Patterns - Complex Condition (or)
# Author: Braedy Kuzma
# Date: January 31, 2019
#----------------------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#----------------------------------------------
.text

# A function with a condition containing an OR.
f2:
  # Function code leading up to the conditional.
  # ...

  # if ($t0 % 3 == 0 OR $t0 % 5 == 0) { ... }

  # $t0 % 3 == 0
  li    $t1, 3                    # Load 3.
  div   $t0, $t1                  # Divide to get remainder.
  mfhi  $t1                       # Get remainder.
  beq   $t1, $zero, _f2CondBody   # Branch to then if success.

  # $t0 % 5 == 0
  li    $t1, 5                    # Load 5
  div   $t0, $t1                  # Divide to get remainder.
  mfhi  $t1                       # Get remainder.
  bne   $t1, $zero, _f2Join       # Branch to join on fail.

_f2CondBody:
  # Then body.
  # ...

  # Fall through to join block.

_f2Join:
  # Code after the conditional.
  # ...

  jr    $ra                       # Return
