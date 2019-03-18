# __start is in .text.
.text

# Define the __start label and make it global.
.globl __start
__start:
  # Program set up code. Get things like argc and argv ready for main.
  # ...

  jal   main                      # Call main.

  # Exit.
  li $v0 10                       # Load syscall 10.
  syscall                         # Make exit syscall.
