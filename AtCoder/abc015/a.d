import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto A = readln.chomp, B = readln.chomp;
	(A.length > B.length ? A : B).writeln;
}
