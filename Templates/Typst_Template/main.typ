#import "socialst.typ": *

#show: project.with(
  title: "Title",
  authors: (
    (name: "Tae-Geun Kim", email: "tg.kim@yonsei.ac.kr", affiliation: "Yonsei University", major: "Department of Physics"),
  ),
  date: "May 11, 2023",
)

#outline(indent: true)

= Test1
== Test1.1

#def[Ordered Pair [Wolf 6.1]][
    - (Intuitive) : For any two objects $a$ and $b$, the _ordered pair_ $(a,b)$ is a notation specifying the two objects $a$ and $b$, in that order.
    - (Set-theoretic) : For any two objects $a$ and $b$, the _ordered pair_ $(a,b)$ is defined to be the set ${{a}, {a,b}}$.
]

#pagebreak()

#bibliography("ref.bib")