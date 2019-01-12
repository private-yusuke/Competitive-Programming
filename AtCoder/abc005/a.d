import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto a = readln.split.to!(int[]), x = a[0], y = a[1];
	(y / x).writeln;
}
