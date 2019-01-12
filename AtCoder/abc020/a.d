import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto Q = readln.chomp.to!int;
	(Q == 1 ? "ABC" : "chokudai").writeln;
}
