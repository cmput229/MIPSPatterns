#------------------------------
# Common MIPS Patterns - Precondition Loop
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------
.text

# A function with a preconditioned loop in it.
f1:
  # Function code leading up to the loop.
  # ...

  # for (i = 0; i < 10; ++i) { ... }

  # Setup loop.
  move  $t0, $zero                # Set i to 0.
  li    $t1, 10                   # Set max to 10.

_f1LoopBegin:
  # i < 10
  bge   $t0, $t1, _f1Join         # Branch to join on fail.

  # Do your loop work here.
  # ...

  # Increment.
  addi  $t0, $t0, 1               # Increment counter by 1.

  # Restart loop.
  j     _f1LoopBegin              # Jump to condition.

_f1Join:
  # Code after the loop.
  # ...

  # Return.
  jr    $ra
