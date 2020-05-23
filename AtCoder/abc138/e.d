void main() {
	auto s = rs, t = rs;
	size_t[][char] m;
	foreach(i, c; s) m[c] ~= i + 1;

	long last, loopc;
	auto N = s.length;
	foreach(c; t) {
		if(c !in m) {
			writeln(-1);
			return;
		}
		auto k = m[c].assumeSorted.upperBound(last);
		debug writefln("%s %s", m[c], k);
		if(k.empty) {
			loopc++;
			last = m[c][0];
		} else {
			last = k[0];
		}
		debug writefln("%d %d", loopc, last);
	}
	writeln(loopc * N + last);
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