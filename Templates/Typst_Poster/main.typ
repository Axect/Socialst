#import "./poster.typ": *

#show: poster.with(
  size: "841x1189",
  title: "Exploration of Primordial Black Holes and Axion-Like Particles through a novel decay model on cosmological scale",
  authors: [
    #set text(size: 1.2em)
    #text(weight: "bold", fill: rgb("#003876"))[Tae-Geun Kim#super("1")], Yongsoo Jho#super("2"), Jong-Chul Park#super("3"), Seong Chan Park#super("2") and Yeji Park#super("2") \
    #set text(size: 0.8em, style: "italic")
    #text(weight: "bold", fill: rgb("#003876"))[#super("1")Yonsei University, Korea], #super("2")Weizmann Institute, Israel, #super("3")Chungnam National University, Korea
  ],
  univ_logo: "./images/yonsei_logo_transparent_blue.svg",
  footer_text: "SI2023",
  footer_org: "Yonsei HEP-COSMO",
  footer_journal: "arXiv:2212.11977",
  footer_color: "#003876",
  footer_text_color: "#ffffff",
  keywords: ("PBH", "ALP", "Time-varying decay"),
  // Use the following to override the default settings
  // for the poster header.
  num_columns: "2",
  univ_logo_scale: "18",
  title_font_size: "2",
  authors_font_size: "1",
  univ_logo_column_size: "20",
  title_column_size: "80",
  footer_org_font_size: "1",
  footer_text_font_size: "1.5",
)

= Introduction
#lorem(100)

= #lorem(2)
#lorem(30)

+ #lorem(10)
+ #lorem(10)
+ #lorem(10)

#lorem(50)

#set align(center)
#table(
  columns:(auto, auto, auto), 
  inset:(10pt),
 [#lorem(4)], [#lorem(2)], [#lorem(2)],
 [#lorem(3)], [#lorem(2)], [$alpha$],
 [#lorem(2)], [#lorem(1)], [$beta$],
 [#lorem(1)], [#lorem(1)], [$gamma$],
 [#lorem(2)], [#lorem(3)], [$theta$],
)

#set align(left)
#lorem(80)
$ mat(
  1, 2, ..., 8, 9, 10;
  2, 2, ..., 8, 9, 10;
  dots.v, dots.v, dots.down, dots.v, dots.v, dots.v;
  10, 10, ..., 10, 10, 10;
) $
== #lorem(5)

#lorem(50)

== #lorem(5)

#lorem(30)

- #lorem(10)
- #lorem(10)
- #lorem(10)

#lorem(20)

= #lorem(3)

#block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt,
  [
    #lorem(80),
    - #lorem(10),
    - #lorem(10),
    - #lorem(10),
  ]
)
#lorem(30)
