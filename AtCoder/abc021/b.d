import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.math;
import std.bitmanip;

void main() {
	auto N = readln.chomp.to!int;
	auto ip1 = readln.split.to!(int[]), a = ip1[0], b = ip1[1];
	auto K = readln.chomp.to!int;
	auto P = new int[](K);
	P = readln.split.to!(int[]);
	
	auto flags = new bool[N+1];
	flags[a] = true;
	flags[b] = true;
	foreach(i; P) {
		if(flags[i] == true) {
			writeln("NO");
			return;
		}
		flags[i] = true;
	}
	writeln("YES");
}
