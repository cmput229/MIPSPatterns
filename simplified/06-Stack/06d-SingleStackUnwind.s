#-------------------------------------------
# Common MIPS Patterns - Single Stack Unwind
# Author: Braedy Kuzma
# Date: January 31, 2019
#-------------------------------------------
.text

# A function with multiple return values but one exit point.
f1:
  # Function prologue, set up stack and save registers.
  addi  $sp, $sp, -20             # Allocate five slots on stack.
  sw    $ra, 0($sp)               # $ra is in the first slot.
  sw    $s0, 4($sp)               # $s0 is in the second slot.
  sw    $s1, 8($sp)               # $s1 is in the third slot.
  sw    $s2, 12($sp)              # $s2 is in the fourth slot.
  sw    $s3, 16($sp)              # $s3 is in the fifth slot.

  # Complicated decision making.
  # ...

_f1Body1:
  # Result code that sets up the return values for the first case.
  # ...

  j     _unwind                   # Jump to cleanup.

_f1Body2:
  # Result code that sets up the return values for the second case.
  # ...

  j     _unwind                   # Jump to cleanup.

_f1Body3:
  # Result code that sets up the return values for the third case.
  # ...

  # Now, since the next instructions are my clean up, we can just fall through.

_unwind:
  # Clean up code.
  # ...

  # Function epilogue, restorn saved registers and clean up stack.
  lw    $s3, 16($sp)              # Restore $s3.
  lw    $s2, 12($sp)              # Restore $s2.
  lw    $s1, 8($sp)               # Restore $s1.
  lw    $s0, 4($sp)               # Restore $s0.
  lw    $ra, 0($sp)               # Restore $ra.
  addi  $sp, $sp, 20              # Deallocate five slots from the stack.

  jr    $ra                       # Return
