#import "@preview/touying:0.6.1": *
#import "simple.typ": *
#import "alias.typ": *
#import "@preview/lovelace:0.3.0": *

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

#title-slide[
  #heading[#subheader[Title]]
  #v(1em)

  #text(yonsei)[#subheader[Tae-Geun Kim]]

  #image("./themes/yonsei/yonsei_logo.svg", width: 15%)

  #set text(size: 18pt)

  #subheader[Seminar]

  #subheader[2025.03.10]
]
