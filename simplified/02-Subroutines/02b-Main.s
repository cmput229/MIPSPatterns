#----------------------------
# Common MIPS Patterns - Main
# Author: Braedy Kuzma
# Date: January 31, 2019
#----------------------------
.text

# Label for start of main.
main:
  # Body code...

  li    $v0, 0                    # Ready to return 0.
  jr    $ra                       # Return.
