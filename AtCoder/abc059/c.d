void main() {
	auto N = ri;
	auto a = readAs!(int[]);
	ulong res;
	long S;
	ulong tmp;
	// Even is positive
	foreach(i; 0..N) {
		S += a[i];
		if(i%2) { // Odd is negative
			if(S >= 0) {
				tmp += 1 + S;
				S = -1;
			}
		} else {
			if(S <= 0) {
				tmp += 1 - S;
				S = 1;
			}
		}
		debug tmp.writeln;
	}
	res = tmp;
	tmp = 0;
	S = 0;

	foreach(i; 0..N) {
		S += a[i];
		if(i%2==1) {
			if(S >= 0) {
				tmp += 1 + S;
				S = -1;
			}
		} else {
			if(S <= 0) {
				tmp += 1 - S;
				S = 1;
			}
		}
		debug tmp.writeln;
	}
	res = min(res, tmp);
	writeln(res);
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