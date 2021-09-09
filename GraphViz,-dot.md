
* Dot language: <https://graphviz.org/doc/info/lang.html>
* Dot guide: <https://www.graphviz.org/pdf/dotguide.pdf>
* VS code plugin: `joaompinto.vscode-graphviz`


Project Plan:

```
digraph "unnamed" {
//  rankdir = LR;
  encoding = "UTF-8";

  node [style=filled; fillcolor=white];

  // dot file.dot -Tpdf > file.pdf

  // completed
  // one [fillcolor=green];

  // milestones
  // one,two [shape=box];

  // texts
  // one [label="Label for One\ntwo lines"];

  // key points
  // one, two, three [color=red];

  // warning
  // one [fillcolor=tomato];

  // main line
  // one, two, three [fillcolor=pink];

  // dependencies
  // one -> two;
  // { one two } -> three -> { four five } -> six;

  A -> B;
}
```
