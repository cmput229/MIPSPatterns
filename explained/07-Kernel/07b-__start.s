# The __start label goes in .text NOT .ktext.
.text

# The "main" routine is typically thought as the entry point for a program. In
# reality this is not true. Programs actually start at a label called __start.
# This is true of languages like C as well, where the standard library provides
# setup code in __start which eventually calls main.

# Normally, SPIM's exception.s has an __start in it that calls main. If you are
# writing your own exception handler by using -notrap, then you'll need to
# include an __start label yourself that calls main, or just start in __start.

# The __start label is expected to be able to be found anywhere by the assembler
# so it must be made global using the .globl directive.

.globl __start
__start:
  # Program set up code. Get things like argc and argv ready for main.
  # ...

  # Call to main.
  jal   main

  # This is the "top level" code in the program so using "jr $ra" doesn't make
  # sense because nothing called us. Instead we use the syscall to exit the
  # program.
  li $v0 10
  syscall
