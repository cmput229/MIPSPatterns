# MIPSPatterns
A resource for common coding structures in MIPS.

It's often difficult to translate high level programming structures that are
often delimited by punctuation or indentation into the mostly syntax-free
environment that is MIPS assembly. This resource aims to provide general
patterns for beginning users to adapt for their needs as well as provide
explanations that allow them to combine the different structures and eventually
extend them to solve more subtle problems.

In this way, these files are meant to be _suggestions_ or _aids_, ___not___
rules and laws. This is not the only way to solve your problems but it can help
you get started.

Each file has two versions, one in `explained/` and another in `simplified/`.
The version in `explained/` contains explanation and descriptions of why and how
we do things as well as where things go and what things do. The version in
`simplified/` has nothing but the bare minimum of comments in an effort to
distill the structure. Some of the explanations are rather long so the
simplified files assume you already know why something might be done in a
certain way.

The content is divided up as follows:
<!--
  This has to be in HTML because markdown does not support specifying the type
  of ordered list.
--->
<ol type="1">
  <li>
    <a href="explained/01-SyntaxAndStructure">Syntax and Structure</a>:
    Discusses how a MIPS assembly file is structured.
    <ol type="a">
      <li>
        Labels and Sections: Introduces data/text section and labels within
        each.
      </li>
      <li>
        Data Section: Introduces common data section directives.
      </li>
    </ol>
  </li>
  <li>
    <a href="explained/02-Subroutines">Subroutines</a>: Discusses how to
    interact with <em>basic</em> subroutines (leaf functions).
    <ol type="a">
      <li>
        Subroutines: Introduces basic leaf functions. More advanced functions
        <a href="#stack">use the stack</a>.
      </li>
      <li>
        Main: Introduces what main should look like.
      </li>
    </ol>
  </li>
  <li>
    <a href="explained/03-Conditionals">Conditionals</a>: Discusses how to
    form basic conditional statements.
    <ol type="a">
      <li>
        If: Introduces a basic if conditional.
      </li>
      <li>
        If/Else: Introduces an if with an unconditional else block.
      </li>
      <li>
        If/Elif/Else: Introduces an if with conditional elif blocks and finally
        an unconditional else block.
      </li>
      <li>
        Alternate If/Elif/Else: Shows a different style of conditionals that
        some may prefer.
      </li>
    </ol>
  </li>
  <li>
    <a href="explained/04-Loops">Loops</a>: Discusses how to form
    basic loop statements.
    <ol type="a">
      <li>
        Precondition Loop: Introduces loops with a condition check before the
        body.
      </li>
      <li>
        Postcondition Loop: Introduces loops with an initial guard and then a
        condition check after the body.
      </li>
    </ol>
  </li>
  <li>
    <a href="explained/05-ComplexConditions">Complex Conditions</a>: Discusses how to form
    composite conditions.
    <ol type="a">
      <li>
        And: Introduces a two-part condition joined by an and.
      </li>
      <li>
        Or: Introduces a two-part condition joined by an or.
      </li>
    </ol>
  </li>
  <li>
    <a href="explained/06-Stack" name="stack">Stack</a>: Discusses
    how to interact with the stack. This topic can be more difficult than
    previous sections.
    <ol type="a">
      <li>
        Saved Register Calling Convention: Introduces how to manage saved
        registers in a subroutine.
      </li>
      <li>
        Return Address Calling Convention: Introduces how to manage the return
        address register when a subroutine calls other subroutines.
      </li>
      <li>
        Temporary Register Calling Convention: Introduces how to manage
        temporary registers that are live across subroutine calls.
      </li>
      <li>
        Single Stack Unwind: Introduces a method to simplify subroutine code
        by using a single exit point.
      </li>
    </ol>
  </li>
  <li>
    <a href="explained/07-Kernel" name="stack">Kernel</a>: Discusses
    how to act as the kernel. This topic can be more difficult than previous
    sections as well.
    <ol type="a">
      <li>
        Sections: Introduces the new sections used when acting as the kernel.
      </li>
      <li>
        __start: Introduces the __start label and how to use it.
      </li>
      <li>
        Register Saving: Introduces how to save registers in the kernel.
      </li>
    </ol>
  </li>
</ol>

# Contributors
 * Braedy Kuzma
