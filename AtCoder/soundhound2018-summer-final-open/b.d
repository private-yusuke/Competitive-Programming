void main() {
	auto ip = readAs!(long[]), N = ip[0], K = ip[1];
	auto b = new long[](N);
	foreach(ref i; b) i = ri;
	long[] c;
	foreach(i; 0..N-K+1) {
		c ~= b[i..i+K].sum;
	}
	debug b.writeln;
	debug c.writeln;
	foreach(i, ref v; c) {
		if(v < 0) {
			v = 0;
			foreach(ref k; b[i..i+K]) if(k<0) k = 0;

			foreach(j; i..min(N-K+1, i+K)) {
				debug j.writeln;
				c[j] = b[j..j+K].sum;
			}
		}
		debug b.writeln;
		debug c.writeln;
	}
	b.sum.writeln;
}

// ===================================

import std.stdio;
import std.string;
import std.functional;
import std.conv;
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