# Scryfall.jl
*A Julia wrapper for basic functionality of https://scryfall.com --- a MtG all-in-one look-up site.*

| **Build Status**                                                                                |
|:-----------------------------------------------------------------------------------------------:|
| [![Build Status](https://travis-ci.org/Moelf/Scryfall.jl.svg?branch=master)](https://travis-ci.org/Moelf/Scryfall.jl)|


## Installation

The package is registered in `METADATA.jl` and can be installed with `Pkg.add`, or in `REPL` by pressing `] add Scryfall`.
```julia
julia> Pkg.add("Scryfall")
```

## Basic Usage


```julia
using Scryfall

getOracle("Black lotus")
#"{T}, Sacrifice Black Lotus: Add three mana of any one color."

getImgurl("Black lotus")
# "https://img.scryfall.com/cards/normal/en/vma/4.jpg?1517813031"

getImgurl("Black lotus",setCode="LEB")
"https://img.scryfall.com/cards/normal/en/leb/233.jpg?1525123053"

```
