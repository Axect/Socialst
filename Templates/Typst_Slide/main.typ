#import "slides.typ": *
#import "themes/yonsei.typ": *

#show: slides.with(
    authors: ("Alice", text(fill: rgb(0, 32, 91), weight: "bold")[Tae-Geun Kim], "Bob"),
    short-authors: "Alice et al.",
    title: "Title (Long to be expanded)",
    subtitle: "Subtitle (Long to be expanded)",
    short-title: "Shorter title for slide footer",
    date: "February 7, 2024",
    theme: yonsei-theme(),
)

#set text(font: "IBM Plex Sans", size: 18pt)

#slide(theme-variant: "title slide")

#new-section("Primordial Black Hole")

#slide(title: "Primordial Black Hole")[

]

#slide(theme-variant: "wake up")[
  Focus!
]

#new-section("References")

#slide()[
  #set text(size: 16pt)
  #bibliography("ref.bib", title: [
    #set text(size: 24pt, fill: rgb(0, 32, 91))
    === Bibliography
  ])
]
