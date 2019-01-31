.text

# A function with a condition containing an AND.
f1:
  # Function code leading up to the conditional.
  # ...

  # if ($t0 < 0 AND $t0 != 5) { ... }

  # $t0 < 0
  bge   $t1, $zero, _f1Join       # Branch to join on fail.

  # $t0 != 5
  li    $t1, 5                    # Load 5.
  beq   $t0, $t1, _f1Join         # Branch to join on fail.

  # Then body.
  # ...

  # Fall through to join block.

_f1Join:
  # Code after the conditional.
  # ...

  jr    $ra                       # Return
