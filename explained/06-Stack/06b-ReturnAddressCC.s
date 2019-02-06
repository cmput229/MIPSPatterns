#---------------------------------------------------------
# Common MIPS Patterns - Return Address Calling Convention
# Author: Braedy Kuzma
# Date: January 31, 2019
#---------------------------------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#---------------------------------------------------------
.text

# A function that calls another function.
# This is a more advanced topic.
f1:
  # If we're planning on calling another function then we're going to jump to it
  # using jal. The "al" part of jal means "and link", which means that we will
  # place a return address in the $ra register. However, we only have a SINGLE
  # $ra register. Right now, $ra has OUR return address in it, so if we use jal
  # and overwrite it, we'll never be able to return. So WE need to save it. In
  # this way, $ra is ALSO a saved register.

  # We save this register the same way we'd save another saved register: save
  # it at the start of the function on the stack and then restore it just before
  # returning.

  # Grow the stack down by one slot.
  addi  $sp, $sp, -4

  # Save the $ra register to the new slot.
  sw    $ra, 0($sp)

  # Execute some function code.
  # ...

  # Now we call the other function, overwriting $ra. We don't mind though
  # because we've got the address in a safe place already.
  jal   f2

  # Execute some more function code.
  # ...

  # Now we restore $ra just before returning.
  lw    $ra, 0($s0)

  # Deallocate stack space.
  addi  $sp, $sp, 4

  # Return.
  jr    $ra

# A leaf function that does nothing, used for demonstration.
f2:
  # Return.
  jr    $ra
