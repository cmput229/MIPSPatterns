#---------------------------------------------------------
# Common MIPS Patterns - Return Address Calling Convention
# Author: Braedy Kuzma
# Date: January 31, 2019
#---------------------------------------------------------
.text

# A function that calls another function.
# This is a more advanced topic.
f1:
  # Function prologue, set up stack and save return address.
  addi  $sp, $sp, -4              # Allocate one slot on stack.
  sw    $ra, 0($sp)               # $ra is in the first slot.

  # Execute some function code.
  # ...

  jal   f2                        # Call other function.

  # Execute some more function code.
  # ...

  # Function epilogue, restorn return address and clean up stack.
  lw    $ra, 0($s0)               # Restore $ra.
  addi  $sp, $sp, 4               # Deallocate one slot from stack.

  jr    $ra                       # Return.

# A leaf function that does nothing, used for demonstration.
f2:
  jr    $ra                       # Return.
