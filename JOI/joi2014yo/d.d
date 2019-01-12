const MOD = 10007;

string S;
void main() {
	auto N = ri;
	S = rs;
	
	dp = new int[][](N, 8);
	foreach(ref i; dp) i[] = -1;
	foreach(k; 0..8) {
		int a = S.front == 'J' ? 4 : retc('J') + retc(S.front);
		if((k & a) == a) dp[0][k] = 1;
		else dp[0][k] = 0;
	}
	
	ulong res;
	foreach(k; 0..8) res = (res + calc(N - 1, k)) % MOD;
	writeln(res);
}

int retc(T)(T c) if(isSomeChar!T) {
	if(c == 'J') return 4;
	if(c == 'O') return 2;
	if(c == 'I') return 1;
	return 0;
}

int calc(int i, int j) {
	if(dp[i][j] >= 0) return dp[i][j];
	
	// writefln("%d, %d", i, j);
	// writefln("%.3b, %.3b, %.3b", S[i].retc, j, (S[i].retc & j));
	if((S[i].retc & j) == 0) return dp[i][j] = 0;
	int tmp;
	foreach(k; 0..8) {
		// writefln("| %.3b, %.3b, %.3b", j, k, (j & k));
		if((j & k) != 0) tmp = (tmp + calc(i - 1, k)) % MOD;
	}
	return dp[i][j] = (tmp % MOD);
}

int[][] dp;

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
