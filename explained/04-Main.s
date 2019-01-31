#------------------------------
# Common MIPS Patterns - Main
# Author: Braedy Kuzma
# Date:January 31, 2019
#------------------------------

# If you are creating a program, not just a function, then you need what is
# called a program entry point. In C we call this main: in MIPS it is the same.

# Main must be in a text section since it is code.
.text

# It's now as simple as putting a label called main. Your program will then
# start from this label (after a bit of behind the scenes set up).
main:
  # Main code.
  # ...

  # This returns.
  jr    $ra
