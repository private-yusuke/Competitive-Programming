import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.range;

void main() {
	auto N = readln.chomp.to!int;
	auto a = readln.split.to!(int[]);
	a.sort;
	writeln(a[$-1] - a[0]);
}
