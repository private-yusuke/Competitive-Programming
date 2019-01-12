void main() {
	auto ip = readAs!(long[]), M = ip[0], N = ip[1], Q = ip[2];
	long nowy, nowx;
	long res;
	foreach(_; 0..Q) {
		debug writefln("(%d, %d)", nowy, nowx);
		auto ip2 = readAs!(long[]), a = ip2[0], b = ip2[1];
		long cost;
		if(nowy == 0 && nowx == 0) {
			res += a;
			nowy = a; nowx = b;
			debug writefln("! %d", a);
			continue;
		}
		long tmp1 = min(abs(b - nowx), min(abs(N - b), b) + min(abs(N - nowx), nowx));
		debug writefln("%d!!", tmp1);
		tmp1 += abs(nowy - a);
		cost = min(tmp1, nowy + a);
		debug writefln("cost: %d, tmp1: %d", cost, tmp1);
		res += cost;
		nowy = a; nowx = b;
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
