#-----------------------------------------------
# Common MIPS Patterns - Complex Condition (and)
# Author: Braedy Kuzma
# Date: January 31, 2019
#-----------------------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#-----------------------------------------------
.text

# A function with a condition containing an AND.
f1:
  # Function code leading up to the conditional.
  # ...

  # We want something more than a simple condition inside our conditional.
  # Anything more complex than a single boolean expression requires careful
  # understanding of boolean logic and program flow due to how quickly the
  # header of your loop can expand.

  # We'll start with AND (&&).
  # Let's check: if ($t0 < 0 AND $t0 != 5) { ... }
  # If either boolean is false then the body WILL NOT BE executed. This is
  # called short circuiting.

  # We're doing a simple if with no else here to focus on how to manage more
  # complex conditions. We'll build on this as we go on.

  # Set up for first part of condition would be here, but we don't need any.

  # Now check the condition. We want to quit evaluating early (short circuit) if
  # we can. That means if we FAIL the case, then we can skip to the join point.
  # Failing the case here means that t1 >= 0. Given this, we want to BRANCH if
  # we are GREATER than or EQUAL to (bge).
  bge   $t0, $zero, _f1Join

  # If we get here then that means the first condition is true which also means
  # we need to check the second condition. Set up for the second condition now.
  # Choose $t1, assuming that it's not being used previously.
  li    $t1, 5

  # Now check the condition. We want to fail and go to the join point if this
  # case fails. We want to BRANCH if $t0 EQUALS 5.
  beq   $t0, $t1, _f1Join

  # We're inside the body now, we passed both conditions. Execute your body
  # code.
  # ...

  # We can just fall through to the join point.

_f1Join:
  # Code after the conditional.

  jr    $ra
