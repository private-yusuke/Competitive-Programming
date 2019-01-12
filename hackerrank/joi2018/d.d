int INF = 1 << 30;
int N, H;
int[] w, h;
int[][] dp;

void main() {
	auto ip = readAs!(int[]);
	N = ip[0], H = ip[1];
	foreach(_; 1..N) {
		auto ip2 = readAs!(int[]), a = ip2[0], b = ip2[1];
		w ~= a; h ~= b;
	}
	if(h.sum < H) {
		writeln(-1);
		return;
	}
	dp = new int[][](N+1, H+1001);
	foreach(ref i; dp) i[] = INF;
	dp[0][0] = 0;
	
	//calc(N-2, H).writeln;
	foreach(i; 0..N-1) {
		foreach(j; 0..H+1001) {
			debug writefln("%d %d", i, j);
			if(j < h[i]) dp[i+1][j] = dp[i][j];
			else dp[i+1][j] = min(dp[i][j], dp[i][j-h[i]] + (i+1) * w[i]);
		}
	}
	dp[N-1][H..$].reduce!min.writeln;
}

int calc(int i, int j) {
	debug writefln("%d %d", i, j);
	if(i < 0) return INF;
	if(dp[i][j] != INF) return dp[i][j];
	if(j < h[i]) return dp[i][j] = calc(i - 1, j);
	return dp[i][j] = min(calc(i - 1, j), calc(i - 1, j - h[i]) + (i + 1) * w[i]);
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
