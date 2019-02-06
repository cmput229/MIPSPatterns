#-----------------------------------
# Common MIPS Patterns - Subroutines
# Author: Braedy Kuzma
# Date: January 31, 2019
#-----------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#-----------------------------------
.text

# A label marking the start of foo.
foo:

# A label within foo. Consider your internal naming style.
_fooLabelName:

  jr    $ra                       # Return.
