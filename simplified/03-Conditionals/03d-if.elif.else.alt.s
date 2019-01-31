#------------------------------
# Common MIPS Patterns - Alternate If/Elif/Else
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------
.text

# A function with a different style of if/elif/else in it.
f4:
  # Function code leading up to the conditional.
  # ...

  # First condition.
  li    $t1, 1                    # Load 1.
  bne   $t0, $t1, _f4Cond2        # Branch to next condition if fail.

  # First then block.
  # ...

  j     _f4Join                   # Jump past others to join.

_f4Cond2:
  # Second condition.
  addi  $t1, $t1, 1               # Increment 1 to 2.
  bne   $t0, $t1, _f4Else         # Branch to else if fail.

  # Second then block.
  # ...

  j     _f4Join                   # Jump past others to join.

_f4Else:
  # Else block.
  # ...

  # Fall through to join block.

_f4Join:
  # Code after the conditional.
  # ...

  jr    $ra                       # Return.
