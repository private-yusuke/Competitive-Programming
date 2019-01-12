import std.stdio;
import std.string;
import std.conv;
import std.range;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto N = readln.chomp.to!int;
	auto S = new string[](N), P = new int[](N);
	foreach(i; 0..N) {
		auto ip = readln.split;
		S[i] = ip[0];
		P[i] = ip[1].to!int;
	}
	auto ave = P.sum / 2;
	foreach(i; 0..N) {
		if(ave < P[i]) {
			writeln(S[i]);
			return;
		}
	}
	writeln("atcoder");
}
