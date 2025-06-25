#import "@preview/touying:0.6.1": *
#import "simple.typ": *
#import "alias.typ": *
#import "@preview/lovelace:0.3.0": *
#import "@preview/ctheorems:1.1.3": *
#show: thmrules

#set text(font: "IBM Plex Sans")
#show: simple-theme.with(
  aspect-ratio: "16-9",
  header: none,
  footer: [Short Title],
  primary: rgb(0, 32, 91),
)
#show link: underline

#let yonsei = rgb(0, 32, 91);
#let subheader(body) = text(weight: "bold", stretch: 75%)[#body];
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
  #heading[#subheader[Title]]
  #v(1em)

  #text(yonsei)[#subheader[Tae-Geun Kim]]

  #image("./themes/yonsei/yonsei_logo.svg", width: 15%)

  #set text(size: 18pt)

  #subheader[Seminar]

  #subheader[2025.06.26]
]

// ┌─────────────────────────────────────────────────────────┐
//  Slide
// └─────────────────────────────────────────────────────────┘

#focus-slide[
  // #set page(background: image("./figs/background.png", width: 100%))
  *Hi*
]

== Slide Title

#block(width: 100%)[

]
