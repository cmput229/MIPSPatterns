#------------------------------
# Common MIPS Patterns - Single Stack Unwind
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------
.text

# A function with multiple return values but one exit point.
f1:
  # Example stack winding.
  addi  $sp, $sp, -20
  sw    $ra, 0($sp)
  sw    $s0, 4($sp)
  sw    $s1, 8($sp)
  sw    $s2, 12($sp)
  sw    $s3, 16($sp)

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

  # Example stack unwinding.
  lw    $s3, 16($sp)
  lw    $s2, 12($sp)
  lw    $s1, 8($sp)
  lw    $s0, 4($sp)
  lw    $ra, 0($sp)
  addi  $sp, $sp, 20

  # Return.
  jr    $ra
