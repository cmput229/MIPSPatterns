#----------------------------------------------
# Common MIPS Patterns - Alternate If/Elif/Else
# Author: Braedy Kuzma
# Date: January 31, 2019
#----------------------------------------------
.text

# A function with a different style of if/elif/else in it.
f4:
  # Function code leading up to the conditional.
  # ...

  # An elif block is only checked if the previous condition has failed.
  # Therefore it can be shown that:

  # if (cnd1) { bdy1 }
  # elif (cnd2) { bdy2 }
  # else { bdy3 }

  # is equivalent to:

  # if (cnd1) { bdy1 }
  # else {
  #   if (cnd2) { bdy2 }
  #   else { bdy3 }
  # }

  # This means that we can take conditionals as in f2 and nest them to achieve
  # the same funtionality as f3. All we need to do is have the body of the else
  # be the next conditional. Of course, we can be cleaner than just duplicating
  # code so the result is a bit better than this, but this is the general idea.

  # Setup for your first condition test here. In this case we want to check if
  # $t0 == 1 so we can set up in one instruction.
  # We'll assume that $t1 is free for use right now and put 1 into it.
  li    $t1, 1

  # As in f2, jump around code that we don't want to execute.
  bne   $t0, $t1, _f4Cond2

  # We passed if condition one, do the then block.
  # ...

  # We don't want to execute any of the other blocks, so jump to the join point.
  j     _f4Join

_f4Cond2:
  # Setup for the next condition here.
  # Increment 1 to 2 by adding 1 to $t1 and putting it back in $t1.
  addi  $t1, $t1, 1

  # Same logic as the first branch, we want to jump around code we don't want to
  # execute. This is the last condition, if there's an else block then we branch
  # there, otherwise (no else block) we branch to the join point.
  # We have an else block, so branch on failing ($t0 != 2) to the else block.
  bne   $t0, $t1, _f4Else

  # We failed condition one but passed condition two, do the elif then block.
  # ...

  # We don't want to execute any of the other blocks, so jump to the join point.
  j     _f4Join

_f4Else:
  # We didn't pass any conditions so do the else block.
  # ...

  # There's nothing between us and the join block so we can just fall through.

_f4Join:
  # Code after the conditional.

  jr    $ra
