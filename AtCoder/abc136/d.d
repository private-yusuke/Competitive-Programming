void main() {
	auto S = rs;
	auto N = S.length;
	alias Pair = Tuple!(dchar, "c", ulong, "l", ulong, "r", ulong, "n");
	ulong k;
	Pair[] pairs;
	foreach(v; S.group) {
		pairs ~= Pair(v[0], k, k+v[1]-1, v[1]);
		k += v[1];
	}
	auto arr = new ulong[](N);
	foreach(p; pairs) {
		debug writefln("%s, [%d, %d], %d", p.c, p.l, p.r, p.n);
		if(p.l == 0 && p.c == 'L') {
			arr[0] = p.n;
			continue;
		}
		if(p.r == N-1 && p.c == 'R') {
			arr[N-1] = p.n;
			continue;
		}
		if(p.c == 'R') {
			arr[p.r] += (p.n + 1) / 2;
			arr[p.r + 1] += p.n / 2;
		} else {
			arr[p.l] += (p.n + 1) / 2;
			arr[p.l - 1] += p.n / 2;
		}
		debug writefln("%(%d %)", arr);
	}
	writefln("%(%d %)", arr);
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
