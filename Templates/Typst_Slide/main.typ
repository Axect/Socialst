#import "slides.typ": *
#import "themes/yonsei.typ": *

#show: slides.with(
    authors: ("Alice", text(fill: rgb(0, 32, 91), weight: "bold")[Tae-Geun Kim], "Bob"),
    short-authors: "Alice et al.",
    title: "Title (Long to be expanded)",
    subtitle: "Subtitle (Long to be expanded)",
    short-title: "Shorter title for slide footer",
    date: "August 2023",
    theme: yonsei-theme(),
)

#set text(font: "IBM Plex Sans", size: 18pt)

#slide(theme-variant: "title slide")

#new-section("Primordial Black Hole")

#slide(title: "Primordial Black Hole")[
  - Cosmologically produced (e.g., during the inflationary epoch)

  - Considered as one of the viable candidates for dark matter

  - Possess the ability to evaporate through a process known as _Hawking radiation_

  - *Hawking temperature of PBH*:
  $
  k_B T_"PBH" = (planck.reduce c^3) / (8 pi G M_("PBH")) tilde.op 10.6 ((10^(15)"g ") / (M_"PBH")) "MeV" tilde.op 10^(11) "K "
  $

  #grid(
    columns: (55%, 45%),
    [
      - *Emission rates of particle $i$* #sub[[D. N. Page, Phys. Rev. D (1976)]]
        $
        (d^2 N_i) / (d E d t) = (g_i) / (2 pi) (Gamma(E, M_("PBH"))) / (e^(E\/k_B T_"PBH") - (-1)^(2s_i))
        $
        #sub[$g_i$: degree of freedom of particle $i$, #h(0.2cm) $s_i$: spin of particle $i$ \
        $Gamma(E, M_("PBH"))$: graybody factor]
    ],
    [
      - *The lifetime of PBH*
      $
      tau_"PBH" tilde.op 13.8 times 10^9 "yr" ((M_"PBH") / (5 times 10^(14) "g "))^3
      $
    ]
  )
]

#slide(title: "Photons from PBH")[
  
]

#slide(theme-variant: "wake up")[
  Focus!
]

#new-section("Conclusion")

#slide(title: "Take home message")[
  Read the book!

  Try it out!

  Create themes!
]
