import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.conv;
import std.typecons;

int N;
int[] p;
bool[] dp;

void main() {
	N = ri();
	p = readAs!(int[]);
	dp = new bool[](100^^2 + 1);
	dp[0] = true;
	foreach(i; p) {
		foreach_reverse(j; 0..(100^^2 + 1)) {
			if(j >= i) dp[j] |= dp[j - i];
		}
	}
	dp.count!(a => a).writeln;
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

string rs() {
	return readln.chomp;
}