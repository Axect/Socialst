#import "@preview/ctheorems:1.1.3": *

#let project(title: "", authors: (), affiliations: (), date: none, body) = {
  // Set the document's basic properties.
  set document(author: authors.map(author => author.name), title: title)
  set page(numbering: "1", number-align: center)
  set text(font: ("IBM Plex Serif", "Noto Serif CJK KR"))

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
    bottom: 0.3em,
    x: 2em,
    align(center)[
      #for (i, author) in authors.enumerate() {
        if i > 0 [, #h(0.3em)]
        [*#author.name*]
        if author.keys().contains("orcid") {
          link("https://orcid.org/" + author.orcid)[#box(baseline: -1pt, image("./ORCID_iD.svg", width: 9pt))]
        }
        [#super(author.marks)]
      }
    ],
  )

  // Affiliation list
  pad(
    top: 0.2em,
    bottom: 0.5em,
    x: 2em,
    align(center)[
      #set text(size: 9pt, style: "italic")
      #for (i, aff) in affiliations.enumerate() {
        [#super(aff.mark) #aff.name]
        if i < affiliations.len() - 1 {
          v(0.2em)
        }
      }
    ],
  )

  // Email
  pad(
    bottom: 1em,
    align(center)[
      #set text(size: 9pt)
      #for (i, author) in authors.enumerate() {
        if author.keys().contains("email") {
          if i > 0 [, #h(0.5em)]
          link("mailto:" + author.email)
        }
      }
    ],
  )

  // Main body.
  set par(justify: true)
  set heading(numbering: "1.")
  set math.equation(numbering: "(1)")

  body
}


#let fudan = rgb(0, 47, 108);

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
