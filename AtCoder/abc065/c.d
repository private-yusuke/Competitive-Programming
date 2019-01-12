enum MOD = 10uL^^9+7;

void main() {
	auto ip = readAs!(long[]), N = ip[0], M = ip[1];
	auto c = abs(N-M);
	switch(c) {
		case 0:
			writeln((fact(N)*fact(M) % MOD)*2 % MOD);
			break;
		case 1:
			writeln((fact(N)*fact(M)) % MOD);
			break;
		default:
			writeln(0);
			break;
	}
}

ulong fact(ulong n) {
	ulong p = 1;
	while(n>1) {
		p *= n;
		p %= MOD;
		n--;
	}
	return p;
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