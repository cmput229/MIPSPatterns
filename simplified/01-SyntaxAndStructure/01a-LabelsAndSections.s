#-------------------------------------------
# Common MIPS Patterns - Labels and Sections
# Author: Braedy Kuzma
# Date: January 31, 2019
#-------------------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#-------------------------------------------

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
  add   $t0, $zero, $zero         # Foo starts here.
  jr    $ra                       # Foo ends here.

# Label with first instruction on same line.
bar:  add   $t0, $zero, $zero     # Bar starts here.
      jr    $ra                   # Bar ends here.

# Label with first instruction later.
baz:


  add   $t0, $zero, $zero         # Baz starts here.
  jr    $ra                       # Baz ends here.
