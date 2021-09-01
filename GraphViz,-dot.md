
* Dot language: <https://graphviz.org/doc/info/lang.html>
* VS code: `joaompinto.vscode-graphviz`


Project Plan:

```
digraph "unnamed" {
//  rankdir = LR;
  encoding = "UTF-8";

  node [style=filled; fillcolor=white];

  // dot HouseDesign.dot -Tpdf > HouseDesign.pdf

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
