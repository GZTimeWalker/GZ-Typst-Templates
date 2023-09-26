#let line_height = 1em

#let fonts = (
  text: ("CMU Serif", "Source Han Serif SC", "Source Han Serif"),
  sans: ("Source Han Sans SC", "Source Han Sans"),
  code: ("JetBrains Mono", "Consolas"),
)

#let textbf(it) = block(text(font: fonts.sans, weight: "semibold", it))

#let textit(it) = block(text(style: "italic", it))
