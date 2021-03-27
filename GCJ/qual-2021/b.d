// C: 0, J: 1

void main() {
	auto T = ri;
	foreach(t; 0..T) {
		auto ip = readln.split, X = ip[0].to!int, Y = ip[1].to!int, S = ip[2];

		int c2i(dchar c) {
			if(c == 'C') return 0;
			if(c == 'J') return 1;
			else return -1;
		}

		int cost(int v1, int v2) {
			if([v1, v2] == [0, 1]) return X;
			if([v1, v2] == [1, 0]) return Y;
			return 0;
		}

		auto dp = new int[][][](S.length, 2, 2);
		foreach(ref v1; dp) foreach(ref v2; v1) v2[] = -100000;

		int f(int i, int v1, int v2) {
			if(dp[i][v1][v2] != -100000) return dp[i][v1][v2];
			if(i <= 1) return dp[i][v1][v2] = cost(v1, v2);
			int res = int.max;
			if(S[i-2] == '?') res = min(
					f(i-1, 0, v1),
					f(i-1, 1, v1));
			if(S[i-2] == 'C') res = f(i-1, 0, v1);
			if(S[i-2] == 'J') res = f(i-1, 1, v1);
			return dp[i][v1][v2] = res + cost(v1, v2);
		}

		int res;
		auto N = S.length.to!int;
		if(N == 1) res = 0;
		else if(N == 2) res = cost(c2i(S[0]), c2i(S[1]));
		else {
			auto B = [S[$-2], S[$-1]];
			if(B == ['?', '?']) res = min(
					f(N-1, 0, 0),
					f(N-1, 0, 1),
					f(N-1, 1, 0),
					f(N-1, 1, 1));
			if(B == ['?', 'C']) res = min(
					f(N-1, 0, 0),
					f(N-1, 1, 0));
			if(B == ['?', 'J']) res = min(
					f(N-1, 0, 1),
					f(N-1, 1, 1));
			if(B == ['C', '?']) res = min(
					f(N-1, 0, 0),
					f(N-1, 0, 1));
			if(B == ['C', 'C']) res = 
					f(N-1, 0, 0);
			if(B == ['C', 'J']) res = 
					f(N-1, 0, 1);
			if(B == ['J', '?']) res = min(
					f(N-1, 1, 0),
					f(N-1, 1, 1));
			if(B == ['J', 'C']) res = 
					f(N-1, 1, 0);
			if(B == ['J', 'J']) res = 
					f(N-1, 1, 1);
		}
		writefln("Case #%d: %d", t+1, res);
	}
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

long rl() {
	return readAs!long;
}

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}
