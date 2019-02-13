ulong[] A;

ulong cost(ulong i, ulong j) {
	switch(j) {
		case 0, 4: // never visit there
			return A[i];
		case 1, 3: // even(x > 0)
			return A[i] == 0 ? 2 : A[i] % 2;
		case 2: // odd
			return (A[i] + 1) % 2;
		default: return 0;
	}
}

// dp[i][j]
// i: point
// j: current mode(details on editorial)

// allowed to move any times
// just need to take care of the parity of A[i]

void main() {
	auto L = ri;
	A = L.iota.map!(i => readAs!ulong).array;
	auto dp = new ulong[][](L+1, 5);
	foreach(ref v; dp) v[] = INF;
	dp[0][0] = 0;
	foreach(i; 0..L) foreach(j; 0..5) foreach(k; j..5) {
		dp[i+1][k] = min(dp[i+1][k], dp[i][j] + cost(i, k));
	}
	dp[L].reduce!min.writeln;
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
import std.container;
import std.bigint;
import std.numeric;
import std.conv;
import std.typecons;
import std.uni;
import std.ascii;
import std.bitmanip;
import core.bitop;

const long INF = 1UL << 60;

T readAs(T)() if (isBasicType!T) {
	return readln.chomp.to!T;
}
T readAs(T)() if (isArray!T) {
	return readln.split.to!T;
}

T[][] readMatrix(T)(uint height, uint width) if (!isSomeChar!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		res[i] = readAs!(T[]);
	}
	return res;
}

T[][] readMatrix(T)(uint height, uint width) if (isSomeChar!T) {
	auto res = new T[][](height, width);
	foreach(i; 0..height) {
		auto s = rs;
		foreach(j; 0..width) res[i][j] = s[j].to!T;
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
