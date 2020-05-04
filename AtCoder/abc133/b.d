void main() {
	auto ip = readAs!(int[]), N = ip[0], D = ip[1];
	auto X = readMatrix!real(N, D);
	ulong res;

	bool ok(real[] a, real[] b) {
		real tmp = 0;
		foreach(i; 0..a.length) {
			tmp += pow(a[i] - b[i], 2);
		}
		tmp = sqrt(tmp);
		debug tmp.writeln;
		return tmp.ceil == tmp.floor;
	}

	foreach(i; 0..N) foreach(j; i+1..N) {
		if(i >= j) continue;
		if(ok(X[i], X[j])) res++;
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