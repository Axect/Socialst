#import "@preview/ctheorems:1.1.3": *

#let project(title: "", authors: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(author => author.name), title: title)
  set page(numbering: "1", number-align: center)
  set text(font: "Hahmlet")
  
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
        #if author.keys().contains("orcid") {
          grid(
            columns: (8pt, auto, 8pt),
            [],
            [*#author.name*],
            link("https://orcid.org/" + author.orcid)[#pad(left:2pt, top:-4pt, image("./ORCID_iD.svg", width:8pt))]
          )
        } else {
          [*#author.name* \ ]
        }
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

  //set text(font: "IBM Plex Sans KR")

  body
}


#let yonsei = rgb(0, 32, 91);

// ┌─────────────────────────────────────────────────────────┐
//  Theorem Box
// └─────────────────────────────────────────────────────────┘
#let thm = thmbox.with(
  inset: 0.65em,
  stroke: luma(200) + 1pt,
  namefmt: name => [
    #set text(font: "Times New Roman", size: 16pt, weight: "bold", style: "italic")
    (#name)
  ],
  titlefmt: title => [
    #set text(font: "Times New Roman", size: 16pt, weight: "bold", style: "italic")
    #title
  ],
  separator: [
    #set text(size: 16pt)
    #h(1fr) \
  ],
  bodyfmt: body => [
    #set text(font: "Times New Roman", size: 16pt, style: "italic")
    #block(
      inset: (left: 0.5em, right: 0.5em, top: -0.5em),
      width: 100%,
    )[
      #body
    ]
  ]
)

#let definition = thm(
  "definition",
  "Definition",
)
#let theorem = thm(
  "theorem",
  "Theorem",
)
#let example = thm(
  "example",
  "Example",
)
