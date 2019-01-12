import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto a = readln.split.to!(int[]), M = a[0], D = a[1];
	(M % D == 0 ? "YES" : "NO").writeln;
}
