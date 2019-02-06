#------------------------------------
# Common MIPS Patterns - Data Section
# Author: Braedy Kuzma
# Date: January 31, 2019
#------------------------------------
# Copyright 2019 Braedy Kuzma
#
# Licensed under the Apache License, Version 2.0
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#------------------------------------

# Data section.
.data
# Initialised bytes.
aByte:
  .byte 255
manyBytes:
  .byte 1, 2, 3, 0x55, -128

# Initialised halfwords.
aHalfword:
  .half 65535
manyHalfwords:
  .half 256, 0xFFFE, -19

# initialised words.
aWord:
  .word 4294967295
manyWords:
  .word 65536, 0xDEADBEEF, -2147483648

# Initialised floats.
aFloat:
  .float 1.0
manyFloats:
  .float -1.0, 1000.0001

# Initialised strings.
hwString:
  .asciiz "Hello world!"
hwChars:
  .ascii "Hello world!"
  .byte 0x00
hwBytes:
  .byte 0x48, 0x65, 0x6C, 0x6C, 0x6f, 0x20, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x21
  .byte 0x00

# Uninitialised space.
someSpace:
  .space 64
