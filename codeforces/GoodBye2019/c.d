void main() {
	auto t = ri;
	foreach(_; 0..t) {
		auto n = ri;
		auto a = readAs!(long[]);
		auto res = solve(a);
		res.length.writeln;
		writefln("%(%d %)", res);
	}
}

unittest {
	import std.random;
	foreach(i; 0..1000) 5L.iota.randomCover(Random(unpredictableSeed)).array.solve;
}

long[] solve(long[] a) {
	long su = a.sum, xo = a.reduce!((a, b) => a ^ b);
	long[] res;
	bool diffOdd = (abs(xo - su) % 2 == 1);
	long tmp;
	if(diffOdd) {
		tmp += 1;
		su += 1L;
		xo ^= 1L;
	}
	tmp += 2L << 40;
	res ~= tmp;
	su += tmp;
	xo ^= tmp;

	res ~= (abs(2*xo - su)/2).repeat(2).array;
	su += abs(2*xo - su);
	debug writefln("%d, %d", su, xo*2);
	assert(su == xo*2);
	assert(res.all!(v => 0 <= v && v <= 1000000000000000000));
	return res;
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