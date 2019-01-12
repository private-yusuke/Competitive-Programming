import strutils, sequtils, math

#var N = stdin.readline.parseInt
discard stdin.readline

var L = stdin.readline.split.map(parseInt)
var ans = high(int)

var k: int
proc c(x: int):int = (k-x)^2

for i in -100..100:
  k=i
  ans = min(ans, (L.map c).sum);

echo ans

