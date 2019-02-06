#-------------------------------------------------------------
# Common MIPS Patterns - Temporary Register Calling Convention
# Author: Braedy Kuzma
# Date: January 31, 2019
#-------------------------------------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#-------------------------------------------------------------
.text

# A function that calls another function with a live value in a temporary
# register.
# This is a more advanced topic.
f1:
  # This function calls another function, so we need to save $ra.
  addi  $sp, $sp, -4              # Allocate one slot on stack.
  sw    $ra, 0($sp)               # $ra is in the first slot.

  # Execute some body code.
  # ...

  # We're at the point in the program where we must call another function,
  # however there's a value in a temporary register that we need to use after
  # the function call. We say that this value is "live" because it needs to be
  # used in the future. In particular, we would describe this as a value that
  # is "live across a subroutine call".

  # Calling convention says that temporary registers can be used by a called
  # subrouine (i.e. we are the CALLEE) without worrying about what value was in
  # it previously. However, when we are the CALLER we need to save temporary
  # registers that we still need. This is why we sometimes call temporary
  # registers "caller saved" registers.

  # Note that caller saved registers include $t0-$t9, $a0-$a3, $v0, $v1.

  # Imagine that registers $t2, $t6, $a0 have values that we still need in them.
  # We are going to manage them in the same manner as we do for saved registers,
  # except that we're going to save and restore them around the function call
  # rather than at the beginning and end of the function.

  # Allocate space on stack for three registers.
  addi  $sp, $sp, -12

  # Save our registers.
  sw    $t2, 0($sp)
  sw    $t6, 4($sp)
  sw    $a0, 8($sp)

  # Call the function.
  jal   f2

  # Load our registers.
  lw    $a0, 8($sp)
  lw    $t6, 4($sp)
  lw    $t2, 0($sp)

  # Deallocate space on the stack, this returns the stack pointer to the same
  # place as at the start of our function so we can still load $ra from the
  # correct place.
  addi  $sp, $sp 12

  # Continue with our body code, using $t2, $t6, $a0 with the same value.
  # ...

  # We need to restore $ra before returning.
  lw    $ra, 0($sp)
  addi  $sp, $sp, 4

  # Return.
  jr    $ra

# A leaf function that does nothing, used for demonstration.
f2:
  # Return.
  jr    $ra
