import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;
import std.range;

void main() {
	auto X = readln.chomp.to!int, A = readln.chomp.to!int, B = readln.chomp.to!int;
	auto tmp = X - A;
	(tmp % B).writeln;
}
