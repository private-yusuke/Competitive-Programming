void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	int[] S, C;
	foreach(i; 0..M) {
		auto ip2 = readAs!(int[]), s = ip2[0], c = ip2[1];
		S ~= s;
		C ~= c;
	}
	foreach(i; 0..(10 ^^ (N))) {
		auto st = i.to!string;
		if(st.length != N) continue;
		bool flag = true;
		foreach(k; 0..M) {
			if(!(st[S[k]-1] - '0' == C[k])) flag = false;
		}
		if(flag) {
			writeln(i);
			return;
		}
	}
	writeln(-1);
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