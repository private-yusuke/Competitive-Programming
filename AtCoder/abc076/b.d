import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto N = readln.chomp.to!int, K = readln.chomp.to!int;
	int res = 1;

	foreach(i; 0..N) res = (res * 2 < res + K ? res * 2 : res + K);
	writeln(res);
}