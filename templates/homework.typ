#import "shared.typ": *

#let report(subject: "课程", title: "作业一", name: "张三", stdid: "11223344", body) = {
  set document(title: title)
  show: shared

  let fieldname(name) = [
    #set align(right + horizon)
    #set text(font: fonts.serif)
    #name
  ]

  let cell = rect.with(width: 100%, radius: 6pt, stroke: none)

  let fieldvalue(value) = [
    #set align(left + horizon)
    #set text(font: fonts.serif, weight: "medium", size: 13pt)
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

  show par: set block(spacing: line_height)
  set align(left + top)
  set par(justify: true, first-line-indent: 0pt, leading: line_height)

  body
}
