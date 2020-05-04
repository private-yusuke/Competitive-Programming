void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	bool[int] m;
	int[int] penarr;
	int penalty;
	foreach(i; 0..M) {
		auto ip2 = readln.split, p = ip2[0].to!int, S = ip2[1];
		if(S == "AC") {
			if(p-1 in m && !m[p-1] && p-1 in penarr) penalty += penarr[p-1];
			m[p-1] = true;
		} else {
			if(p-1 !in m) m[p-1] = false;
			if(p-1 !in m || !m[p-1]) penarr[p-1]++;
		}
	}
	writefln("%d %d", m.values.count!(v => v), penalty);
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