#-------------------------------------------
# Common MIPS Patterns - Single Stack Unwind
# Author: Braedy Kuzma
# Date: January 31, 2019
#-------------------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
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

  # Sometimes we want to have functions that return early. Maybe we have
  # something like:
  # if (i < 0) { return value1; }
  # elif (i > 0) { return value2; }
  # else { return value3; }

  # The conditions and bodies can of course be much more complicated than this
  # but this is a simple example. The simplest way to manage this is to convert
  # exactly this. Do your decision making that sends you to the correct block;
  # execute code in the block; setup your return value in $v0 and $v1; unwind
  # your stack; and finally return. This is a lot of duplicated code and a lot
  # of points of failure when returning. The first parts are unavoidable: you'll
  # need to execute the code and setup the return value no matter what. However,
  # if you're managing the stack winding in one place, wouldn't it be nice to
  # unwind in one place as well? This way, if you save more registers or change
  # your stack wind, you only need to maintain one place for unwinding.

  # Complicated decision making
  # ...

_f1Body1:
  # Result code that sets up the return values for the first case.
  # ...

  j     _unwind                   # Now jump to the cleanup section.

_f1Body2:
  # Result code that sets up the return values for the second case.
  # ...

  j     _unwind                   # Now jump to the cleanup section.

_f1Body3:
  # Result code that sets up the return values for the third case.
  # ...

  # Now, since the next instructions are my clean up, we can just fall through.

_unwind:
  # Any code here is ONLY for cleaning up the stack since we don't want to
  # disturb any registers.

  # Function epilogue, restore registers and clean up stack.
  lw    $s3, 16($sp)              # Restore $s3.
  lw    $s2, 12($sp)              # Restore $s2.
  lw    $s1, 8($sp)               # Restore $s1.
  lw    $s0, 4($sp)               # Restore $s0.
  lw    $ra, 0($sp)               # Restore $ra.
  addi  $sp, $sp, 20              # Deallocate five slots from the stack.

  # Return.
  jr    $ra
