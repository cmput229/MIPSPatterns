#------------------------------
# Common MIPS Patterns - Subroutines
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------
.text

# Subroutines, also called procedures or functions, are started at labels and
# typically end with a jump register (jr) instruction using the return address
# register ($ra).

# A funcion foo. Note that this is still just a regular label, we just choose to
# think of it as a subroutine.
foo:

  # Function code. Stack wind, function work, other procedure calls, stack
  # unwind, etc.

  # A label within the function for some reason, probably a branch or jump
  # destination as part of a loop, conditional, etc. you might consider
  # prefixing your label name differently so you can tell them apart from
  # function labels.
_fooLabelName:

  # The return instruction. It's often a good idea to have only one exit or as
  # few as possible so that you only need to manage a few exit points.
  jr $ra
