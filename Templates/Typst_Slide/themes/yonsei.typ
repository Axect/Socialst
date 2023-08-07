//==============================================
// University of Bristol theme for Typst slides.
// Based on a previous version of David Barton's 
// UoB LaTeX Beamer template, found at
// https://github.com/dawbarton/UoB-beamer-theme
// =============================================

#import "../slides.typ": *

#let yonsei-theme(
      color: rgb(0, 32, 91), watermark: "yonsei/yonsei_watermark.svg", logo: "yonsei/yonsei_logo.svg", secondlogo: "yonsei/yonsei_horizontal_logo.png", workshop: "Particle Physics and Cosmology 2023"
   ) = data => {

    let title-slide(slide-info, bodies) = {

     	//place(image(watermark, width:100%))
        //set page(background: image(watermark, width:100%))

        align(center + horizon)[
            #block(
                stroke: ( y: 1mm + color ),
                inset: 1em,
                breakable: false,
                [
                    #text(1.3em, color)[*#data.title*] \
                    #{
                        if data.subtitle != none {
                            parbreak()
                            text(.9em, color)[#data.subtitle]
                        }
                    }
                ]
            )
            #set text(size: .8em)
            #grid(
                columns: (1fr,) * calc.min(data.authors.len(), 3),
                column-gutter: 1em,
                row-gutter: 1em,
                ..data.authors
            )
            #align(center + horizon)[
              #image("./yonsei/yonsei_logo.svg", width: 10%)
            ]
            #data.date \
            #text(fill: color)[#workshop]
        ]
    }

    let default(slide-info, bodies) = {
        let body = none
        if bodies.len() == 1 {
	    body = bodies.first()
	}
	else{
	    let colwidths = none
	    let thisgutter = .2em
	    if "colwidths" in slide-info{
	        colwidths = slide-info.colwidths
		if colwidths.len() != bodies.len(){
		    panic("Provided colwidths must be of same length as bodies")
		}
	    }
	    else{
	        colwidths = (1fr,) * bodies.len()
	    }
	    if "gutter" in slide-info{
	        thisgutter = slide-info.gutter
            }
	    body = grid(
	        columns: colwidths,
		gutter: thisgutter,
		 ..bodies
	    )
	}

        let decoration(position, body) = {
            let border = 1mm + color
            let strokes = (
                header: ( bottom: border ),
                footer: ( top: border )
            )
	    grid(columns: (3%, 94%, 3%), [],
		block(
		    stroke: strokes.at(position),
		    width: 100%,
		    inset: (x:.5em, y:.4em),
		    body
		),
	    [])
        }


        // header
        decoration(
          "header", 
          grid(
            columns: (1fr, 1fr),
	    align(left + horizon, image(secondlogo, width:25%)),
	    align(right + horizon, text(color, .7em)[#section.display()])
	  )
	)

        if "title" in slide-info {
            block(
                width: 100%, inset: (x: 4.5%, y: -.5em), breakable: false,
                outset: 0em,
                heading(level: 2, text(color)[#slide-info.title])
            )
	    v(.3em)
        }
        
        //v(1fr)
        block(
            width: 100%, inset: (x: 2em), breakable: false, outset: 0em,
            body
        )
        v(2fr)

        // footer
        decoration("footer")[
            #text(color, .6em)[#data.short-authors] #h(1fr)
            #text(color, .6em)[#logical-slide.display()]
        ]
    }

    let wake-up(slide-info, bodies) = {
        if bodies.len() != 1 {
            panic("wake up variant of bristol theme only supports one body per slide")
        }
        let body = bodies.first()

        block(
            width: 100%, height: 100%, inset: 2em, breakable: false, outset: 0em,
            fill: color,
            text(size: 1.5em, fill: white, {v(1fr); body; v(1fr)})
        )
    }

    (
        "title slide": title-slide, "default": default, "wake up": wake-up,
    )
}
