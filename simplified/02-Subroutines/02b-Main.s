#----------------------------
# Common MIPS Patterns - Main
# Author: Braedy Kuzma
# Date: January 31, 2019
#----------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#----------------------------
.text

# Label for start of main.
main:
  # Body code...

  li    $v0, 0                    # Ready to return 0.
  jr    $ra                       # Return.
