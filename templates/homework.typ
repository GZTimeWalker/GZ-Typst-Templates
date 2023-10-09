#import "../functions/style.typ": *
#import "../functions/booktab.typ": *
#import "@preview/physica:0.8.0": *

#let report(subject: "课程", title: "作业一", name: "张三", stdid: "11223344", body) = {
  set document(title: title)
  set page(paper: "a4", numbering: "1", number-align: center)
  set text(font: fonts.text, lang: "zh", size: 11pt)
  set heading(numbering: "1.1.")

  show raw.where(block: true): block.with(
    fill: rgb(248, 248, 248),
    inset: (x: 1.25em, y: 1em),
    width: 100%,
    radius: 4pt,
  )

  show raw.where(block: true): par.with(first-line-indent: 0em, justify: true, leading: 8pt)

  show raw.where(block: false): box.with(
    fill: rgb(248, 248, 248),
    inset: (x: 5pt, y: 0pt),
    outset: (y: 4pt),
    radius: 3pt,
  )

  show raw: text.with(font: fonts.code, size: 1em)

  show heading: it => [
    // Cancel indentation for headings of level 2 or above
    #set par(first-line-indent: 0em, hanging-indent: 2em)

    #let sized_heading(it, size, weight, mt, mb) = [
      #set text(size, weight: weight)
      #v(mt)
      #text(size, weight: weight, it.body)
      #v(mb)
    ]

    #if it.level == 1 {
      sized_heading(it, 20pt, "semibold", 1em, 0.6em)
    } else if it.level == 2 {
      sized_heading(it, 16pt, "semibold", 0.7em, 0.7em)
    } else if it.level == 3 {
      sized_heading(it, 14pt, "medium", 0.5em, 0.5em)
    } else {
      sized_heading(it, 12pt, "medium", 0.3em, 0.3em)
    }
  ]

  show link: underline

  let fieldname(name) = [
    #set align(right + horizon)
    #set text(font: fonts.text)
    #name
  ]

  let cell = rect.with(width: 100%, radius: 6pt, stroke: none)

  let fieldvalue(value) = [
    #set align(left + horizon)
    #set text(font: fonts.text, weight: "medium", size: 13pt)
    #cell(value)
  ]

  set page(header: align(center)[
    #grid(
      columns: (auto, auto, auto, auto),
      gutter: 1em,
      fieldvalue(subject),
      fieldvalue(title),
      fieldvalue(name),
      fieldvalue(stdid),
    )
  ])

  set align(left + top)
  set par(justify: true, first-line-indent: 0pt, leading: line_height)
  set math.vec(delim: "[")
  set math.mat(delim: "[")

  show par: set block(spacing: line_height)

  body
}
