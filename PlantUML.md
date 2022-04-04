
# PERT

```plain
@startuml pert
left to right direction
' Horizontal lines: -->, <--, <-->
' Vertical lines: ->, <-, <->
title Graph: dependencies

package "pgk1" {
        map MAP.1 {
                Level => skel
        }
        map MAP.2 {
                Level => RECOVERING/RECOVERED/TRANSIENT
        }
        map MAP.3 {
                Level => interface
        }
}

package "NET" {
        map net.1 {
                Level => text 1
        }
        map net.2 {
                Level => integration 
        }
        map net.3 {
                Level => its own implementation;
        }
}

MAP.1 --> net.2
MAP.2 --> net.3
MAP.3 --> net.4

@enduml
```
