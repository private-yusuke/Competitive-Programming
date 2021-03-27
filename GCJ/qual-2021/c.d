void main() {
	auto T = ri;
	foreach(t; 0..T) {
		auto ip = readAs!(int[]), N = ip[0], C = ip[1];
		auto A = iota(1, N+1).array;
		string res = "IMPOSSIBLE";
		do {
			if(reversort(A) == C) {
				res = A.to!(string[]).join(" ");
				break;
			}
		} while(nextPermutation(A));
		writefln("Case #%d: %s", t + 1, res);
	}
}

int reversort(int[] L) {
	int cost = 0;
	foreach(i; 0..L.length - 1) {
		int m = int.max;
		ulong j = 0;
		foreach(k, v; L[i..$]) {
			if(m > v) {
				m = v;
				j = k + i;
			}
		}
		L = L[0..i] ~ retro(L[i..j+1]).array ~ L[j+1..$];
		cost += j - i + 1;
		// stderr.writefln("L: %s", L);
		// stderr.writefln("i, j: %d, %d", i, j);
		// stderr.writefln("cost: %d", cost);
	}
	return cost;
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
