#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(author => author.name), title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Linux Libertine", lang: "en")
  
  // Link
  show link: underline

  // Title row.
  align(center)[
    #block(text(weight: 700, 1.75em, title))
    #v(1em, weak: true)
    #date
  ]

  // Author information.
  pad(
    top: 0.5em,
    bottom: 0.5em,
    x: 2em,
    grid(
      columns: (1fr,) * calc.min(3, authors.len()),
      gutter: 1em,
      ..authors.map(author => align(center)[
        *#author.name* \
        _#author.major _ \
        _#author.affiliation _ \
        #link(
          "mailto:" + author.email,
        )
      ]),
    ),
  )

  // Main body.
  set par(justify: true)
  //show: columns.with(2, gutter: 1.3em)
  set heading(numbering: "1.")
  set math.equation(numbering: "(1)")

  body
}

// Counter for theorems
#let thmnum = state("num", 0)

// Theorem environments
#let thmenv(env, header, body, number: none) = {
    if number == none {
      thmnum.update(num => num + 1)
    } else {
      thmnum.update(num => number)
    }
    let number = thmnum.display(int)
    block(
      stroke: luma(200),
      inset: 8pt,
      radius: 4pt,
      width: 100%,
      align(left)[
        #block(
          inset: 0pt,
          outset: 7pt,
          radius: 3pt,
          width: 100%,
          align(left)[
            *#env #counter(heading).display("1.1").#number #header*
          ]
        )
        #v(7pt)
        #body
      ]
    )
}

#let def(header, body, number: none) = {
    thmenv("Def", header, body, number: number)
}

#let thm(header, body, number: none) = {
    thmenv("Thm", header, body, number: number)
}

#let lem(header, body, number: none) = {
    thmenv("Lem", header, body, number: number)
}

#let cor(header, body, number: none) = {
    thmenv("Cor", header, body, number: number)
}

#let prop(header, body, number: none) = {
    thmenv("Prop", header, body, number: number)
}

#let note(header, body, number: none) = {
    thmenv("Note", header, body, number: number)
}

#let exercise(header, body, number: none) = {
    thmenv("Exercise", header, body, number: number)
}
