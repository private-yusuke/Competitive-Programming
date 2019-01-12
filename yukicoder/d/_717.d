import std.stdio, std.algorithm, std.string, std.range;
void main() {
	(a => min(a[0][0], a[1][0]) + min(a[0][1], a[1][1]))(readln.split.map!(i => readln.chomp).map!(j => [j.count('A'), j.count('B')]).array).writeln;
}