#------------------------------
# Common MIPS Patterns - If
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------
.text

# A function with a conditional in it.
f1:
  # Function code leading up to the conditional.
  # ...

  bne   $t0, $zero, _f1Join       # Branch around if $t0 != 0

  # Then body.
  # ...

  # Fall through to join block.

# Join point: after the conditional.
_f1Join:
  # Code after the conditional.
  # ...

  jr    $ra                       # Return
