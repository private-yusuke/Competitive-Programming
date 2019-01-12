import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto a = readln.split.to!(int[]), A = a[0], B = a[1];
	format("%d %d", B, A).writeln;
}
