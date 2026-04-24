#import "@preview/touying:0.6.1": *
#import themes.stargazer: *
#import "alias.typ": *
#import "@preview/ctheorems:1.1.3": *
#show: thmrules

#set text(font: "Pretendard")
#show: stargazer-theme.with(
  aspect-ratio: "16-9",
  config-info(
    title: text(size: 1.4em)[Title],
    short-title: text(fill: white, weight: "bold")[Title],
    subtitle: [],
    author: text(weight: "bold")[Tae-Geun Kim (金泰瑾)],
    date: text(size: 16pt, weight: "bold", number-type: "lining", number-width: "tabular")[2026.04.17],
    institution: [
      #grid(
        columns: 2,
        column-gutter: 1.5em,
        align(center + horizon, image("./logos/Fudan_University_Logo.svg", height: 5em)),
        align(center + horizon, image("./logos/RIKEN_logo.png", height: 5em)),
      )
      #v(0.6em)
      #text(size: 16pt, weight: "bold")[Conference / Workshop Name]
    ],
    logo: grid(
      columns: 2,
      column-gutter: 0.5em,
      align(center + horizon, image("./logos/Fudan_University_Logo.svg", height: 1.3em)),
      align(center + horizon, image("./logos/RIKEN_logo.png", height: 1.3em)),
    ),
  ),
  config-colors(
    primary: rgb(0, 32, 91),
    secondary: rgb(100, 140, 200),
  ),
  config-page(
    margin: (top: 3em, bottom: 1.5em, x: 2em),
  ),
  config-store(
    footer-a: self => text(fill: white, weight: "bold")[Tae-Geun Kim (金泰瑾)],
    footer-b: self => text(fill: white, weight: "bold")[Conference / Workshop Name],
    footer-d: context text(number-type: "lining", number-width: "tabular", fill: white, weight: "bold")[#utils.slide-counter.display() / #utils.last-slide-number],
    navigation: self => none,
    header: self => if self.store.title != none {
      block(
        width: 100%,
        height: 1.8em,
        fill: gradient.linear(self.colors.primary, self.colors.neutral-darkest),
        grid(
          columns: (60%, 1fr, auto),
          align: horizon,
          rows: 1.8em,
          box(inset: (left: 1.5em), text(
            fill: self.colors.neutral-lightest,
            weight: "bold",
            size: 1.3em,
            utils.call-or-display(self, self.store.title),
          )),
          context {
            let sections = query(heading.where(level: 1))
            let current-page = here().page()
            let bars = ()
            for (i, section) in sections.enumerate() {
              let next = if i + 1 < sections.len() { sections.at(i + 1) } else { none }
              let active = section.location().page() <= current-page and (
                next == none or current-page < next.location().page()
              )
              bars.push(link(
                section.location(),
                box(
                  width: 24pt,
                  height: 3pt,
                  radius: 1.5pt,
                  fill: if active { self.colors.neutral-lightest } else { rgb("#555") },
                ),
              ))
            }
            align(center + horizon, bars.join(h(0.5em)))
          },
          box(inset: (right: 0.5em), align(right + horizon, utils.call-or-display(self, self.store.header-right))),
        ),
      )
    },
  ),
)
#show link: underline

// ┌─────────────────────────────────────────────────────────┐
//  Helpers
// └─────────────────────────────────────────────────────────┘
#let primary = rgb(0, 32, 91);
#let subheader(body) = text(weight: "bold", stretch: 75%)[#body];
#let citep(body) = text(fill: luma(100), size: 10pt)[[#body]];

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
  separator: [#set text(size: 16pt)
    #h(1fr) \
  ],
  bodyfmt: body => [
    #set text(font: "Times New Roman", size: 16pt, style: "italic")
    #block(inset: (left: 0.5em, right: 0.5em, top: -0.5em), width: 100%)[#body]
  ],
)
#let definition = thm("definition", "Definition")
#let theorem = thm("theorem", "Theorem")
#let example = thm("example", "Example")

// ┌─────────────────────────────────────────────────────────┐
//  Title Slide
// └─────────────────────────────────────────────────────────┘
#title-slide()

// ┌─────────────────────────────────────────────────────────┐
//  Slides
// └─────────────────────────────────────────────────────────┘

= Introduction

== Motivation

#block(width: 100%)[
  #set text(size: 18pt)

  - #subheader[Background]: Brief context of the research problem

  #v(0.8em)

  - #subheader[Challenge]: What makes this problem difficult or interesting?

  #v(0.8em)

  - #subheader[Goal]: What this work aims to achieve
]

== Figure + Text Layout

#block(width: 100%)[
  #grid(
    columns: (55%, 45%),
    column-gutter: 2em,
    [
      #set text(size: 14pt)
      #figure(
        rect(width: 100%, height: 60%, fill: luma(230), stroke: 1pt + luma(180))[
          #align(center + horizon)[_Figure placeholder_]
        ],
        caption: [Description of the figure #citep[Author et al. (2024)]],
      )
    ],
    [
      #v(3em)
      #set text(size: 18pt)
      #pad(left: 0.5em)[
        - #subheader[Key point 1]: Explanation of the first observation

          #v(1em)

        - #subheader[Key point 2]: Explanation of the second observation
      ]
    ],
  )
]

== Equation Slide

#block(width: 100%)[
  #set text(size: 18pt)

  - #subheader[Main equation] #h(1fr) #citep[Author, Journal (2024)] \
    #h(1fr)
    $
    cal(L) = sum_(i=1)^(N) (y_i - f(x_i))^2 + lambda norm(theta)^2
    $

  #v(1em)

  - #subheader[Variables]:
    - $y_i$: Target values
    - $f(x_i)$: Model predictions
    - $lambda$: Regularization strength
]

= Methods

== Two-Column Layout

#block(width: 100%)[
  #grid(
    columns: (1fr, 1fr),
    [
      #set text(size: 14pt)
      #figure(
        rect(width: 95%, height: 70%, fill: luma(230), stroke: 1pt + luma(180))[
          #align(center + horizon)[_Left figure_]
        ],
        caption: [Comparison of method A and B],
      )
    ],
    [
      #set text(size: 14pt)
      #v(1.4em)
      #figure(
        rect(width: 95%, height: 70%, fill: luma(230), stroke: 1pt + luma(180))[
          #align(center + horizon)[_Right figure_]
        ],
        caption: [Detailed analysis of the results],
      )
    ],
  )
]

== Architecture Diagram

#block(width: 100%)[
  #set text(size: 18pt)

  - Overview of the proposed method:

    #v(1em)

    #align(center)[
      #rect(width: 80%, height: 60%, fill: luma(230), stroke: 1pt + luma(180))[
        #align(center + horizon)[_Architecture diagram placeholder_]
      ]
    ]
]

= Results

== Full-Width Result

#block(width: 100%)[
  #align(center)[
    #rect(width: 85%, height: 80%, fill: luma(230), stroke: 1pt + luma(180))[
      #align(center + horizon)[_Result figure placeholder_]
    ]
  ]
]

== Summary

#block(width: 100%)[
  #set text(size: 18pt)
  #v(0.5em)

  - #subheader[Contribution 1] \
    Description of the first contribution.

  #v(0.8em)

  - #subheader[Contribution 2] \
    Description of the second contribution.

  #v(0.8em)

  - #subheader[Contribution 3] \
    Description of the third contribution.

  #v(0.8em)

  - #subheader[Future Work] \
    What comes next.
]

#focus-slide[
  #text(fill: white, weight: "bold", size: 48pt)[Supplements]
]

#show: appendix

== Supplementary Material

#block(width: 100%)[
  #set text(size: 16pt)

  Additional details, proofs, or extended results go here.

  #v(1em)

  #theorem("example-thm")[
    An example theorem in the supplement.

    $ integral_0^infinity e^(-x^2) dif x = sqrt(pi) / 2 $
  ]
]
