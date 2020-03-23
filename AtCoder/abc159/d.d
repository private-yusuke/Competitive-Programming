void main() {
	auto N = ri;
	auto A = readAs!(int[]);
	auto arr = new int[](N);
	foreach(v; A) arr[v-1]++;
	auto arr2 = arr.map!(i => i * (i-1)/2).array;
	auto base = arr2.sum;
	debug arr.writeln;
	debug arr2.writeln;

	foreach(i; 0..N) {
		auto n = arr[A[i]-1];
		debug writefln("%d, %d", A[i], n);
		long tmp = base;
		tmp -= n * (n-1) / 2;
		tmp += (n-1) * (n-2) / 2;
		tmp.writeln;
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