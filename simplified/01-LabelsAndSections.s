#------------------------------
# Common MIPS Patterns - Labels and Sections
# Author: Braedy Kuzma
# Date:January 31, 2019
#------------------------------

# Data section.
.data

# Label with data directive on next line.
exampleLabel1:
  .space 1

# Label with data directive on same line.
exampleLabel2: .space 1

# Text section.
.text

# Label with first instruction on next line.
foo:
  jr    $ra # Foo starts here.

# Label with first instruction on same line.
bar: jr    $ra # Bar starts here.

# Label with first instruction later.
baz:


  jr    $ra # Baz starts here.
