void main() {
	auto ip = readAs!(ulong[]), N = ip[0], M = ip[1];
	auto S = rs;
	auto T = rs;
	auto L = (N*M) / gcd(N, M);
	//auto arr = iota(0, min(N, M)+1).filter!(i => i % (L/N) == 0).filter!(i => i % (L/M)).map!(i => i - 1).array;
	//auto arr = iota(0, L+1, max(N, M));
	auto arrN = iota(0, L, L / N);
	auto arrM = iota(0, L, L / M);
	auto arr = setIntersection(arrN, arrM);
	foreach(i; arr) {
		//auto j = i == 0 ? 0 : i / (L / N) - 1;
		//auto k = i == 0 ? 0 : i / (L / M) - 1;
		auto j = i / (L / N);
		auto k = i / (L / M);
		//writefln("%d %s %d %s", j, S[j], k, T[k]);
		if(S[j] != T[k]) {
			writeln(-1);
			return;
		}
	}
	writeln(L);
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
