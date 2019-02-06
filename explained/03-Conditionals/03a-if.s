#--------------------------
# Common MIPS Patterns - If
# Author: Braedy Kuzma
# Date: January 31, 2019
#--------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#--------------------------
.text

# A function with a conditional in it.
f1:
  # Function code leading up to the conditional.
  # ...

  # Start basic with a single if. Maybe we need to check if $t0 is equal to 0,
  # e.g.:
  # if ($t0 == 0) { ..do something.. }

  # Note that a condition in assembly is often the OPPOSITE of what you would
  # normally write. This is because typically you think of saying "If this case,
  # I want to execute this code". Here, because assembly is always executed in a
  # straight line, we need to think "If this case, I want to keep going".
  # Conversely, we can think "If NOT this case, I don't want to keep going".
  # Because we want to have the opportunity to actually branch around this code,
  # we use the second idea when inserting our branch.

  # Therefore we can take our idea of "If $t0 == 0, do this" and change it to
  # "If $t0 != 0, don't do this". Don't do this means BRANCH around the code
  # we want to skip. We want to branch when $t0 is NOT EQUAL to 0. Conveniently
  # There is a BRANCH NOT EQUAL instruction: bne.

  # Recall that $zero or $0 always has the value of zero.
  bne   $t0, $zero, _f1Join

  # If we get past the bne to this instruction then we know $t0 == 0 because we
  # did not take the branch above.

  # Your conditional "then" body.
  # ...

  # No need to jump to the join point, just let your code "fall through" into
  # the join point.

# The join point. Everything after this label will be seen by both paths from
# the conditional.
_f1Join:
  # Code after the conditional.
  # ...

  jr    $ra
