void main() {
	auto ip = readAs!(int[]), N = ip[0], K = ip[1];
	ulong[] s;
	foreach(i; 0..N) {
		s ~= readAs!ulong;
		if(s[i] == 0) { // contains 0 value so the length of longest range is exactly N
			writeln(N);
			return;
		}
	}
	ulong r, tmp=1;
	long res = -1;

	foreach(l; 0..N) {
		while(r < N && (tmp*s[r]) <= K) {
			tmp *= s[r];
			r++;
		}
		res = max(res, r-l);
		if(l==r) r++;
		else tmp /= s[l];
		//if(tmp == 0) tmp = 1;
	}
	res.max(0).writeln;
}

// ===================================

import std.stdio;
import std.string;
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