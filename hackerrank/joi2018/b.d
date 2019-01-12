void main() {
	auto ip = readAs!(long[]), N = ip[0], M = ip[1];
	auto a = readAs!(long[]);
	auto b = readAs!(long[]);
	auto T = ri;
	foreach(_; 0..T) {
		auto ip2 = readAs!(long[]), d = ip2[0], p = ip2[1], q = ip2[2];
		if(d == 1) {
			auto X = a[p-1];
			auto Y = b[q-1];
			if(X >= Y) {
				a[p-1] = X - Y;
				b[q-1] = 0;
			} else {
				a[p-1] = 0;
				b[q-1] = Y - X;
			}
		} else {
			auto X = b[p-1];
			auto Y = a[q-1];
			if(X >= Y) {
				b[p-1] = X - Y;
				a[q-1] = 0;
			} else {
				b[p-1] = 0;
				a[q-1] = Y - X;
			}
		}
	}
	writeln(a.sum);
	writeln(b.sum);
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
