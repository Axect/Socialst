// First order derivative
#let dx(f, x, ..n) = {
  if f == [] { f = none }
  let n = n.pos()
  let d = $upright(d)$
  if n == () {
    $(#d#f)/(#d#x)$
  } else {
    $(#d^(#n.at(0))#f)/(#d#x^(#n.at(0)))$
  }
}

#let px(f, x, ..n) = {
  if f == [] { f = none }
  let n = n.pos()
  let d = $diff$
  if n == () {
    $(#d#f)/(#d#x)$
  } else {
    $(#d^(#n.at(0))#f)/(#d#x^(#n.at(0)))$
  }
}

// Second order derivative with two variables
#let dxdy(f, x, y) = {
  if f == [] { f = none }
  let d = $upright(d)$
  $(#d^(2)#f)/(#d#x#h(0.01cm)#d#y)$
}

#let pxpy(f, x, y) = {
  if f == [] { f = none }
  let d = $diff$
  $(#d^(2)#f)/(#d#x#h(0.01cm)#d#y)$
}

// Measure
#let meas(x, ..n) = {
  let d = $upright(d)$
  let n = n.pos()
  if n == () {
    $#d#x$
  } else {
    $#d^(#n.at(0))#x$
  }
}

#let upbold(x) = {
  $upright(bold(#x))$
}

// ┌─────────────────────────────────────────────────────────┐
//  Graph products
// └─────────────────────────────────────────────────────────┘
// The four standard products of graphs, with the symbols fixed by the reference
// monograph (Hammack, Imrich & Klavzar, Handbook of Product Graphs, 2nd ed.,
// CRC Press). Each product gets its own symbol precisely so that they cannot be
// confused, which is why the names below say which one is meant:
//
//   cprod  Cartesian    G □ H   edge = change one coordinate by one step
//   dprod  direct       G × H   also called the tensor or categorical product
//   sprod  strong       G ⊠ H   the union of the Cartesian and direct products
//   lprod  lexicographic G ∘ H  also written G[H]
//
// Older papers write × for the Cartesian product; since × now standardly means
// the direct product, such titles have to be reread.
//
// math.class("binary", ...) is what supplies the operator spacing. Without it
// Typst sets "P_L square P_L" as "P_L□P_L", which reads as a missing glyph.
#let cprod = math.class("binary", sym.square)
#let dprod = math.class("binary", sym.times)
#let sprod = math.class("binary", "⊠")
#let lprod = math.class("binary", sym.circle.small)
