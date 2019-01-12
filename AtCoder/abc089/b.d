import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.math;

void main() {
	readln;
	(readln.split.sort().uniq.array.length == 3 ? "Three" : "Four").writeln;
}