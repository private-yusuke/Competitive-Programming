void main() {
	auto ip = readAs!(int[]), N = ip[0], C = ip[1];
	auto D = readMatrix!int(C, C);
	auto c = readMatrix!int(N, N);
	int res = int.max;
	auto arr = new int[][](3, C);

	foreach(a; 0..C) foreach(x; 0..N) foreach(y; 0..N) {
		arr[(x+y)%3][a] += D[c[x][y]-1][a];
	}

	foreach(i; 0..C) foreach(j; 0..C) foreach(k; 0..C) {
		if(i==j||j==k||k==i) continue;
		res = min(res, arr[0][i]+arr[1][j]+arr[2][k]);
	}
	res.writeln;
}

// ===================================

import std.stdio;
import std.string;
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