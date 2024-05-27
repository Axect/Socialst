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
