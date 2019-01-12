import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;
import std.typecons;
import std.uni;
import std.ascii;
import std.bitmanip;
import core.bitop;

int N;
bool[] dp;
int[] W;
void main() {
	N = ri;
	W = readAs!(int[]);
	int s;
	dp = new bool[](10001);
	dp[0] = true;

	foreach(i; W) {
		s += i;
		foreach_reverse(j; 0..10001) {
			if(dp[j]) dp[j+i] = true;
		}
	}
	(!(s & 1) && dp[s / 2] ? "possible" : "impossible").writeln;

}
// ===================================

T readAs(T)() if (isBasicType!T) {
	return readln.chomp.to!T;
}
T readAs(T)() if (isArray!T) {
	return readln.split.to!T;
}

T[][] readMatrix(T)(uint height, uint width) if (isBasicType!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		res[i] = readAs!(T[]);
	}
	return res;
}

int ri() {
	return readAs!int;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}