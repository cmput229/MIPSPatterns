#----------------------------------------------
# Common MIPS Patterns - Complex Condition (or)
# Author: Braedy Kuzma
# Date: January 31, 2019
#----------------------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#----------------------------------------------
.text

# A function with a condition containing an OR.
f2:
  # Function code leading up to the conditional.
  # ...

  # We'll try an OR (||) now.
  # Let's check: if ($t0 % 3 == 0 OR $t0 % 5 == 0) { ... }
  # If either boolean is true then the body WILL BE executed. This is still
  # called short circuiting.

  # Set up for the first part of the condition.
  # Assume $t1 is available for use here. Remainder can be obtained from the div
  # instruction like so:
  li    $t1, 3
  div   $t0, $t1
  mfhi  $t1

  # Now check the condition. We want to execute the body if the remainder is
  # zero, so, we want to BRANCH if $t1 EQUALS 0. We branch straight to the body,
  # there's no need to look at the other condition.
  beq   $t1, $zero, _f2CondBody

  # The first part was not true, so we need to check the next part.
  # Set up for the next expression.
  # We know $t1 is available here because we were using it above.
  li    $t1, 5
  div   $t0, $t1
  mfhi  $t1

  # Now check the condition. The difference here is that if we fail here then we
  # SHOULD NOT execute the body. This is the classic do-the-opposite-of-what-we-
  # wrote. We want to BRANCH if $t1 DOES NOT equal 0. We branch to the join
  # because we failed every condition or fall through because we pass this one
  # ($t1 == 0)
  bne   $t1, $zero, _f2Join

_f2CondBody:

# We're inside the body now, we passed one of the conditions. Execute your body
# code.
# ...

# We can just fall through to the join point.

_f2Join:
  # Code after the conditional.

  jr    $ra
