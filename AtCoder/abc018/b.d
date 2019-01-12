import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.bitmanip;

void main() {
	auto S = readln.chomp;
	auto N = readln.chomp.to!int;
	auto l = new int[](N), r = new int[](N);
	foreach(i; 0..N) {
		auto ip = readln.split.to!(int[]);
		l[i] = ip[0];
		r[i] = ip[1];
	}
	auto res = S.to!(char[]);
	foreach(i; 0..N) {
		std.algorithm.reverse(res[l[i]-1..r[i]]);
	}
	res.writeln;
}
