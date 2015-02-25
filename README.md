# Colorizor

This tiny little colorizing string library is just a bit of code to get a few colors.

You can clone the repo and require it to start playing.


```
require("./colorizor/main.rb")

puts "blue".blue + "hello"
```

## Concerns

* Chaining method calls on `ColorString` is probably one of the best ways to quickly bust things.
* `method_missing` seems like a slow and hacky approach.

