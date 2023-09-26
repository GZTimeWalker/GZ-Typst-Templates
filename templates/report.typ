#import "../functions/style.typ": *
#import "../functions/booktab.typ": *
#import "../functions/dirac.typ": *

#let report(
  title: "实验报告",
  subtitle: "Lab 0: 环境准备",
  name: "张三",
  stdid: "11223344",
  classid: "计科一班",
  major: "计算机科学与技术",
  school: "计算机学院",
  time: "2022~2023 学年第二学期",
  banner: none + "",
  body,
) = {
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
    #set par(first-line-indent: 0em)

    #let sized_heading(it, size, weight, mt, mb) = [
      #set text(size, weight: weight)
      #v(mt)
      #if it.numbering != none {
        counter(heading).display()
        h(0.1em)
      }
      #text(size, weight: weight, it.body)
      #v(mb)
    ]

    #if it.level == 1 {
      sized_heading(it, 20pt, "semibold", 1em, 0.3em)
    } else if it.level == 2 {
      sized_heading(it, 16pt, "semibold", 0.7em, 0.2em)
    } else if it.level == 3 {
      sized_heading(it, 14pt, "medium", 0.5em, 0.2em)
    } else {
      sized_heading(it, 12pt, "medium", 0.3em, 0.1em)
    }
  ]

  show link: underline

  let fieldname(name) = [
    #set align(right + horizon)
    #set text(font: fonts.text)
    #name
  ]

  let fieldvalue(value) = [
    #set align(left + horizon)
    #set text(font: fonts.text)
    #value
  ]

  align(center)[
    #if (banner == none) {
      v(200pt)
    } else {
      image(banner, height: 200pt, width: 95%, fit: "contain")
    }
    #linebreak()
    #v(50pt, weak: true)
    #block(text(weight: "semibold", 30pt, title))
    #v(50pt, weak: true)
    #block(text(weight: "medium", 24pt, subtitle))

    #v(140pt, weak: true)
    #set text(14.5pt)

    #grid(
      columns: (200pt, 240pt),
      row-gutter: 1em,
      fieldname(text("姓") + h(2em) + text("名：") + h(1em)),
      fieldvalue(name),
      fieldname(text("学") + h(2em) + text("号：") + h(1em)),
      fieldvalue(stdid),
      fieldname(text("教学班号：") + h(1em)),
      fieldvalue(classid),
      fieldname(text("专") + h(2em) + text("业：") + h(1em)),
      fieldvalue(major),
      fieldname(text("院") + h(2em) + text("系：") + h(1em)),
      fieldvalue(school),
    )

    #v(40pt)
    #set text(13pt)
    #text(time)
    #pagebreak()
  ]

  set align(left + top)
  set par(justify: true, first-line-indent: 2em, leading: line_height)
  set math.vec(delim: "[")
  set math.mat(delim: "[")

  show par: set block(spacing: line_height)

  body
}

#let title(content: "") = align(center)[
  #set text(26pt, weight: "bold")
  #v(2em)
  #content
  #v(1.625em)
]
