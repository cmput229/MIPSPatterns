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

# The data section is used to allocate static space for variables. Here's a few
# you might care about.

# This directive starts the data section.
.data

# All of the the following directives can be initialised by putting a comma
# separated list of values after the directive.

# Allocating space for bytes of data uses the .byte directive.
aByte:
  .byte 255

manyBytes:
  .byte 1, 2, 3, 0x55, -128

# Allocating space for a halfword (2 bytes) uses the .half directive.
aHalfword:
  .half 65535

manyHalfwords:
  .half 256, 0xFFFE, -19

# Allocating space for a word (4 bytes, an int) uses the .word directive.
aWord:
  .word 4294967295

manyWords:
  .word 65536, 0xDEADBEEF, -2147483648

# Allocating space for a float (4 bytes, IEEE float) uses the .float directive.
aFloat:
  .float 1.0

manyFloats:
  .float -1.0, 1000.0001

# Allocating space for characters has two options, .ascii or .asciiz. The first
# directive will make an array of characters while the second will make the same
# array of characters but will ALSO add a null character at the end. Therefore,
# it may be more appropriate to use .ascii when you just need array of
# characters while .asciiz is good for printing strings.
# It's important to remember that characters are just bytes with specific
# values, see here: http://www.asciitable.com/index/asciifull.gif

# For example, all of these are equivalent.
hwString:
  .asciiz "Hello world!"

hwChars:
  .ascii "Hello world!"
  .byte 0x00

hwBytes:
  .byte 0x48, 0x65, 0x6C, 0x6C, 0x6f, 0x20, 0x77, 0x6F, 0x72, 0x6C, 0x64, 0x21
  .byte 0x00

# Alternately, if you'd like to just request UNINITIALISED space for data (for
# an array or something similar) you can use the .space directive. This will
# give you the requested number of BYTES of space uninitialised.

# Space for 16 words.
someSpace:
  .space 64
