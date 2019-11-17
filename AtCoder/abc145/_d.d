long[][] dp;

void main() {
	auto ip = readAs!(int[]), X = ip[0], Y = ip[1];
	auto m = (X + Y) / 3;
	/*if((X+Y) % 3 != 0) {
		writeln(0);
		return;
	}*/
	dp = new long[][](X+1, Y+1);
	foreach(i; 0..X+1) dp[i][] = -1;
	dp[0][0] = 1;
	foreach(i; 0..X+1) foreach(j; 0..Y+1) solve(i, j);
	writefln("    x\t%(%d\t%)", iota(X+1));
	writefln(" y\t%(=\t%)", iota(X+1));
	dp.enumerate.array.reverse.each!(v => writefln("%.2d|\t%(%d\t%)", v.index, v.value));
}

ulong solve(long x, long y) {
	// writeln(x, ", ", y);
	if(x < 0 || y < 0) return 0;
	//if(2*x+1 < y || 2*y+1 < x) return 0;
	if(dp[x][y] != -1) return dp[x][y];
	dp[x][y] = solve(x-1, y) + solve(x, y-1);
	dp[x][y] %= 1000000007;
	return dp[x][y];
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