// see https://github.com/andreasKroepelin/polylux/blob/main/examples/minimal.typ

#import "@typst-forge/polylux:0.3.1": *

#set page(paper: "presentation-16-9")
#set text(size: 25pt)

#polylux-slide[
  #align(horizon + center)[
    = Very minimalist slides

    A lazy author

    July 23, 2023
  ]
]

#polylux-slide[
  == First slide

  Some static text on this slide.
]

#polylux-slide[
  == This slide changes!

  You can always see this.
  #uncover(2)[But this appears later!]
]
