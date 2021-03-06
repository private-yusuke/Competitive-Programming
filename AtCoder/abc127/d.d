void main() {
	auto ip = readAs!(ulong[]), N = ip[0], M = ip[1];
	auto A = readAs!(ulong[]);
	alias Pair = Tuple!(ulong, "B", ulong, "C");
	Pair[] pairs = A.sort().group.map!(v => Pair(v[1], v[0])).array;
	foreach(_; 0..M) {
		auto ip2 = readAs!(ulong[]), B = ip2[0], C = ip2[1];
		pairs ~= Pair(B, C);
	}
	pairs.sort!((a, b) => a.C > b.C)();
	ulong res;
	ulong cnt;
	foreach(p; pairs) {
		if(p.B > N - cnt) {
			res += (N - cnt) * p.C;
			break;
		} else {
			cnt += p.B;
			res += p.C * p.B;
		}
	}
	res.writeln;
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