import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto N = readln.chomp.to!int;
	(N % 3 == 0 ? "YES" : "NO").writeln;
}
