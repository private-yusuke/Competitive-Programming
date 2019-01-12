import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;
import std.range;

void main() {
	auto N = readln.chomp.to!int;
	auto A1 = readln.split.to!(int[]);
	auto A2 = readln.split.to!(int[]);
	
	int res;
	int tmp;
	foreach(i; 0..N) {
		tmp += A1[i];
		res = max(res, tmp+A2[i..N].sum);
	}
	res.writeln;
}
