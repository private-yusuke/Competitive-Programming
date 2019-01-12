import strutils, sequtils, math, algorithm;

var N = stdin.readline.parseint
var a = stdin.readline.split.map(parseint)
sort(a, system.cmp)

var count: int

for i in a:
  if a.binarySearch(i*2):
    count++

echo count