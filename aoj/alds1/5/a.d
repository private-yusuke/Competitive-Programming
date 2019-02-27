import std.stdio;
import std.string;
import std.algorithm;
import std.conv;

void main() {
	auto N = readln.chomp.to!int;
	auto A = readln.split.to!(int[]);
	auto q = readln.chomp.to!int;
	auto m = readln.split.to!(int[]);
	bool solve(int i, int j) {
		if(j < 0) return false;
		if(j == 0) return true;
		if(i == N) return false;
		return solve(i+1, j) || solve(i+1, j - A[i]);
	}
	m.map!(i => solve(0, i) ? "yes" : "no").each!writeln;
}
