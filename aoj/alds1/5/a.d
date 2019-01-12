int n;
int[] A, m;
int[][] dp;

// make the number r by using numbers after i-1th
int solve(int i, int r) {
	if(r < 0) return 0;
	//"%d %d".writefln(i, r);
	if(r == 0) return 1;
	if(i >= n) return 0;
	if(dp[i][r] != -1) return dp[i][r];
	if(solve(i+1, r) || solve(i+1, r - A[i])) return 1;
	else return 0;
}
void main() {
	n = ri;
	A = readAs!(int[]);
	auto q = ri;
	m = readAs!(int[]);
	dp = new int[][](n+1, m.reduce!max + 1);
	foreach(ref i; dp) i[] = -1;
	foreach(ref i; dp) i[0] = 0;

	m.each!(i => ((solve(0, i) == 1 ? "yes" : "no").writeln));
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
import std.conv;
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