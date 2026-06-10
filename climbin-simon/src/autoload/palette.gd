extends Node
## The entire art direction in one file. No other file may define a Color
## literal -- scenes stay colorless and scripts apply these at runtime, so a
## palette change is a one-file PR.

const SKY := Color("#0d2137")      # deep navy -- background everywhere
const TERRAIN := Color("#e8b04b")  # sand/amber -- ground fill
const BIKE := Color("#ff6f59")     # coral -- bike frame and wheels
const RIDER := Color("#f5f1e8")    # off-white -- rider, UI text
const ACCENT := Color("#ffd166")   # gold -- timer, finish gate, highlights
