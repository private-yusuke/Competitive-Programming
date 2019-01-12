import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;

void main() {
	int N = readln.chomp.to!int;
	int m = 1e+4.to!int;
	foreach(i; 0..N) {
		int t = readln.chomp.to!int;
		if(t < m) m = t;
	}
	m.writeln;
}
