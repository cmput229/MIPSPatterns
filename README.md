# MIPSPatterns
A resource for common coding structures in MIPS.

It's often difficult to translate high level programming structures that are
often delimited by punctuation or indentation into the mostly syntax-free
environment that is MIPS assembly. This resource aims to provide general
patterns for beginning users to adapt for their needs as well as provide
explanations that allow them to combine the different structures and eventually
extend them to solve more subtle problems.

In this way, these files are meant to be _suggestions_ or _aids_, ___not___
rules and laws. This is not the only way to solve your problems.

Each file has two versions, one in `explained/` and another in `simplified/`.
The version in `explained/` contains explanation and descriptions of why and how
we do things as well as where things go and what things do. The version in
`simplified/` has nothing but the bare minimum of comments in an effort to
distill the structure. Some of the explanations are rather long so the
simplified files assume you already know why something might be done in a
certain way.

The content is divided up as follows:
  1. [Syntax and Structure](explained/01-SyntaxAndStructure): Discusses how a
    MIPS assembly file is structured.
    <ol type="a">
      <li>
        Labels and Sections: Introduces data/text section and labels within
        each.
      </li>
      <li>
        Data Section: Introduces common data section directives.
      </li>
    </ol>
  1. [Subroutines](explained/02-Subroutines): Discusses how to interact with
    _basic_ subroutines (leaf functions).
    <ol type="a">
      <li>
        Subroutines: Introduces basic leaf functions. More advanced functions
        [use the stack](#stack).
      </li>
      <li>
        Main: Introduces what main should look like.
      </li>
    </ol>
  1. [Conditionals](explained/03-Conditionals): Discusses how to form basic conditional statements.
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
  1. [Loops](explained/04-Loops): Discusses how to form basic loop statements.
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
  1. [Complex Conditions](explained/05-ComplexConditions): Discusses how to form
    composite conditions.
    <ol type="a">
      <li>
        And: Introduces a two-part condition joined by an and.
      </li>
      <li>
        Or: Introduces a two-part condition joined by an or.
      </li>
    </ol>
  1. <a name="stack"/> [Stack](explained/06-Stack): Discusses how to interact with the stack.
    <ol type="a">
      <li>
        Single Stack Unwind: Discusses how to simplify your code with a single
        exit point.
      </li>
    </ol>

# Contributors
 * Braedy Kuzma
