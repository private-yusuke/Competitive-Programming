import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto a = readln.split.to!(int[]), S = a[0], T = a[1];
	(T - S + 1).writeln;
}
