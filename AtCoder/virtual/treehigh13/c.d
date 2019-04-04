void main() {
	auto N = ri;
	int[] C, S, F;
	foreach(i; 0..N-1) {
		auto ip = readAs!(int[]), c = ip[0], s = ip[1], f = ip[2];
		C ~= c; S ~= s; F ~= f;
	}
	
	foreach(i; 0..N-1) {
		long tmp;
		foreach(j; i..N-1) {
			if(tmp < S[j]) tmp = S[j];
			else if(tmp % F[j] != 0) tmp += F[j] - tmp % F[j];
			tmp += C[j];
			debug writefln("tmp: %d, i: %d, j: %d", tmp, i, j);
		}
		tmp.writeln;
	}
	0.writeln;
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
