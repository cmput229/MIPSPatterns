#------------------------------
# Common MIPS Patterns - Subroutines
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------
.text

# A label marking the start of foo.
foo:

# A label within foo. Consider your internal naming style.
_fooLabelName:

  jr    $ra                       # Return.
