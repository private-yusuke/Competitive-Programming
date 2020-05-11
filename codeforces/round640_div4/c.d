void main() {
	auto t = ri;
	foreach(T; 0..t) {
		auto ip = readAs!(long[]), n = ip[0], k = ip[1];

		long l = 0, r = 1L << 60;
		long m;

		while(l + 1 < r) {
			//debug "%d, %d".writefln(l, r);
			m = (l+r) / 2;
			debug writefln("%d - (%d / %d) = %d, %d", m, m, n, m - (m / n), k);
			if(m - (m / n) < k) {
				debug "ok".writeln;
				l = m;
			} else r = m;
		}

		(l+1).writeln;
	}
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