
* Language reference: https://thsmi.github.io/sieve-reference/en/
* Tutorial with tons of examples: https://p5r.uk/blog/2011/sieve-tutorial.html


# Editing Subject

```
    if header :matches "Subject" "*" {
      set "subject" "${1}";
      deleteheader "Subject";
      addheader :last "Subject" "[EXT]  ${1}";
    }
```

