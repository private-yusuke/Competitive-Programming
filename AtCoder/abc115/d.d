void main() {
	auto ip = readAs!(ulong[]), N = ip[0], X = ip[1];
	F = new ulong[](51);
	L = new ulong[](51);
	F[0] = L[0] = 1;
	foreach(i; 0..50) {
		F[i+1] = 2*F[i]+3;
		L[i+1] = 2*L[i]+1;
	}
	
	calc(N, X).writeln;
}

ulong[] F, L;

long calc(long N, long X) {
	if(N == 0) return 1;
	if(X == 1) return 0;
	if(X == F[N]) return L[N];
	if(X == 2+F[N-1]) return L[N-1]+1;
	else {
		if(X <= 1+F[N-1]) return calc(N-1, X-1);
		else return L[N-1]+1+calc(N-1, X-2-F[N-1]);
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
