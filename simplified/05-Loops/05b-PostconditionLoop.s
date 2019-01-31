#------------------------------
# Common MIPS Patterns - Postcondition Loop
# Author: Braedy Kuzma
# Date:January 31, 2019
#------------------------------
.text

# A function with a postconditioned loop in it.
f2:
  # Function code leading up to the loop.
  # ...

  # for (i = 0; i < 10; ++i) { ... }

  # Setup loop.
  move  $t0, $zero                # Set i to 0.
  li    $t1, 10                   # Set max to 10.

  # Loop guard.
  bge     $t0, $t1, _f2Join       # Branch to join on fail.

_f2LoopBegin:
  # Do your loop work here.
  # ...

  # Increment.
  addi    $t0, $t0, 1             # Increment counter by 1.

  # Post condition.
  blt     $t0, $t1, _f2LoopBegin  # Branch to begin on success to restart loop.

_f2Join:
  # Code after the loop.
  # ...

  # Return.
   jr $ra
