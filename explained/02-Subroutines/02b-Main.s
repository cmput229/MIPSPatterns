#----------------------------
# Common MIPS Patterns - Main
# Author: Braedy Kuzma
# Date: January 31, 2019
#----------------------------

# If you are creating a program, not just a function, then you need what is
# called a program entry point. In C we call this main: in MIPS it is the same.
# The main function itself is actually just a subroutine that is called by
# start up code.

# Main must be in a text section since it is code.
.text

# It's now as simple as putting a label called main. Your program will then
# start from this label (after a bit of behind the scenes set up).
main:
  # Main code.
  # ...

  # Main is expecting an integer return. Returning after a successful execution
  # usually returns 0.
  li    $v0, 0

  # This returns.
  jr    $ra
