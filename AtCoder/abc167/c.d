void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1], X = ip[2];
	int[][] As;
	int[] Cs;
	foreach(i; 0..N) {
		auto ip2 = readAs!(int[]);
		auto C = ip2[0];
		auto A = ip2[1..$];
		As ~= A;
		Cs ~= C;
	}

	int res = int.max;
	foreach(k; 0..2^^N) {
		auto b = format(format("%%.%db", N), k);

		int[] learns = new int[](M);
		int S;
		foreach(i, c; b) {
			if(c == '1') {
				S += Cs[i];
				foreach(j, v; As[i]) {
					learns[j] += v;
				}
			}
		}
		if(learns.all!(v => v >= X)) {
			res = min(res, S);
		}
	}
	if(res == int.max) {
		writeln(-1);
	} else res.writeln;
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