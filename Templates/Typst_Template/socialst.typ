#import "@preview/ctheorems:1.1.3": *

// Typography follows two reference templates:
//   @preview/arkheion  arXiv preprint look: New Computer Modern, no hyphenation,
//                      padded headings, 25 mm margins.
//   @preview/ilm       notes look: looser leading and paragraph spacing, roomier
//                      tables, smaller bibliography.
// Typst's own defaults (leading 0.65em, par spacing 1.2em, table inset 5pt) are
// too tight for a heading-dense technical document.
//
// `font` deliberately pairs with `math-font`. New Computer Modern is the text
// companion of New Computer Modern Math, which is Typst's default math font, so
// prose and equations match. For a Times-like journal look pass
//   font: ("STIX Two Text", "Noto Serif CJK KR"), math-font: "STIX Two Math"
#let project(
  title: "",
  authors: (),
  affiliations: (),
  date: none,
  font: ("New Computer Modern", "Noto Serif CJK KR"),
  math-font: "New Computer Modern Math",
  size: 11pt,
  paper: "a4",
  margin: (left: 25mm, right: 25mm, top: 25mm, bottom: 28mm),
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(author => author.name), title: title)
  set page(paper: paper, margin: margin, numbering: "1", number-align: center)
  set text(font: font, size: size, lang: "en", hyphenate: false)

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
  set par(leading: 0.72em, spacing: 1.35em, justify: true, linebreaks: "optimized")
  set heading(numbering: "1.1")
  set math.equation(numbering: "(1)")

  // Breathing room around headings. arkheion pads H1 by 10pt and H2 by 8pt;
  // Typst's default `below` is far too small next to an 11pt body.
  show heading: set text(hyphenate: false)
  show heading.where(level: 1): set block(above: 2.0em, below: 1.0em)
  show heading.where(level: 2): set block(above: 1.7em, below: 0.85em)
  show heading.where(level: 3): set block(above: 1.4em, below: 0.7em)

  // Match equations to the text font and keep them off the neighbouring lines.
  show math.equation: set text(font: math-font, weight: 400)
  show math.equation.where(block: true): set block(spacing: 1.25em)

  // Roomier tables (ilm uses inset 7pt against Typst's 5pt), kept whole so a
  // page break never orphans the header row.
  set table(inset: 7pt)
  show table: set block(breakable: false)

  // Float figures get air; ctheorems boxes are figures of kind "thmenv" and must
  // stay close to the prose that introduces them.
  show figure.where(kind: image): set block(above: 1.9em, below: 1.9em)
  show figure.where(kind: table): set block(above: 1.9em, below: 1.9em)
  show figure.where(kind: "thmenv"): set block(above: 1.25em, below: 1.25em)
  show figure.caption: set text(size: 0.92em)
  show figure.caption: pad.with(x: 1.5em, top: 0.35em)

  set enum(indent: 0.6em)
  set list(indent: 0.6em)
  show bibliography: set text(size: 0.92em)

  // ctheorems needs this once per document; doing it here keeps notes free of
  // boilerplate.
  show: thmrules

  body
}


#let fudan = rgb(0, 47, 108);

// ┌─────────────────────────────────────────────────────────┐
//  Theorem Box
//  amsthm-like. The head is bold and runs into the body; the body inherits the
//  document font and size instead of forcing its own. "plain" style
//  (theorem / lemma / proposition / corollary) italicises the body; "definition"
//  style (definition / example / remark) leaves it upright.
// └─────────────────────────────────────────────────────────┘
#let thm = thmbox.with(
  inset: (x: 0.85em, y: 0.7em),
  radius: 3pt,
  stroke: luma(192) + 0.6pt,
  base_level: 1,
  namefmt: name => text(weight: "semibold")[(#name)],
  titlefmt: title => text(weight: "semibold", title),
  separator: [#text(weight: "semibold")[.]#h(0.4em)],
)

#let definition  = thm("definition", "Definition")
#let example     = thm("example", "Example")
#let remark      = thm("remark", "Remark")
#let theorem     = thm("theorem", "Theorem", bodyfmt: body => emph(body))
#let lemma       = thm("lemma", "Lemma", bodyfmt: body => emph(body))
#let proposition = thm("proposition", "Proposition", bodyfmt: body => emph(body))
#let corollary   = thm("corollary", "Corollary", bodyfmt: body => emph(body))
