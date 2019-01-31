#------------------------------
# Common MIPS Patterns - Precondition Loop
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------
.text

# A function with a preconditioned loop in it.
f1:
  # Function code leading up to the loop.
  # ...

  # This loop has a "precondition": a condition that's calculated at the START
  # of every iteration. This is how we typically think of loops and so is
  # probably the easiest to reason about and use.

  # We're just going to set up a simple loop that looks like this:
  # for (i = 0; i < 10; ++i) { ... }
  #      ----- +++++++ ****   ^^^^^
  #        1      2      3      4
  # The above also underlines some sections so that we can point them out in the
  # code.

  # We need to track our iterations through the loop which means we need to keep
  # two values around at the same time: the counter and the maximum. This means
  # two registers.

  # These registers may have been filled by previous code but we're just going
  # to assume that we want to make a loop do something ten times and set one
  # register to zero and then other to ten. THIS IS SECTION 1.
  # Assume $t0 and $t1 are free here.
  move  $t0, $zero
  li    $t1, 10

_f1LoopBegin:
  # Your precondition should be the first thing after your begin label, which
  # is where we'll jump to every time we finish an iteration. THIS IS SECTION 2.
  # This is another example of do-the-opposite. We want to stop the loop if the
  # condition fails. Failing means that $t0 is not < 10, or $t0 >= 10.
  # Therefore, we want to BRANCH if $t0 is GREATER than or EQUAL to 10 (bge).
  bge   $t0, $t1, _f1Join

  # Be aware that I'm using t-registers here and, unlike in conditionals where
  # we don't care about the registers used in checking the condition after the
  # first time we use them, we're going to need to keep those values. If you
  # make any calls (jal) you should be aware that calling convention allows
  # those registers to be trampled. You must save t-registers before the call
  # and restore them after. If you'd prefer to use s-registers then you must
  # save and restore them at the beginning and end of your function.
  # respectively

  # Do your loop work here. THIS IS SECTION 4.
  # ...

  # Now do our increment step. THIS IS SECTION 3.
  # Note that the "increment step" is something that for loops do, not while
  # loops. If you're modeling a while loop then the "increment" is probably
  # just a part of your loop body.
  addi  $t0, $t0, 1

  # We've finished this iteration so we need to start the iteration over again.
  # This means unconditionally jumping back to checking our condition.
  j     _f1LoopBegin

_f1Join:
  # Code after the loop.
  # ...

  # Return.
  jr    $ra
