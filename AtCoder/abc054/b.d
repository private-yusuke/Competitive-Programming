void main() {
	auto ip = readAs!(int[]), N = ip[0], M = ip[1];
	auto A = readMatrix!char(N, N);
	auto B = readMatrix!char(M, M);
	bool ok = false;

	foreach(ly; 0..N-M+1) {
		foreach(lx; 0..N-M+1) {
			bool match = true;
			foreach(y; 0..M) foreach(x; 0..M) {
				if(A[ly+y][lx+x] != B[y][x]) match = false;
			}
			if(match) ok = true;
		}
	}
	(ok ? "Yes" : "No").writeln;
}

// ===================================

import std.stdio;
import std.string;
import std.conv;
import std.algorithm;
import std.range;
import std.traits;
import std.math;
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
