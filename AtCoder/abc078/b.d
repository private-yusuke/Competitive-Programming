import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto ip = readln.split.to!(int[]), X = ip[0], Y = ip[1], Z = ip[2];
	auto a = X - Z, b = Z + Y;
	writeln(a / b);
}