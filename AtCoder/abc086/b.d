import std.stdio;
import std.string;
import std.conv;
import std.range;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto n = readln.chomp.filter!"a != ' '".array;
	(sqrt(n.to!float) % 1 == 0 ? "Yes" : "No").writeln;
}
