#------------------------------
# Common MIPS Patterns - If/Else
# Author: Braedy Kuzma
# Date:January 31, 2019
#------------------------------
.text

# A function with an if/else conditional in it.
f2:
  # Function code leading up to the conditional.
  # ...

  # We want to have a single if with an unconditional else block using the same
  # condition as above, e.g.:
  # if ($t0 == 0) { ..do something if true.. }
  # else { ..do something if false.. }

  # The idea remains basically the same as above, use the opposite condition to
  # skip code we don't want to do. The difference is that if we fail the
  # condition we jump to the else block instead and then both blocks are
  # directed to the join point.
  bne   $t0, $zero, _f2Else

  # Inside the "then" block again.
  # ...

  # Now that there's an else block between us and the join point, we can't just
  # fall through. Instead we need to unconditionally jump to the join point
  # using the jump instruction.
  j     _f2Join

_f2Else:
  # If we get here then we know we're in the else block.

  # Else block.
  # ...

  # Just like before, because we're right above the join point we can fall
  # through in the join code.

_f2Join:
  # Code after the conditional.
  # ...

  jr    $ra
