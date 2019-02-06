#-------------------------------
# Common MIPS Patterns - If/Else
# Author: Braedy Kuzma
# Date: January 31, 2019
#-------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#-------------------------------
.text

# A function with an if/else conditional in it.
f2:
  # Function code leading up to the conditional.
  # ...

  bne   $t0, $zero, _f2Else       # Branch to else if $t0 != 0

  # Then body.
  # ...

  j     _f2Join                   # Jump past else to join.

_f2Else:
  # Else body.
  # ...

  # Fall through to join block.

_f2Join:
  # Code after the conditional.
  # ...

  jr    $ra                       # Return.
