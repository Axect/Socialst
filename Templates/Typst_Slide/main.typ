#import "@preview/touying:0.6.1": *
#import "simple.typ": *
#import "alias.typ": *
#import "@preview/lovelace:0.3.0": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/pinit:0.2.2": *
#show: thmrules

#set text(font: "Pretendard")
#show: simple-theme.with(
  aspect-ratio: "16-9",
  header: none,
  footer-left: [Tae-Geun Kim],
  footer-center: [Short Title],
  primary: rgb(0, 32, 91),
)
#show link: underline

#let yonsei = rgb(0, 32, 91);
#let blackheader(body) = text(weight: "black")[#body];
#let ebheader(body) = text(weight: "extrabold")[#body];
#let bheader(body) = text(weight: "bold")[#body];
#let citep(body) = text(fill:luma(100), size:10pt)[[#body]];

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

// ┌─────────────────────────────────────────────────────────┐
//  Title Slide
// └─────────────────────────────────────────────────────────┘
#title-slide[
  #heading[#ebheader[Presentation Title]]
  #v(1em)

  #text(yonsei)[#bheader[Tae-Geun Kim]]

  //#image("./themes/yonsei/yonsei_logo.svg", width: 15%)
  #grid(
    columns: (51%, 49%),
    column-gutter: 0.5em,
    align(right)[
      #image("./themes/Fudan_University_Logo.svg", height: 25%)
    ],
    align(left)[
      #image("./themes/RIKEN_logo.png", height: 25%)
    ]
  )

  #set text(size: 18pt)

  #bheader[Seminar]

  #bheader[2026.02.05]
]

// ┌─────────────────────────────────────────────────────────┐
//  Slide
// └─────────────────────────────────────────────────────────┘

#focus-slide[
  // #set page(background: image("./figs/background.png", width: 100%))
  #ebheader[Hello]
]

== Slide Title

#block(width: 100%)[
  #set text(size: 18pt)

  A simple #pin(1)highlighted text#pin(2).

  #pinit-highlight(1,2)

  #pinit-point-from(2)[It is simple.]
]

== Slide Title 2

#block(width: 100%)[
  #set text(size: 18pt)

  $
  E = m c^2
  $
]

#focus-slide[
  // #set page(background: image("./figs/background.png", width: 100%))
  *Supplements*
]

#supplement-slide[
  == Section Title <section-id>
  #v(1em)

  Hi
]
