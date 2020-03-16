# Get space for registers to save into.
.kdata
rAT:
  .word 0
rS5:
  .word 0
rT3:
  .word 0

# Start .ktext.
.ktext  0x80000180
  # Save $at first.
  .set  noat                      # Unprotect $at.
  move  $k0, $at                  # Copy $at.
  .set  at                        # Reprotect $at.
  sw    $k0, rAT                  # Save $at to memory.

  # Save other registers.
  sw    $s5, rS5                  # Save $s5.
  sw    $t3, rT3                  # Save $t3.

  # Exception handler code goes here.
  # ...

  # Load other registers.
  lw    $t3, rT3                  # Load $s5.
  lw    $s5, rS5                  # Load $t3.

  # Load $at last.
  lw    $k0, rAT                  # Load $at
  .set  noat                      # Unprotect $at.
  move $at, $k0                   # Overwrite $at.
  .set at                         # Reprotect $at.

  eret                            # Return from exception handler.
