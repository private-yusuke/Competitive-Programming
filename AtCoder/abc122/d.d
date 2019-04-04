char t(ulong c) {
	switch(c) {
		case 0: return 'A';
		case 1: return 'C';
		case 2: return 'G';
		case 3: return 'T';
		default: return 'x';
	}
}	

void main() {
	auto N = ri;
	ulong MOD = 1000000007;
	
	auto dp = new long[][][][](N+1, 4, 4, 4);
	dp[0][3][3][3] = 1;
	
	foreach(n; 0..N) foreach(t1; 0..4) foreach(t2; 0..4) foreach(t3; 0..4) {
		if(dp[n][t1][t2][t3] == 0) continue;
		foreach(a; 0..4) {
			char c1 = t1.t, c2 = t2.t, c3 = t3.t, c4 = a.t;
			if([c1, c3, c4] == "AGC") continue;
			if([c1, c2, c4] == "AGC") continue;
			if([c2, c3, c4] == "AGC") continue;
			if([c2, c3, c4] == "GAC") continue;
			if([c2, c3, c4] == "ACG") continue;
			dp[n+1][t2][t3][a] += dp[n][t1][t2][t3];
			dp[n+1][t2][t3][a] %= MOD;
		}
	}
	long res;
	foreach(t1; 0..4) foreach(t2; 0..4) foreach(t3; 0..4) {
		res += dp[N][t1][t2][t3];
		res %= MOD;
	}
	res.writeln;
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
