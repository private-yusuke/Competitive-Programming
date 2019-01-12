import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	auto ip = readln.split.to!(int[]), N = ip[0], Y = ip[1];
	foreach(i; 0..N+1) {
		foreach(j; 0..N-i+1) {
			auto k = N - i - j;
			if(10000*i + 5000*j + 1000*k == Y) {
				writefln("%s %s %s", i, j, k);
				return;
			}
		}
	}
	writeln("-1 -1 -1");
}
