using Scryfall
using Test
@test contains(getOracle("Black lotus"), "Add three mana of any one color.")
