#import "templates/report.typ": *

#show: report.with(
  title: "实验报告实验",
  subtitle: "尝试使用 Typst 编写实验报告",
  name: "张三",
  stdid: "22223333",
  classid: "实验二班",
  major: "实验报告编写技术",
  school: "实验报告学院",
  time: "2022~2023 学年第二学期",
  // banner: "../images/banner.png"
  banner: none
)

// write your report here

#title(content: "尝试使用 Typst 编写实验报告")

= 实验报告实验

== 什么是实验报告

#lorem(200)

#booktab(
  width: 100%,
  aligns: (left + horizon, center, right + bottom),
  columns: (1fr, 1fr, 1fr),
  caption: [`booktab` 示例],
  [左对齐], [居中], [右对齐],
  [4], [5], [6],
  [7], [8], [9],
  [10], [$ (n(n+1)) / 2 $], [11],
)

$ sum_(k=0)^n k
    &= 1 + ... + n \
    &= (n(n+1)) / 2 $

== 什么是 Typst

```c
int main() {
  printf("Hello, world!");
  return 0;
}
```
