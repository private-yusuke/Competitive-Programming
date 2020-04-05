void main() {
	auto ip = readAs!(long[]), N = ip[0], Q = ip[1];
	auto A = readAs!(long[]);
	auto S = readAs!(long[]);
	auto arr = new long[](N+1);
	arr[0] = 0;
	foreach(i; 0..N) arr[i+1] = gcd(arr[i], A[i]);
	debug arr.writeln;

	foreach(q; S) {
		if(gcd(q, arr.back) > 1) {
			gcd(q, arr.back).writeln;
			continue;
		}

		long l = 0, r = N;
		
		
		while(l + 1 < r) {
			long m = (l+r)/2;
			debug writefln("m, r, l: %d, %d, %d", m, r, l);
			if(gcd(q, arr[m]) > 1) {
				l = m;
			} else {
				r = m;
			}
		}
		(1+l).writeln;
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