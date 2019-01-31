#------------------------------
# Common MIPS Patterns - Single Stack Unwind
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------
.text

# A function with multiple return values but one exit point.
f1:
  # Wind the stack.
  addi  $sp, $sp, -20             # Grow stack by five words.
  sw    $ra, 0($sp)               # Save $ra.
  sw    $s0, 4($sp)               # Save $s0.
  sw    $s1, 8($sp)               # Save $s1.
  sw    $s2, 12($sp)              # Save $s2.
  sw    $s3, 16($sp)              # Save $s3.

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

  # Unwind stack.
  lw    $s3, 16($sp)              # Restore $s3.
  lw    $s2, 12($sp)              # Restore $s2.
  lw    $s1, 8($sp)               # Restore $s1.
  lw    $s0, 4($sp)               # Restore $s0.
  lw    $ra, 0($sp)               # Restore $ra.
  addi  $sp, $sp, 20              # Shrink stack by five words.

  jr    $ra                       # Return
