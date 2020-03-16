#------------------------------------
# Common MIPS Patterns - If/Elif/Else
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#------------------------------------
.text

# A function with an if/elif/else condition in it.
f3:
  # Function code leading up to the conditional.
  # ...

  # So we want to have multiple mutually exclusive (only one is executed)
  # conditionals like if/elif/else. We need to make the condition a bit more
  # complicated so we'll try to make something like this:
  # if ($t0 == 1) { ..do something.. }
  # elif ($t0 == 2) { ..do something.. }
  # else { ..do something.. }

  # There's two ways to do this in assembly. The first is easier to visualise
  # and maintain. The second will be explained in 03d-if.elif.else.alt but you
  # only really need to know one.

  # The idea here is slightly different than before. We are going to gather all
  # of our conditions in one place (the top of the conditional) and then branch
  # to a block of code with the body of that conditional. Rather than skipping
  # code given a case (as was done before) we are instead going to branch when
  # we hit that case. We can stack this setup/branch-if-true pattern infinitely
  # to obtain infinite if/elif/.../else blocks.

  # Setup for your first condition test here. In this case we want to check if
  # $t0 == 1 so we can set up in one instruction.
  # We'll assume that $t1 is free for use right now and put 1 into it.
  li    $t1, 1

  # Because there are other conditional branches directly following this to go
  # to other bodies, we want to BRANCH when the two values are EQUAL to get to
  # the correct body. Conveniently again, MIPS has the beq instruction.
  beq   $t0, $t1, _f3Body1

  # Setup for the next condition here.
  # Increment 1 to 2 by adding 1 to $t1 and putting it back in $t1.
  addi  $t1, $t1, 1

  # Same logic as the first branch, we want to go there if this is true.
  beq   $t0, $t1, _f3Body2

  # We're done all of our conditions. If we get here then we know that none of
  # the if conditions were met. If there's an else block then we must execute it
  # by unconditionally jumping to it. If there is no else block (i.e. if/elif
  # without else) then we unconditionally jump to the join block.

  # We have an else block, so jump to it.
  j     _f3Else

  # Or if there was no else block: j _f3Join

_f3Body1:
  # We passed if condition one, do if then block.
  # ...

  # We don't want to execute any of the other blocks, so jump to the join point.
  j     _f3Join

_f3Body2:
  # We failed condition one but passed condition two, do the elif then block.
  # ...

  # We don't want to execute any of the other blocks, so jump to the join point.
  j     _f3Join

_f3Else:
  # We didn't pass any conditions so do the else block.
  # ...

  # There's nothing between us and the join block so we can just fall through.

_f3Join:
  # Code after the conditional.
  # ...

  jr    $ra
