#------------------------------------
# Common MIPS Patterns - If/Elif/Else
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------------
.text

# A function with an if/elif/else condition in it.
f3:
  # Function code leading up to the conditional.
  # ...

  # First condition.
  li    $t1, 1                    # Load 1.
  beq   $t0, $t1, _f3Body1        # Branch to body if $t0 == 1.

  # Second condition.
  addi  $t1, $t1, 1               # Increment 1 to 2.
  beq   $t0, $t1, _f3Body2        # Branch to body if $t0 == 2.

  # Else.
  j     _f3Else                   # Jump to else block.

_f3Body1:
  # First then block
  # ...

  j     _f3Join                   # Jump past others straight to join.

_f3Body2:
  # Second then block.
  # ...

  j     _f3Join                   # Jump past else straight to join.

_f3Else:
  # Else block.
  # ...

  # Fall through to join block.

_f3Join:
  # Code after the conditional.
  # ...

  jr    $ra                       # Return.
