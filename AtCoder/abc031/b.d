import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.regex;

void main() {
	auto ip = readln.split.to!(int[]), L = ip[0], H = ip[1];
	auto N = readln.chomp.to!int;
	foreach(i; 0..N) {
		auto A = readln.chomp.to!int;
		if(A > H) writeln(-1);
		else if(A < L) writeln(L - A);
		else writeln(0);
	}
}
