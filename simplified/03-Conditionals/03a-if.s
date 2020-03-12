#--------------------------
# Common MIPS Patterns - If
# Author: Braedy Kuzma
# Date: January 31, 2019
#--------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#--------------------------
.text

# A function with a conditional in it.
f1:
  # Function code leading up to the conditional.
  # ...

  bne   $t0, $zero, _f1Join       # Branch around if $t0 != 0

  # Then body.
  # ...

  # Fall through to join block.

_f1Join:
  # Code after the conditional.
  # ...

  jr    $ra                       # Return
