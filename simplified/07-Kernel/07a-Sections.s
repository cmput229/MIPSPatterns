# Can only be accessed from .ktext.
.kdata
# A word of data in .kdata.
aWord:
  .word 0

# Can be accessed from .ktext or .text.
.data

# Kernel text starts at 0x80000180 for our version of MIPS.
.ktext 0x80000180

  # Excepion handler code.
  # ...

  eret                            # Return from exception handler for our
                                  # version of MIPS.
