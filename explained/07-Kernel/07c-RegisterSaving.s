# The .kdata section can be used to give us space to save registers we want to
# use into.
.kdata
rAT:
  .word 0
rS5:
  .word 0
rT3:
  .word 0

# Similar to how calling convention works in the conventional text section, the
# kernel must also save registers. There are two main differences:

# 1. We cannot trust $sp so we cannot use the stack. This necessitates saving
# values into the data section instead.

# 2. In the kernel, only $k0 and $k1 can be used freely. ANY other register must
# be saved before using it. This means that every register you are about to use
# (except $k0 and $k1) must have a slot in .ktext.
.ktext
  # The first register you must always consider saving is $at. The $at register
  # is the Assembler Temporary register and is used as an intermediate holding
  # place when performing pseudo instructions. For example:
  # li $t0, 0x11112222
  # is actually these two instructions:
  # lui $at, 0x1111
  # ori $t0, $at, 0x2222

  # The reason we need to consider this is that when we are in the exception
  # handler, we don't know if the main program was paused between the lui and
  # the ori or not. This reason isn't all that different from why we'd want to
  # save a register like $s0. We don't know if $s0 was in use when the program
  # was paused, so if we want to use it, we need to save it. The difference here
  # is that regular registers (like $t0 or $s0) must be used *explicitly* by us,
  # whereas $at is always used *implicitly*. Uses of $at make our lives easier.
  # For example, I can save $s0 to the label rS5 in the .ktext section by
  # writing one line:
  # sw $s5, rs5
  # This is actually two lines, using $at:
  # lui $at, 0x9000
  # sw $s5, 4($at)

  # We'd like to keep our lives easy. If we want to use pseudo instructions,
  # which we almost certainly do, the first thing that should always be done is
  # to save $at.

  # Due to the nature of $at, it is actually protected by the assembler. Any
  # explicit interaction with $at will result in a syntax error from the
  # assembler. To save $at we must first disable its protection. To do this we
  # use the .set directive with the "noat" parameter.
  .set  noat

  # Next, we need to MOVE $at into $k0 or $k1. Remember that this line:
  # sw $at, rAT
  # is actually:
  # lui $at, 0x9000
  # sw $at, 0($at)
  # Which overwrites $at before saving it, making it useless. Using la isn't
  # much better. For example, if .kdata were to start at 0x90001000 then:
  # la $k0, rAT
  # sw $at, 0($k0)
  # Would be expanded into:
  # lui $at, 0x9000
  # ori $k0, $at, 0x1000
  # sw $at, 0($k0)
  # Which also overwrites $at before saving it. Useless again. In the end, we
  # need to copy it first.
  move  $k0, $at

  # Next we need to re-enable the protection on $at. It's dangerous for us to
  # have it off. We use .set again with the parameter "at".
  .set  at

  # Now we can actually save registers that we need to save since we have at
  # saved. First save $at:
  sw    $k0, rAT
  # Remember that this is short hand for loading the address and then saving it
  # like so:
  # la $at, rAT
  # sw $k0, 0($at)

  # Now that we're done saving $at, we can save our other registers. Again, it's
  # safe to use $at, so we might as well.
  sw    $s5, rS5
  sw    $t3, rT3

  # Exception handler code goes here.
  # ...

  # Now it's time to restore all of the registers we used. We should first
  # restore the easy registers while we're still allowed to use $at.
  lw    $t3, rT3
  lw    $s5, rS5

  # Now we need to restore $at. The most easily understood method is to undo
  # exactly what we did before: load it, unprotect it, overwrite it, protect it.
  lw    $k0, rAT
  .set  noat
  move $at, $k0
  .set at

  # Technically, it is safe to unprotect, load directly into it, then reprotect
  # it because the last operation is writing the loaded value into the $at
  # register with no opportunities to change the value. This could be
  # accomplished like so:
  # .set noat
  # lw $at, rAT
  # .set at
  # Which expands to:
  # .set noat
  # lui $at, 0x9000
  # lw $at, 0($at)
  # Which is safe.

  # The last thing we should do is return.
  eret
