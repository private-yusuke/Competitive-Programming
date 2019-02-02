void main() {
	auto N = ri;
	int[] C, S, F;
	foreach(i; 0..N-1) {
		auto ip = readAs!(int[]), c_ = ip[0], s_ = ip[1], f_ = ip[2];
		C ~= c_; S ~= s_; F ~= f_;
	}
	foreach(i; 0..N-1) {
		int t = 0;
		foreach(j; i..N-1) {
			if(t < S[j]) t = S[j];
			else if(t % F[j] != 0) t += F[j] - t % F[j];
			t += C[j];
		}
		t.writeln;
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
