void main() {
	auto ip = readAs!(int[]), N = ip[0], K = ip[1];
	auto p = readAs!(int[]);
	auto arr = new real[](N);
	foreach(i; 0..N) {
		arr[i] = p[i] * (p[i] + 1) / 2. / p[i];
	}
	debug arr.writeln;
	auto arr2 = new real[](N);
	arr2[0] = arr[0];
	foreach(i; 0..N-1) arr2[i+1] = arr[i+1] + arr2[i];
	real res = 0;
	debug arr2.writeln;
	foreach(i; 0..N-K) res = max(res, arr2[i+K] - arr2[i]);
	if(N == 1) res = arr2[0];
	if(N == K) res = arr2.back;
	writefln("%.9f", res);
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