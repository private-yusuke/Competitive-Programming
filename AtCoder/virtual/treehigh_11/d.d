void main() {	
	auto ip = readAs!(long[]), N = ip[0], T = ip[1], Q = ip[2];
	long[] m;
	int[] dir;
	int[] needs;
	long[] t = new long[](N);
	foreach(i; 0..N) {
		auto ip2 = readAs!(long[]), A = ip2[0], D = ip2[1];
		m ~= A;
		dir ~= D;
	}
	foreach(i; 0..Q) {
		needs ~= ri - 1;
	}
	ulong ptr = 1;
	bool flag = true;
	int d = 1;
	long r = long.min;
	while(flag) {
		if(m[ptr-1] == d && m[ptr] != d) {
			r = m[
		}
		last = dir[ptr];
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

double rd() {
	return readAs!double;
}

string rs() {
	return readln.chomp;
}
