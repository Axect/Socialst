// This function gets your whole document as its `body` and formats
// it as an article in the style of a Poster.
#let poster(
  // The poster's size.
  size: "'36x24' or '48x36''",

  // The poster's title.
  title: "Paper Title",

  // A string of author names.
  authors: "Author Names (separated by commas)",

  // University logo.
  univ_logo: "Logo Path",

  // Footer text.
  // For instance, Name of Conference, Date, Location.
  // or Course Name, Date, Instructor.
  footer_text: "Footer Text",

  // Any URL, like a link to the conference website.
  footer_org: "Footer Organization",

  // Email IDs of the authors.
  footer_journal: "Journal Name",

  // Color of the footer.
  footer_color: "Hex Color Code",

  // Color of the footer text.
  footer_text_color: "Hex Color Code",

  // DEFAULTS
  // ========
  // For 3-column posters, these are generally good defaults.
  // Tested on 36in x 24in, 48in x 36in, and 36in x 48in posters.
  // For 2-column posters, you may need to tweak these values.
  // See ./examples/example_2_column_18_24.typ for an example.

  // Any keywords or index terms that you want to highlight at the beginning.
  keywords: (),

  // Number of columns in the poster.
  num_columns: "3",

  // University logo's scale (in %).
  univ_logo_scale: "100",

  // University logo's column size (in mm).
  univ_logo_column_size: "50",

  // Title and authors' column size (in mm).
  title_column_size: "200",

  // Poster title's font size (in em).
  title_font_size: "4",

  // Authors' font size (in em).
  authors_font_size: "2",

  // Footer's URL and email font size (in em).
  footer_org_font_size: "1.5",

  // Footer's text font size (in em).
  footer_text_font_size: "2",

  // The poster's content.
  body
) = {
  // Set the body font.
  set text(font: "STIX Two Text", size: 36pt)
  //set text(font: "IBM Plex Serif", size: 16pt)
  let sizes = size.split("x")
  let width = int(sizes.at(0)) * 1mm
  let height = int(sizes.at(1)) * 1mm
  univ_logo_scale = int(univ_logo_scale) * 1%
  title_font_size = float(title_font_size) * 1em
  authors_font_size = float(authors_font_size) * 1em
  num_columns = int(num_columns)
  univ_logo_column_size = int(univ_logo_column_size) * 1%
  title_column_size = int(title_column_size) * 1%
  footer_org_font_size = float(footer_org_font_size) * 1em
  footer_text_font_size = float(footer_text_font_size) * 1em

  // Configure the page.
  // This poster defaults to 36in x 24in.
  set page(
    width: width,
    height: height,
    margin: 
      (top: 3.5%, left: 5%, right: 5%, bottom: 6.5%),
    footer: [
      #set align(center)
      //#set text(186pt)
      #block(
        fill: rgb(footer_color),
        width: 100%,
        inset: 1em,
        radius: 0.5em,
        [
          #text(size: footer_org_font_size, weight: "bold", fill: rgb(footer_text_color), footer_org) 
          #h(1fr) 
          #text(size: footer_text_font_size, weight: "bold", fill: rgb(footer_text_color), smallcaps(footer_text)) 
          #h(1fr) 
          #text(size: footer_org_font_size, weight: "bold", fill: rgb(footer_text_color), footer_journal)
        ]
      )
    ],
    background: align(top + right, 
      [
        #v(3.5em)
        #pad(right: 1em, image(univ_logo, width: univ_logo_scale))
      ]
    )
  )

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")
  show math.equation: set block(spacing: 0.65em)

  // Configure lists.
  set enum(indent: 1em, body-indent: 0.9em)
  set list(indent: 1em, body-indent: 0.9em)

  // Configure headings.
  set heading(numbering: "I.A.1.")
  show heading: it => locate(loc => {
    // Find out the final number of the heading counter.
    let levels = counter(heading).at(loc)
    let deepest = if levels != () {
      levels.last()
    } else {
      1
    }

    set text(weight: 400)
    if it.level == 1 [
      // First-level headings are centered smallcaps.
      #set align(center)
      //#set text({ 18pt })
      #show: smallcaps
      #v(1.5em, weak: true)
      #if it.numbering != none {
        numbering("I.", deepest)
        h(0.5em, weak: true)
      }
      #it.body
      #v(0.75em, weak: true)
      #line(length: 100%)
    ] else if it.level == 2 [
      // Second-level headings are run-ins.
      //#set text(style: "italic")
      #v(1.5em, weak: true)
      #if it.numbering != none {
        numbering("i.", deepest)
        h(0.3em, weak: true)
      }
      #it.body
      #v(0.75em, weak: true)
    ] else [
      // Third level headings are run-ins too, but different.
      #if it.level == 3 {
        numbering("1)", deepest)
        [ ]
      }
      _#(it.body):_
    ]
  })

  align(center,
    grid(
      rows: 2,
      row-gutter: 2em,
      text(title_font_size, title),
      [
        #authors
      ]
    )
  )

  // Display the keywords.
  if keywords != () [
      #set text(1.25em, weight: 400)
      #show "Keywords": smallcaps
      #align(left,
        [
          *Keywords* --- #keywords.join(", ")
        ]
      )
  ]

  v(1em)

  // Start three column mode and configure paragraph properties.
  show: columns.with(num_columns, gutter: 2.5em)
  set par(justify: true, first-line-indent: 0em)
  show par: set block(spacing: 0.65em)


  // Display the poster's contents.
  body
}
