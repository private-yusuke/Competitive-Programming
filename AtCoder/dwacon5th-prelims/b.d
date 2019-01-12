void main() {
	auto ip = readAs!(ulong[]), N = ip[0], K = ip[1];
	auto a = readAs!(ulong[]);
	ulong[][] arr;
	foreach(k; 1..N+1) {
		foreach(i; 0..N-k+1) {
			arr ~= a[i..i+k];
		}
	}
	
	auto m = arr.map!(i => i.sum).array.sort!"a > b"().map!(i => i.bitsSet.array).array;
	
	ulong res;
	foreach(k; iota(60, 0, -1)) {
		if(m.filter!(i => i.canFind(k)).array.length >= K) {
			m = m.filter!(i => i.canFind(k)).array;
		}
	}
	ulong[] h;
	foreach(i; m) {
		ulong r;
		foreach(j; i) r += 1 << j;
		h ~= r;
	}
	h[0..K].reduce!((i, j) => i & j).writeln;
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
