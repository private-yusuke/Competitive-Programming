import std.stdio;
import std.string;
import std.conv;
import std.range;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto ip = readln.split.to!(int[]), a = ip[0], b = ip[1];
	((a*b)&1 ? "Odd" : "Even").writeln;
}
