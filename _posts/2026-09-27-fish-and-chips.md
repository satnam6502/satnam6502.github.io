---
layout: personal
title: "Fish and Chips: Functional Geometry and FPGA Circuit Layout"
description: "Escher's Square Limit drawn in Lean 4 with Peter Henderson's Functional Geometry, and how the same kind of layout combinators describe FPGA circuit layouts."
image: "/images/squarelimit.png"
permalink: /escher-fish/
tags:
  author: satnam_singh
---
# Fish and Chips: Functional Geometry and FPGA Circuit Layout

The Lean 4 code for this post is at [satnam6502/escher-fish](https://github.com/satnam6502/escher-fish).

I love [Escher's fish](https://en.wikipedia.org/wiki/Sky_and_Water_I), and I especially love [Peter Henderson](https://www.linkedin.com/in/peter-henderson-98a48742/)'s rendering of Escher's fish, which has inspired much of the work I have done on algebraic specification of circuit layout, building on the original work on [Ruby](https://www.cs.ox.ac.uk/people/geraint.jones/ruby/) for circuit design and layout by [Mary Sheeran](https://www.cse.chalmers.se/~ms/) and [Geraint Jones](https://www.cs.ox.ac.uk/people/geraint.jones/).

Here we have Escher's *Square Limit*, drawn in Lean 4 using the algebra of pictures from the 2002 update of Peter
Henderson's 1982 paper [*Functional Geometry*](https://eprints.soton.ac.uk/id/eprint/257577/1/funcgeo2.pdf).

![Square Limit to depth 2](/images/squarelimit.svg)

And this is its beautiful description in Lean 4:

```lean
def squarelimit (n : Nat) :=
  nonet (corner n) (side n) (rot (rot (rot (corner n))))
        (rot (side n)) u (rot (rot (rot (side n))))
        (rot (corner n)) (rot (rot (side n))) (rot (rot (corner n)))
```

## Functional Geometry for Circuit Layout

Ruby, a relational hardware description language which provides combinators that simultaneously combine behavioural semantics and layout semantics, allows for the expression of sophisticated circuit layouts using just composable combinators without mentioning a single Cartesian co-ordinate. The page [A Sorter Example in Lava](/lava/sorter/) gives an example of how a high speed sorter can be efficiently laid out on a Xilinx FPGA using a DSL that has layout combinators that also compose behaviour ([Lava](/lava/)).

Here is what the layout of a Batcher's bitonic sorter on a Xilinx Artix-7 XC7A200T FPGA produced from a DSL with layout combinators looks like:

![Butterfly sorter](/images/butterfly-bsort.png)

Notice how the FFT-style butterfly wiring pattern is clearly evident. The ability to express spatial layout in a textual algebraic manner is not only great for humans, but it is also fantastic for AIs (LLMs), which can use layout combinators and their laws to help optimize circuit layouts to minimize area, delay, power, etc. The basic higher order layout combinator used to implement the sorter is a butterfly network:

```lean
/-
BFLY is a butterfly pattern that can be used to implement Batcher's bitonic merger.
A degree n=0 butterfly is the base case, applying just r on 2^(1+n) inputs ie. 2 inputs to 2 outputs.
A degree n butterfly takes 2^(1+n) inputs and produces 2^(1+n) outputs.
-/
def BFLY (r : Rel (List.Vector α 2) (List.Vector α 2)) :
    (n : Nat) → Rel (List.Vector α (2 ^ (n + 1))) (List.Vector α (2 ^ (n + 1)))
  | 0 => r
  | n + 1 =>
    have h : 2 ^ (n + 2) = 2 * 2 ^ (n + 1) := by ring
    h ▸ (ILV (BFLY r n) ⨾ EVENS r)
```

Here `ILV` (interleave), `EVENS` and series composition `⨾` are Ruby combinators over relations (`Rel`), described in the Ruby papers listed below.

## Running

Clone [https://github.com/satnam6502/escher-fish](https://github.com/satnam6502/escher-fish), then:

```
lake build
.lake/build/bin/escher            # writes squarelimit.svg
.lake/build/bin/escher out.svg    # or to a path of your choosing
```

## Reading the code alongside the paper

| Paper | Lean |
| --- | --- |
| §5, a picture as a function of vectors `a`, `b`, `c`; `blank`, `over`, `beside`, `above`, `rot`, `flip`, `rot45`; the utility functions `quartet` and `nonet` | [`Escher/Picture.lean`](https://github.com/satnam6502/escher-fish/blob/main/Escher/Picture.lean) |
| Figure 4, the basic fish | [`Escher/Fish.lean`](https://github.com/satnam6502/escher-fish/blob/main/Escher/Fish.lean) |
| §3, `fish2`, `fish3`, `t`, `u`, `side`, `corner`, `squarelimit` | [`Escher/SquareLimit.lean`](https://github.com/satnam6502/escher-fish/blob/main/Escher/SquareLimit.lean) |
| §6, laws such as `rot(beside(p,q)) = above(rot(q),rot(p))`, proved for all pictures | [`Escher/Laws.lean`](https://github.com/satnam6502/escher-fish/blob/main/Escher/Laws.lean) |
| Rendering the curves | [`Escher/Svg.lean`](https://github.com/satnam6502/escher-fish/blob/main/Escher/Svg.lean) |

The paper's `side[n]` and `corner[n]` become functions of the depth `n`, and
`beside(m, n, p, q)` / `above(m, n, p, q)` are written `beside' m n p q` /
`above' m n p q`. Otherwise the equations read as they do in the paper (repeated from above):

```lean
def squarelimit (n : Nat) :=
  nonet (corner n) (side n) (rot (rot (rot (corner n))))
        (rot (side n)) u (rot (rot (rot (side n))))
        (rot (corner n)) (rot (rot (side n))) (rot (rot (corner n)))
```

Coordinates are exact rationals (`Rat`) rather than `Float`, so the laws can be
proved: floating-point addition is not even associative. Some laws hold only up to
the order in which curves are drawn; these are stated with `≈`, meaning the two
pictures draw the same curves in every locating box. The laws proved are:

```lean
theorem rot_rot_rot_rot : rot (rot (rot (rot p))) = p

theorem rot_above : rot (above p q) = beside (rot p) (rot q)

theorem rot_beside : rot (beside p q) ≈ above (rot q) (rot p)

theorem flip_beside : flip (beside p q) ≈ beside (flip q) (flip p)

/-- Two `rot45`s halve a picture and move it out of its box, into the box above. -/
theorem above_blank_rot45_rot45 :
    above blank (rot45 (rot45 p)) = above (quartet blank blank (rot p) blank) blank

theorem beside'_one_one : beside' 1 1 p q = beside p q

theorem above'_one_one : above' 1 1 p q = above p q
```

## More about Ruby and Lava

There are many great papers about Ruby and Lava, here is a small selection:

* [Ruby page at the University of Oxford](https://www.cs.ox.ac.uk/people/geraint.jones/ruby/)
* [Lava: hardware design in Haskell](https://dl.acm.org/doi/10.1145/289423.289440). Per Bjesse, Koen Claessen, Mary Sheeran and Satnam Singh. ICFP '98: Proceedings of the third ACM SIGPLAN international conference on Functional programming.
* [The Design and Verification of a Sorter Core](https://link.springer.com/chapter/10.1007/3-540-44798-9_28). Koen Claessen, Mary Sheeran and Satnam Singh. Correct Hardware Design and Verification Methods. CHARME 2001.
* [Extensible Embedded Hardware Description Languages with Compilation, Simulation and Verification](https://dl.acm.org/doi/10.1145/3597031.3597051). Omar Tahir, Wayne Luk and Nicolas Wu. HEART '23: Proceedings of the 13th International Symposium on Highly Efficient Accelerators and Reconfigurable Technologies.


## Credits and Notes

The fish's Bézier control points are Einar Høst's transcription of Henderson's
fish, from [einarwh/escher-workshop](https://github.com/einarwh/escher-workshop)
(MIT licence).

The original version of Peter Henderson's 1982 paper used four tiles and avoided the 45 degree rotation, as shown on the page [Programming with Escher](https://mapio.github.io/programming-with-escher/). This version is based on a complete fish tile.

### Why `Rat` and not `Float`

Thanks to [Jeremy Gibbons](https://www.cs.ox.ac.uk/people/jeremy.gibbons/) for asking some clarifying questions about the use of `Rat` and 45 degree rotation. Here is some explanation.

The point of an algebra of pictures is that its laws can be used to reason about
pictures, which means they should be proved, not just tested. Every law in
[`Escher/Laws.lean`](https://github.com/satnam6502/escher-fish/blob/main/Escher/Laws.lean) reduces to equations between coordinates, and
those equations rely on ordinary arithmetic facts such as associativity,
commutativity and distributivity. `Float` loses associativity and distributivity to
rounding: `(a + b) + c` and
`a + (b + c)` can round to different values, so a law like
`rot (above p q) = beside (rot p) (rot q)` is simply false over `Float`. `Rat` is a
genuine field, so once the combinators are unfolded, `grind` can close each goal. The
exact rationals are converted to decimals only at the last moment, when the SVG is
written.

### Why `≈`

A picture is a function from a locating box `(a, b, c)` to a list of Bézier curves.
Combinators such as `over` and `beside` concatenate the lists of their arguments, so
two pictures can look identical but draw their curves in a different order. For
example, `rot (beside p q)` draws `p`'s curves before `q`'s, whereas
`above (rot q) (rot p)` draws `q`'s first. Insisting on `=` would make such laws
false for reasons that have nothing to do with geometry. So `p ≈ q` is defined as

```lean
instance : HasEquiv Picture := ⟨fun p q => ∀ a b c, (p a b c).Perm (q a b c)⟩
```

meaning that in every locating box, the two pictures draw the same curves, each the
same number of times, possibly in a different order. Laws that hold exactly, such as
`rot_rot_rot_rot`, are still stated with `=`.

### Why the 45 degree rotation still works over the rationals

The rationals are not closed under rotation by 45 degrees: rotating `(1, 0)` gives
`(√2/2, √2/2)`. The trick, which comes straight from Henderson's paper, is that a
picture is never rotated by applying a rotation matrix to its points. Instead,
`rot45` builds a new locating box from the old one:

```lean
def rot45 (p : Picture) : Picture :=
  fun a b c => p (a + (b + c) / 2) ((b + c) / 2) ((c - b) / 2)
```

The new edges `(b + c) / 2` and `(c - b) / 2` are the old edges rotated by 45 degrees
*and* shrunk by a factor of `1/√2`. Combining the two, the `√2` from the rotation
cancels the `√2` from the shrinking, which leaves the matrix
`½ [[1, -1], [1, 1]]` with rational entries. The shrinking is exactly what the
Square Limit needs, because the rotated fish must fit inside the triangle formed by
half of the square. Every combinator only adds, subtracts and scales vectors by
rational amounts, and the fish's control points and the initial box are rational, so
every coordinate stays rational. Applying `rot45` twice gives a quarter turn at half
the size, shifted into the box above. That too holds exactly, as
`above_blank_rot45_rot45` shows.
