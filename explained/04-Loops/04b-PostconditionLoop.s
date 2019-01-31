#------------------------------
# Common MIPS Patterns - Postcondition Loop
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------
.text

# A function with a postconditioned loop in it.
f2:
  # Function code leading up to the loop.
  # ...

  # This loop has a post condition, a condition that's calculated at the end of
  # every iteration. This is a bit more difficult to think about but this is
  # often what a compile will actuall transform your loop into. This form is a
  # bit more complicated because you still need to check initially if conditions
  # are met (like an if) but then rely on the condition at the end to finish the
  # loop.

  # We're going to set up the same loop as last time. THIS IS SECTION 1.
  # Assume $t0 and $t1 are free here.
  move  $t0, $zero
  li    $t1, 10

  # Our initial check. It's trivial to see here that this branch will never be
  # taken because we just set it up. However, if these were values that were
  # calculated in the above code then this is necessary. This condition will
  # also be expressed the same way as if it was a pre condition loop (i.e. we
  # want to quit if this condition is met). THIS IS SECTION 2.
  # It is important that this is BEFORE the loop begin label. It is NOT executed
  # every loop. It only guards the first iteration.
  bge   $t0, $t1, _f2Join

_f2LoopBegin:

  # The same note as above about saving your t-registers applies here.

  # Do your loop work here. THIS IS SECTION 4.
  # ...

  # Now do our increment step. THIS IS SECTION 3.
  # The same note as above about while loops applies here too.
  addi  $t0, $t0, 1


  # Now check our condition. This is the POSTCONDITION. It will almost certainly
  # be the negation of the initial check. The reason being that we are trying to
  # check if we want to RESTART the loop, not if we want to END it. THIS IS
  # SECTION 2 ALSO.
  # The benefit we get is that we don't need to jump back to the precondition
  # every iteration, instead we can just fall-through to the join block when we
  # finish.
  # We want to keep doing the loop while the counter is less than 10. Therefore
  # we want to BRANCH while #t0 is LESS THAN $t1 (blt). Note that blt is the
  # negation of bge.
  blt   $t0, $t1, _f2LoopBegin

_f2Join:
  # Code after the loop.
  # ...

  # Return.
  jr    $ra
