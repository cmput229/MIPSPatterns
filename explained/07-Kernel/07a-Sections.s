# This is an advanced topic.
# Interacting with the kernel brings two new sections: .ktext and .kdata.

# The kernel data section (.kdata) works exactly like the regular data section.
# The only difference is that .kdata can only be accessed from .ktext.
.kdata
# You can ask for data in exactly the same you do in the .data section.
aWord:
  .word 0

# Can be accessed from .ktext or .text.
.data

# The .ktext section is slightly different in how we get to the code in this
# section. Instead of having a label to jump to, the processor knows to jump to
# a predefined address: 0x80000180 (for our version of MIPS*). We can tell the
# section where to start by adding an address after the .ktext directive.

# When any exception occurs, the processor will pause the main running program
# and jump to this address. There are two different types of exceptions: traps
# and interrupts. Traps are the result of synchronous exceptions, which means
# they were a result of running code. These are some type of error in your code
# like dividing by zero or loading from a bad memory address. Interrupts are the
# result of asynchronous exceptions, which means they were caused by an external
# force. These are things like the timer register matching the comparison
# register (timer interrupt) or someone pressing a key on the keyboard
# (keyboard interrupt).
.ktext 0x80000180

  # Excepion handler code.
  # ...

  # How to return from the exception handler (for our version of MIPS**).
  eret

# The following footnotes are based on spim's default exception.s.
# *: MIPS32. For MIPS-I (R2000) this address is 0x80000080.
# **: MIPS-I (R2000) uses a combination of manually getting EPC and an rfe
#     instruction.
