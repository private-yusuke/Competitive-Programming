void main() {
	auto ip = readAs!(long[]), N = ip[0], K = ip[1];
	foreach(i; 1..N+1) foreach(j; 1..K+1) {
		writefln("%d %d, %d", i, j, calc(i, j));
	}
}

long calc(long N, long K) {
	long cnt;
	foreach(a; 1..N+1) {
		foreach(b; 1..N+1) {
			foreach(c; 1..N+1) {
				//writefln("%d %d %d", a, b, c);
				if((a + b) % K == 0 && (b + c) % K == 0 && (c + a) % K == 0) cnt++;
			}
		}
	}
	return cnt;
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