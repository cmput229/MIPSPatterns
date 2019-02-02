#-------------------------------------------------------------
# Common MIPS Patterns - Temporary Register Calling Convention
# Author: Braedy Kuzma
# Date: January 31, 2019
#-------------------------------------------------------------
.text

# A function that calls another function with a live value in a temporary
# register.
# This is a more advanced topic.
f1:
  # Function prologue, set up stack and save return address.
  addi  $sp, $sp, -4              # Allocate one slot on stack.
  sw    $ra, 0($sp)               # $ra is in the first slot.

  # Execute some body code.
  # ...

  # Function call prologue, set up stack and save temporary registers.
  addi  $sp, $sp, -12             # Allocate three slots on stack.
  sw    $t2, 0($sp)               # $t2 is in the first slot.
  sw    $t6, 4($sp)               # $t6 is in the second slot.
  sw    $a0, 8($sp)               # $a0 is in the third slot.

  # Call the function.
  jal   f2

  # Function call epilogue, restore temporary registers and clean up stack.
  lw    $a0, 8($sp)               # Restore $a0.
  lw    $t6, 4($sp)               # Restore $t6.
  lw    $t2, 0($sp)               # Restore $t2.
  addi  $sp, $sp 12               # Deallocate three slots from stack.

  # Continue with our body code, using $t2, $t6, $t7 with the same value.
  # ...

  # Function epilogue, restore return address and clean up stack.
  lw    $ra, 0($s0)               # Restore $ra.
  addi  $sp, $sp, 4               # Deallocate one slot from stack.

  jr    $ra                       # Return.

# A leaf function that does nothing, used for demonstration.
f2:
  # Return.
  jr    $ra
