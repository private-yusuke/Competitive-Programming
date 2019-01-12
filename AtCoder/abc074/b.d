import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto N = readln.chomp.to!int;
	auto K = readln.chomp.to!int;
	int res;
	foreach(x_i; readln.split.to!(int[])) {
		res += min(abs(K - x_i), x_i)*2;
	}
	writeln(res);
}