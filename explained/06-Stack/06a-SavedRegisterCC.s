#---------------------------------------------------------
# Common MIPS Patterns - Saved Register Calling Convention
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

# A leaf function that uses saved registers.
# This is a more advanced topic.
f1:
  # Every subroutine shares the same registers. Without any rules on how
  # registers can be used, developers would never be able to use another
  # developer's functions because it would be impossible to determine if calling
  # their function would destroy the values you have in registers.

  # The solution to this is what we call "calling convention". Calling
  # convention is a set of rules (a convention) that determines how functions
  # will share registers when they are called.

  # Saved registers are registers that the calling function (a.k.a. the
  # "caller") can depend on REMAINING THE SAME across calls to another function.
  # This means that if the called function (a.k.a. the "callee") wants to use
  # a saved register then it must save them to the stack when it starts
  # executing and then restore them just before it returns so that it appears to
  # the caller as if there were no change to the register. This is why saved
  # registers are also sometimes called "callee saved" registers.

  # Remember that a function can be both a caller and a callee. When it's a
  # callee, it must save the saved registers. But when it calls another function
  # it gets to assume that the saved registers will be the same when the child
  # function returns.

  # The first thing we need to do is allocate space on the stack. We manage the
  # stack via the stack point ($sp). The stack pointer is a HIGH value. When the
  # stack grows (allocating more space on the stack) we DECREASE the point. This
  # means the stack grows DOWNWARDS.

  # We plan on using registers $s0-$s2.
  # That is 3 registers * 4 bytes which means 12 bytes.
  addi  $sp, $sp, -12

  # Now we need to save these registers. Since we allocated the space we know
  # directly the offsets to place this into, so there's no reason to do math
  # $sp.
  sw    $s0, 0($sp)               # $s0 is in the first slot.
  sw    $s1, 4($sp)               # $s1 is in the second slot.
  sw    $s2, 8($sp)               # $s2 is in the third slot.

  # Now that we've saved them, we're free to overwrite them or use them for
  # whatever we want.
  # Do your function body, making use of $s0-$s2.
  # ...

  # Now that we're done the function, we need to restore the registers we saved
  # so it looks like we didn't change them. Once again, we know what slots we
  # put them in, so we can just take them out immediately using the offset.
  lw    $s2, 8($sp)
  lw    $s1, 4($sp)
  lw    $s0, 0($sp)

  # You must always deallocate the space you took on the stack. If you don't,
  # your calling function will assume that the stack pointer is in the right
  # place and when it assumes it's loading values from the correct slot, it will
  # load the wrong values.
  addi  $sp, $sp, 12

  # Return.
  jr    $ra
